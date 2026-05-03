-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Aug 13, 2025 at 01:58 PM
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
-- Database: `pts`
--

-- --------------------------------------------------------

--
-- Table structure for table `branches`
--

CREATE TABLE `branches` (
  `id` int(30) NOT NULL,
  `branch_code` varchar(50) NOT NULL,
  `street` text NOT NULL,
  `city` text NOT NULL,
  `state` text NOT NULL,
  `zip_code` varchar(50) NOT NULL,
  `country` text NOT NULL,
  `contact` varchar(100) NOT NULL,
  `date_created` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `branches`
--

INSERT INTO `branches` (`id`, `branch_code`, `street`, `city`, `state`, `zip_code`, `country`, `contact`, `date_created`) VALUES
(1, 'npl001', 'New Road', 'Kathmandu', 'Bagmati', '44600', 'Nepal', '014321567', '2025-05-31 10:53:59'),
(3, 'npl002', 'Nadipur, Pame, lake side', 'Pokhara', 'Gandaki', '33700', 'Nepal', '0524321', '2025-05-31 10:53:59'),
(4, 'npl003', 'Kalika nagar, Milan Chowk', 'Butwal', 'Lumbini', '32900', 'Nepal', '0623456', '2025-05-31 10:53:59'),
(5, 'npl004', 'Birat road', 'Birat Nagar', 'Koshi ', '56613', 'Nepal', '056613', '2025-05-31 11:56:21');

-- --------------------------------------------------------

--
-- Table structure for table `branch_distances`
--

CREATE TABLE `branch_distances` (
  `from_branch_id` int(30) NOT NULL,
  `to_branch_id` int(30) NOT NULL,
  `distance` float DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `branch_distances`
--

INSERT INTO `branch_distances` (`from_branch_id`, `to_branch_id`, `distance`) VALUES
(1, 3, 200),
(1, 4, 330),
(1, 5, 500),
(3, 4, 120),
(3, 5, 450),
(4, 5, 180),
(3, 1, 200),
(4, 1, 330),
(5, 1, 500),
(4, 3, 120),
(5, 3, 450),
(5, 4, 180);

-- --------------------------------------------------------

--
-- Table structure for table `deliveries`
--

CREATE TABLE `deliveries` (
  `id` int(11) NOT NULL,
  `parcel_id` int(11) NOT NULL,
  `type` varchar(50) NOT NULL,
  `date` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `parcels`
--

CREATE TABLE `parcels` (
  `id` int(30) NOT NULL,
  `reference_number` varchar(100) NOT NULL,
  `sender_name` text NOT NULL,
  `sender_address` text NOT NULL,
  `sender_contact` text NOT NULL,
  `recipient_name` text NOT NULL,
  `recipient_address` text NOT NULL,
  `recipient_contact` text NOT NULL,
  `type` int(1) NOT NULL COMMENT '1 = Deliver, 2=Pickup',
  `from_branch_id` varchar(30) NOT NULL,
  `to_branch_id` varchar(30) NOT NULL,
  `weight` varchar(100) NOT NULL,
  `height` varchar(100) NOT NULL,
  `width` varchar(100) NOT NULL,
  `length` varchar(100) NOT NULL,
  `price` float NOT NULL,
  `status` int(2) NOT NULL DEFAULT 0,
  `date_created` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `parcels`
--

INSERT INTO `parcels` (`id`, `reference_number`, `sender_name`, `sender_address`, `sender_contact`, `recipient_name`, `recipient_address`, `recipient_contact`, `type`, `from_branch_id`, `to_branch_id`, `weight`, `height`, `width`, `length`, `price`, `status`, `date_created`) VALUES
(1, '201406231415', 'Jinisha Shrestha', 'Sample', '+123456', 'Tina Tamang', 'Sample', 'Sample', 1, '1', '', '30', '12', '12', '15', 300, 7, '2025-05-31 10:54:35'),
(2, '117967400213', 'Vikash Sharma', 'Sample', '+123456', 'Sima Tamang', 'Sample', 'Sample', 2, '1', '3', '30', '12', '12', '15', 300, 1, '2025-05-31 10:54:35'),
(3, '983186540795', 'Bipin Thapa', 'Sample', '+123456', 'Kamal R', 'Sample', 'Sample', 2, '1', '3', '20Kg', '10in', '10in', '10in', 1500, 2, '2025-05-31 10:54:35'),
(4, '514912669061', 'Alisha T', 'Sample', '+123456', 'Binit Kumar', 'Sample Address', '+12345', 2, '4', '1', '23kg', '12in', '12in', '15in', 1900, 0, '2025-05-31 10:54:35'),
(5, '897856905844', 'Rohini Sth', 'Sample', '+123456', 'Kristina Sharma', 'Sample Address', '+12345', 2, '4', '1', '30kg', '10in', '10in', '10in', 1450, 0, '2025-05-31 10:54:35'),
(6, '505604168988', 'Prayash Karki', 'Sample', '+123456', 'Binit Kumar', 'Sample', '+12345', 1, '1', '', '23kg', '12in', '12in', '15in', 2500, 1, '2025-05-31 10:54:35'),
(7, '007079340354', 'ayush', 'tokha', '1111111111111111', 'sam', 'samakushi', '222222222222222', 2, '1', '1', '20', '25', '20', '30', 300, 3, '2025-06-07 22:11:12'),
(8, '652392952233', 'bipin t', 'Sample', '2345', 'Sima Tamang', 'Sample Address', '+12345', 2, '4', '', '34', '23', '442', '23', 467.64, 0, '2025-07-26 22:12:14'),
(9, '910828415860', 'binish', 'tokha', '9836748', 'bipin', 'samakushi', '984444444', 2, '1', '1', '30', '40', '20', '15', 300, 0, '2025-07-27 13:02:34');

-- --------------------------------------------------------

--
-- Table structure for table `parcel_tracks`
--

CREATE TABLE `parcel_tracks` (
  `id` int(30) NOT NULL,
  `parcel_id` int(30) NOT NULL,
  `status` int(2) NOT NULL,
  `date_created` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `parcel_tracks`
--

INSERT INTO `parcel_tracks` (`id`, `parcel_id`, `status`, `date_created`) VALUES
(1, 2, 1, '2025-05-31 10:53:09'),
(2, 3, 1, '2025-05-31 10:53:09'),
(3, 1, 1, '2025-05-31 10:53:09'),
(4, 1, 2, '2025-05-31 10:53:09'),
(5, 1, 3, '2025-05-31 10:53:09'),
(6, 1, 4, '2025-05-31 10:53:09'),
(7, 1, 5, '2025-05-31 10:53:09'),
(8, 1, 7, '2025-05-31 10:53:09'),
(9, 3, 2, '2025-05-31 10:53:09'),
(10, 6, 1, '2025-05-31 10:53:09'),
(11, 7, 3, '2025-07-26 22:51:18');

-- --------------------------------------------------------

--
-- Table structure for table `system_settings`
--

CREATE TABLE `system_settings` (
  `id` int(30) NOT NULL,
  `name` text NOT NULL,
  `email` varchar(200) NOT NULL,
  `contact` varchar(20) NOT NULL,
  `address` text NOT NULL,
  `cover_img` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `system_settings`
--

INSERT INTO `system_settings` (`id`, `name`, `email`, `contact`, `address`, `cover_img`) VALUES
(1, 'Parcel Tracking System', 'info@test.comm', '01-4321987', 'New Road, Kathmandu, Nepal', '');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(30) NOT NULL,
  `firstname` varchar(200) NOT NULL,
  `lastname` varchar(200) NOT NULL,
  `email` varchar(200) NOT NULL,
  `password` text NOT NULL,
  `type` tinyint(1) NOT NULL DEFAULT 2 COMMENT '1 = admin, 2 = staff',
  `branch_id` int(30) NOT NULL,
  `date_created` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `firstname`, `lastname`, `email`, `password`, `type`, `branch_id`, `date_created`) VALUES
(1, 'Binisha', 'admin', 'admin@test.com', '0192023a7bbd73250516f069df18b500', 1, 0, '2025-05-31 10:56:21'),
(2, 'Binit', 'Adhikari', 'binit@test.com', 'e841e6fd47a491a0e0b9b2beec71c156', 2, 1, '2025-05-31 10:56:21'),
(3, 'Ram', 'Gurung', 'ram@test.com', '6a557ed1005dddd940595b8fc6ed47b2', 2, 4, '2025-05-31 10:56:21');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `branches`
--
ALTER TABLE `branches`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `deliveries`
--
ALTER TABLE `deliveries`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `parcels`
--
ALTER TABLE `parcels`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `parcel_tracks`
--
ALTER TABLE `parcel_tracks`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `system_settings`
--
ALTER TABLE `system_settings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD KEY `branch_id` (`branch_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `branches`
--
ALTER TABLE `branches`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `deliveries`
--
ALTER TABLE `deliveries`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `parcels`
--
ALTER TABLE `parcels`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `parcel_tracks`
--
ALTER TABLE `parcel_tracks`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `system_settings`
--
ALTER TABLE `system_settings`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
