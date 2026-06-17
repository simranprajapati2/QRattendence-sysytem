-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 17, 2026 at 11:14 AM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.0.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `attendance`
--

-- --------------------------------------------------------

--
-- Table structure for table `attendance_new`
--

CREATE TABLE `attendance_new` (
  `id` int(11) NOT NULL,
  `roll_no` varchar(20) DEFAULT NULL,
  `date` date DEFAULT NULL,
  `time` time DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `attendance_new`
--

INSERT INTO `attendance_new` (`id`, `roll_no`, `date`, `time`) VALUES
(1, '101', '2026-06-01', '10:00:00'),
(2, '101', '2026-06-02', '10:02:00'),
(3, '101', '2026-06-03', '10:01:00'),
(4, '101', '2026-06-04', '10:03:00'),
(5, '101', '2026-06-05', '10:00:00'),
(6, '101', '2026-06-08', '10:02:00'),
(7, '101', '2026-06-09', '10:01:00'),
(8, '101', '2026-06-10', '10:00:00'),
(9, '101', '2026-06-11', '10:04:00'),
(10, '101', '2026-06-12', '10:00:00'),
(11, '101', '2026-06-15', '10:03:00'),
(12, '101', '2026-06-16', '10:01:00'),
(13, '101', '2026-06-17', '10:00:00'),
(14, '101', '2026-06-18', '10:02:00'),
(15, '101', '2026-06-19', '10:01:00'),
(16, '101', '2026-06-22', '10:00:00'),
(17, '101', '2026-06-23', '10:03:00'),
(18, '101', '2026-06-24', '10:01:00'),
(19, '101', '2026-06-25', '10:00:00'),
(20, '101', '2026-06-26', '10:02:00'),
(21, '101', '2026-06-01', '10:00:00'),
(22, '101', '2026-06-02', '10:02:00'),
(23, '101', '2026-06-03', '10:01:00'),
(24, '101', '2026-06-04', '10:03:00'),
(25, '101', '2026-06-05', '10:00:00'),
(26, '101', '2026-06-08', '10:02:00'),
(27, '101', '2026-06-09', '10:01:00'),
(28, '101', '2026-06-10', '10:00:00'),
(29, '101', '2026-06-11', '10:04:00'),
(30, '101', '2026-06-12', '10:00:00'),
(31, '101', '2026-06-15', '10:03:00'),
(32, '101', '2026-06-16', '10:01:00'),
(33, '101', '2026-06-17', '10:00:00'),
(34, '101', '2026-06-18', '10:02:00'),
(35, '101', '2026-06-19', '10:01:00'),
(36, '101', '2026-06-22', '10:00:00'),
(37, '101', '2026-06-23', '10:03:00'),
(38, '101', '2026-06-24', '10:01:00'),
(50, '101', '2024-06-01', '09:10:00'),
(51, '102', '2024-06-01', '09:12:00'),
(52, '103', '2024-06-01', '09:15:00'),
(53, '109', '2024-06-01', '09:18:00'),
(54, '111', '2024-06-01', '09:20:00'),
(55, '112', '2024-06-02', '09:11:00'),
(56, '113', '2024-06-02', '09:13:00'),
(57, '114', '2024-06-02', '09:15:00'),
(58, '105', '2024-06-02', '09:17:00'),
(59, '106', '2024-06-02', '09:19:00'),
(60, '107', '2024-06-03', '09:10:00'),
(61, '108', '2024-06-03', '09:12:00'),
(62, '119', '2024-06-03', '09:14:00'),
(63, '110', '2024-06-03', '09:16:00'),
(64, '101', '2024-06-03', '09:18:00'),
(65, '102', '2024-06-04', '09:10:00'),
(66, '103', '2024-06-04', '09:12:00'),
(67, '109', '2024-06-04', '09:14:00'),
(68, '111', '2024-06-04', '09:16:00'),
(69, '112', '2024-06-04', '09:18:00'),
(70, '113', '2024-06-05', '09:10:00'),
(71, '114', '2024-06-05', '09:12:00'),
(72, '105', '2024-06-05', '09:14:00'),
(73, '106', '2024-06-05', '09:16:00'),
(74, '107', '2024-06-05', '09:18:00'),
(75, '108', '2024-06-06', '09:10:00'),
(76, '119', '2024-06-06', '09:12:00'),
(77, '110', '2024-06-06', '09:14:00'),
(78, '101', '2024-06-06', '09:16:00'),
(79, '102', '2024-06-06', '09:18:00'),
(80, '103', '2024-06-07', '09:10:00'),
(81, '109', '2024-06-07', '09:12:00'),
(82, '111', '2024-06-07', '09:14:00'),
(83, '112', '2024-06-07', '09:16:00'),
(84, '113', '2024-06-07', '09:18:00'),
(85, '114', '2024-06-08', '09:10:00'),
(86, '105', '2024-06-08', '09:12:00'),
(87, '106', '2024-06-08', '09:14:00'),
(88, '107', '2024-06-08', '09:16:00'),
(89, '108', '2024-06-08', '09:18:00'),
(90, '119', '2024-06-09', '09:10:00'),
(91, '110', '2024-06-09', '09:12:00'),
(92, '101', '2024-06-09', '09:14:00'),
(93, '102', '2024-06-09', '09:16:00'),
(94, '103', '2024-06-09', '09:18:00'),
(95, '109', '2024-06-10', '09:10:00'),
(96, '111', '2024-06-10', '09:12:00'),
(97, '112', '2024-06-10', '09:14:00'),
(98, '113', '2024-06-10', '09:16:00'),
(99, '114', '2024-06-10', '09:18:00'),
(100, '105', '2024-06-11', '09:10:00'),
(101, '106', '2024-06-11', '09:12:00'),
(102, '107', '2024-06-11', '09:14:00'),
(103, '108', '2024-06-11', '09:16:00'),
(104, '119', '2024-06-11', '09:18:00'),
(105, '110', '2024-06-12', '09:10:00'),
(106, '101', '2024-06-12', '09:12:00'),
(107, '102', '2024-06-12', '09:14:00'),
(108, '103', '2024-06-12', '09:16:00'),
(109, '109', '2024-06-12', '09:18:00'),
(110, '111', '2024-06-13', '09:10:00'),
(111, '112', '2024-06-13', '09:12:00'),
(112, '113', '2024-06-13', '09:14:00'),
(113, '114', '2024-06-13', '09:16:00'),
(114, '105', '2024-06-13', '09:18:00'),
(115, '106', '2024-06-14', '09:10:00'),
(116, '107', '2024-06-14', '09:12:00'),
(117, '108', '2024-06-14', '09:14:00'),
(118, '119', '2024-06-14', '09:16:00'),
(119, '110', '2024-06-14', '09:18:00'),
(120, '101', '2024-06-15', '09:10:00'),
(121, '102', '2024-06-15', '09:12:00'),
(122, '103', '2024-06-15', '09:14:00'),
(123, '109', '2024-06-15', '09:16:00'),
(124, '111', '2024-06-15', '09:18:00');

-- --------------------------------------------------------

--
-- Table structure for table `attendance_settings`
--

CREATE TABLE `attendance_settings` (
  `id` int(11) NOT NULL,
  `start_time` time DEFAULT NULL,
  `end_time` time DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `attendance_settings`
--

INSERT INTO `attendance_settings` (`id`, `start_time`, `end_time`) VALUES
(1, '10:00:00', '10:15:00');

-- --------------------------------------------------------

--
-- Table structure for table `students`
--

CREATE TABLE `students` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `roll_no` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `students`
--

INSERT INTO `students` (`id`, `name`, `roll_no`) VALUES
(1, 'simran', '101'),
(2, 'kk', '102'),
(3, 'Anvi', '103'),
(4, 'simii', '109'),
(45, 'Aman Sharma', '111'),
(46, 'Rahul Verma', '112'),
(47, 'Priya Singh', '113'),
(48, 'Neha Patil', '114'),
(49, 'Rohit Kumar', '105'),
(50, 'Sneha Joshi', '106'),
(51, 'Vikas Yadav', '107'),
(52, 'Anjali Mehta', '108'),
(53, 'Soham Deshmukh', '119'),
(54, 'Pooja Nair', '110'),
(55, 'd', '123');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `username` varchar(50) NOT NULL,
  `password` varchar(100) NOT NULL,
  `role` varchar(20) DEFAULT 'user'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `username`, `password`, `role`) VALUES
(1, 'admin', 'admin123', 'admin');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `attendance_new`
--
ALTER TABLE `attendance_new`
  ADD PRIMARY KEY (`id`),
  ADD KEY `roll_no` (`roll_no`);

--
-- Indexes for table `attendance_settings`
--
ALTER TABLE `attendance_settings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `students`
--
ALTER TABLE `students`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `roll_no` (`roll_no`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `attendance_new`
--
ALTER TABLE `attendance_new`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=125;

--
-- AUTO_INCREMENT for table `attendance_settings`
--
ALTER TABLE `attendance_settings`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `students`
--
ALTER TABLE `students`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=56;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `attendance_new`
--
ALTER TABLE `attendance_new`
  ADD CONSTRAINT `attendance_new_ibfk_1` FOREIGN KEY (`roll_no`) REFERENCES `students` (`roll_no`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
