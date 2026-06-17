# QR_Attendence-Sysytem
QR Attendance System (Flask + MySQL)

A smart QR Code based Attendance Management System built using Flask, MySQL, HTML, CSS, and JavaScript.
It allows students to mark attendance by scanning QR codes and provides a powerful admin dashboard with analytics, leaderboard, and reports.

🚀 Features
👤 User Login System (Admin authentication)
📷 QR Code based Attendance Marking
⏰ Attendance Time Control (Start/End time restriction)
📊 Real-time Dashboard with stats
🏆 Leaderboard with ranking system
📈 Analytics dashboard with charts
📄 Attendance reports (table view)
📥 Export attendance to CSV
👨‍🎓 Add / Delete students
🔐 QR Expiry system (time-based security)
📱 QR scanning via camera + image upload
🛠️ Tech Stack

Frontend:

HTML
CSS
Bootstrap
JavaScript
Chart.js

Backend:

Python (Flask)

Database:

MySQL

Libraries:

qrcode
pandas
flask
flask-mysql-connector


📁 Project Structure
project/
│── app.py
│── templates/
│     ├── dashboard.html
│     ├── login.html
│     ├── leaderboard.html
│     ├── report.html
│     ├── analytics.html
│     ├── scan.html
│     ├── add_student.html
│     ├── generate_qr.html
│── static/
│     ├── style.css
│     ├── qr_codes/
│── database.sql

⚙️ Installation & Setup
1️⃣ Clone Repository
git clone https://github.com/simranprajapati2/QRattendence-sysytem.git
cd qr-attendance-system
2️⃣ Install Dependencies
pip install flask mysql-connector-python qrcode pandas flask-mail
3️⃣ Setup MySQL Database

Create database:

CREATE DATABASE attendance;

Import tables 

4️⃣ Run Project
python app.py

Open in browser:

http://127.0.0.1:5000

📊 Modules
🔐 Login System

Secure admin login with session handling.

📷 QR Attendance

Students scan QR code → attendance marked automatically.

🏆 Leaderboard

Displays ranking based on attendance percentage.

📊 Analytics

Graph-based attendance insights using Chart.js.

📄 Reports

Full attendance history with export option.

📸 Screenshots (Optional)

Add images here:

/static/screenshots/dashboard.png
/static/screenshots/leaderboard.png
🚀 Future Improvements
Mobile App (Android/iOS)
Face recognition attendance
Cloud database (Firebase / AWS)
Email notification system
Role-based access (Teacher/Student/Admin)

👨‍💻 Author

Your Name

GitHub: https://github.com/simranprajapati2

📜 License

This project is open-source and free to use.

⭐ If you like this project

Give a star ⭐ on GitHub to support!
