-- phpMyAdmin SQL Dump
-- version 4.7.9
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 14, 2018 at 06:09 PM
-- Server version: 10.1.31-MariaDB
-- PHP Version: 7.2.3

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
(2, 'test2', 'EUR', '69.949', '2018-06-14 17:11:36'),
(3, 'test1', 'GBP', '1.698', '2018-06-13 10:36:40'),
(4, 'test1', 'EUR', '1.352', '2018-06-13 10:38:05'),
(6, 'test1', 'USD', '1.796', '2018-06-13 10:38:05'),
(7, 'test2', 'GBP', '99.443', '2018-06-14 17:11:31'),
(8, 'test2', 'USD', '16.202', '2018-06-14 17:11:42'),
(9, 'test3', 'GBP', '80.347', '2018-06-14 17:12:13'),
(10, 'test3', 'EUR', '97.637', '2018-06-14 17:12:17'),
(11, 'test3', 'USD', '122.880', '2018-06-14 17:12:22'),
(13, 'test7', 'GBP', '263.713', '2018-06-14 17:18:15'),
(14, 'test10', 'DKK', '911.081', '2018-06-14 17:19:22'),
(15, 'test10', 'EUR', '172.384', '2018-06-14 17:19:34');

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
('DKK', 1.066, 1.275, 0.300, 1.600, 10, '2018-06-14 16:09:11'),
('EUR', 4.738, 4.682, 4.000, 6.000, 10, '2018-06-14 16:09:09'),
('GBP', 6.216, 6.536, 4.600, 7.000, 30, '2018-06-14 16:09:08'),
('USD', 3.220, 3.044, 2.400, 4.200, 15, '2018-06-14 16:09:09');

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
('test1', 2, 10616.20, '2018-06-13 10:37:45'),
('test10', 17, 1000.00, '2018-06-14 17:19:34'),
('test11', 18, 0.00, '2018-06-14 17:19:58'),
('test2', 3, 50.00, '2018-06-14 17:11:42'),
('test3', 10, 4821.10, '2018-06-14 17:15:13'),
('test4', 11, 300.00, '2018-06-14 17:17:08'),
('test5', 12, 700.00, '2018-06-14 17:17:23'),
('test6', 13, 150.00, '2018-06-14 17:17:39'),
('test7', 14, 1000.00, '2018-06-14 17:18:15'),
('test8', 15, 100.00, '2018-06-14 17:18:31'),
('test9', 16, 769.00, '2018-06-14 17:18:50');

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
(7, 'test1', 'RON', 'GBP', -10.000, '2018-06-13 10:05:43'),
(8, 'test1', 'RON', 'GBP', -100.000, '2018-06-13 10:05:48'),
(9, 'test1', 'GBP', 'RON', 248.207, '2018-06-13 10:05:57'),
(10, 'test1', 'RON', 'GBP', -10.000, '2018-06-13 10:36:40'),
(11, 'test1', 'RON', 'EUR', -10.000, '2018-06-13 10:36:43'),
(12, 'test1', 'RON', 'DKK', -100.000, '2018-06-13 10:36:46'),
(13, 'test1', 'RON', 'DKK', -100.000, '2018-06-13 10:37:32'),
(14, 'test1', 'DKK', 'RON', 414.991, '2018-06-13 10:37:45'),
(15, 'test1', 'EUR', 'USD', 0.000, '2018-06-13 10:38:05'),
(16, 'test2', 'RON', 'GBP', -90.000, '2018-06-14 17:11:21'),
(17, 'test2', 'RON', 'GBP', -500.000, '2018-06-14 17:11:31'),
(18, 'test2', 'RON', 'EUR', -300.000, '2018-06-14 17:11:36'),
(19, 'test2', 'RON', 'USD', -50.000, '2018-06-14 17:11:42'),
(20, 'test3', 'RON', 'GBP', -500.000, '2018-06-14 17:12:14'),
(21, 'test3', 'RON', 'EUR', -500.000, '2018-06-14 17:12:17'),
(22, 'test3', 'RON', 'USD', -500.000, '2018-06-14 17:12:22'),
(23, 'test3', 'RON', 'DKK', -500.000, '2018-06-14 17:12:42'),
(24, 'test3', 'RON', 'DKK', -500.000, '2018-06-14 17:12:47'),
(25, 'test3', 'DKK', 'RON', 4321.101, '2018-06-14 17:15:13'),
(26, 'test7', 'RON', 'GBP', -1500.000, '2018-06-14 17:18:15'),
(27, 'test10', 'RON', 'DKK', -666.000, '2018-06-14 17:19:22'),
(28, 'test10', 'RON', 'EUR', -1000.000, '2018-06-14 17:19:34');

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
(3, 'test2', 'ad0234829205b9033196ba818f7a872b', 'test2@test.net', 'user', '2018-05-11 00:25:58', '2018-05-11 00:25:58'),
(10, 'test3', '8ad8757baa8564dc136c1e07507f4a98', 'test3@test.com', 'user', '2018-06-13 11:35:54', '2018-06-13 11:35:54'),
(11, 'test4', '86985e105f79b95d6bc918fb45ec7727', 'test4@test.com', 'user', '2018-06-14 17:16:58', '2018-06-14 17:16:58'),
(12, 'test5', 'e3d704f3542b44a621ebed70dc0efe13', 'test5@test.com', 'user', '2018-06-14 17:17:19', '2018-06-14 17:17:19'),
(13, 'test6', '4cfad7076129962ee70c36839a1e3e15', 'test6@test.com', 'user', '2018-06-14 17:17:35', '2018-06-14 17:17:35'),
(14, 'test7', 'b04083e53e242626595e2b8ea327e525', 'test7@test.com', 'user', '2018-06-14 17:18:01', '2018-06-14 17:18:01'),
(15, 'test8', '5e40d09fa0529781afd1254a42913847', 'test8@test.com', 'user', '2018-06-14 17:18:27', '2018-06-14 17:18:27'),
(16, 'test9', '739969b53246b2c727850dbb3490ede6', 'test9@test.com', 'user', '2018-06-14 17:18:45', '2018-06-14 17:18:45'),
(17, 'test10', 'c1a8e059bfd1e911cf10b626340c9a54', 'test10@test.com', 'user', '2018-06-14 17:19:04', '2018-06-14 17:19:04'),
(18, 'test11', 'f696282aa4cd4f614aa995190cf442fe', 'test11@test.com', 'user', '2018-06-14 17:19:58', '2018-06-14 17:19:58');

--
-- Triggers `users`
--
DELIMITER $$
CREATE TRIGGER `add_to_hof` AFTER INSERT ON `users` FOR EACH ROW INSERT INTO `speculapp`.`hof`(username,user_id,credit,updated_at) VALUES (NEW.username, NEW.id, 0, now())
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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `transactions`
--
ALTER TABLE `transactions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

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
