-- phpMyAdmin SQL Dump
-- version 4.8.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 13, 2018 at 10:36 AM
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
(2, 'test2', 'EUR', '1.752', '2018-06-13 10:00:07'),
(3, 'test1', 'GBP', '1.698', '2018-06-13 10:36:40'),
(4, 'test1', 'EUR', '1.352', '2018-06-13 10:38:05'),
(6, 'test1', 'USD', '1.796', '2018-06-13 10:38:05');

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
('DKK', 0.844, 0.515, 0.300, 1.600, 10, '2018-06-13 11:15:11'),
('EUR', 5.150, 5.415, 4.000, 6.000, 10, '2018-06-13 11:15:19'),
('GBP', 6.817, 6.968, 4.600, 7.000, 30, '2018-06-13 11:15:08'),
('USD', 2.413, 3.434, 2.400, 4.200, 15, '2018-06-13 11:15:24');

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
('test2', 3, 990.00, '2018-06-13 10:00:07'),
('test3', 10, 0.00, '2018-06-13 11:35:54');

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
(15, 'test1', 'EUR', 'USD', 0.000, '2018-06-13 10:38:05');

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
(10, 'test3', '8ad8757baa8564dc136c1e07507f4a98', 'test3@test.com', 'user', '2018-06-13 11:35:54', '2018-06-13 11:35:54');

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `transactions`
--
ALTER TABLE `transactions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

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
