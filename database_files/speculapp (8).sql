-- phpMyAdmin SQL Dump
-- version 4.8.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 10, 2018 at 03:55 PM
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

-- --------------------------------------------------------

--
-- Table structure for table `currency`
--

CREATE TABLE `currency` (
  `name` varchar(8) NOT NULL,
  `cur_value` double(10,3) NOT NULL,
  `last_value` double(10,3) NOT NULL,
  `min_value` double(10,3) NOT NULL,
  `max_value` double(10,3) NOT NULL,
  `update_time` int(11) NOT NULL,
  `last_update` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `currency`
--

INSERT INTO `currency` (`name`, `cur_value`, `last_value`, `min_value`, `max_value`, `update_time`, `last_update`) VALUES
('DKK', 0.676, 0.904, 0.300, 1.600, 30, '2018-06-10 16:55:11'),
('EUR', 5.369, 5.953, 4.000, 6.000, 10, '2018-06-10 16:55:19'),
('GBP', 6.173, 5.673, 4.600, 7.000, 30, '2018-06-10 16:55:08'),
('USD', 3.395, 2.617, 2.400, 4.200, 15, '2018-06-10 16:55:09');

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
  `credit` double(10,2) NOT NULL,
  `updated_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `hof`
--

INSERT INTO `hof` (`username`, `user_id`, `credit`, `updated_at`) VALUES
('test1', 2, 10461.00, '2018-06-10 16:36:17'),
('test2', 3, 1000.00, '2018-06-09 10:49:39');

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

-- --------------------------------------------------------

--
-- Table structure for table `value_history`
--

CREATE TABLE `value_history` (
  `id` int(8) NOT NULL,
  `currency_name` varchar(8) NOT NULL,
  `value` double(10,3) NOT NULL,
  `created_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `value_history`
--

INSERT INTO `value_history` (`id`, `currency_name`, `value`, `created_at`) VALUES
(1, 'EUR', 0.000, '2018-06-10 16:42:28'),
(2, 'EUR', 4.663, '2018-06-10 16:42:39'),
(3, 'USD', 0.000, '2018-06-10 16:42:43'),
(4, 'EUR', 5.408, '2018-06-10 16:42:49'),
(5, 'USD', 4.119, '2018-06-10 16:42:54'),
(6, 'GBP', 0.000, '2018-06-10 16:42:57'),
(7, 'EUR', 5.948, '2018-06-10 16:42:59'),
(8, 'GBP', 6.413, '2018-06-10 16:43:08'),
(9, 'EUR', 5.538, '2018-06-10 16:43:09'),
(10, 'USD', 3.056, '2018-06-10 16:43:09'),
(11, 'DKK', 0.000, '2018-06-10 16:43:18'),
(12, 'EUR', 5.669, '2018-06-10 16:43:19'),
(13, 'USD', 2.659, '2018-06-10 16:43:24'),
(14, 'EUR', 4.789, '2018-06-10 16:43:29'),
(15, 'GBP', 6.328, '2018-06-10 16:43:38'),
(16, 'USD', 4.184, '2018-06-10 16:43:39'),
(17, 'EUR', 5.189, '2018-06-10 16:43:39'),
(18, 'DKK', 1.511, '2018-06-10 16:43:41'),
(19, 'EUR', 4.679, '2018-06-10 16:43:49'),
(20, 'USD', 3.543, '2018-06-10 16:43:54'),
(21, 'EUR', 5.914, '2018-06-10 16:43:59'),
(22, 'GBP', 6.767, '2018-06-10 16:44:08'),
(23, 'EUR', 4.457, '2018-06-10 16:44:09'),
(24, 'USD', 3.266, '2018-06-10 16:44:09'),
(25, 'DKK', 0.486, '2018-06-10 16:44:11'),
(26, 'EUR', 4.592, '2018-06-10 16:44:19'),
(27, 'USD', 2.813, '2018-06-10 16:44:24'),
(28, 'EUR', 4.875, '2018-06-10 16:44:29'),
(29, 'GBP', 5.626, '2018-06-10 16:44:38'),
(30, 'EUR', 5.092, '2018-06-10 16:44:39'),
(31, 'USD', 3.524, '2018-06-10 16:44:39'),
(32, 'DKK', 1.163, '2018-06-10 16:44:41'),
(33, 'EUR', 4.058, '2018-06-10 16:44:49'),
(34, 'USD', 2.575, '2018-06-10 16:44:54'),
(35, 'EUR', 5.155, '2018-06-10 16:44:59'),
(36, 'GBP', 6.457, '2018-06-10 16:45:08'),
(37, 'EUR', 4.872, '2018-06-10 16:45:09'),
(38, 'USD', 2.969, '2018-06-10 16:45:09'),
(39, 'DKK', 0.834, '2018-06-10 16:45:11'),
(40, 'EUR', 5.853, '2018-06-10 16:45:19'),
(41, 'USD', 3.438, '2018-06-10 16:45:24'),
(42, 'EUR', 4.565, '2018-06-10 16:45:29'),
(43, 'GBP', 6.663, '2018-06-10 16:45:38'),
(44, 'EUR', 5.500, '2018-06-10 16:45:39'),
(45, 'USD', 3.534, '2018-06-10 16:45:39'),
(46, 'DKK', 0.351, '2018-06-10 16:45:41'),
(47, 'EUR', 4.245, '2018-06-10 16:45:49'),
(48, 'USD', 3.613, '2018-06-10 16:45:54'),
(49, 'EUR', 4.362, '2018-06-10 16:45:59'),
(50, 'GBP', 6.323, '2018-06-10 16:46:08'),
(51, 'USD', 4.080, '2018-06-10 16:46:09'),
(52, 'EUR', 5.381, '2018-06-10 16:46:09'),
(53, 'DKK', 1.382, '2018-06-10 16:46:11'),
(54, 'EUR', 4.553, '2018-06-10 16:46:19'),
(55, 'USD', 3.998, '2018-06-10 16:46:24'),
(56, 'EUR', 4.406, '2018-06-10 16:46:29'),
(57, 'GBP', 5.128, '2018-06-10 16:46:38'),
(58, 'EUR', 5.441, '2018-06-10 16:46:39'),
(59, 'USD', 3.756, '2018-06-10 16:46:39'),
(60, 'DKK', 1.167, '2018-06-10 16:46:41'),
(61, 'EUR', 5.414, '2018-06-10 16:46:49'),
(62, 'USD', 3.683, '2018-06-10 16:46:54'),
(63, 'EUR', 5.242, '2018-06-10 16:46:59'),
(64, 'GBP', 4.950, '2018-06-10 16:47:08'),
(65, 'USD', 2.479, '2018-06-10 16:47:09'),
(66, 'EUR', 5.921, '2018-06-10 16:47:09'),
(67, 'DKK', 1.404, '2018-06-10 16:47:11'),
(68, 'EUR', 5.090, '2018-06-10 16:47:19'),
(69, 'USD', 3.036, '2018-06-10 16:47:24'),
(70, 'EUR', 4.621, '2018-06-10 16:47:29'),
(71, 'GBP', 6.212, '2018-06-10 16:47:38'),
(72, 'EUR', 4.375, '2018-06-10 16:47:39'),
(73, 'USD', 3.488, '2018-06-10 16:47:39'),
(74, 'DKK', 0.693, '2018-06-10 16:47:41'),
(75, 'EUR', 4.258, '2018-06-10 16:47:49'),
(76, 'USD', 4.046, '2018-06-10 16:47:54'),
(77, 'EUR', 4.731, '2018-06-10 16:47:59'),
(78, 'GBP', 5.232, '2018-06-10 16:48:08'),
(79, 'EUR', 4.753, '2018-06-10 16:48:09'),
(80, 'USD', 3.116, '2018-06-10 16:48:09'),
(81, 'DKK', 1.429, '2018-06-10 16:48:11'),
(82, 'EUR', 4.783, '2018-06-10 16:48:19'),
(83, 'USD', 3.355, '2018-06-10 16:48:24'),
(84, 'EUR', 5.235, '2018-06-10 16:48:29'),
(85, 'GBP', 6.019, '2018-06-10 16:48:38'),
(86, 'EUR', 5.316, '2018-06-10 16:48:39'),
(87, 'USD', 3.931, '2018-06-10 16:48:39'),
(88, 'DKK', 1.492, '2018-06-10 16:48:41'),
(89, 'EUR', 5.575, '2018-06-10 16:48:49'),
(90, 'USD', 3.058, '2018-06-10 16:48:54'),
(91, 'EUR', 5.290, '2018-06-10 16:48:59'),
(92, 'GBP', 5.333, '2018-06-10 16:49:08'),
(93, 'EUR', 4.238, '2018-06-10 16:49:09'),
(94, 'USD', 3.788, '2018-06-10 16:49:09'),
(95, 'DKK', 0.897, '2018-06-10 16:49:11'),
(96, 'EUR', 4.238, '2018-06-10 16:49:19'),
(97, 'USD', 3.110, '2018-06-10 16:49:24'),
(98, 'EUR', 5.589, '2018-06-10 16:49:29'),
(99, 'GBP', 6.922, '2018-06-10 16:49:38'),
(100, 'USD', 3.537, '2018-06-10 16:49:39'),
(101, 'EUR', 4.869, '2018-06-10 16:49:39'),
(102, 'DKK', 0.893, '2018-06-10 16:49:41'),
(103, 'EUR', 4.311, '2018-06-10 16:49:49'),
(104, 'USD', 3.458, '2018-06-10 16:49:54'),
(105, 'EUR', 5.301, '2018-06-10 16:49:59'),
(106, 'GBP', 6.202, '2018-06-10 16:50:08'),
(107, 'EUR', 5.991, '2018-06-10 16:50:09'),
(108, 'USD', 3.415, '2018-06-10 16:50:09'),
(109, 'DKK', 0.905, '2018-06-10 16:50:11'),
(110, 'EUR', 5.035, '2018-06-10 16:50:19'),
(111, 'USD', 3.066, '2018-06-10 16:50:24'),
(112, 'EUR', 4.952, '2018-06-10 16:50:29'),
(113, 'GBP', 5.678, '2018-06-10 16:50:38'),
(114, 'USD', 4.194, '2018-06-10 16:50:39'),
(115, 'EUR', 5.630, '2018-06-10 16:50:39'),
(116, 'DKK', 0.641, '2018-06-10 16:50:41'),
(117, 'EUR', 4.089, '2018-06-10 16:50:49'),
(118, 'USD', 3.504, '2018-06-10 16:50:54'),
(119, 'EUR', 4.226, '2018-06-10 16:50:59'),
(120, 'GBP', 6.768, '2018-06-10 16:51:08'),
(121, 'EUR', 4.497, '2018-06-10 16:51:09'),
(122, 'USD', 3.041, '2018-06-10 16:51:09'),
(123, 'DKK', 0.759, '2018-06-10 16:51:11'),
(124, 'EUR', 4.397, '2018-06-10 16:51:19'),
(125, 'USD', 2.601, '2018-06-10 16:51:24'),
(126, 'EUR', 4.280, '2018-06-10 16:51:29'),
(127, 'GBP', 5.909, '2018-06-10 16:51:38'),
(128, 'USD', 3.273, '2018-06-10 16:51:39'),
(129, 'EUR', 5.935, '2018-06-10 16:51:39'),
(130, 'DKK', 1.028, '2018-06-10 16:51:41'),
(131, 'EUR', 4.153, '2018-06-10 16:51:49'),
(132, 'USD', 3.984, '2018-06-10 16:51:54'),
(133, 'EUR', 4.698, '2018-06-10 16:51:59'),
(134, 'GBP', 5.280, '2018-06-10 16:52:08'),
(135, 'USD', 3.387, '2018-06-10 16:52:09'),
(136, 'EUR', 4.139, '2018-06-10 16:52:09'),
(137, 'DKK', 1.447, '2018-06-10 16:52:11'),
(138, 'EUR', 4.761, '2018-06-10 16:52:19'),
(139, 'USD', 3.184, '2018-06-10 16:52:24'),
(140, 'EUR', 4.429, '2018-06-10 16:52:29'),
(141, 'GBP', 6.865, '2018-06-10 16:52:38'),
(142, 'EUR', 5.227, '2018-06-10 16:52:39'),
(143, 'USD', 2.856, '2018-06-10 16:52:39'),
(144, 'DKK', 0.932, '2018-06-10 16:52:41'),
(145, 'EUR', 5.536, '2018-06-10 16:52:49'),
(146, 'USD', 3.410, '2018-06-10 16:52:54'),
(147, 'EUR', 5.360, '2018-06-10 16:52:59'),
(148, 'GBP', 6.747, '2018-06-10 16:53:08'),
(149, 'EUR', 5.106, '2018-06-10 16:53:09'),
(150, 'USD', 3.501, '2018-06-10 16:53:09'),
(151, 'DKK', 0.441, '2018-06-10 16:53:11'),
(152, 'EUR', 4.122, '2018-06-10 16:53:19'),
(153, 'USD', 2.685, '2018-06-10 16:53:24'),
(154, 'EUR', 5.576, '2018-06-10 16:53:29'),
(155, 'GBP', 6.142, '2018-06-10 16:53:38'),
(156, 'USD', 2.447, '2018-06-10 16:53:39'),
(157, 'EUR', 4.766, '2018-06-10 16:53:39'),
(158, 'DKK', 0.319, '2018-06-10 16:53:41'),
(159, 'EUR', 4.204, '2018-06-10 16:53:49'),
(160, 'USD', 3.564, '2018-06-10 16:53:54'),
(161, 'EUR', 4.208, '2018-06-10 16:53:59'),
(162, 'GBP', 6.421, '2018-06-10 16:54:08'),
(163, 'USD', 3.589, '2018-06-10 16:54:09'),
(164, 'EUR', 4.408, '2018-06-10 16:54:09'),
(165, 'DKK', 0.582, '2018-06-10 16:54:11'),
(166, 'EUR', 4.368, '2018-06-10 16:54:19'),
(167, 'USD', 3.597, '2018-06-10 16:54:24'),
(168, 'EUR', 5.901, '2018-06-10 16:54:29'),
(169, 'GBP', 5.673, '2018-06-10 16:54:38'),
(170, 'USD', 3.056, '2018-06-10 16:54:39'),
(171, 'EUR', 5.316, '2018-06-10 16:54:39'),
(172, 'DKK', 0.904, '2018-06-10 16:54:41'),
(173, 'EUR', 5.435, '2018-06-10 16:54:49'),
(174, 'USD', 2.617, '2018-06-10 16:54:54'),
(175, 'EUR', 5.935, '2018-06-10 16:54:59'),
(176, 'GBP', 6.173, '2018-06-10 16:55:08'),
(177, 'USD', 3.395, '2018-06-10 16:55:09'),
(178, 'EUR', 5.953, '2018-06-10 16:55:09'),
(179, 'DKK', 0.676, '2018-06-10 16:55:11'),
(180, 'EUR', 5.369, '2018-06-10 16:55:19');

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
-- Indexes for table `value_history`
--
ALTER TABLE `value_history`
  ADD PRIMARY KEY (`id`),
  ADD KEY `currency_name` (`currency_name`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `available`
--
ALTER TABLE `available`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

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
-- AUTO_INCREMENT for table `value_history`
--
ALTER TABLE `value_history`
  MODIFY `id` int(8) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=181;

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

--
-- Constraints for table `value_history`
--
ALTER TABLE `value_history`
  ADD CONSTRAINT `value_history_ibfk_1` FOREIGN KEY (`currency_name`) REFERENCES `currency` (`name`);

DELIMITER $$
--
-- Events
--
CREATE DEFINER=`user`@`localhost` EVENT `GBP_generator` ON SCHEDULE EVERY 30 SECOND STARTS '2018-06-10 16:43:08' ON COMPLETION NOT PRESERVE ENABLE DO BEGIN
			DECLARE v_min, v_max, v_current, v_new_value double(10,3);
			SELECT min_value,max_value,cur_value INTO v_min,v_max,v_current FROM `currency` WHERE name='GBP';
			SELECT RAND()*(v_max-v_min)+v_min INTO v_new_value FROM DUAL;
			UPDATE `currency` SET cur_value=v_new_value, last_value=v_current, last_update=now() WHERE name='GBP';
			INSERT INTO `value_history` (currency_name,value,created_at) VALUES('GBP',v_new_value,now());
		END$$

CREATE DEFINER=`user`@`localhost` EVENT `DKK_generator` ON SCHEDULE EVERY 30 SECOND STARTS '2018-06-10 16:43:41' ON COMPLETION NOT PRESERVE ENABLE DO BEGIN
			DECLARE v_min, v_max, v_current, v_new_value double(10,3);
			SELECT min_value,max_value,cur_value INTO v_min,v_max,v_current FROM `currency` WHERE name='DKK';
			SELECT RAND()*(v_max-v_min)+v_min INTO v_new_value FROM DUAL;
			UPDATE `currency` SET cur_value=v_new_value, last_value=v_current, last_update=now() WHERE name='DKK';
			INSERT INTO `value_history` (currency_name,value,created_at) VALUES('DKK',v_new_value,now());
		END$$

CREATE DEFINER=`user`@`localhost` EVENT `EUR_generator` ON SCHEDULE EVERY 10 SECOND STARTS '2018-06-10 16:42:39' ON COMPLETION NOT PRESERVE ENABLE DO BEGIN
			DECLARE v_min, v_max, v_current, v_new_value double(10,3);
			SELECT min_value,max_value,cur_value INTO v_min,v_max,v_current FROM `currency` WHERE name='EUR';
			SELECT RAND()*(v_max-v_min)+v_min INTO v_new_value FROM DUAL;
			UPDATE `currency` SET cur_value=v_new_value, last_value=v_current, last_update=now() WHERE name='EUR';
			INSERT INTO `value_history` (currency_name,value,created_at) VALUES('EUR',v_new_value,now());
		END$$

CREATE DEFINER=`user`@`localhost` EVENT `USD_generator` ON SCHEDULE EVERY 15 SECOND STARTS '2018-06-10 16:42:54' ON COMPLETION NOT PRESERVE ENABLE DO BEGIN
			DECLARE v_min, v_max, v_current, v_new_value double(10,3);
			SELECT min_value,max_value,cur_value INTO v_min,v_max,v_current FROM `currency` WHERE name='USD';
			SELECT RAND()*(v_max-v_min)+v_min INTO v_new_value FROM DUAL;
			UPDATE `currency` SET cur_value=v_new_value, last_value=v_current, last_update=now() WHERE name='USD';
			INSERT INTO `value_history` (currency_name,value,created_at) VALUES('USD',v_new_value,now());
		END$$

DELIMITER ;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
