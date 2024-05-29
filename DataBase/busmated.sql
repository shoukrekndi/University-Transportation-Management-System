-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 29, 2024 at 09:43 PM
-- Server version: 10.4.28-MariaDB
-- PHP Version: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `busmated`
--

-- --------------------------------------------------------

--
-- Table structure for table `buses`
--

CREATE TABLE `buses` (
  `bus_id` bigint(20) UNSIGNED NOT NULL,
  `bus_number` varchar(255) NOT NULL,
  `bus_type` enum('large','medium','small') NOT NULL,
  `bus_sign` varchar(255) NOT NULL,
  `capacity` int(11) NOT NULL,
  `company_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `buses`
--

INSERT INTO `buses` (`bus_id`, `bus_number`, `bus_type`, `bus_sign`, `capacity`, `company_id`, `created_at`, `updated_at`) VALUES
(1, '1', 'large', '1586324', 20, 3, '2024-02-29 15:33:45', '2024-02-29 14:06:38'),
(3, '2', 'large', '258', 40, 1, '2024-02-29 19:18:51', '2024-02-29 19:18:51');

-- --------------------------------------------------------

--
-- Table structure for table `change_trip_requests`
--

CREATE TABLE `change_trip_requests` (
  `chtrequest_id` bigint(20) UNSIGNED NOT NULL,
  `subscriber_id` bigint(20) UNSIGNED NOT NULL,
  `old_trip_number` int(11) NOT NULL,
  `new_trip_number` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `change_trip_requests`
--

INSERT INTO `change_trip_requests` (`chtrequest_id`, `subscriber_id`, `old_trip_number`, `new_trip_number`, `created_at`, `updated_at`) VALUES
(1, 1, 1, 3, '2024-02-29 14:12:53', '2024-02-29 14:12:53');

-- --------------------------------------------------------

--
-- Table structure for table `companies`
--

CREATE TABLE `companies` (
  `company_id` bigint(20) UNSIGNED NOT NULL,
  `company_name` varchar(255) NOT NULL,
  `company_address` text NOT NULL,
  `comunication_email` varchar(255) NOT NULL,
  `phone_number` varchar(255) NOT NULL,
  `company_website` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `companies`
--

INSERT INTO `companies` (`company_id`, `company_name`, `company_address`, `comunication_email`, `phone_number`, `company_website`, `created_at`, `updated_at`) VALUES
(1, 'طروادة', 'دمشق التل', 'tt@gmail.com', '0936589652', 'https://www.youtube.com/', '2024-02-28 15:18:26', '2024-02-28 15:18:26'),
(3, 'فرح', 'دمشق التل', 'tt7@gmail.com', '0936589659', 'https://www.youtube.com/', '2024-02-29 03:42:04', '2024-02-29 04:24:45');

-- --------------------------------------------------------

--
-- Table structure for table `contracts`
--

CREATE TABLE `contracts` (
  `contract_id` bigint(20) UNSIGNED NOT NULL,
  `contract_number` varchar(255) NOT NULL,
  `contract_price` decimal(8,2) NOT NULL,
  `start_date` date NOT NULL,
  `end_date` date NOT NULL,
  `year_id` bigint(20) UNSIGNED NOT NULL,
  `company_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `contracts`
--

INSERT INTO `contracts` (`contract_id`, `contract_number`, `contract_price`, `start_date`, `end_date`, `year_id`, `company_id`, `created_at`, `updated_at`) VALUES
(1, '20', 4500.00, '2024-02-21', '2024-03-09', 2, 1, '2024-02-28 15:18:26', '2024-02-29 03:31:38'),
(3, '2', 5000.00, '2024-01-28', '2024-03-09', 2, 3, '2024-02-29 03:42:04', '2024-02-29 03:42:04');

-- --------------------------------------------------------

--
-- Table structure for table `dashboard_users`
--

CREATE TABLE `dashboard_users` (
  `duser_id` bigint(20) UNSIGNED NOT NULL,
  `user_name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `phone_number` varchar(255) NOT NULL,
  `role` enum('admin','user_university','user_company') NOT NULL,
  `year_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `dashboard_users`
--

INSERT INTO `dashboard_users` (`duser_id`, `user_name`, `email`, `password`, `phone_number`, `role`, `year_id`, `created_at`, `updated_at`) VALUES
(1, 'jwan', 'aaa@gmail.com', '123456', '0953415972', 'admin', 2, '2024-02-28 12:24:25', '2024-02-28 13:08:08'),
(7, 'shoukre', 'sh@gmail.com', '$2y$10$kN0RTKe6yidOmwieQe8UMe2/KIGUd9BdakwoqqiaNLBUmkZ9x7Vv.', '0953415998', 'user_company', 1, '2024-03-01 16:41:48', '2024-03-02 00:27:42'),
(8, 'saher', 'saher@gmail.com', '$2y$10$3ncUFTFAZX3ytZw7DhDffuAeXnY8ghFe9gRTsY/.wxzpAaRJqRs5G', '0900000000', 'admin', 1, '2024-03-01 18:59:48', '2024-03-01 18:59:48'),
(10, 'shoukre', 'sh88@gmail.com', '$2y$12$hUpagPJ1dn/.sX.HuCuYAeYJeR1smarvE.qAzib9BofTNtJf9rW1q', '0965485236', 'admin', 2, '2024-03-01 16:18:53', '2024-03-01 16:18:53'),
(11, 'mohammed fareed', 'sh1111@gmail.com', '$2y$12$spo93vdPxOqGcORibJYaeeSqCgRgG.ktAuMa/Q0AgUGKEyWSBhDWW', '0955485236', 'admin', 2, '2024-03-02 00:27:25', '2024-03-02 00:27:25');

-- --------------------------------------------------------

--
-- Table structure for table `drivers`
--

CREATE TABLE `drivers` (
  `driver_id` bigint(20) UNSIGNED NOT NULL,
  `subscriber_type` varchar(255) NOT NULL,
  `driver_name` varchar(255) NOT NULL,
  `driver_address` text NOT NULL,
  `driver_number` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `license_number` varchar(255) NOT NULL,
  `date_of_employment` date NOT NULL,
  `bus_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `drivers`
--

INSERT INTO `drivers` (`driver_id`, `subscriber_type`, `driver_name`, `driver_address`, `driver_number`, `email`, `password`, `license_number`, `date_of_employment`, `bus_id`, `created_at`, `updated_at`) VALUES
(1, 'driver', 'Tarek mohager', 'دمشق مزة مزةجبل حارة7 بناء2', '0965865423', 'tarek@gmail.com', '123456789', '4567', '2024-02-29', 1, '2024-02-29 15:34:38', '2024-02-29 16:33:24'),
(4, 'driver', 'وليد', 'حلب اشرفية', '0956485325', 'wal@gmail.com', '$2y$12$25QxmSLvBLXgKiuQSiyIK.Nsos7qlnC0i1Q.WmycEFnRyVByrIxa.', '123456', '2024-03-29', 3, '2024-03-01 23:56:09', '2024-03-01 23:56:09');

-- --------------------------------------------------------

--
-- Table structure for table `driver_feedbacks`
--

CREATE TABLE `driver_feedbacks` (
  `dfeedback_id` bigint(20) UNSIGNED NOT NULL,
  `feedback_id` bigint(20) UNSIGNED NOT NULL,
  `driver_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `driver_feedbacks`
--

INSERT INTO `driver_feedbacks` (`dfeedback_id`, `feedback_id`, `driver_id`, `created_at`, `updated_at`) VALUES
(1, 1, 1, '2024-02-29 15:38:17', '2024-02-29 15:38:17'),
(2, 1, 1, '2024-02-29 15:38:46', '2024-02-29 15:38:46');

-- --------------------------------------------------------

--
-- Table structure for table `driver_notifications`
--

CREATE TABLE `driver_notifications` (
  `dnotification_id` bigint(20) UNSIGNED NOT NULL,
  `notification_id` bigint(20) UNSIGNED NOT NULL,
  `driver_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(255) NOT NULL,
  `connection` text NOT NULL,
  `queue` text NOT NULL,
  `payload` longtext NOT NULL,
  `exception` longtext NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `feedback`
--

CREATE TABLE `feedback` (
  `feedback_id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(255) NOT NULL,
  `contant` text NOT NULL,
  `type` enum('complaint','suggestion') NOT NULL,
  `state` enum('read','unread') NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `feedback`
--

INSERT INTO `feedback` (`feedback_id`, `title`, `contant`, `type`, `state`, `created_at`, `updated_at`) VALUES
(1, 'مشكلة في الباص ', 'هناك تاخير في الباص في الرحلة رقم 7 ارجو حل المشكلة ', 'complaint', 'unread', '2024-02-29 15:05:46', '2024-02-29 15:05:46');

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_reset_tokens_table', 1),
(3, '2014_10_12_100000_create_password_resets_table', 1),
(4, '2019_08_19_000000_create_failed_jobs_table', 1),
(5, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(6, '2024_02_01_123318_create_years_table', 1),
(7, '2024_02_01_123509_create_dashboard_users_table', 1),
(8, '2024_02_01_123549_create_semesters_table', 1),
(9, '2024_02_01_123620_create_companies_table', 1),
(10, '2024_02_01_123643_create_contracts_table', 1),
(11, '2024_02_01_123707_create_buses_table', 1),
(12, '2024_02_01_123738_create_drivers_table', 1),
(13, '2024_02_01_124005_create_subscription_requests_table', 1),
(14, '2024_02_01_124022_create_subscribers_table', 1),
(15, '2024_02_01_124054_create_change_trip_requests_table', 1),
(16, '2024_02_01_124125_create_trips_table', 1),
(17, '2024_02_01_124234_create_subscriber_trips_table', 1),
(18, '2024_02_01_124300_create_trip_informations_table', 1),
(19, '2024_02_01_124427_create_notifications_table', 1),
(20, '2024_02_01_124538_create_driver_notifications_table', 1),
(21, '2024_02_01_124556_create_feedback_table', 1),
(22, '2024_02_01_124615_create_driver_feedbacks_table', 1),
(23, '2024_02_01_124649_create_subscriber_feedbacks_table', 1),
(24, '2024_02_01_124700_create_subscriber_notifications_table', 1),
(25, '2024_03_01_171218_create_company_users_table', 2),
(26, '2024_03_01_171218_create_company_user_table', 3),
(27, '2024_03_01_182228_create_user_companies_table', 4);

-- --------------------------------------------------------

--
-- Table structure for table `notifications`
--

CREATE TABLE `notifications` (
  `notification_id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(255) NOT NULL,
  `contant` text NOT NULL,
  `recipient_type` enum('subscriber','driver') NOT NULL,
  `state` enum('read','unread') NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `password_reset_tokens`
--

CREATE TABLE `password_reset_tokens` (
  `email` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `token` varchar(64) NOT NULL,
  `abilities` text DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `semesters`
--

CREATE TABLE `semesters` (
  `semester_id` bigint(20) UNSIGNED NOT NULL,
  `semester_name` varchar(255) NOT NULL,
  `semester_code` varchar(255) NOT NULL,
  `start_date` date NOT NULL,
  `end_date` date NOT NULL,
  `year_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `semesters`
--

INSERT INTO `semesters` (`semester_id`, `semester_name`, `semester_code`, `start_date`, `end_date`, `year_id`, `created_at`, `updated_at`) VALUES
(5, 'فصل ثاني', 'S220', '2024-02-01', '2024-03-09', 2, '2024-02-28 11:31:30', '2024-02-28 11:45:49'),
(7, 'semester samar', 's01', '2024-03-01', '2024-03-29', 2, '2024-03-01 16:20:57', '2024-03-01 16:20:57'),
(8, 'semester one', 'w2', '2024-03-08', '2024-03-30', 2, '2024-03-01 16:21:47', '2024-03-01 16:21:47');

-- --------------------------------------------------------

--
-- Table structure for table `subscribers`
--

CREATE TABLE `subscribers` (
  `subscriber_id` bigint(20) UNSIGNED NOT NULL,
  `subscriber_type` enum('student','staff') NOT NULL,
  `full_name` varchar(255) NOT NULL,
  `college` varchar(255) NOT NULL,
  `college_number` int(11) NOT NULL,
  `phone` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `subscriber_state` enum('active','inactive') NOT NULL,
  `semester_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `subscribers`
--

INSERT INTO `subscribers` (`subscriber_id`, `subscriber_type`, `full_name`, `college`, `college_number`, `phone`, `email`, `password`, `subscriber_state`, `semester_id`, `created_at`, `updated_at`) VALUES
(1, 'student', 'شكري كندي', 'هندسة معلوماتية', 447, '0953415972', 'kkk@gmail.com', '$2y$12$jebLh8JJgwijMIe2v55zveX1Xf7Q6jlFSACyo32uM109PBzDgGY0i', 'active', 5, '2024-02-29 05:57:12', '2024-02-29 05:57:12'),
(4, 'staff', 'tarek', 'هندسة معلوماتية', 0, '0965478932', 'tarek@gmail.com', '$2y$12$DUkMAPXfc5nwsJRFQDzBaelprMVSoVt5KcpgyVLykjPSpoVhaLjgK', 'active', 5, '2024-02-29 06:42:59', '2024-02-29 06:42:59'),
(6, 'staff', 'Amane', 'It', 0, '0965485324', 'amane@gmail.com', '$2y$10$DFBE8bmayrZBtb9EPBm0MuStW6MC33IrkglqT0vfPnm41qholwlN6', 'active', 5, '2024-02-29 09:47:03', '2024-02-29 09:47:03');

-- --------------------------------------------------------

--
-- Table structure for table `subscriber_feedbacks`
--

CREATE TABLE `subscriber_feedbacks` (
  `sfeedback_id` bigint(20) UNSIGNED NOT NULL,
  `feedback_id` bigint(20) UNSIGNED NOT NULL,
  `subscriber_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `subscriber_feedbacks`
--

INSERT INTO `subscriber_feedbacks` (`sfeedback_id`, `feedback_id`, `subscriber_id`, `created_at`, `updated_at`) VALUES
(1, 1, 1, '2024-02-29 15:06:52', '2024-02-29 15:06:52');

-- --------------------------------------------------------

--
-- Table structure for table `subscriber_notifications`
--

CREATE TABLE `subscriber_notifications` (
  `snotification_id` bigint(20) UNSIGNED NOT NULL,
  `notification_id` bigint(20) UNSIGNED NOT NULL,
  `subscriber_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `subscriber_trips`
--

CREATE TABLE `subscriber_trips` (
  `subscriber_trip_id` bigint(20) UNSIGNED NOT NULL,
  `trip_id` bigint(20) UNSIGNED NOT NULL,
  `subscriber_id` bigint(20) UNSIGNED NOT NULL,
  `QrCode` blob NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `subscriber_trips`
--

INSERT INTO `subscriber_trips` (`subscriber_trip_id`, `trip_id`, `subscriber_id`, `QrCode`, `created_at`, `updated_at`) VALUES
(1, 1, 6, '', '2024-03-02 03:17:33', '2024-03-02 03:17:33'),
(2, 1, 1, '', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `subscription_requests`
--

CREATE TABLE `subscription_requests` (
  `srequest_id` bigint(20) UNSIGNED NOT NULL,
  `subscriber_type` varchar(255) NOT NULL,
  `full_name` varchar(255) NOT NULL,
  `college` varchar(255) NOT NULL,
  `college_number` int(11) NOT NULL,
  `phone` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `semester_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `subscription_requests`
--

INSERT INTO `subscription_requests` (`srequest_id`, `subscriber_type`, `full_name`, `college`, `college_number`, `phone`, `email`, `password`, `semester_id`, `created_at`, `updated_at`) VALUES
(4, 'student', 'طارق مهاجر', 'هندسة معلوماتية ', 586, '0965853568', 'tarek@gmail.com', '$2y$10$JEzYwurBKLWIBv.Y74leF.bnawceTfCN3qYWbv15EQUwuEu6fop.i', 5, '2024-02-29 12:50:00', '2024-02-29 12:50:00');

-- --------------------------------------------------------

--
-- Table structure for table `trips`
--

CREATE TABLE `trips` (
  `trip_id` bigint(20) UNSIGNED NOT NULL,
  `trip_number` int(11) NOT NULL,
  `trip_type` enum('go','return','special') NOT NULL,
  `start_point` varchar(255) NOT NULL,
  `end_point` varchar(255) NOT NULL,
  `trip_day` varchar(255) NOT NULL,
  `start_time` time NOT NULL,
  `stops` varchar(255) NOT NULL,
  `semester_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `trips`
--

INSERT INTO `trips` (`trip_id`, `trip_number`, `trip_type`, `start_point`, `end_point`, `trip_day`, `start_time`, `stops`, `semester_id`, `created_at`, `updated_at`) VALUES
(1, 1, 'go', 'جديدة عرطوز', 'التل', 'الاحد والاثنين والثلاثاء والاربعاء والخميس والجمعة والسبت', '07:00:00', 'جسر قطنا و المزة و المواسات و التل', 5, '2024-02-29 10:32:31', '2024-02-29 10:32:31');

-- --------------------------------------------------------

--
-- Table structure for table `trip_informations`
--

CREATE TABLE `trip_informations` (
  `tinformation_id` bigint(20) UNSIGNED NOT NULL,
  `trip_id` bigint(20) UNSIGNED NOT NULL,
  `bus_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `user_companies`
--

CREATE TABLE `user_companies` (
  `cuser_id` bigint(20) UNSIGNED NOT NULL,
  `user_name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `phone_number` varchar(255) NOT NULL,
  `role` enum('user_company') NOT NULL,
  `company_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `user_companies`
--

INSERT INTO `user_companies` (`cuser_id`, `user_name`, `email`, `password`, `phone_number`, `role`, `company_id`, `created_at`, `updated_at`) VALUES
(1, 'Tarek', 'tarek@gmail.com', '$2y$12$g28JmPqK4cz6U1yw4YR3n.tZQHSZdm52YQSN9Gy73c9kVol2JFJ7K', '0963785320', 'user_company', 3, '2024-03-01 15:28:27', '2024-03-01 15:28:27');

-- --------------------------------------------------------

--
-- Table structure for table `years`
--

CREATE TABLE `years` (
  `year_id` bigint(20) UNSIGNED NOT NULL,
  `year_date` year(4) NOT NULL,
  `start_date` date NOT NULL,
  `end_date` date NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `years`
--

INSERT INTO `years` (`year_id`, `year_date`, `start_date`, `end_date`, `created_at`, `updated_at`) VALUES
(1, '2024', '2024-02-20', '2025-02-20', '2024-02-28 07:36:00', '2024-02-28 07:36:00'),
(2, '2025', '2024-02-28', '2024-02-28', '2024-02-28 12:02:39', '2024-02-28 12:02:39'),
(3, '2024', '2024-01-01', '2024-12-31', '2024-03-02 01:01:40', '2024-03-02 01:01:40');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `buses`
--
ALTER TABLE `buses`
  ADD PRIMARY KEY (`bus_id`),
  ADD KEY `buses_company_id_foreign` (`company_id`);

--
-- Indexes for table `change_trip_requests`
--
ALTER TABLE `change_trip_requests`
  ADD PRIMARY KEY (`chtrequest_id`),
  ADD KEY `change_trip_requests_subscriber_id_foreign` (`subscriber_id`);

--
-- Indexes for table `companies`
--
ALTER TABLE `companies`
  ADD PRIMARY KEY (`company_id`);

--
-- Indexes for table `contracts`
--
ALTER TABLE `contracts`
  ADD PRIMARY KEY (`contract_id`),
  ADD KEY `contracts_year_id_foreign` (`year_id`),
  ADD KEY `contracts_company_id_foreign` (`company_id`);

--
-- Indexes for table `dashboard_users`
--
ALTER TABLE `dashboard_users`
  ADD PRIMARY KEY (`duser_id`),
  ADD UNIQUE KEY `dashboard_users_email_unique` (`email`),
  ADD UNIQUE KEY `dashboard_users_phone_number_unique` (`phone_number`),
  ADD KEY `dashboard_users_year_id_foreign` (`year_id`);

--
-- Indexes for table `drivers`
--
ALTER TABLE `drivers`
  ADD PRIMARY KEY (`driver_id`),
  ADD KEY `drivers_bus_id_foreign` (`bus_id`);

--
-- Indexes for table `driver_feedbacks`
--
ALTER TABLE `driver_feedbacks`
  ADD PRIMARY KEY (`dfeedback_id`),
  ADD KEY `driver_feedbacks_feedback_id_foreign` (`feedback_id`),
  ADD KEY `driver_feedbacks_driver_id_foreign` (`driver_id`);

--
-- Indexes for table `driver_notifications`
--
ALTER TABLE `driver_notifications`
  ADD PRIMARY KEY (`dnotification_id`),
  ADD KEY `driver_notifications_notification_id_foreign` (`notification_id`),
  ADD KEY `driver_notifications_driver_id_foreign` (`driver_id`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `feedback`
--
ALTER TABLE `feedback`
  ADD PRIMARY KEY (`feedback_id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `notifications`
--
ALTER TABLE `notifications`
  ADD PRIMARY KEY (`notification_id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indexes for table `password_reset_tokens`
--
ALTER TABLE `password_reset_tokens`
  ADD PRIMARY KEY (`email`);

--
-- Indexes for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Indexes for table `semesters`
--
ALTER TABLE `semesters`
  ADD PRIMARY KEY (`semester_id`),
  ADD UNIQUE KEY `semesters_semester_code_unique` (`semester_code`),
  ADD KEY `semesters_year_id_foreign` (`year_id`);

--
-- Indexes for table `subscribers`
--
ALTER TABLE `subscribers`
  ADD PRIMARY KEY (`subscriber_id`),
  ADD KEY `subscribers_semester_id_foreign` (`semester_id`);

--
-- Indexes for table `subscriber_feedbacks`
--
ALTER TABLE `subscriber_feedbacks`
  ADD PRIMARY KEY (`sfeedback_id`),
  ADD KEY `subscriber_feedbacks_feedback_id_foreign` (`feedback_id`),
  ADD KEY `subscriber_feedbacks_subscriber_id_foreign` (`subscriber_id`);

--
-- Indexes for table `subscriber_notifications`
--
ALTER TABLE `subscriber_notifications`
  ADD PRIMARY KEY (`snotification_id`),
  ADD KEY `subscriber_notifications_notification_id_foreign` (`notification_id`),
  ADD KEY `subscriber_notifications_subscriber_id_foreign` (`subscriber_id`);

--
-- Indexes for table `subscriber_trips`
--
ALTER TABLE `subscriber_trips`
  ADD PRIMARY KEY (`subscriber_trip_id`),
  ADD KEY `subscriber_trips_trip_id_foreign` (`trip_id`),
  ADD KEY `subscriber_trips_subscriber_id_foreign` (`subscriber_id`);

--
-- Indexes for table `subscription_requests`
--
ALTER TABLE `subscription_requests`
  ADD PRIMARY KEY (`srequest_id`),
  ADD KEY `subscription_requests_semester_id_foreign` (`semester_id`);

--
-- Indexes for table `trips`
--
ALTER TABLE `trips`
  ADD PRIMARY KEY (`trip_id`),
  ADD KEY `trips_semester_id_foreign` (`semester_id`);

--
-- Indexes for table `trip_informations`
--
ALTER TABLE `trip_informations`
  ADD PRIMARY KEY (`tinformation_id`),
  ADD KEY `trip_informations_trip_id_foreign` (`trip_id`),
  ADD KEY `trip_informations_bus_id_foreign` (`bus_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- Indexes for table `user_companies`
--
ALTER TABLE `user_companies`
  ADD PRIMARY KEY (`cuser_id`),
  ADD UNIQUE KEY `user_companies_email_unique` (`email`),
  ADD UNIQUE KEY `user_companies_phone_number_unique` (`phone_number`),
  ADD KEY `user_companies_company_id_foreign` (`company_id`);

--
-- Indexes for table `years`
--
ALTER TABLE `years`
  ADD PRIMARY KEY (`year_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `buses`
--
ALTER TABLE `buses`
  MODIFY `bus_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `change_trip_requests`
--
ALTER TABLE `change_trip_requests`
  MODIFY `chtrequest_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `companies`
--
ALTER TABLE `companies`
  MODIFY `company_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `contracts`
--
ALTER TABLE `contracts`
  MODIFY `contract_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `dashboard_users`
--
ALTER TABLE `dashboard_users`
  MODIFY `duser_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `drivers`
--
ALTER TABLE `drivers`
  MODIFY `driver_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `driver_feedbacks`
--
ALTER TABLE `driver_feedbacks`
  MODIFY `dfeedback_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `driver_notifications`
--
ALTER TABLE `driver_notifications`
  MODIFY `dnotification_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `feedback`
--
ALTER TABLE `feedback`
  MODIFY `feedback_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- AUTO_INCREMENT for table `notifications`
--
ALTER TABLE `notifications`
  MODIFY `notification_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `semesters`
--
ALTER TABLE `semesters`
  MODIFY `semester_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `subscribers`
--
ALTER TABLE `subscribers`
  MODIFY `subscriber_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `subscriber_feedbacks`
--
ALTER TABLE `subscriber_feedbacks`
  MODIFY `sfeedback_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `subscriber_notifications`
--
ALTER TABLE `subscriber_notifications`
  MODIFY `snotification_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `subscriber_trips`
--
ALTER TABLE `subscriber_trips`
  MODIFY `subscriber_trip_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `subscription_requests`
--
ALTER TABLE `subscription_requests`
  MODIFY `srequest_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `trips`
--
ALTER TABLE `trips`
  MODIFY `trip_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `trip_informations`
--
ALTER TABLE `trip_informations`
  MODIFY `tinformation_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `user_companies`
--
ALTER TABLE `user_companies`
  MODIFY `cuser_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `years`
--
ALTER TABLE `years`
  MODIFY `year_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `buses`
--
ALTER TABLE `buses`
  ADD CONSTRAINT `buses_company_id_foreign` FOREIGN KEY (`company_id`) REFERENCES `companies` (`company_id`);

--
-- Constraints for table `change_trip_requests`
--
ALTER TABLE `change_trip_requests`
  ADD CONSTRAINT `change_trip_requests_subscriber_id_foreign` FOREIGN KEY (`subscriber_id`) REFERENCES `subscribers` (`subscriber_id`);

--
-- Constraints for table `contracts`
--
ALTER TABLE `contracts`
  ADD CONSTRAINT `contracts_company_id_foreign` FOREIGN KEY (`company_id`) REFERENCES `companies` (`company_id`),
  ADD CONSTRAINT `contracts_year_id_foreign` FOREIGN KEY (`year_id`) REFERENCES `years` (`year_id`);

--
-- Constraints for table `dashboard_users`
--
ALTER TABLE `dashboard_users`
  ADD CONSTRAINT `dashboard_users_year_id_foreign` FOREIGN KEY (`year_id`) REFERENCES `years` (`year_id`);

--
-- Constraints for table `drivers`
--
ALTER TABLE `drivers`
  ADD CONSTRAINT `drivers_bus_id_foreign` FOREIGN KEY (`bus_id`) REFERENCES `buses` (`bus_id`);

--
-- Constraints for table `driver_feedbacks`
--
ALTER TABLE `driver_feedbacks`
  ADD CONSTRAINT `driver_feedbacks_driver_id_foreign` FOREIGN KEY (`driver_id`) REFERENCES `drivers` (`driver_id`),
  ADD CONSTRAINT `driver_feedbacks_feedback_id_foreign` FOREIGN KEY (`feedback_id`) REFERENCES `feedback` (`feedback_id`);

--
-- Constraints for table `driver_notifications`
--
ALTER TABLE `driver_notifications`
  ADD CONSTRAINT `driver_notifications_driver_id_foreign` FOREIGN KEY (`driver_id`) REFERENCES `drivers` (`driver_id`),
  ADD CONSTRAINT `driver_notifications_notification_id_foreign` FOREIGN KEY (`notification_id`) REFERENCES `notifications` (`notification_id`);

--
-- Constraints for table `semesters`
--
ALTER TABLE `semesters`
  ADD CONSTRAINT `semesters_year_id_foreign` FOREIGN KEY (`year_id`) REFERENCES `years` (`year_id`);

--
-- Constraints for table `subscribers`
--
ALTER TABLE `subscribers`
  ADD CONSTRAINT `subscribers_semester_id_foreign` FOREIGN KEY (`semester_id`) REFERENCES `semesters` (`semester_id`);

--
-- Constraints for table `subscriber_feedbacks`
--
ALTER TABLE `subscriber_feedbacks`
  ADD CONSTRAINT `subscriber_feedbacks_feedback_id_foreign` FOREIGN KEY (`feedback_id`) REFERENCES `feedback` (`feedback_id`),
  ADD CONSTRAINT `subscriber_feedbacks_subscriber_id_foreign` FOREIGN KEY (`subscriber_id`) REFERENCES `subscribers` (`subscriber_id`);

--
-- Constraints for table `subscriber_notifications`
--
ALTER TABLE `subscriber_notifications`
  ADD CONSTRAINT `subscriber_notifications_notification_id_foreign` FOREIGN KEY (`notification_id`) REFERENCES `notifications` (`notification_id`),
  ADD CONSTRAINT `subscriber_notifications_subscriber_id_foreign` FOREIGN KEY (`subscriber_id`) REFERENCES `subscribers` (`subscriber_id`);

--
-- Constraints for table `subscriber_trips`
--
ALTER TABLE `subscriber_trips`
  ADD CONSTRAINT `subscriber_trips_subscriber_id_foreign` FOREIGN KEY (`subscriber_id`) REFERENCES `subscribers` (`subscriber_id`),
  ADD CONSTRAINT `subscriber_trips_trip_id_foreign` FOREIGN KEY (`trip_id`) REFERENCES `trips` (`trip_id`);

--
-- Constraints for table `subscription_requests`
--
ALTER TABLE `subscription_requests`
  ADD CONSTRAINT `subscription_requests_semester_id_foreign` FOREIGN KEY (`semester_id`) REFERENCES `semesters` (`semester_id`);

--
-- Constraints for table `trips`
--
ALTER TABLE `trips`
  ADD CONSTRAINT `trips_semester_id_foreign` FOREIGN KEY (`semester_id`) REFERENCES `semesters` (`semester_id`);

--
-- Constraints for table `trip_informations`
--
ALTER TABLE `trip_informations`
  ADD CONSTRAINT `trip_informations_bus_id_foreign` FOREIGN KEY (`bus_id`) REFERENCES `buses` (`bus_id`),
  ADD CONSTRAINT `trip_informations_trip_id_foreign` FOREIGN KEY (`trip_id`) REFERENCES `trips` (`trip_id`);

--
-- Constraints for table `user_companies`
--
ALTER TABLE `user_companies`
  ADD CONSTRAINT `user_companies_company_id_foreign` FOREIGN KEY (`company_id`) REFERENCES `companies` (`company_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
