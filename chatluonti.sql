-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: 03.02.2020 klo 20:08
-- Palvelimen versio: 5.7.26
-- PHP Version: 7.2.18

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `chat`
--
CREATE DATABASE IF NOT EXISTS `chat` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `chat`;

-- --------------------------------------------------------

--
-- Rakenne taululle `chat_message`
--

DROP TABLE IF EXISTS `chat_message`;
CREATE TABLE IF NOT EXISTS `chat_message` (
  `chat_message_id` int(11) NOT NULL AUTO_INCREMENT,
  `to_user_id` int(11) NOT NULL,
  `from_user_id` int(11) NOT NULL,
  `chat_message` text NOT NULL,
  `timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `status` int(1) NOT NULL,
  PRIMARY KEY (`chat_message_id`)
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=latin1;

--
-- Vedos taulusta `chat_message`
--

INSERT INTO `chat_message` (`chat_message_id`, `to_user_id`, `from_user_id`, `chat_message`, `timestamp`, `status`) VALUES
(1, 1, 2, 'hello', '2019-12-12 12:36:18', 0),
(2, 2, 1, 'hello', '2019-12-12 12:36:59', 0),
(3, 1, 2, 'does this work', '2019-12-12 17:04:09', 0),
(4, 2, 1, 'yes', '2019-12-12 17:04:23', 0),
(5, 2, 1, 'asd', '2019-12-12 22:15:39', 0),
(6, 1, 2, 'asdasdasdasd', '2019-12-13 22:01:59', 0),
(7, 2, 1, 'hello', '2019-12-13 22:02:28', 0),
(8, 2, 1, 'test', '2019-12-14 14:06:14', 1),
(9, 2, 1, 'test', '2019-12-14 14:06:16', 1),
(10, 2, 1, 'test', '2019-12-14 14:06:16', 1),
(11, 2, 1, 'test', '2019-12-14 14:06:16', 1),
(12, 2, 1, 'test', '2019-12-14 14:06:22', 1),
(13, 2, 1, 'testi', '2019-12-14 14:06:26', 1),
(14, 2, 1, 'asd', '2019-12-14 14:15:38', 1),
(15, 2, 1, 'asd', '2019-12-14 14:25:48', 1),
(16, 2, 1, 'testi2', '2019-12-14 14:35:59', 1),
(17, 2, 1, 'hei', '2019-12-14 14:38:46', 1),
(18, 2, 1, 'hea', '2019-12-14 14:52:49', 1),
(19, 2, 1, 'asd', '2019-12-14 14:56:55', 1),
(20, 2, 1, '123', '2019-12-14 15:08:54', 1),
(21, 2, 1, '2', '2019-12-14 15:08:58', 1),
(22, 2, 1, 'moi', '2019-12-17 16:39:52', 1),
(23, 1, 2, 'ii', '2019-12-17 19:54:23', 1),
(24, 16, 1, 'hei', '2019-12-17 20:37:37', 1),
(25, 23, 26, 'moi vihdoin toimii', '2019-12-17 22:12:47', 1),
(26, 26, 23, 'jee', '2019-12-17 22:13:21', 1),
(27, 1, 26, 'asd', '2019-12-17 22:15:44', 1),
(28, 23, 26, 'asd', '2019-12-17 22:15:51', 1),
(29, 2, 1, 'a', '2019-12-21 20:14:39', 1),
(30, 3, 1, 'aika', '2019-12-21 21:04:27', 1),
(31, 2, 1, 'Viesti dokumentoitia varten', '2019-12-22 18:06:20', 1),
(32, 32, 1, 'terve', '2020-02-03 14:33:02', 1),
(33, 1, 32, 'moi', '2020-02-03 14:33:19', 1);

-- --------------------------------------------------------

--
-- Rakenne taululle `login`
--

DROP TABLE IF EXISTS `login`;
CREATE TABLE IF NOT EXISTS `login` (
  `user_id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=latin1;

--
-- Vedos taulusta `login`
--

INSERT INTO `login` (`user_id`, `username`, `password`) VALUES
(1, 'testi', '$2y$10$4REfvTZpxLgkAR/lKG9QiOkSdahOYIR3MeoGJAyiWmRkEFfjH3396'),
(2, 'testi2', '$2y$10$4REfvTZpxLgkAR/lKG9QiOkSdahOYIR3MeoGJAyiWmRkEFfjH3396'),
(3, 'testi3', '$2y$10$4REfvTZpxLgkAR/lKG9QiOkSdahOYIR3MeoGJAyiWmRkEFfjH3396'),
(4, 'testi4', '$2y$10$ixe3uizM2LHxzTYFz9DsNOuV5eaFJbzO5UWmdBLWoijTkW8ho056m'),
(5, 'testi5', '$2y$10$hFOLtwrPQo0PEsUm2PnRZet2ZLWIyw5ntE1m2sU4mWfghfBIlw3W.'),
(30, 'Lisää', '$2y$10$F1adAy7THdAPNegIAnH4yueb1TyTYcz6sQ/Y99fiKLZ/X4ZXkuZEy'),
(31, 'kokki', '$2y$10$h4uTk2RnO6EzAvM7iLX.Xu9vOpAMANqB8xYiY0pwxkbSWlznHNIZu'),
(32, 'kokki1', '$2y$10$ha9YRAczPygkMypKgaK.dutW6.rMKalP2EWvmnWitkKGsv57XwRLK');

-- --------------------------------------------------------

--
-- Rakenne taululle `login_details`
--

DROP TABLE IF EXISTS `login_details`;
CREATE TABLE IF NOT EXISTS `login_details` (
  `login_details_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `last_activity` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`login_details_id`)
) ENGINE=InnoDB AUTO_INCREMENT=44 DEFAULT CHARSET=latin1;

--
-- Vedos taulusta `login_details`
--

INSERT INTO `login_details` (`login_details_id`, `user_id`, `last_activity`) VALUES
(1, 2, '2019-12-12 16:21:55'),
(2, 1, '2019-12-12 12:37:03'),
(3, 2, '2019-12-12 18:46:02'),
(4, 1, '2019-12-12 17:11:09'),
(5, 1, '2019-12-12 19:55:36'),
(6, 3, '2019-12-12 22:14:52'),
(7, 1, '2019-12-12 22:34:28'),
(8, 2, '2019-12-12 22:51:35'),
(9, 1, '2019-12-12 22:51:56'),
(10, 1, '2019-12-14 13:44:56'),
(11, 2, '2019-12-13 22:07:02'),
(12, 4, '2019-12-13 22:16:04'),
(13, 1, '2019-12-14 13:57:56'),
(14, 1, '2019-12-14 15:29:23'),
(15, 2, '2019-12-14 16:24:56'),
(16, 5, '2019-12-14 16:24:59'),
(17, 8, '2019-12-16 20:49:30'),
(18, 1, '2019-12-17 16:38:08'),
(19, 1, '2019-12-17 19:09:00'),
(20, 1, '2019-12-17 19:53:44'),
(21, 2, '2019-12-17 22:12:46'),
(22, 1, '2019-12-17 20:23:31'),
(23, 1, '2019-12-17 20:38:43'),
(24, 20, '2019-12-17 21:25:06'),
(25, 1, '2019-12-17 21:48:48'),
(26, 23, '2019-12-17 22:02:45'),
(27, 23, '2019-12-17 22:11:56'),
(28, 26, '2019-12-17 22:18:16'),
(29, 23, '2019-12-17 22:18:18'),
(30, 1, '2019-12-21 20:11:29'),
(31, 29, '2019-12-21 20:13:34'),
(32, 1, '2019-12-21 20:17:27'),
(33, 2, '2019-12-21 21:35:19'),
(34, 1, '2019-12-21 21:35:23'),
(35, 3, '2019-12-21 21:35:22'),
(36, 1, '2019-12-22 17:45:16'),
(37, 1, '2019-12-22 18:15:40'),
(38, 2, '2019-12-22 18:37:06'),
(39, 1, '2020-02-03 13:29:37'),
(40, 31, '2020-02-03 14:27:05'),
(41, 1, '2020-02-03 14:54:55'),
(42, 32, '2020-02-03 14:33:26'),
(43, 1, '2020-02-03 14:34:07');
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
