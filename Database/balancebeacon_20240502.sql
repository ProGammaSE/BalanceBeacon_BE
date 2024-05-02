-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 02, 2024 at 09:12 AM
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
(76, 10, 13, 19, 5, 9, 1, '2024-04-11 12:28:57'),
(85, 10, 7, 20, 3, 3, 1, '2024-04-16 10:12:50'),
(86, 10, 9, 20, 4, 4, 1, '2024-04-16 10:12:50'),
(87, 10, 10, 20, 6, 6, 1, '2024-04-16 10:12:50'),
(88, 10, 13, 20, 8, 8, 1, '2024-04-16 10:12:50'),
(89, 10, 5, 21, 0, 0, 1, '2024-04-23 22:48:49'),
(90, 10, 8, 21, 0, 0, 1, '2024-04-23 22:48:49'),
(91, 10, 11, 21, 0, 0, 1, '2024-04-23 22:48:50'),
(92, 12, 4, 22, 0, 0, 1, '2024-04-24 23:06:44'),
(93, 12, 5, 22, 0, 0, 1, '2024-04-24 23:06:44'),
(94, 12, 6, 22, 0, 0, 1, '2024-04-24 23:06:44'),
(95, 12, 7, 22, 0, 0, 1, '2024-04-24 23:06:44'),
(96, 12, 8, 22, 0, 0, 1, '2024-04-24 23:06:44'),
(97, 12, 4, 23, 0, 0, 1, '2024-04-24 23:16:06'),
(98, 12, 5, 23, 0, 0, 1, '2024-04-24 23:16:06'),
(99, 12, 6, 23, 0, 0, 1, '2024-04-24 23:16:06'),
(100, 12, 7, 23, 0, 0, 1, '2024-04-24 23:16:06'),
(101, 12, 8, 23, 0, 0, 1, '2024-04-24 23:16:06'),
(102, 12, 4, 24, 0, 0, 1, '2024-04-24 23:31:09'),
(103, 12, 5, 24, 0, 0, 1, '2024-04-24 23:31:10'),
(104, 12, 6, 24, 0, 0, 1, '2024-04-24 23:31:10'),
(105, 12, 7, 24, 0, 0, 1, '2024-04-24 23:31:10'),
(106, 12, 8, 24, 0, 0, 1, '2024-04-24 23:31:10'),
(107, 12, 4, 25, 0, 0, 1, '2024-04-24 23:32:51'),
(108, 12, 5, 25, 0, 0, 1, '2024-04-24 23:32:51'),
(109, 12, 6, 25, 0, 0, 1, '2024-04-24 23:32:51'),
(110, 12, 7, 25, 0, 0, 1, '2024-04-24 23:32:51'),
(111, 12, 8, 25, 0, 0, 1, '2024-04-24 23:32:51'),
(112, 12, 4, 26, 0, 0, 1, '2024-04-24 23:36:24'),
(113, 12, 5, 26, 0, 0, 1, '2024-04-24 23:36:24'),
(114, 12, 6, 26, 0, 0, 1, '2024-04-24 23:36:24'),
(115, 12, 7, 26, 0, 0, 1, '2024-04-24 23:36:24'),
(116, 12, 8, 26, 0, 0, 1, '2024-04-24 23:36:24'),
(117, 12, 4, 27, 0, 0, 1, '2024-04-24 23:39:40'),
(118, 12, 5, 27, 0, 0, 1, '2024-04-24 23:39:40'),
(119, 12, 6, 27, 0, 0, 1, '2024-04-24 23:39:40'),
(120, 12, 7, 27, 0, 0, 1, '2024-04-24 23:39:40'),
(121, 12, 8, 27, 0, 0, 1, '2024-04-24 23:39:40'),
(122, 12, 4, 28, 0, 0, 1, '2024-04-24 23:50:22'),
(123, 12, 5, 28, 0, 0, 1, '2024-04-24 23:50:22'),
(124, 12, 6, 28, 0, 0, 1, '2024-04-24 23:50:22'),
(125, 12, 7, 28, 0, 0, 1, '2024-04-24 23:50:22'),
(126, 12, 8, 28, 0, 0, 1, '2024-04-24 23:50:22'),
(127, 12, 4, 29, 0, 0, 1, '2024-04-25 00:29:55'),
(128, 12, 5, 29, 0, 0, 1, '2024-04-25 00:29:55'),
(129, 12, 6, 29, 0, 0, 1, '2024-04-25 00:29:55'),
(130, 12, 7, 29, 0, 0, 1, '2024-04-25 00:29:55'),
(131, 12, 8, 29, 0, 0, 1, '2024-04-25 00:29:55'),
(132, 11, 4, 30, 0, 0, 1, '2024-04-25 00:30:50'),
(133, 11, 5, 30, 0, 0, 1, '2024-04-25 00:30:50'),
(134, 11, 6, 30, 0, 0, 1, '2024-04-25 00:30:50'),
(135, 11, 7, 30, 0, 0, 1, '2024-04-25 00:30:50'),
(136, 11, 8, 30, 0, 0, 1, '2024-04-25 00:30:50'),
(137, 12, 4, 31, 0, 0, 1, '2024-04-25 01:51:16'),
(138, 12, 5, 31, 0, 0, 1, '2024-04-25 01:51:16'),
(139, 12, 6, 31, 0, 0, 1, '2024-04-25 01:51:16'),
(140, 12, 7, 31, 0, 0, 1, '2024-04-25 01:51:16'),
(141, 12, 8, 31, 0, 0, 1, '2024-04-25 01:51:16'),
(142, 10, 7, 32, 5, 7, 1, '2024-04-25 06:11:15'),
(143, 10, 8, 32, 3, 9, 1, '2024-04-25 06:11:15'),
(144, 10, 9, 32, 5, 9, 1, '2024-04-25 06:11:15'),
(145, 10, 10, 32, 3, 10, 1, '2024-04-25 06:11:15'),
(146, 10, 11, 32, 0, 10, 1, '2024-04-25 06:11:15'),
(147, 10, 12, 32, 8, 9, 1, '2024-04-25 06:11:15'),
(148, 10, 13, 32, 7, 10, 1, '2024-04-25 06:11:15'),
(149, 10, 14, 32, 9, 10, 1, '2024-04-25 06:11:15'),
(150, 10, 7, 33, 0, 5, 1, '2024-04-25 06:14:21'),
(151, 10, 8, 33, 8, 10, 1, '2024-04-25 06:14:21'),
(152, 10, 9, 33, 5, 10, 1, '2024-04-25 06:14:21'),
(153, 10, 10, 33, 2, 10, 1, '2024-04-25 06:14:21'),
(154, 10, 11, 33, 0, 0, 1, '2024-04-25 06:14:21'),
(155, 10, 12, 33, 3, 10, 1, '2024-04-25 06:14:21'),
(156, 10, 13, 33, 3, 10, 1, '2024-04-25 06:14:21'),
(157, 10, 14, 33, 3, 10, 1, '2024-04-25 06:14:21'),
(158, 10, 4, 34, 0, 0, 1, '2024-04-25 06:28:15'),
(159, 10, 5, 34, 0, 0, 1, '2024-04-25 06:28:15'),
(160, 10, 7, 34, 0, 0, 1, '2024-04-25 06:28:15'),
(161, 10, 8, 34, 0, 0, 1, '2024-04-25 06:28:15'),
(162, 10, 10, 34, 0, 0, 1, '2024-04-25 06:28:15'),
(163, 10, 11, 34, 0, 0, 1, '2024-04-25 06:28:15'),
(164, 10, 13, 34, 0, 0, 1, '2024-04-25 06:28:15'),
(165, 10, 14, 34, 0, 0, 1, '2024-04-25 06:28:15'),
(166, 10, 4, 35, 0, 0, 1, '2024-04-25 06:31:16'),
(167, 10, 5, 35, 0, 0, 1, '2024-04-25 06:31:16'),
(168, 10, 7, 35, 0, 0, 1, '2024-04-25 06:31:16'),
(169, 10, 8, 35, 0, 0, 1, '2024-04-25 06:31:16'),
(170, 10, 10, 35, 0, 0, 1, '2024-04-25 06:31:16'),
(171, 10, 11, 35, 0, 0, 1, '2024-04-25 06:31:16'),
(172, 10, 13, 35, 0, 0, 1, '2024-04-25 06:31:16'),
(173, 10, 14, 35, 0, 0, 1, '2024-04-25 06:31:16'),
(174, 10, 5, 36, 0, 0, 1, '2024-04-25 06:39:14'),
(175, 10, 7, 36, 0, 0, 1, '2024-04-25 06:39:14'),
(176, 10, 8, 36, 0, 0, 1, '2024-04-25 06:39:14'),
(177, 10, 9, 36, 0, 0, 1, '2024-04-25 06:39:14'),
(178, 10, 10, 36, 0, 0, 1, '2024-04-25 06:39:14'),
(179, 10, 11, 36, 0, 0, 1, '2024-04-25 06:39:14'),
(180, 10, 13, 36, 0, 0, 1, '2024-04-25 06:39:14'),
(181, 10, 14, 36, 0, 0, 1, '2024-04-25 06:39:14'),
(182, 10, 7, 37, 0, 0, 1, '2024-04-25 06:51:54'),
(183, 10, 8, 37, 0, 0, 1, '2024-04-25 06:51:54'),
(184, 10, 9, 37, 0, 0, 1, '2024-04-25 06:51:54'),
(185, 10, 10, 37, 0, 0, 1, '2024-04-25 06:51:54'),
(186, 10, 11, 37, 0, 0, 1, '2024-04-25 06:51:54'),
(187, 10, 12, 37, 0, 0, 1, '2024-04-25 06:51:54'),
(188, 10, 13, 37, 0, 0, 1, '2024-04-25 06:51:54'),
(189, 10, 7, 38, 0, 0, 1, '2024-04-25 07:01:55'),
(190, 10, 8, 38, 0, 0, 1, '2024-04-25 07:01:55'),
(191, 10, 10, 38, 0, 0, 1, '2024-04-25 07:01:55'),
(192, 10, 11, 38, 0, 0, 1, '2024-04-25 07:01:55'),
(193, 10, 12, 38, 0, 0, 1, '2024-04-25 07:01:55'),
(194, 15, 4, 39, 0, 0, 1, '2024-04-25 13:49:05'),
(195, 15, 5, 39, 0, 0, 1, '2024-04-25 13:49:05'),
(196, 15, 6, 39, 0, 0, 1, '2024-04-25 13:49:05'),
(197, 15, 7, 39, 0, 0, 1, '2024-04-25 13:49:05'),
(198, 15, 8, 39, 0, 0, 1, '2024-04-25 13:49:05'),
(199, 14, 8, 40, 0, 0, 1, '2024-04-25 14:06:42'),
(200, 14, 10, 40, 0, 0, 1, '2024-04-25 14:06:42'),
(201, 14, 11, 40, 0, 0, 1, '2024-04-25 14:06:42'),
(202, 14, 13, 40, 0, 0, 1, '2024-04-25 14:06:42'),
(203, 15, 8, 41, 3, 10, 1, '2024-04-25 14:08:18'),
(204, 15, 10, 41, 1, 10, 1, '2024-04-25 14:08:18'),
(205, 15, 14, 41, 2, 10, 1, '2024-04-25 14:08:18'),
(206, 10, 7, 42, 3, 7, 1, '2024-04-25 14:21:27'),
(207, 10, 8, 42, 4, 9, 1, '2024-04-25 14:21:27'),
(208, 10, 10, 42, 4, 9, 1, '2024-04-25 14:21:27'),
(209, 10, 12, 42, 1, 2, 1, '2024-04-25 14:21:27'),
(210, 10, 6, 43, 2, 6, 1, '2024-04-26 10:12:59'),
(211, 10, 9, 43, 3, 10, 1, '2024-04-26 10:12:59'),
(212, 10, 11, 43, 4, 10, 1, '2024-04-26 10:12:59'),
(213, 10, 12, 43, 4, 5, 1, '2024-04-26 10:12:59');

-- --------------------------------------------------------

--
-- Table structure for table `coachers`
--

CREATE TABLE `coachers` (
  `coach_id` int(11) NOT NULL,
  `coach_name` varchar(100) NOT NULL,
  `coach_gender` varchar(15) NOT NULL,
  `coach_speciality` varchar(200) NOT NULL,
  `phone_number` varchar(25) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `coachers`
--

INSERT INTO `coachers` (`coach_id`, `coach_name`, `coach_gender`, `coach_speciality`, `phone_number`) VALUES
(1, 'Aylin Webb', 'Female', 'Anxiety Master Coach', '+44-9065-927-229'),
(2, 'Poppy Wonnacoot', 'Female', 'Transformational Life Coach', '+44-4153-652-338'),
(3, 'Sallie Coventry', 'Female', 'Life Training', '+44-5698-318-634'),
(4, 'Helen Unwin', 'Female', 'Confidence Coach', '+44-7233-477-275'),
(5, 'Kieran Perry', 'Male', 'Business & Sales Coaching', '+44-5825-774-140'),
(6, 'Dr. Jo Robinson', 'Female', 'Psychologist and Coach', '+44-2688-731-354');

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
  `feedback_rate` float DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `feedbacks`
--

INSERT INTO `feedbacks` (`feedback_id`, `user_id`, `feedback_rate`) VALUES
(1, 10, 3.5),
(2, 10, 0.5);

-- --------------------------------------------------------

--
-- Table structure for table `goals`
--

CREATE TABLE `goals` (
  `goal_id` int(11) NOT NULL,
  `user_tip_id` int(10) DEFAULT NULL,
  `area_description` varchar(200) DEFAULT NULL,
  `tip_description` varchar(200) DEFAULT NULL,
  `tip_status` int(10) DEFAULT NULL,
  `goal_days` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `goals`
--

INSERT INTO `goals` (`goal_id`, `user_tip_id`, `area_description`, `tip_description`, `tip_status`, `goal_days`) VALUES
(3, 5, 'Love. Family. Kids', 'Plan family activities or trips during breaks', 2, '10 Days'),
(4, 6, 'Love. Family. Kids', 'Plan family activities or trips during breaks', 2, '10 Days'),
(5, 325, 'Education', 'Seek feedback on assignments and tests to improve', 0, '1 Month'),
(6, 331, 'Social & Friends', 'Be open to making friends from different backgrounds and cultures', 2, '1 Month');

-- --------------------------------------------------------

--
-- Table structure for table `tips`
--

CREATE TABLE `tips` (
  `tip_id` int(11) NOT NULL,
  `area_id` int(11) NOT NULL,
  `tip_description` varchar(250) DEFAULT NULL,
  `tip_created_date` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tips`
--

INSERT INTO `tips` (`tip_id`, `area_id`, `tip_description`, `tip_created_date`) VALUES
(1, 4, 'Plan family activities or trips during breaks', '2024-04-24 00:00:00'),
(2, 4, 'Share your academic and personal achievements to keep them involved', '2024-04-24 00:00:00'),
(3, 4, 'Be proactive in addressing conflicts or misunderstandings', '2024-04-24 00:00:00'),
(4, 4, 'Show appreciation for family support', '2024-04-24 00:00:00'),
(5, 4, 'Set boundaries with family that respect your independence', '2024-04-24 00:00:00'),
(6, 6, 'Learn basic investing to grow your savings', '2024-04-24 00:00:00'),
(7, 6, 'Use student discounts and promotions to save money', '2024-04-24 00:00:00'),
(8, 6, 'Track all expenses to understand spending habits', '2024-04-24 00:00:00'),
(9, 6, 'Set up an emergency fund to cover unexpected expenses', '2024-04-24 00:00:00'),
(10, 7, 'Attend all classes and take detailed notes', '2024-04-24 06:47:23'),
(11, 7, 'Form or join study groups to enhance learning', '2024-04-24 06:47:31'),
(12, 7, 'Regularly review class materials to reinforce knowledge', '2024-04-24 06:47:41'),
(13, 7, 'Use academic resources like libraries and online databases', '2024-04-24 06:47:48'),
(14, 7, 'Seek feedback on assignments and tests to improve', '2024-04-24 06:47:59'),
(15, 8, 'Incorporate a variety of physical activities to keep workouts interesting', '2024-04-24 06:48:37'),
(16, 8, 'Stay hydrated, especially during physical activities', '2024-04-24 06:48:48'),
(17, 8, 'Aim for 7-9 hours of sleep per night', '2024-04-24 06:49:00'),
(18, 8, 'Limit consumption of processed foods and high sugar beverages', '2024-04-24 06:49:10'),
(19, 8, 'Regularly schedule check-ups with a healthcare provider', '2024-04-24 06:49:28'),
(20, 10, 'Be open to making friends from different backgrounds and cultures', '2024-04-24 06:51:44'),
(21, 10, 'Volunteer for social events and university functions', '2024-04-24 06:53:08'),
(22, 10, 'Respect your commitments and be reliable in social settings', '2024-04-24 06:53:17'),
(23, 10, 'Prioritize quality of friendships over quantity', '2024-04-24 06:53:25'),
(24, 10, 'Communicate openly and honestly in your relationships', '2024-04-24 06:53:36'),
(25, 11, 'Explore hobbies that are completely unrelated to your studies', '2024-04-24 06:56:17'),
(26, 11, 'Take breaks to enjoy nature, such as local parks or hikes', '2024-04-24 06:56:25'),
(27, 11, 'Use art or music as creative outlets for relaxation', '2024-04-24 06:56:34'),
(28, 11, 'Plan short trips or mini-adventures with friends', '2024-04-24 06:56:46'),
(29, 11, 'Regularly try new activities to find what brings you joy and relaxation', '2024-04-24 06:56:53'),
(30, 13, 'Allocate time for solitude and reflection', '2024-04-24 07:00:37'),
(31, 13, 'Explore different philosophical or spiritual texts to broaden perspectives', '2024-04-24 07:00:44'),
(32, 13, 'Participate in groups or communities that share your spiritual interests', '2024-04-24 07:00:51'),
(33, 13, 'Practice gratitude daily', '2024-04-24 07:00:59'),
(34, 13, 'Use ethical considerations as a guide for decision-making', '2024-04-24 07:01:07'),
(35, 14, 'Set personal goals and review them regularly', '2024-04-24 07:01:38'),
(36, 14, 'Practice self-discipline, especially in balancing various aspects of life', '2024-04-24 07:01:45'),
(37, 14, 'Accept and learn from failures as part of personal growth', '2024-04-24 07:01:54'),
(38, 14, 'Seek out mentors who can guide personal and professional development', '2024-04-24 07:02:02'),
(39, 14, 'Stay curious and open-minded to new experiences and ideas', '2024-04-24 07:02:13');

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
  `user_status` int(10) NOT NULL,
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
(10, 'Peter', 'test', '0765842111', 0, 29, 'test', 2, '2024-04-09 00:47:27'),
(11, 'test1', 'Edinberg', '0765842111', 0, 29, 'test', 1, '2024-04-09 20:03:49'),
(12, 'Donald', 'test3', '0765842111', 0, 29, 'test3', 1, '2024-04-10 00:16:42'),
(13, 'Dustin', 'abc@.com', '0454125896', 1, 25, '123456789', 1, '2024-04-10 00:32:47'),
(14, 'Peter Zink', 'zink@mail.com', '0125463287', 2, 25, '123456', 2, '2024-04-10 01:10:17'),
(15, 'Peters', 'test12345', '0765842111', 0, 29, '12345', 2, '2024-04-25 13:48:38');

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
  `assessment_id` int(10) NOT NULL,
  `area_id` int(10) DEFAULT NULL,
  `tip_id` int(11) NOT NULL,
  `tip_description` varchar(250) DEFAULT NULL,
  `tip_status` int(10) DEFAULT NULL,
  `created_date` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `user_tips`
--

INSERT INTO `user_tips` (`user_tip_id`, `user_id`, `assessment_id`, `area_id`, `tip_id`, `tip_description`, `tip_status`, `created_date`) VALUES
(5, 12, 29, 5, 1, 'Plan family activities or trips during breaks', 2, '2024-04-25 00:29:55'),
(6, 12, 29, 6, 2, 'Share your academic and personal achievements to keep them involved', 2, '2024-04-25 00:29:55'),
(7, 12, 29, NULL, 3, 'Be proactive in addressing conflicts or misunderstandings', 0, '2024-04-25 00:29:55'),
(8, 12, 29, NULL, 4, 'Show appreciation for family support', 0, '2024-04-25 00:29:55'),
(9, 12, 29, NULL, 5, 'Set boundaries with family that respect your independence', 0, '2024-04-25 00:29:55'),
(10, 12, 29, NULL, 6, 'Learn basic investing to grow your savings', 0, '2024-04-25 00:29:55'),
(11, 12, 29, NULL, 7, 'Use student discounts and promotions to save money', 0, '2024-04-25 00:29:55'),
(12, 12, 29, NULL, 8, 'Track all expenses to understand spending habits', 0, '2024-04-25 00:29:55'),
(13, 12, 29, NULL, 9, 'Set up an emergency fund to cover unexpected expenses', 0, '2024-04-25 00:29:55'),
(14, 12, 29, NULL, 10, 'Attend all classes and take detailed notes', 0, '2024-04-25 00:29:55'),
(15, 12, 29, NULL, 11, 'Form or join study groups to enhance learning', 0, '2024-04-25 00:29:55'),
(16, 12, 29, NULL, 12, 'Regularly review class materials to reinforce knowledge', 0, '2024-04-25 00:29:55'),
(17, 12, 29, NULL, 13, 'Use academic resources like libraries and online databases', 0, '2024-04-25 00:29:55'),
(18, 12, 29, NULL, 14, 'Seek feedback on assignments and tests to improve', 0, '2024-04-25 00:29:55'),
(19, 12, 29, NULL, 15, 'Incorporate a variety of physical activities to keep workouts interesting', 0, '2024-04-25 00:29:55'),
(20, 12, 29, NULL, 16, 'Stay hydrated, especially during physical activities', 0, '2024-04-25 00:29:55'),
(21, 12, 29, NULL, 17, 'Aim for 7-9 hours of sleep per night', 0, '2024-04-25 00:29:55'),
(22, 12, 29, NULL, 18, 'Limit consumption of processed foods and high sugar beverages', 0, '2024-04-25 00:29:55'),
(23, 12, 29, NULL, 19, 'Regularly schedule check-ups with a healthcare provider', 0, '2024-04-25 00:29:55'),
(24, 11, 30, NULL, 1, 'Plan family activities or trips during breaks', 0, '2024-04-25 00:30:50'),
(25, 11, 30, NULL, 2, 'Share your academic and personal achievements to keep them involved', 0, '2024-04-25 00:30:50'),
(26, 11, 30, NULL, 3, 'Be proactive in addressing conflicts or misunderstandings', 0, '2024-04-25 00:30:50'),
(27, 11, 30, NULL, 4, 'Show appreciation for family support', 0, '2024-04-25 00:30:50'),
(28, 11, 30, NULL, 5, 'Set boundaries with family that respect your independence', 0, '2024-04-25 00:30:50'),
(29, 11, 30, NULL, 6, 'Learn basic investing to grow your savings', 0, '2024-04-25 00:30:50'),
(30, 11, 30, NULL, 7, 'Use student discounts and promotions to save money', 0, '2024-04-25 00:30:50'),
(31, 11, 30, NULL, 8, 'Track all expenses to understand spending habits', 0, '2024-04-25 00:30:50'),
(32, 11, 30, NULL, 9, 'Set up an emergency fund to cover unexpected expenses', 0, '2024-04-25 00:30:50'),
(33, 11, 30, NULL, 10, 'Attend all classes and take detailed notes', 0, '2024-04-25 00:30:50'),
(34, 11, 30, NULL, 11, 'Form or join study groups to enhance learning', 0, '2024-04-25 00:30:50'),
(35, 11, 30, NULL, 12, 'Regularly review class materials to reinforce knowledge', 0, '2024-04-25 00:30:50'),
(36, 11, 30, NULL, 13, 'Use academic resources like libraries and online databases', 0, '2024-04-25 00:30:50'),
(37, 11, 30, NULL, 14, 'Seek feedback on assignments and tests to improve', 0, '2024-04-25 00:30:50'),
(38, 11, 30, NULL, 15, 'Incorporate a variety of physical activities to keep workouts interesting', 0, '2024-04-25 00:30:50'),
(39, 11, 30, NULL, 16, 'Stay hydrated, especially during physical activities', 0, '2024-04-25 00:30:50'),
(40, 11, 30, NULL, 17, 'Aim for 7-9 hours of sleep per night', 0, '2024-04-25 00:30:50'),
(41, 11, 30, NULL, 18, 'Limit consumption of processed foods and high sugar beverages', 0, '2024-04-25 00:30:50'),
(42, 11, 30, NULL, 19, 'Regularly schedule check-ups with a healthcare provider', 0, '2024-04-25 00:30:50'),
(43, 12, 31, 4, 1, 'Plan family activities or trips during breaks', 0, '2024-04-25 01:51:16'),
(44, 12, 31, 4, 2, 'Share your academic and personal achievements to keep them involved', 0, '2024-04-25 01:51:16'),
(45, 12, 31, 4, 3, 'Be proactive in addressing conflicts or misunderstandings', 0, '2024-04-25 01:51:16'),
(46, 12, 31, 4, 4, 'Show appreciation for family support', 0, '2024-04-25 01:51:16'),
(47, 12, 31, 4, 5, 'Set boundaries with family that respect your independence', 0, '2024-04-25 01:51:16'),
(48, 12, 31, 6, 6, 'Learn basic investing to grow your savings', 0, '2024-04-25 01:51:16'),
(49, 12, 31, 6, 7, 'Use student discounts and promotions to save money', 0, '2024-04-25 01:51:16'),
(50, 12, 31, 6, 8, 'Track all expenses to understand spending habits', 0, '2024-04-25 01:51:16'),
(51, 12, 31, 6, 9, 'Set up an emergency fund to cover unexpected expenses', 0, '2024-04-25 01:51:16'),
(52, 12, 31, 7, 10, 'Attend all classes and take detailed notes', 0, '2024-04-25 01:51:16'),
(53, 12, 31, 7, 11, 'Form or join study groups to enhance learning', 0, '2024-04-25 01:51:16'),
(54, 12, 31, 7, 12, 'Regularly review class materials to reinforce knowledge', 0, '2024-04-25 01:51:16'),
(55, 12, 31, 7, 13, 'Use academic resources like libraries and online databases', 0, '2024-04-25 01:51:16'),
(56, 12, 31, 7, 14, 'Seek feedback on assignments and tests to improve', 0, '2024-04-25 01:51:16'),
(57, 12, 31, 8, 15, 'Incorporate a variety of physical activities to keep workouts interesting', 0, '2024-04-25 01:51:16'),
(58, 12, 31, 8, 16, 'Stay hydrated, especially during physical activities', 0, '2024-04-25 01:51:16'),
(59, 12, 31, 8, 17, 'Aim for 7-9 hours of sleep per night', 0, '2024-04-25 01:51:16'),
(60, 12, 31, 8, 18, 'Limit consumption of processed foods and high sugar beverages', 0, '2024-04-25 01:51:16'),
(61, 12, 31, 8, 19, 'Regularly schedule check-ups with a healthcare provider', 0, '2024-04-25 01:51:16'),
(62, 10, 32, 7, 10, 'Attend all classes and take detailed notes', 0, '2024-04-25 06:11:15'),
(63, 10, 32, 7, 11, 'Form or join study groups to enhance learning', 0, '2024-04-25 06:11:15'),
(64, 10, 32, 7, 12, 'Regularly review class materials to reinforce knowledge', 0, '2024-04-25 06:11:15'),
(65, 10, 32, 7, 13, 'Use academic resources like libraries and online databases', 0, '2024-04-25 06:11:15'),
(66, 10, 32, 7, 14, 'Seek feedback on assignments and tests to improve', 0, '2024-04-25 06:11:15'),
(67, 10, 32, 8, 15, 'Incorporate a variety of physical activities to keep workouts interesting', 0, '2024-04-25 06:11:15'),
(68, 10, 32, 8, 16, 'Stay hydrated, especially during physical activities', 0, '2024-04-25 06:11:15'),
(69, 10, 32, 8, 17, 'Aim for 7-9 hours of sleep per night', 0, '2024-04-25 06:11:15'),
(70, 10, 32, 8, 18, 'Limit consumption of processed foods and high sugar beverages', 0, '2024-04-25 06:11:15'),
(71, 10, 32, 8, 19, 'Regularly schedule check-ups with a healthcare provider', 0, '2024-04-25 06:11:15'),
(72, 10, 32, 10, 20, 'Be open to making friends from different backgrounds and cultures', 0, '2024-04-25 06:11:15'),
(73, 10, 32, 10, 21, 'Volunteer for social events and university functions', 0, '2024-04-25 06:11:15'),
(74, 10, 32, 10, 22, 'Respect your commitments and be reliable in social settings', 0, '2024-04-25 06:11:15'),
(75, 10, 32, 10, 23, 'Prioritize quality of friendships over quantity', 0, '2024-04-25 06:11:15'),
(76, 10, 32, 10, 24, 'Communicate openly and honestly in your relationships', 0, '2024-04-25 06:11:15'),
(77, 10, 32, 11, 25, 'Explore hobbies that are completely unrelated to your studies', 0, '2024-04-25 06:11:15'),
(78, 10, 32, 11, 26, 'Take breaks to enjoy nature, such as local parks or hikes', 0, '2024-04-25 06:11:15'),
(79, 10, 32, 11, 27, 'Use art or music as creative outlets for relaxation', 0, '2024-04-25 06:11:15'),
(80, 10, 32, 11, 28, 'Plan short trips or mini-adventures with friends', 0, '2024-04-25 06:11:15'),
(81, 10, 32, 11, 29, 'Regularly try new activities to find what brings you joy and relaxation', 0, '2024-04-25 06:11:15'),
(82, 10, 32, 13, 30, 'Allocate time for solitude and reflection', 0, '2024-04-25 06:11:15'),
(83, 10, 32, 13, 31, 'Explore different philosophical or spiritual texts to broaden perspectives', 0, '2024-04-25 06:11:15'),
(84, 10, 32, 13, 32, 'Participate in groups or communities that share your spiritual interests', 0, '2024-04-25 06:11:15'),
(85, 10, 32, 13, 33, 'Practice gratitude daily', 0, '2024-04-25 06:11:15'),
(86, 10, 32, 13, 34, 'Use ethical considerations as a guide for decision-making', 0, '2024-04-25 06:11:15'),
(87, 10, 32, 14, 35, 'Set personal goals and review them regularly', 0, '2024-04-25 06:11:15'),
(88, 10, 32, 14, 36, 'Practice self-discipline, especially in balancing various aspects of life', 0, '2024-04-25 06:11:15'),
(89, 10, 32, 14, 37, 'Accept and learn from failures as part of personal growth', 0, '2024-04-25 06:11:15'),
(90, 10, 32, 14, 38, 'Seek out mentors who can guide personal and professional development', 0, '2024-04-25 06:11:15'),
(91, 10, 32, 14, 39, 'Stay curious and open-minded to new experiences and ideas', 0, '2024-04-25 06:11:15'),
(92, 10, 33, 7, 10, 'Attend all classes and take detailed notes', 0, '2024-04-25 06:14:21'),
(93, 10, 33, 7, 11, 'Form or join study groups to enhance learning', 0, '2024-04-25 06:14:21'),
(94, 10, 33, 7, 12, 'Regularly review class materials to reinforce knowledge', 0, '2024-04-25 06:14:21'),
(95, 10, 33, 7, 13, 'Use academic resources like libraries and online databases', 0, '2024-04-25 06:14:21'),
(96, 10, 33, 7, 14, 'Seek feedback on assignments and tests to improve', 0, '2024-04-25 06:14:21'),
(97, 10, 33, 8, 15, 'Incorporate a variety of physical activities to keep workouts interesting', 0, '2024-04-25 06:14:21'),
(98, 10, 33, 8, 16, 'Stay hydrated, especially during physical activities', 0, '2024-04-25 06:14:21'),
(99, 10, 33, 8, 17, 'Aim for 7-9 hours of sleep per night', 0, '2024-04-25 06:14:21'),
(100, 10, 33, 8, 18, 'Limit consumption of processed foods and high sugar beverages', 0, '2024-04-25 06:14:21'),
(101, 10, 33, 8, 19, 'Regularly schedule check-ups with a healthcare provider', 0, '2024-04-25 06:14:21'),
(102, 10, 33, 10, 20, 'Be open to making friends from different backgrounds and cultures', 0, '2024-04-25 06:14:21'),
(103, 10, 33, 10, 21, 'Volunteer for social events and university functions', 0, '2024-04-25 06:14:21'),
(104, 10, 33, 10, 22, 'Respect your commitments and be reliable in social settings', 0, '2024-04-25 06:14:21'),
(105, 10, 33, 10, 23, 'Prioritize quality of friendships over quantity', 0, '2024-04-25 06:14:21'),
(106, 10, 33, 10, 24, 'Communicate openly and honestly in your relationships', 0, '2024-04-25 06:14:21'),
(107, 10, 33, 11, 25, 'Explore hobbies that are completely unrelated to your studies', 0, '2024-04-25 06:14:21'),
(108, 10, 33, 11, 26, 'Take breaks to enjoy nature, such as local parks or hikes', 0, '2024-04-25 06:14:21'),
(109, 10, 33, 11, 27, 'Use art or music as creative outlets for relaxation', 0, '2024-04-25 06:14:21'),
(110, 10, 33, 11, 28, 'Plan short trips or mini-adventures with friends', 0, '2024-04-25 06:14:21'),
(111, 10, 33, 11, 29, 'Regularly try new activities to find what brings you joy and relaxation', 0, '2024-04-25 06:14:21'),
(112, 10, 33, 13, 30, 'Allocate time for solitude and reflection', 0, '2024-04-25 06:14:21'),
(113, 10, 33, 13, 31, 'Explore different philosophical or spiritual texts to broaden perspectives', 0, '2024-04-25 06:14:21'),
(114, 10, 33, 13, 32, 'Participate in groups or communities that share your spiritual interests', 0, '2024-04-25 06:14:21'),
(115, 10, 33, 13, 33, 'Practice gratitude daily', 0, '2024-04-25 06:14:21'),
(116, 10, 33, 13, 34, 'Use ethical considerations as a guide for decision-making', 0, '2024-04-25 06:14:21'),
(117, 10, 33, 14, 35, 'Set personal goals and review them regularly', 0, '2024-04-25 06:14:21'),
(118, 10, 33, 14, 36, 'Practice self-discipline, especially in balancing various aspects of life', 0, '2024-04-25 06:14:21'),
(119, 10, 33, 14, 37, 'Accept and learn from failures as part of personal growth', 0, '2024-04-25 06:14:21'),
(120, 10, 33, 14, 38, 'Seek out mentors who can guide personal and professional development', 0, '2024-04-25 06:14:21'),
(121, 10, 33, 14, 39, 'Stay curious and open-minded to new experiences and ideas', 0, '2024-04-25 06:14:21'),
(122, 10, 34, 4, 1, 'Plan family activities or trips during breaks', 0, '2024-04-25 06:28:15'),
(123, 10, 34, 4, 2, 'Share your academic and personal achievements to keep them involved', 0, '2024-04-25 06:28:15'),
(124, 10, 34, 4, 3, 'Be proactive in addressing conflicts or misunderstandings', 0, '2024-04-25 06:28:15'),
(125, 10, 34, 4, 4, 'Show appreciation for family support', 0, '2024-04-25 06:28:15'),
(126, 10, 34, 4, 5, 'Set boundaries with family that respect your independence', 0, '2024-04-25 06:28:15'),
(127, 10, 34, 7, 10, 'Attend all classes and take detailed notes', 0, '2024-04-25 06:28:15'),
(128, 10, 34, 7, 11, 'Form or join study groups to enhance learning', 0, '2024-04-25 06:28:15'),
(129, 10, 34, 7, 12, 'Regularly review class materials to reinforce knowledge', 0, '2024-04-25 06:28:15'),
(130, 10, 34, 7, 13, 'Use academic resources like libraries and online databases', 0, '2024-04-25 06:28:15'),
(131, 10, 34, 7, 14, 'Seek feedback on assignments and tests to improve', 0, '2024-04-25 06:28:15'),
(132, 10, 34, 8, 15, 'Incorporate a variety of physical activities to keep workouts interesting', 0, '2024-04-25 06:28:15'),
(133, 10, 34, 8, 16, 'Stay hydrated, especially during physical activities', 0, '2024-04-25 06:28:15'),
(134, 10, 34, 8, 17, 'Aim for 7-9 hours of sleep per night', 0, '2024-04-25 06:28:15'),
(135, 10, 34, 8, 18, 'Limit consumption of processed foods and high sugar beverages', 0, '2024-04-25 06:28:15'),
(136, 10, 34, 8, 19, 'Regularly schedule check-ups with a healthcare provider', 0, '2024-04-25 06:28:15'),
(137, 10, 34, 10, 20, 'Be open to making friends from different backgrounds and cultures', 0, '2024-04-25 06:28:15'),
(138, 10, 34, 10, 21, 'Volunteer for social events and university functions', 0, '2024-04-25 06:28:15'),
(139, 10, 34, 10, 22, 'Respect your commitments and be reliable in social settings', 0, '2024-04-25 06:28:15'),
(140, 10, 34, 10, 23, 'Prioritize quality of friendships over quantity', 0, '2024-04-25 06:28:15'),
(141, 10, 34, 10, 24, 'Communicate openly and honestly in your relationships', 0, '2024-04-25 06:28:15'),
(142, 10, 34, 11, 25, 'Explore hobbies that are completely unrelated to your studies', 0, '2024-04-25 06:28:15'),
(143, 10, 34, 11, 26, 'Take breaks to enjoy nature, such as local parks or hikes', 0, '2024-04-25 06:28:15'),
(144, 10, 34, 11, 27, 'Use art or music as creative outlets for relaxation', 0, '2024-04-25 06:28:15'),
(145, 10, 34, 11, 28, 'Plan short trips or mini-adventures with friends', 0, '2024-04-25 06:28:15'),
(146, 10, 34, 11, 29, 'Regularly try new activities to find what brings you joy and relaxation', 0, '2024-04-25 06:28:15'),
(147, 10, 34, 13, 30, 'Allocate time for solitude and reflection', 0, '2024-04-25 06:28:15'),
(148, 10, 34, 13, 31, 'Explore different philosophical or spiritual texts to broaden perspectives', 0, '2024-04-25 06:28:15'),
(149, 10, 34, 13, 32, 'Participate in groups or communities that share your spiritual interests', 0, '2024-04-25 06:28:15'),
(150, 10, 34, 13, 33, 'Practice gratitude daily', 0, '2024-04-25 06:28:15'),
(151, 10, 34, 13, 34, 'Use ethical considerations as a guide for decision-making', 0, '2024-04-25 06:28:15'),
(152, 10, 34, 14, 35, 'Set personal goals and review them regularly', 0, '2024-04-25 06:28:15'),
(153, 10, 34, 14, 36, 'Practice self-discipline, especially in balancing various aspects of life', 0, '2024-04-25 06:28:15'),
(154, 10, 34, 14, 37, 'Accept and learn from failures as part of personal growth', 0, '2024-04-25 06:28:15'),
(155, 10, 34, 14, 38, 'Seek out mentors who can guide personal and professional development', 0, '2024-04-25 06:28:15'),
(156, 10, 34, 14, 39, 'Stay curious and open-minded to new experiences and ideas', 0, '2024-04-25 06:28:15'),
(157, 10, 35, 4, 1, 'Plan family activities or trips during breaks', 0, '2024-04-25 06:31:16'),
(158, 10, 35, 4, 2, 'Share your academic and personal achievements to keep them involved', 0, '2024-04-25 06:31:16'),
(159, 10, 35, 4, 3, 'Be proactive in addressing conflicts or misunderstandings', 0, '2024-04-25 06:31:16'),
(160, 10, 35, 4, 4, 'Show appreciation for family support', 0, '2024-04-25 06:31:16'),
(161, 10, 35, 4, 5, 'Set boundaries with family that respect your independence', 0, '2024-04-25 06:31:16'),
(162, 10, 35, 7, 10, 'Attend all classes and take detailed notes', 0, '2024-04-25 06:31:16'),
(163, 10, 35, 7, 11, 'Form or join study groups to enhance learning', 0, '2024-04-25 06:31:16'),
(164, 10, 35, 7, 12, 'Regularly review class materials to reinforce knowledge', 0, '2024-04-25 06:31:16'),
(165, 10, 35, 7, 13, 'Use academic resources like libraries and online databases', 0, '2024-04-25 06:31:16'),
(166, 10, 35, 7, 14, 'Seek feedback on assignments and tests to improve', 0, '2024-04-25 06:31:16'),
(167, 10, 35, 8, 15, 'Incorporate a variety of physical activities to keep workouts interesting', 0, '2024-04-25 06:31:16'),
(168, 10, 35, 8, 16, 'Stay hydrated, especially during physical activities', 0, '2024-04-25 06:31:16'),
(169, 10, 35, 8, 17, 'Aim for 7-9 hours of sleep per night', 0, '2024-04-25 06:31:16'),
(170, 10, 35, 8, 18, 'Limit consumption of processed foods and high sugar beverages', 0, '2024-04-25 06:31:16'),
(171, 10, 35, 8, 19, 'Regularly schedule check-ups with a healthcare provider', 0, '2024-04-25 06:31:16'),
(172, 10, 35, 10, 20, 'Be open to making friends from different backgrounds and cultures', 0, '2024-04-25 06:31:16'),
(173, 10, 35, 10, 21, 'Volunteer for social events and university functions', 0, '2024-04-25 06:31:16'),
(174, 10, 35, 10, 22, 'Respect your commitments and be reliable in social settings', 0, '2024-04-25 06:31:16'),
(175, 10, 35, 10, 23, 'Prioritize quality of friendships over quantity', 0, '2024-04-25 06:31:16'),
(176, 10, 35, 10, 24, 'Communicate openly and honestly in your relationships', 0, '2024-04-25 06:31:16'),
(177, 10, 35, 11, 25, 'Explore hobbies that are completely unrelated to your studies', 0, '2024-04-25 06:31:16'),
(178, 10, 35, 11, 26, 'Take breaks to enjoy nature, such as local parks or hikes', 0, '2024-04-25 06:31:16'),
(179, 10, 35, 11, 27, 'Use art or music as creative outlets for relaxation', 0, '2024-04-25 06:31:16'),
(180, 10, 35, 11, 28, 'Plan short trips or mini-adventures with friends', 0, '2024-04-25 06:31:16'),
(181, 10, 35, 11, 29, 'Regularly try new activities to find what brings you joy and relaxation', 0, '2024-04-25 06:31:17'),
(182, 10, 35, 13, 30, 'Allocate time for solitude and reflection', 0, '2024-04-25 06:31:17'),
(183, 10, 35, 13, 31, 'Explore different philosophical or spiritual texts to broaden perspectives', 0, '2024-04-25 06:31:17'),
(184, 10, 35, 13, 32, 'Participate in groups or communities that share your spiritual interests', 0, '2024-04-25 06:31:17'),
(185, 10, 35, 13, 33, 'Practice gratitude daily', 0, '2024-04-25 06:31:17'),
(186, 10, 35, 13, 34, 'Use ethical considerations as a guide for decision-making', 0, '2024-04-25 06:31:17'),
(187, 10, 35, 14, 35, 'Set personal goals and review them regularly', 0, '2024-04-25 06:31:17'),
(188, 10, 35, 14, 36, 'Practice self-discipline, especially in balancing various aspects of life', 0, '2024-04-25 06:31:17'),
(189, 10, 35, 14, 37, 'Accept and learn from failures as part of personal growth', 0, '2024-04-25 06:31:17'),
(190, 10, 35, 14, 38, 'Seek out mentors who can guide personal and professional development', 0, '2024-04-25 06:31:17'),
(191, 10, 35, 14, 39, 'Stay curious and open-minded to new experiences and ideas', 0, '2024-04-25 06:31:17'),
(192, 10, 36, 7, 10, 'Attend all classes and take detailed notes', 0, '2024-04-25 06:39:14'),
(193, 10, 36, 7, 11, 'Form or join study groups to enhance learning', 0, '2024-04-25 06:39:14'),
(194, 10, 36, 7, 12, 'Regularly review class materials to reinforce knowledge', 0, '2024-04-25 06:39:14'),
(195, 10, 36, 7, 13, 'Use academic resources like libraries and online databases', 0, '2024-04-25 06:39:14'),
(196, 10, 36, 7, 14, 'Seek feedback on assignments and tests to improve', 0, '2024-04-25 06:39:14'),
(197, 10, 36, 8, 15, 'Incorporate a variety of physical activities to keep workouts interesting', 0, '2024-04-25 06:39:14'),
(198, 10, 36, 8, 16, 'Stay hydrated, especially during physical activities', 0, '2024-04-25 06:39:14'),
(199, 10, 36, 8, 17, 'Aim for 7-9 hours of sleep per night', 0, '2024-04-25 06:39:14'),
(200, 10, 36, 8, 18, 'Limit consumption of processed foods and high sugar beverages', 0, '2024-04-25 06:39:14'),
(201, 10, 36, 8, 19, 'Regularly schedule check-ups with a healthcare provider', 0, '2024-04-25 06:39:14'),
(202, 10, 36, 10, 20, 'Be open to making friends from different backgrounds and cultures', 0, '2024-04-25 06:39:14'),
(203, 10, 36, 10, 21, 'Volunteer for social events and university functions', 0, '2024-04-25 06:39:14'),
(204, 10, 36, 10, 22, 'Respect your commitments and be reliable in social settings', 0, '2024-04-25 06:39:14'),
(205, 10, 36, 10, 23, 'Prioritize quality of friendships over quantity', 0, '2024-04-25 06:39:14'),
(206, 10, 36, 10, 24, 'Communicate openly and honestly in your relationships', 0, '2024-04-25 06:39:14'),
(207, 10, 36, 11, 25, 'Explore hobbies that are completely unrelated to your studies', 0, '2024-04-25 06:39:14'),
(208, 10, 36, 11, 26, 'Take breaks to enjoy nature, such as local parks or hikes', 0, '2024-04-25 06:39:14'),
(209, 10, 36, 11, 27, 'Use art or music as creative outlets for relaxation', 0, '2024-04-25 06:39:14'),
(210, 10, 36, 11, 28, 'Plan short trips or mini-adventures with friends', 0, '2024-04-25 06:39:14'),
(211, 10, 36, 11, 29, 'Regularly try new activities to find what brings you joy and relaxation', 0, '2024-04-25 06:39:14'),
(212, 10, 36, 13, 30, 'Allocate time for solitude and reflection', 0, '2024-04-25 06:39:14'),
(213, 10, 36, 13, 31, 'Explore different philosophical or spiritual texts to broaden perspectives', 0, '2024-04-25 06:39:14'),
(214, 10, 36, 13, 32, 'Participate in groups or communities that share your spiritual interests', 0, '2024-04-25 06:39:14'),
(215, 10, 36, 13, 33, 'Practice gratitude daily', 0, '2024-04-25 06:39:14'),
(216, 10, 36, 13, 34, 'Use ethical considerations as a guide for decision-making', 0, '2024-04-25 06:39:14'),
(217, 10, 36, 14, 35, 'Set personal goals and review them regularly', 0, '2024-04-25 06:39:14'),
(218, 10, 36, 14, 36, 'Practice self-discipline, especially in balancing various aspects of life', 0, '2024-04-25 06:39:14'),
(219, 10, 36, 14, 37, 'Accept and learn from failures as part of personal growth', 0, '2024-04-25 06:39:14'),
(220, 10, 36, 14, 38, 'Seek out mentors who can guide personal and professional development', 0, '2024-04-25 06:39:14'),
(221, 10, 36, 14, 39, 'Stay curious and open-minded to new experiences and ideas', 0, '2024-04-25 06:39:14'),
(222, 10, 37, 7, 10, 'Attend all classes and take detailed notes', 0, '2024-04-25 06:51:54'),
(223, 10, 37, 7, 11, 'Form or join study groups to enhance learning', 0, '2024-04-25 06:51:54'),
(224, 10, 37, 7, 12, 'Regularly review class materials to reinforce knowledge', 0, '2024-04-25 06:51:54'),
(225, 10, 37, 7, 13, 'Use academic resources like libraries and online databases', 0, '2024-04-25 06:51:54'),
(226, 10, 37, 7, 14, 'Seek feedback on assignments and tests to improve', 0, '2024-04-25 06:51:54'),
(227, 10, 37, 8, 15, 'Incorporate a variety of physical activities to keep workouts interesting', 0, '2024-04-25 06:51:54'),
(228, 10, 37, 8, 16, 'Stay hydrated, especially during physical activities', 0, '2024-04-25 06:51:54'),
(229, 10, 37, 8, 17, 'Aim for 7-9 hours of sleep per night', 0, '2024-04-25 06:51:54'),
(230, 10, 37, 8, 18, 'Limit consumption of processed foods and high sugar beverages', 0, '2024-04-25 06:51:54'),
(231, 10, 37, 8, 19, 'Regularly schedule check-ups with a healthcare provider', 0, '2024-04-25 06:51:54'),
(232, 10, 37, 10, 20, 'Be open to making friends from different backgrounds and cultures', 0, '2024-04-25 06:51:54'),
(233, 10, 37, 10, 21, 'Volunteer for social events and university functions', 0, '2024-04-25 06:51:54'),
(234, 10, 37, 10, 22, 'Respect your commitments and be reliable in social settings', 0, '2024-04-25 06:51:54'),
(235, 10, 37, 10, 23, 'Prioritize quality of friendships over quantity', 0, '2024-04-25 06:51:54'),
(236, 10, 37, 10, 24, 'Communicate openly and honestly in your relationships', 0, '2024-04-25 06:51:54'),
(237, 10, 37, 11, 25, 'Explore hobbies that are completely unrelated to your studies', 0, '2024-04-25 06:51:54'),
(238, 10, 37, 11, 26, 'Take breaks to enjoy nature, such as local parks or hikes', 0, '2024-04-25 06:51:54'),
(239, 10, 37, 11, 27, 'Use art or music as creative outlets for relaxation', 0, '2024-04-25 06:51:54'),
(240, 10, 37, 11, 28, 'Plan short trips or mini-adventures with friends', 0, '2024-04-25 06:51:54'),
(241, 10, 37, 11, 29, 'Regularly try new activities to find what brings you joy and relaxation', 0, '2024-04-25 06:51:54'),
(242, 10, 37, 13, 30, 'Allocate time for solitude and reflection', 0, '2024-04-25 06:51:54'),
(243, 10, 37, 13, 31, 'Explore different philosophical or spiritual texts to broaden perspectives', 0, '2024-04-25 06:51:54'),
(244, 10, 37, 13, 32, 'Participate in groups or communities that share your spiritual interests', 0, '2024-04-25 06:51:54'),
(245, 10, 37, 13, 33, 'Practice gratitude daily', 0, '2024-04-25 06:51:54'),
(246, 10, 37, 13, 34, 'Use ethical considerations as a guide for decision-making', 0, '2024-04-25 06:51:54'),
(247, 10, 38, 7, 10, 'Attend all classes and take detailed notes', 0, '2024-04-25 07:01:55'),
(248, 10, 38, 7, 11, 'Form or join study groups to enhance learning', 0, '2024-04-25 07:01:55'),
(249, 10, 38, 7, 12, 'Regularly review class materials to reinforce knowledge', 0, '2024-04-25 07:01:55'),
(250, 10, 38, 7, 13, 'Use academic resources like libraries and online databases', 0, '2024-04-25 07:01:55'),
(251, 10, 38, 7, 14, 'Seek feedback on assignments and tests to improve', 0, '2024-04-25 07:01:55'),
(252, 10, 38, 8, 15, 'Incorporate a variety of physical activities to keep workouts interesting', 0, '2024-04-25 07:01:55'),
(253, 10, 38, 8, 16, 'Stay hydrated, especially during physical activities', 0, '2024-04-25 07:01:55'),
(254, 10, 38, 8, 17, 'Aim for 7-9 hours of sleep per night', 0, '2024-04-25 07:01:55'),
(255, 10, 38, 8, 18, 'Limit consumption of processed foods and high sugar beverages', 0, '2024-04-25 07:01:55'),
(256, 10, 38, 8, 19, 'Regularly schedule check-ups with a healthcare provider', 0, '2024-04-25 07:01:55'),
(257, 10, 38, 10, 20, 'Be open to making friends from different backgrounds and cultures', 0, '2024-04-25 07:01:55'),
(258, 10, 38, 10, 21, 'Volunteer for social events and university functions', 0, '2024-04-25 07:01:55'),
(259, 10, 38, 10, 22, 'Respect your commitments and be reliable in social settings', 0, '2024-04-25 07:01:55'),
(260, 10, 38, 10, 23, 'Prioritize quality of friendships over quantity', 0, '2024-04-25 07:01:55'),
(261, 10, 38, 10, 24, 'Communicate openly and honestly in your relationships', 0, '2024-04-25 07:01:55'),
(262, 10, 38, 11, 25, 'Explore hobbies that are completely unrelated to your studies', 0, '2024-04-25 07:01:55'),
(263, 10, 38, 11, 26, 'Take breaks to enjoy nature, such as local parks or hikes', 0, '2024-04-25 07:01:55'),
(264, 10, 38, 11, 27, 'Use art or music as creative outlets for relaxation', 0, '2024-04-25 07:01:55'),
(265, 10, 38, 11, 28, 'Plan short trips or mini-adventures with friends', 0, '2024-04-25 07:01:55'),
(266, 10, 38, 11, 29, 'Regularly try new activities to find what brings you joy and relaxation', 0, '2024-04-25 07:01:55'),
(267, 15, 39, 4, 1, 'Plan family activities or trips during breaks', 0, '2024-04-25 13:49:05'),
(268, 15, 39, 4, 2, 'Share your academic and personal achievements to keep them involved', 0, '2024-04-25 13:49:05'),
(269, 15, 39, 4, 3, 'Be proactive in addressing conflicts or misunderstandings', 0, '2024-04-25 13:49:05'),
(270, 15, 39, 4, 4, 'Show appreciation for family support', 0, '2024-04-25 13:49:05'),
(271, 15, 39, 4, 5, 'Set boundaries with family that respect your independence', 0, '2024-04-25 13:49:05'),
(272, 15, 39, 6, 6, 'Learn basic investing to grow your savings', 0, '2024-04-25 13:49:05'),
(273, 15, 39, 6, 7, 'Use student discounts and promotions to save money', 0, '2024-04-25 13:49:05'),
(274, 15, 39, 6, 8, 'Track all expenses to understand spending habits', 0, '2024-04-25 13:49:05'),
(275, 15, 39, 6, 9, 'Set up an emergency fund to cover unexpected expenses', 0, '2024-04-25 13:49:05'),
(276, 15, 39, 7, 10, 'Attend all classes and take detailed notes', 0, '2024-04-25 13:49:05'),
(277, 15, 39, 7, 11, 'Form or join study groups to enhance learning', 0, '2024-04-25 13:49:05'),
(278, 15, 39, 7, 12, 'Regularly review class materials to reinforce knowledge', 0, '2024-04-25 13:49:05'),
(279, 15, 39, 7, 13, 'Use academic resources like libraries and online databases', 0, '2024-04-25 13:49:05'),
(280, 15, 39, 7, 14, 'Seek feedback on assignments and tests to improve', 0, '2024-04-25 13:49:05'),
(281, 15, 39, 8, 15, 'Incorporate a variety of physical activities to keep workouts interesting', 0, '2024-04-25 13:49:05'),
(282, 15, 39, 8, 16, 'Stay hydrated, especially during physical activities', 0, '2024-04-25 13:49:05'),
(283, 15, 39, 8, 17, 'Aim for 7-9 hours of sleep per night', 0, '2024-04-25 13:49:05'),
(284, 15, 39, 8, 18, 'Limit consumption of processed foods and high sugar beverages', 0, '2024-04-25 13:49:05'),
(285, 15, 39, 8, 19, 'Regularly schedule check-ups with a healthcare provider', 0, '2024-04-25 13:49:05'),
(286, 14, 40, 8, 15, 'Incorporate a variety of physical activities to keep workouts interesting', 0, '2024-04-25 14:06:42'),
(287, 14, 40, 8, 16, 'Stay hydrated, especially during physical activities', 0, '2024-04-25 14:06:42'),
(288, 14, 40, 8, 17, 'Aim for 7-9 hours of sleep per night', 0, '2024-04-25 14:06:42'),
(289, 14, 40, 8, 18, 'Limit consumption of processed foods and high sugar beverages', 0, '2024-04-25 14:06:42'),
(290, 14, 40, 8, 19, 'Regularly schedule check-ups with a healthcare provider', 0, '2024-04-25 14:06:42'),
(291, 14, 40, 10, 20, 'Be open to making friends from different backgrounds and cultures', 0, '2024-04-25 14:06:42'),
(292, 14, 40, 10, 21, 'Volunteer for social events and university functions', 0, '2024-04-25 14:06:42'),
(293, 14, 40, 10, 22, 'Respect your commitments and be reliable in social settings', 0, '2024-04-25 14:06:42'),
(294, 14, 40, 10, 23, 'Prioritize quality of friendships over quantity', 0, '2024-04-25 14:06:42'),
(295, 14, 40, 10, 24, 'Communicate openly and honestly in your relationships', 0, '2024-04-25 14:06:42'),
(296, 14, 40, 11, 25, 'Explore hobbies that are completely unrelated to your studies', 0, '2024-04-25 14:06:42'),
(297, 14, 40, 11, 26, 'Take breaks to enjoy nature, such as local parks or hikes', 0, '2024-04-25 14:06:42'),
(298, 14, 40, 11, 27, 'Use art or music as creative outlets for relaxation', 0, '2024-04-25 14:06:42'),
(299, 14, 40, 11, 28, 'Plan short trips or mini-adventures with friends', 0, '2024-04-25 14:06:42'),
(300, 14, 40, 11, 29, 'Regularly try new activities to find what brings you joy and relaxation', 0, '2024-04-25 14:06:42'),
(301, 14, 40, 13, 30, 'Allocate time for solitude and reflection', 0, '2024-04-25 14:06:42'),
(302, 14, 40, 13, 31, 'Explore different philosophical or spiritual texts to broaden perspectives', 0, '2024-04-25 14:06:42'),
(303, 14, 40, 13, 32, 'Participate in groups or communities that share your spiritual interests', 0, '2024-04-25 14:06:42'),
(304, 14, 40, 13, 33, 'Practice gratitude daily', 0, '2024-04-25 14:06:42'),
(305, 14, 40, 13, 34, 'Use ethical considerations as a guide for decision-making', 0, '2024-04-25 14:06:42'),
(306, 15, 41, 8, 15, 'Incorporate a variety of physical activities to keep workouts interesting', 0, '2024-04-25 14:08:18'),
(307, 15, 41, 8, 16, 'Stay hydrated, especially during physical activities', 0, '2024-04-25 14:08:18'),
(308, 15, 41, 8, 17, 'Aim for 7-9 hours of sleep per night', 0, '2024-04-25 14:08:18'),
(309, 15, 41, 8, 18, 'Limit consumption of processed foods and high sugar beverages', 0, '2024-04-25 14:08:18'),
(310, 15, 41, 8, 19, 'Regularly schedule check-ups with a healthcare provider', 0, '2024-04-25 14:08:18'),
(311, 15, 41, 10, 20, 'Be open to making friends from different backgrounds and cultures', 0, '2024-04-25 14:08:18'),
(312, 15, 41, 10, 21, 'Volunteer for social events and university functions', 0, '2024-04-25 14:08:18'),
(313, 15, 41, 10, 22, 'Respect your commitments and be reliable in social settings', 0, '2024-04-25 14:08:18'),
(314, 15, 41, 10, 23, 'Prioritize quality of friendships over quantity', 0, '2024-04-25 14:08:18'),
(315, 15, 41, 10, 24, 'Communicate openly and honestly in your relationships', 0, '2024-04-25 14:08:18'),
(316, 15, 41, 14, 35, 'Set personal goals and review them regularly', 0, '2024-04-25 14:08:18'),
(317, 15, 41, 14, 36, 'Practice self-discipline, especially in balancing various aspects of life', 0, '2024-04-25 14:08:18'),
(318, 15, 41, 14, 37, 'Accept and learn from failures as part of personal growth', 0, '2024-04-25 14:08:18'),
(319, 15, 41, 14, 38, 'Seek out mentors who can guide personal and professional development', 0, '2024-04-25 14:08:18'),
(320, 15, 41, 14, 39, 'Stay curious and open-minded to new experiences and ideas', 0, '2024-04-25 14:08:18'),
(321, 10, 42, 7, 10, 'Attend all classes and take detailed notes', 0, '2024-04-25 14:21:27'),
(322, 10, 42, 7, 11, 'Form or join study groups to enhance learning', 0, '2024-04-25 14:21:27'),
(323, 10, 42, 7, 12, 'Regularly review class materials to reinforce knowledge', 0, '2024-04-25 14:21:27'),
(324, 10, 42, 7, 13, 'Use academic resources like libraries and online databases', 0, '2024-04-25 14:21:27'),
(325, 10, 42, 7, 14, 'Seek feedback on assignments and tests to improve', 1, '2024-04-25 14:21:27'),
(326, 10, 42, 8, 15, 'Incorporate a variety of physical activities to keep workouts interesting', 0, '2024-04-25 14:21:27'),
(327, 10, 42, 8, 16, 'Stay hydrated, especially during physical activities', 0, '2024-04-25 14:21:27'),
(328, 10, 42, 8, 17, 'Aim for 7-9 hours of sleep per night', 0, '2024-04-25 14:21:27'),
(329, 10, 42, 8, 18, 'Limit consumption of processed foods and high sugar beverages', 1, '2024-04-25 14:21:27'),
(330, 10, 42, 8, 19, 'Regularly schedule check-ups with a healthcare provider', 0, '2024-04-25 14:21:27'),
(331, 10, 42, 10, 20, 'Be open to making friends from different backgrounds and cultures', 1, '2024-04-25 14:21:27'),
(332, 10, 42, 10, 21, 'Volunteer for social events and university functions', 0, '2024-04-25 14:21:27'),
(333, 10, 42, 10, 22, 'Respect your commitments and be reliable in social settings', 0, '2024-04-25 14:21:27'),
(334, 10, 42, 10, 23, 'Prioritize quality of friendships over quantity', 0, '2024-04-25 14:21:27'),
(335, 10, 42, 10, 24, 'Communicate openly and honestly in your relationships', 0, '2024-04-25 14:21:27'),
(336, 10, 43, 6, 6, 'Learn basic investing to grow your savings', 0, '2024-04-26 10:12:59'),
(337, 10, 43, 6, 7, 'Use student discounts and promotions to save money', 0, '2024-04-26 10:12:59'),
(338, 10, 43, 6, 8, 'Track all expenses to understand spending habits', 0, '2024-04-26 10:12:59'),
(339, 10, 43, 6, 9, 'Set up an emergency fund to cover unexpected expenses', 0, '2024-04-26 10:12:59'),
(340, 10, 43, 11, 25, 'Explore hobbies that are completely unrelated to your studies', 0, '2024-04-26 10:12:59'),
(341, 10, 43, 11, 26, 'Take breaks to enjoy nature, such as local parks or hikes', 0, '2024-04-26 10:12:59'),
(342, 10, 43, 11, 27, 'Use art or music as creative outlets for relaxation', 0, '2024-04-26 10:12:59'),
(343, 10, 43, 11, 28, 'Plan short trips or mini-adventures with friends', 0, '2024-04-26 10:12:59'),
(344, 10, 43, 11, 29, 'Regularly try new activities to find what brings you joy and relaxation', 0, '2024-04-26 10:12:59');

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
  MODIFY `assess_area_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=214;

--
-- AUTO_INCREMENT for table `coachers`
--
ALTER TABLE `coachers`
  MODIFY `coach_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `feedbacks`
--
ALTER TABLE `feedbacks`
  MODIFY `feedback_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `goals`
--
ALTER TABLE `goals`
  MODIFY `goal_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `tips`
--
ALTER TABLE `tips`
  MODIFY `tip_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=40;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `user_tips`
--
ALTER TABLE `user_tips`
  MODIFY `user_tip_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=345;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
