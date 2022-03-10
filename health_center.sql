-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Mar 09, 2022 at 09:30 PM
-- Server version: 10.4.22-MariaDB
-- PHP Version: 8.1.2

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `health_center`
--
CREATE DATABASE IF NOT EXISTS `health_center` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
USE `health_center`;

-- --------------------------------------------------------

--
-- Table structure for table `doktors`
--

CREATE TABLE `doktors` (
  `doctors_id` int(30) NOT NULL,
  `f_name` varchar(30) NOT NULL,
  `l_name` varchar(30) NOT NULL,
  `speciality` varchar(50) NOT NULL,
  `fk_realized_id` int(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `doktors`
--

INSERT INTO `doktors` (`doctors_id`, `f_name`, `l_name`, `speciality`, `fk_realized_id`) VALUES
(100, 'Mohoo', 'Many', 'emergency_department', 0),
(101, 'Ivan', 'Markovic', 'scenner department', 1),
(102, 'Blazo', 'Bozovic', 'eye', 7);

-- --------------------------------------------------------

--
-- Table structure for table `intervention`
--

CREATE TABLE `intervention` (
  `pk_realized_id` int(30) NOT NULL,
  `fk_setting_of_date_id` int(30) NOT NULL,
  `observed_symptom` char(50) NOT NULL,
  `prescribed_treatment` char(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `intervention`
--

INSERT INTO `intervention` (`pk_realized_id`, `fk_setting_of_date_id`, `observed_symptom`, `prescribed_treatment`) VALUES
(0, 10122010, 'foot scratch', 'bend'),
(1, 10122011, 'broken arm', 'bandage with a bandage'),
(7, 10122013, 'eye injury', 'eye institute');

-- --------------------------------------------------------

--
-- Table structure for table `patients`
--

CREATE TABLE `patients` (
  `patients_id` int(11) NOT NULL,
  `f_name` varchar(30) NOT NULL,
  `l_name` varchar(30) NOT NULL,
  `type_of` varchar(50) NOT NULL,
  `date_of_birth` date NOT NULL,
  `social_security_number` int(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `patients`
--

INSERT INTO `patients` (`patients_id`, `f_name`, `l_name`, `type_of`, `date_of_birth`, `social_security_number`) VALUES
(1, 'John', 'Doe', 'leg injury', '2010-01-11', 121011),
(2, 'Bill', 'Boho', 'hand injury', '2015-03-13', 131313),
(3, 'Sissy', 'Milov', 'eye injury', '1968-02-07', 123123);

-- --------------------------------------------------------

--
-- Table structure for table `register`
--

CREATE TABLE `register` (
  `register_id` int(11) NOT NULL,
  `age` int(30) NOT NULL,
  `date_of_admission` int(30) NOT NULL,
  `fk_patient_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `register`
--

INSERT INTO `register` (`register_id`, `age`, `date_of_admission`, `fk_patient_id`) VALUES
(121011, 12, 12032010, 1),
(131313, 7, 13032010, 2),
(123123, 80, 13032016, 3);

-- --------------------------------------------------------

--
-- Table structure for table `unit`
--

CREATE TABLE `unit` (
  `unit_id` int(30) NOT NULL,
  `rooms` int(30) NOT NULL,
  `stage` int(11) NOT NULL,
  `name` varchar(30) NOT NULL,
  `fk_date_of_admission_id` int(11) NOT NULL,
  `fk_setting_of_date_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `unit`
--

INSERT INTO `unit` (`unit_id`, `rooms`, `stage`, `name`, `fk_date_of_admission_id`, `fk_setting_of_date_id`) VALUES
(10, 1, 1, 'emergency department', 12032010, 10122010),
(11, 2, 2, 'scanner compartment', 13032010, 10122011),
(12, 3, 3, 'eye_institution', 13032016, 10122013);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `doktors`
--
ALTER TABLE `doktors`
  ADD PRIMARY KEY (`doctors_id`),
  ADD KEY `fk_realized_id` (`fk_realized_id`);

--
-- Indexes for table `intervention`
--
ALTER TABLE `intervention`
  ADD PRIMARY KEY (`pk_realized_id`,`fk_setting_of_date_id`) USING BTREE,
  ADD UNIQUE KEY `fk_setting_of_date_id` (`fk_setting_of_date_id`);

--
-- Indexes for table `patients`
--
ALTER TABLE `patients`
  ADD PRIMARY KEY (`patients_id`);

--
-- Indexes for table `register`
--
ALTER TABLE `register`
  ADD PRIMARY KEY (`date_of_admission`),
  ADD KEY `fk_patient_id` (`fk_patient_id`);

--
-- Indexes for table `unit`
--
ALTER TABLE `unit`
  ADD PRIMARY KEY (`unit_id`),
  ADD UNIQUE KEY `fk_setting_of_date_id` (`fk_setting_of_date_id`) USING BTREE,
  ADD UNIQUE KEY `fk_date_of_admission_id` (`fk_date_of_admission_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `doktors`
--
ALTER TABLE `doktors`
  MODIFY `doctors_id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=103;

--
-- AUTO_INCREMENT for table `patients`
--
ALTER TABLE `patients`
  MODIFY `patients_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=225524;

--
-- AUTO_INCREMENT for table `register`
--
ALTER TABLE `register`
  MODIFY `date_of_admission` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13032017;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `intervention`
--
ALTER TABLE `intervention`
  ADD CONSTRAINT `intervention_ibfk_1` FOREIGN KEY (`pk_realized_id`) REFERENCES `doktors` (`fk_realized_id`);

--
-- Constraints for table `register`
--
ALTER TABLE `register`
  ADD CONSTRAINT `register_ibfk_1` FOREIGN KEY (`fk_patient_id`) REFERENCES `patients` (`patients_id`);

--
-- Constraints for table `unit`
--
ALTER TABLE `unit`
  ADD CONSTRAINT `unit_ibfk_4` FOREIGN KEY (`fk_setting_of_date_id`) REFERENCES `intervention` (`fk_setting_of_date_id`),
  ADD CONSTRAINT `unit_ibfk_5` FOREIGN KEY (`fk_date_of_admission_id`) REFERENCES `register` (`date_of_admission`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
