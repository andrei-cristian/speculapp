-- phpMyAdmin SQL Dump
-- version 4.7.9
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 11, 2018 at 09:33 AM
-- Server version: 10.1.31-MariaDB
-- PHP Version: 7.2.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `speculapp`
--

-- --------------------------------------------------------

--
-- Table structure for table `currency`
--

CREATE TABLE `currency` (
  `name` varchar(8) NOT NULL,
  `cur_value` double NOT NULL,
  `min_value` double NOT NULL,
  `max_value` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `currency`
--

INSERT INTO `currency` (`name`, `cur_value`, `min_value`, `max_value`) VALUES
('EUR', 5.6, 4.3, 6.8),
('USD', 3.6, 2.3, 5.5);

-- --------------------------------------------------------

--
-- Table structure for table `game`
--

CREATE TABLE `game` (
  `last_update` datetime NOT NULL,
  `valid_time` int(11) NOT NULL,
  `init_money` double NOT NULL,
  `win_limit` double NOT NULL,
  `lose_limit` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `game`
--

INSERT INTO `game` (`last_update`, `valid_time`, `init_money`, `win_limit`, `lose_limit`) VALUES
('2018-05-11 10:37:00', 300, 1000, 2000, 100);

-- --------------------------------------------------------

--
-- Table structure for table `hof`
--

CREATE TABLE `hof` (
  `user_id` int(11) NOT NULL,
  `credit` int(11) NOT NULL,
  `updated_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `hof`
--

INSERT INTO `hof` (`user_id`, `credit`, `updated_at`) VALUES
(2, 0, '2018-05-11 00:24:54'),
(3, 0, '2018-05-11 00:25:58');

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
CREATE TRIGGER `add_to_hof` AFTER INSERT ON `users` FOR EACH ROW INSERT INTO `speculapp`.`hof`(user_id,points,updated_at) VALUES (NEW.id,0,now())
$$
DELIMITER ;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `currency`
--
ALTER TABLE `currency`
  ADD PRIMARY KEY (`name`);

--
-- Indexes for table `game`
--
ALTER TABLE `game`
  ADD PRIMARY KEY (`last_update`);

--
-- Indexes for table `hof`
--
ALTER TABLE `hof`
  ADD KEY `user_id` (`user_id`);

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
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `hof`
--
ALTER TABLE `hof`
  ADD CONSTRAINT `hof_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`ID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
