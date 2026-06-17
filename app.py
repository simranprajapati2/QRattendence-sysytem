from flask import Flask, render_template, request, redirect, session, send_file, jsonify
from datetime import datetime, timedelta
import mysql.connector
import qrcode
import pandas as pd
import os

app = Flask(__name__)
app.secret_key = "secret123"


# ---------------- DATABASE ----------------
def get_db():
    conn = mysql.connector.connect(
        host="localhost",
        user="root",
        password="",
        database="attendance"
    )
    return conn, conn.cursor(buffered=True)


# ---------------- HELPERS ----------------
def login_required():
    return 'user' in session


# ---------------- HOME ----------------
@app.route('/')
def home():
    return redirect('/login')


# ---------------- LOGIN ----------------
@app.route('/login', methods=['GET', 'POST'])
def login():
    if request.method == 'POST':
        conn, cursor = get_db()

        username = request.form['username']
        password = request.form['password']

        cursor.execute(
            "SELECT id, username, role FROM users WHERE username=%s AND password=%s",
            (username, password)
        )

        user = cursor.fetchone()
        conn.close()

        if user:
            session['user'] = user[1]
            session['role'] = user[2]
            return redirect('/dashboard')

        return "Invalid Credentials"

    return render_template('login.html')


# ---------------- DASHBOARD ----------------
@app.route('/dashboard')
def dashboard():
    if not login_required():
        return redirect('/login')

    conn, cursor = get_db()

    cursor.execute("SELECT COUNT(*) FROM students")
    total_students = cursor.fetchone()[0]

    cursor.execute("""
        SELECT COUNT(DISTINCT roll_no)
        FROM attendance_new
        WHERE date = CURDATE()
    """)
    present_today = cursor.fetchone()[0]

    cursor.execute("""
        SELECT DATE(date), COUNT(DISTINCT roll_no)
        FROM attendance_new
        GROUP BY DATE(date)
        ORDER BY DATE(date)
    """)

    data = cursor.fetchall()
    conn.close()

    dates = [row[0].strftime("%d-%b") for row in data]
    counts = [row[1] for row in data]

    return render_template(
        "dashboard.html",
        total_students=total_students,
        present_today=present_today,
        dates=dates,
        counts=counts
    )

@app.route('/scan_page')
def scan_page():
    return render_template("scan.html")
# ---------------- SCAN QR ----------------
@app.route('/scan', methods=['POST'])
def scan():
    conn, cursor = get_db()
    data = request.get_json()

    qr_data = data.get('data').strip()

    # QR FORMAT: roll_no|expiry_time
    try:
        roll_no, expiry = qr_data.split("|")
        expiry_time = datetime.strptime(expiry, "%Y-%m-%d %H:%M:%S")

        if datetime.now() > expiry_time:
            conn.close()
            return jsonify({"status": "expired", "message": "QR Expired"})

    except:
        roll_no = qr_data

    # check student
    cursor.execute("SELECT name FROM students WHERE roll_no=%s", (roll_no,))
    student = cursor.fetchone()

    if not student:
        conn.close()
        return jsonify({"status": "error", "message": "Student not found"})

    name = student[0]

    # attendance time control
    cursor.execute("SELECT start_time, end_time FROM attendance_settings WHERE id=1")
    timing = cursor.fetchone()

    now = datetime.now().time()

    start_time = (datetime.min + timing[0]).time()
    end_time = (datetime.min + timing[1]).time()

    if not (start_time <= now <= end_time):
        conn.close()
        return jsonify({"status": "closed", "message": "Attendance Closed"})

    today = datetime.now().date()
    current_time = datetime.now().strftime("%H:%M:%S")

    # duplicate check
    cursor.execute("""
        SELECT id FROM attendance_new
        WHERE roll_no=%s AND date=%s
    """, (roll_no, today))

    exists = cursor.fetchone()

    if exists:
        conn.close()
        return jsonify({
            "status": "duplicate",
            "name": name,
            "message": "Already marked"
        })

    # insert attendance
    cursor.execute("""
        INSERT INTO attendance_new (roll_no, date, time)
        VALUES (%s, %s, %s)
    """, (roll_no, today, current_time))

    conn.commit()
    conn.close()

    return jsonify({
        "status": "success",
        "name": name
    })


# ---------------- REPORT ----------------
@app.route('/report')
def report():
    if not login_required():
        return redirect('/login')

    conn, cursor = get_db()

    cursor.execute("""
        SELECT s.name, s.roll_no, a.date, a.time
        FROM attendance_new a
        JOIN students s ON a.roll_no = s.roll_no
        ORDER BY a.date DESC
    """)

    data = cursor.fetchall()
    conn.close()

    return render_template("report.html", data=data)


# ---------------- ADD STUDENT ----------------
@app.route('/add_student', methods=['GET', 'POST'])
def add_student():
    if not login_required():
        return redirect('/login')

    if request.method == 'POST':
        name = request.form['name']
        roll_no = request.form['roll_no']

        conn, cursor = get_db()

        cursor.execute("""
            INSERT INTO students (name, roll_no)
            VALUES (%s, %s)
        """, (name, roll_no))

        conn.commit()
        conn.close()

        return redirect('/dashboard')

    return render_template("add_student.html")


# ---------------- DELETE STUDENT ----------------
@app.route('/delete_student/<int:id>')
def delete_student(id):
    if not login_required():
        return redirect('/login')

    conn, cursor = get_db()

    cursor.execute("DELETE FROM students WHERE id=%s", (id,))
    conn.commit()
    conn.close()

    return redirect('/dashboard')

@app.route('/generate')
def generate():
    conn, cursor = get_db()
    cursor.execute("SELECT * FROM students")
    students = cursor.fetchall()
    conn.close()
    return render_template("generate_qr.html", students=students)

# ---------------- GENERATE QR ----------------
@app.route('/generate_qr/<roll_no>')
def generate_qr(roll_no):

    # 📁 folder create if not exists
    folder = os.path.join("static", "qr_codes")
    os.makedirs(folder, exist_ok=True)

    # 📌 file path
    file_path = os.path.join(folder, f"qr_{roll_no}.png")

    # ⏰ expiry time (30 sec QR validity)
    expiry_time = datetime.now() + timedelta(seconds=30)

    qr_data = f"{roll_no}|{expiry_time.strftime('%Y-%m-%d %H:%M:%S')}"

    # 📱 generate QR
    qr_img = qrcode.make(qr_data)
    qr_img.save(file_path)

    # 📤 return image
    return send_file(file_path, mimetype='image/png')
# ---------------- EXPORT CSV ----------------
@app.route('/export')
def export():
    if not login_required():
        return redirect('/login')

    conn, cursor = get_db()

    df = pd.read_sql("""
        SELECT s.name, s.roll_no, a.date, a.time
        FROM attendance_new a
        JOIN students s ON a.roll_no = s.roll_no
    """, conn)

    file_path = "attendance_report.csv"
    df.to_csv(file_path, index=False)

    conn.close()

    return send_file(file_path, as_attachment=True)


# ---------------- RANKING ----------------
@app.route('/ranking')
def ranking():
    if not login_required():
        return redirect('/login')

    conn, cursor = get_db()

    cursor.execute("""
        SELECT s.name, s.roll_no, COUNT(a.id)
        FROM students s
        LEFT JOIN attendance_new a
        ON s.roll_no = a.roll_no
        GROUP BY s.roll_no, s.name
    """)

    data = cursor.fetchall()
    conn.close()

    students = []

    for name, roll, present in data:
        percent = round((present / 30) * 100, 2)
        students.append({
            "name": name,
            "roll": roll,
            "percent": percent
        })

    students.sort(key=lambda x: x["percent"], reverse=True)

    return render_template("ranking.html", students=students)


# ---------------- LEADERBOARD ----------------
@app.route('/leaderboard')
def leaderboard():
    if not login_required():
        return redirect('/login')

    conn, cursor = get_db()

    cursor.execute("""
        SELECT s.name, s.roll_no,
        COUNT(a.roll_no),
        (SELECT COUNT(DISTINCT date) FROM attendance_new),
        ROUND((COUNT(a.roll_no) /
        (SELECT COUNT(DISTINCT date) FROM attendance_new)) * 100, 2)
        FROM students s
        LEFT JOIN attendance_new a ON s.roll_no = a.roll_no
        GROUP BY s.roll_no, s.name
        ORDER BY 5 DESC
    """)

    data = cursor.fetchall()
    conn.close()

    return render_template("leaderboard.html", data=data)


# ---------------- ATTENDANCE CONTROL ----------------
@app.route('/attendance_control', methods=['GET', 'POST'])
def attendance_control():
    if not login_required():
        return redirect('/login')

    conn, cursor = get_db()

    if request.method == 'POST':
        start_time = request.form['start_time']
        end_time = request.form['end_time']

        cursor.execute("""
            UPDATE attendance_settings
            SET start_time=%s, end_time=%s
            WHERE id=1
        """, (start_time, end_time))

        conn.commit()

    cursor.execute("SELECT start_time, end_time FROM attendance_settings WHERE id=1")
    timing = cursor.fetchone()

    conn.close()

    return render_template("attendance_control.html", timing=timing)


# ---------------- LOGOUT ----------------
@app.route('/logout')
def logout():
    session.clear()
    return redirect('/login')


# ---------------- RUN ----------------
if __name__ == "__main__":
    app.run(debug=True)