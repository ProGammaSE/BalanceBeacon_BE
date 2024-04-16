-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 16, 2024 at 10:04 AM
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
-- Database: `balancebeacon`
--

-- --------------------------------------------------------

--
-- Table structure for table `achievements`
--

CREATE TABLE `achievements` (
  `archievement_id` int(11) NOT NULL,
  `archievement_name` varchar(50) NOT NULL,
  `archievement_description` varchar(250) DEFAULT NULL,
  `archievement_status` tinyint(1) NOT NULL,
  `archievement_created_date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `areas`
--

CREATE TABLE `areas` (
  `area_id` int(11) NOT NULL,
  `area_description` varchar(50) DEFAULT NULL,
  `area_created_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `areas`
--

INSERT INTO `areas` (`area_id`, `area_description`, `area_created_date`) VALUES
(4, 'Love. Family. Kids', '2024-04-09 00:48:28'),
(5, 'Hobbies. Fun', '2024-04-09 01:04:20'),
(6, 'Money', '2024-04-09 01:04:27'),
(7, 'Education', '2024-04-09 01:04:32'),
(8, 'Health & Fitness', '2024-04-09 01:04:42'),
(9, 'Time Manage', '2024-04-09 01:04:49'),
(10, 'Social & Friends', '2024-04-09 01:04:59'),
(11, 'Recreation', '2024-04-09 01:05:17'),
(12, 'Sex & Romance', '2024-04-09 01:05:27'),
(13, 'Spirituality', '2024-04-09 01:05:39'),
(14, 'Personal Growth', '2024-04-09 01:05:48');

-- --------------------------------------------------------

--
-- Table structure for table `assessments`
--

CREATE TABLE `assessments` (
  `assessment_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `assessment_created_date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `assessment_areas`
--

CREATE TABLE `assessment_areas` (
  `assess_area_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `area_id` int(10) NOT NULL,
  `assessment_id` int(11) NOT NULL,
  `assess_area_current` int(11) DEFAULT NULL,
  `assess_area_future` int(11) DEFAULT NULL,
  `area_status` tinyint(1) NOT NULL,
  `assess_area_created_date` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `assessment_areas`
--

INSERT INTO `assessment_areas` (`assess_area_id`, `user_id`, `area_id`, `assessment_id`, `assess_area_current`, `assess_area_future`, `area_status`, `assess_area_created_date`) VALUES
(28, 6, 0, 6, 0, 0, 0, '2024-04-08 23:37:40'),
(31, 6, 0, 6, 0, 0, 0, '2024-04-08 23:37:40'),
(34, 7, 0, 7, 0, 0, 0, '2024-04-08 23:38:04'),
(37, 7, 0, 7, 0, 0, 0, '2024-04-08 23:38:05'),
(38, 8, 0, 8, 0, 0, 0, '2024-04-08 23:38:35'),
(41, 8, 0, 8, 0, 0, 0, '2024-04-08 23:38:35'),
(43, 10, 0, 9, 0, 0, 1, '2024-04-09 00:55:47'),
(44, 10, 4, 10, 0, 0, 1, '2024-04-09 01:03:01'),
(45, 10, 13, 11, 0, 0, 1, '2024-04-09 01:17:03'),
(46, 10, 4, 12, 0, 0, 1, '2024-04-09 20:00:36'),
(47, 10, 6, 12, 0, 0, 1, '2024-04-09 20:00:36'),
(48, 10, 14, 12, 0, 0, 1, '2024-04-09 20:00:36'),
(49, 11, 4, 13, 0, 0, 1, '2024-04-09 20:05:21'),
(50, 11, 6, 13, 0, 0, 1, '2024-04-09 20:05:21'),
(51, 11, 7, 13, 0, 0, 1, '2024-04-09 20:05:21'),
(52, 11, 8, 13, 0, 0, 1, '2024-04-09 20:05:21'),
(53, 11, 10, 13, 0, 0, 1, '2024-04-09 20:05:21'),
(54, 11, 12, 13, 0, 0, 1, '2024-04-09 20:05:21'),
(55, 11, 13, 13, 0, 0, 1, '2024-04-09 20:05:21'),
(56, 11, 14, 13, 0, 0, 1, '2024-04-09 20:05:21'),
(57, 11, 12, 14, 0, 0, 1, '2024-04-09 20:06:41'),
(58, 11, 5, 15, 2, 8, 1, '2024-04-09 20:09:12'),
(59, 11, 6, 15, 2, 10, 1, '2024-04-09 20:09:12'),
(60, 11, 8, 15, 10, 10, 1, '2024-04-09 20:09:12'),
(61, 11, 9, 15, 5, 9, 1, '2024-04-09 20:09:12'),
(62, 11, 11, 15, 7, 5, 1, '2024-04-09 20:09:12'),
(63, 11, 12, 15, 1, 9, 1, '2024-04-09 20:09:12'),
(64, 11, 13, 15, 4, 5, 1, '2024-04-09 20:09:12'),
(65, 11, 14, 15, 1, 10, 1, '2024-04-09 20:09:12'),
(66, 12, 7, 16, 0, 0, 1, '2024-04-10 00:17:53'),
(67, 12, 13, 16, 0, 0, 1, '2024-04-10 00:17:53'),
(68, 10, 4, 17, 0, 0, 1, '2024-04-10 10:15:40'),
(69, 10, 7, 17, 0, 0, 1, '2024-04-10 10:15:40'),
(70, 10, 8, 17, 0, 0, 1, '2024-04-10 10:15:40'),
(71, 10, 10, 17, 0, 0, 1, '2024-04-10 10:15:40'),
(72, 10, 11, 17, 0, 0, 1, '2024-04-10 10:15:40'),
(73, 12, 12, 18, 0, 0, 1, '2024-04-10 21:27:09'),
(74, 10, 7, 19, 3, 9, 1, '2024-04-11 12:28:57'),
(75, 10, 9, 19, 4, 9, 1, '2024-04-11 12:28:57'),
(76, 10, 13, 19, 5, 9, 1, '2024-04-11 12:28:57');

-- --------------------------------------------------------

--
-- Table structure for table `coachers`
--

CREATE TABLE `coachers` (
  `coach_id` int(11) NOT NULL,
  `area_id` int(11) NOT NULL,
  `coach_name` varchar(100) NOT NULL,
  `coach_gender` int(11) NOT NULL,
  `coach_fee` varchar(10) DEFAULT NULL,
  `coach_created_date` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `coach_bookings`
--

CREATE TABLE `coach_bookings` (
  `booking_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `coach_id` int(11) NOT NULL,
  `booking_status` tinyint(1) DEFAULT NULL,
  `booking_created_date` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `feedbacks`
--

CREATE TABLE `feedbacks` (
  `feedback_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `feedback_rate` int(11) DEFAULT NULL,
  `feedback_created_date` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `goals`
--

CREATE TABLE `goals` (
  `goal_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `assessment_id` int(11) NOT NULL,
  `area_id` int(11) NOT NULL,
  `tip_id` int(11) NOT NULL,
  `goal_days` int(11) NOT NULL,
  `goal_status` tinyint(1) NOT NULL,
  `goal_created_date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tips`
--

CREATE TABLE `tips` (
  `tip_id` int(11) NOT NULL,
  `area_id` int(11) NOT NULL,
  `tip_description` varchar(250) DEFAULT NULL,
  `tip_created_date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `user_id` int(11) NOT NULL,
  `user_name` varchar(100) NOT NULL,
  `user_email` varchar(80) NOT NULL,
  `user_phone` varchar(20) NOT NULL,
  `user_gender` int(11) NOT NULL,
  `user_age` int(11) NOT NULL,
  `user_password` varchar(100) NOT NULL,
  `user_status` tinyint(4) NOT NULL,
  `user_created_date` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`user_id`, `user_name`, `user_email`, `user_phone`, `user_gender`, `user_age`, `user_password`, `user_status`, `user_created_date`) VALUES
(4, 'Gayathri', 'test@gmail.com', '0765842111', 0, 29, '12345', 1, '2024-03-29 22:51:49'),
(5, 'Jayana', 'jayana@gmail.com', '0765842111', 0, 29, 'asdf', 1, '2024-03-29 22:51:49'),
(6, 'Lahiru', 'lahiru@gmail.com', '0765842111', 0, 29, 'asdf', 1, '2024-03-30 20:11:48'),
(7, 'John', 'john@gamil.com', '0367459612', 1, 24, 'asdf', 1, '2024-04-01 21:00:56'),
(8, 'mobille', 'mobile@gmail.com', '0112576935', 1, 30, '0123456789', 1, '2024-04-01 21:06:04'),
(9, 'mobille', 'mobile2@gmail.com', '0112576935', 1, 30, '0123456789', 1, '2024-04-01 21:07:12'),
(10, 'Peter', 'test', '0765842111', 0, 29, 'test', 1, '2024-04-09 00:47:27'),
(11, 'test1', 'Edinberg', '0765842111', 0, 29, 'test', 1, '2024-04-09 20:03:49'),
(12, 'Donald', 'test3', '0765842111', 0, 29, 'test3', 1, '2024-04-10 00:16:42'),
(13, 'Dustin', 'abc@.com', '0454125896', 1, 25, '123456789', 1, '2024-04-10 00:32:47'),
(14, 'Peter Zink', 'zink@mail.com', '0125463287', 2, 25, '123456', 1, '2024-04-10 01:10:17');

-- --------------------------------------------------------

--
-- Table structure for table `user_achievements`
--

CREATE TABLE `user_achievements` (
  `user_archievement_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `archievment_id` int(11) NOT NULL,
  `user_archieve_status` tinyint(1) NOT NULL,
  `user_archieve_created_date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `user_tips`
--

CREATE TABLE `user_tips` (
  `user_tip_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `tip_id` int(11) NOT NULL,
  `tip_description` varchar(250) DEFAULT NULL,
  `tip_created_date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `achievements`
--
ALTER TABLE `achievements`
  ADD PRIMARY KEY (`archievement_id`);

--
-- Indexes for table `areas`
--
ALTER TABLE `areas`
  ADD PRIMARY KEY (`area_id`);

--
-- Indexes for table `assessments`
--
ALTER TABLE `assessments`
  ADD PRIMARY KEY (`assessment_id`);

--
-- Indexes for table `assessment_areas`
--
ALTER TABLE `assessment_areas`
  ADD PRIMARY KEY (`assess_area_id`);

--
-- Indexes for table `coachers`
--
ALTER TABLE `coachers`
  ADD PRIMARY KEY (`coach_id`);

--
-- Indexes for table `coach_bookings`
--
ALTER TABLE `coach_bookings`
  ADD PRIMARY KEY (`booking_id`);

--
-- Indexes for table `feedbacks`
--
ALTER TABLE `feedbacks`
  ADD PRIMARY KEY (`feedback_id`);

--
-- Indexes for table `goals`
--
ALTER TABLE `goals`
  ADD PRIMARY KEY (`goal_id`);

--
-- Indexes for table `tips`
--
ALTER TABLE `tips`
  ADD PRIMARY KEY (`tip_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`user_id`);

--
-- Indexes for table `user_achievements`
--
ALTER TABLE `user_achievements`
  ADD PRIMARY KEY (`user_archievement_id`);

--
-- Indexes for table `user_tips`
--
ALTER TABLE `user_tips`
  ADD PRIMARY KEY (`user_tip_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `areas`
--
ALTER TABLE `areas`
  MODIFY `area_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `assessment_areas`
--
ALTER TABLE `assessment_areas`
  MODIFY `assess_area_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=85;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
