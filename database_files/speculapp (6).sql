-- phpMyAdmin SQL Dump
-- version 4.8.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 09, 2018 at 09:51 AM
-- Server version: 10.1.31-MariaDB
-- PHP Version: 7.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";
SET GLOBAL event_scheduler = ON;


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `speculapp`
--

-- --------------------------------------------------------

--
-- Table structure for table `available`
--

CREATE TABLE `available` (
  `id` int(11) NOT NULL,
  `username` varchar(32) NOT NULL,
  `currency_name` varchar(8) NOT NULL,
  `amount` decimal(10,3) NOT NULL,
  `updated_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `available`
--

INSERT INTO `available` (`id`, `username`, `currency_name`, `amount`, `updated_at`) VALUES
(12, 'test1', 'EUR', '50.001', '2018-06-08 17:21:42'),
(13, 'test1', 'GBP', '14.286', '2018-06-08 17:21:33'),
(14, 'test1', 'USD', '20.000', '2018-06-08 17:21:40');

-- --------------------------------------------------------

--
-- Table structure for table `currency`
--

CREATE TABLE `currency` (
  `name` varchar(8) NOT NULL,
  `cur_value` double NOT NULL,
  `last_value` double(10,3) NOT NULL,
  `min_value` double NOT NULL,
  `max_value` double NOT NULL,
  `update_time` int(11) NOT NULL,
  `last_update` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `currency`
--

INSERT INTO `currency` (`name`, `cur_value`, `last_value`, `min_value`, `max_value`, `update_time`, `last_update`) VALUES
('EUR', 6, 0.000, 4.2, 7.6, 30, '2018-06-08 14:39:45'),
('GBP', 7, 0.000, 5, 9, 30, '2018-06-08 14:39:47'),
('USD', 5, 0.000, 5, 7, 30, '2018-06-05 19:51:36');

-- --------------------------------------------------------

--
-- Table structure for table `game`
--

CREATE TABLE `game` (
  `valid_time` int(11) NOT NULL,
  `init_money` double NOT NULL,
  `win_limit` double NOT NULL,
  `lose_limit` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `game`
--

INSERT INTO `game` (`valid_time`, `init_money`, `win_limit`, `lose_limit`) VALUES
(300, 3000, 6000, 100);

-- --------------------------------------------------------

--
-- Table structure for table `hof`
--

CREATE TABLE `hof` (
  `username` varchar(32) NOT NULL,
  `user_id` int(11) NOT NULL,
  `credit` int(11) NOT NULL,
  `updated_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `hof`
--

INSERT INTO `hof` (`username`, `user_id`, `credit`, `updated_at`) VALUES
('test1', 2, 9400, '2018-06-08 17:21:42'),
('test2', 3, 1000, '2018-06-09 10:49:39');

-- --------------------------------------------------------

--
-- Table structure for table `transactions`
--

CREATE TABLE `transactions` (
  `id` int(11) NOT NULL,
  `username` varchar(32) NOT NULL,
  `FCUR` varchar(8) NOT NULL,
  `TCUR` varchar(8) NOT NULL,
  `result` double(10,3) NOT NULL,
  `created_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `transactions`
--

INSERT INTO `transactions` (`id`, `username`, `FCUR`, `TCUR`, `result`, `created_at`) VALUES
(1, 'test1', 'RON', 'EUR', 10.000, '2018-06-09 10:36:43'),
(2, 'test1', 'RON', 'USD', 5.000, '2018-06-09 10:36:43'),
(3, 'test1', 'USD', 'EUR', -4.000, '2018-06-09 10:37:00'),
(4, 'test1', 'EUR', 'GBP', 5.000, '2018-06-09 10:38:31'),
(5, 'test1', 'EUR', 'GBP', 2.000, '2018-06-09 10:38:55'),
(6, 'test1', 'EUR', 'RON', 60.000, '2018-06-09 10:44:10');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `ID` int(11) NOT NULL,
  `username` varchar(32) NOT NULL,
  `password` varchar(32) NOT NULL,
  `email` varchar(45) NOT NULL,
  `role` varchar(6) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`ID`, `username`, `password`, `email`, `role`, `created_at`, `updated_at`) VALUES
(1, 'admin', '21232f297a57a5a743894a0e4a801fc3', 'admin@admin.com', 'admin', '2018-05-09 16:16:00', '2018-05-09 16:16:00'),
(2, 'test1', '5a105e8b9d40e1329780d62ea2265d8a', 'test1@test.net', 'user', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3, 'test2', 'ad0234829205b9033196ba818f7a872b', 'test2@test.net', 'user', '2018-05-11 00:25:58', '2018-05-11 00:25:58');

--
-- Triggers `users`
--
DELIMITER $$
CREATE TRIGGER `add_to_hof` AFTER INSERT ON `users` FOR EACH ROW INSERT INTO `speculapp`.`hof`(username,user_id,points,updated_at) VALUES (NEW.username, NEW.id, 0, now())
$$
DELIMITER ;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `available`
--
ALTER TABLE `available`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username_currency` (`username`,`currency_name`),
  ADD KEY `currency_name` (`currency_name`);

--
-- Indexes for table `currency`
--
ALTER TABLE `currency`
  ADD PRIMARY KEY (`name`);

--
-- Indexes for table `hof`
--
ALTER TABLE `hof`
  ADD UNIQUE KEY `username` (`username`),
  ADD UNIQUE KEY `user_id_2` (`user_id`),
  ADD KEY `user_id` (`user_id`) USING BTREE;

--
-- Indexes for table `transactions`
--
ALTER TABLE `transactions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`ID`),
  ADD UNIQUE KEY `iq_user_pwd_mail` (`username`,`password`,`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `available`
--
ALTER TABLE `available`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `transactions`
--
ALTER TABLE `transactions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `available`
--
ALTER TABLE `available`
  ADD CONSTRAINT `available_ibfk_1` FOREIGN KEY (`username`) REFERENCES `users` (`username`),
  ADD CONSTRAINT `available_ibfk_2` FOREIGN KEY (`currency_name`) REFERENCES `currency` (`name`);

--
-- Constraints for table `hof`
--
ALTER TABLE `hof`
  ADD CONSTRAINT `hof_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`ID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
