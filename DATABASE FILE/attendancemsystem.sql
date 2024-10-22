-- phpMyAdmin SQL Dump
-- version 5.0.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 06, 2022 at 09:57 PM
-- Server version: 10.4.17-MariaDB
-- PHP Version: 8.0.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `attendancemsystem`
--

-- --------------------------------------------------------

--
-- Table structure for table `tbladmin`
--

CREATE TABLE `tbladmin` (
  `Id` int(10) NOT NULL,
  `firstName` varchar(50) NOT NULL,
  `lastName` varchar(50) NOT NULL,
  `emailAddress` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbladmin`
--

INSERT INTO `tbladmin` (`Id`, `firstName`, `lastName`, `emailAddress`, `password`) VALUES
(1, 'Admin', '', 'admin@gmail.com', 'D00F5D5217896FB7FD601412CB890830');

-- --------------------------------------------------------

--
-- Table structure for table `tblattendance`
--

CREATE TABLE `tblattendance` (
  `Id` int(10) NOT NULL,
  `admissionNo` varchar(255) NOT NULL,
  `classId` varchar(10) NOT NULL,
  `classArmId` varchar(10) NOT NULL,
  `sessionTermId` varchar(10) NOT NULL,
  `status` varchar(10) NOT NULL,
  `dateTimeTaken` varchar(20) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tblattendance`
--

INSERT INTO `tblattendance` (`Id`, `admissionNo`, `classId`, `classArmId`, `sessionTermId`, `status`, `dateTimeTaken`) VALUES
(162, 'ASDFLKJ', '1', '2', '1', '1', '2024-10-20'),
(163, 'HSKSDD', '1', '2', '1', '1', '2024-10-20'),
(164, 'JSLDKJ', '1', '2', '1', '1', '2024-10-20'),
(172, 'HSKDS9EE', '1', '4', '1', '1', '2024-10-20'),
(171, 'JKADA', '1', '4', '1', '0', '2024-10-20'),
(170, 'JSFSKDJ', '1', '4', '1', '1', '2024-10-20'),
(173, 'ASDFLKJ', '1', '2', '1', '1', '2024-10-20'),
(174, 'HSKSDD', '1', '2', '1', '1', '2024-10-20'),
(175, 'JSLDKJ', '1', '2', '1', '1', '2024-10-20'),
(176, 'JSFSKDJ', '1', '4', '1', '0', '2024-10-20'),
(177, 'JKADA', '1', '4', '1', '0', '2024-10-20'),
(178, 'HSKDS9EE', '1', '4', '1', '0', '2024-10-20'),
(179, 'ASDFLKJ', '1', '2', '1', '0', '2024-09-28'),
(180, 'HSKSDD', '1', '2', '1', '1', '2024-09-28'),
(181, 'JSLDKJ', '1', '2', '1', '1', '2024-09-28'),
(182, 'ASDFLKJ', '1', '2', '1', '0', '2024-09-28'),
(183, 'HSKSDD', '1', '2', '1', '0', '2024-09-28'),
(184, 'JSLDKJ', '1', '2', '1', '1', '2024-09-28'),
(185, 'ASDFLKJ', '1', '2', '1', '0', '2024-09-28'),
(186, 'HSKSDD', '1', '2', '1', '0', '2024-09-28'),
(187, 'JSLDKJ', '1', '2', '1', '0', '2024-09-28'),
(188, 'AMS110', '4', '6', '1', '1', '2024-09-28'),
(189, 'AMS133', '4', '6', '1', '0', '2024-09-28'),
(190, 'AMS135', '4', '6', '1', '0', '2024-09-28'),
(191, 'AMS144', '4', '6', '1', '1', '2024-09-28'),
(192, 'AMS148', '4', '6', '1', '0', '2024-09-28'),
(193, 'AMS151', '4', '6', '1', '1', '2024-09-28'),
(194, 'AMS159', '4', '6', '1', '1', '2024-09-28'),
(195, 'AMS161', '4', '6', '1', '1', '2024-09-28'),
(196, 'AMS110', '4', '6', '1', '1', '2024-09-28'),
(197, 'AMS133', '4', '6', '1', '0', '2024-09-28'),
(198, 'AMS135', '4', '6', '1', '0', '2024-09-28'),
(199, 'AMS144', '4', '6', '1', '1', '2024-09-28'),
(200, 'AMS148', '4', '6', '1', '0', '2024-09-28'),
(201, 'AMS151', '4', '6', '1', '1', '2024-09-28'),
(202, 'AMS159', '4', '6', '1', '1', '2024-09-28'),
(203, 'AMS161', '4', '6', '1', '1', '2024-09-28');

-- --------------------------------------------------------

--
-- Table structure for table `tblclass`
--

CREATE TABLE `tblclass` (
  `Id` int(10) NOT NULL,
  `className` varchar(255) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tblclass`
--

INSERT INTO `tblclass` (`Id`, `className`) VALUES
(1, 'MCA I'),
(3, 'MCA II'),
(4, 'MBA II');

-- --------------------------------------------------------

--
-- Table structure for table `tblclassarms`
--

CREATE TABLE `tblclassarms` (
  `Id` int(10) NOT NULL,
  `classId` varchar(10) NOT NULL,
  `classArmName` varchar(255) NOT NULL,
  `isAssigned` varchar(10) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tblclassarms`
--

INSERT INTO `tblclassarms` (`Id`, `classId`, `classArmName`, `isAssigned`) VALUES
(2, '1', 'A', '1'),
(4, '1', 'A', '1'),
(5, '3', 'A', '1'),
(6, '4', 'A', '1');

-- --------------------------------------------------------

--
-- Table structure for table `tblclassteacher`
--

CREATE TABLE `tblclassteacher` (
  `Id` int(10) NOT NULL,
  `firstName` varchar(255) NOT NULL,
  `lastName` varchar(255) NOT NULL,
  `emailAddress` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `phoneNo` varchar(50) NOT NULL,
  `classId` varchar(10) NOT NULL,
  `classArmId` varchar(10) NOT NULL,
  `dateCreated` varchar(50) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tblclassteacher`
--

INSERT INTO `tblclassteacher` (`Id`, `firstName`, `lastName`, `emailAddress`, `password`, `phoneNo`, `classId`, `classArmId`, `dateCreated`) VALUES
(1, 'Ramesh', 'Jadhav', 'teacher2@mail.com', '32250170a0dca92d53ec9624f336ca24', '09089898999', '1', '2', '2024-10-12'),
(4, 'Kumidini', 'Manawar', 'teacher3@gmail.com', '32250170a0dca92d53ec9624f336ca24', '09672002882', '1', '4', '2024-09-08'),
(5, 'Dipali', 'Patil', 'teacher4@mail.com', '32250170a0dca92d53ec9624f336ca24', '7014560000', '3', '5', '2024-08-17'),
(6, 'Anjali', 'Landage', 'teacher@mail.com', '32250170a0dca92d53ec9624f336ca24', '0100000030', '4', '6', '2024-07-07');

-- --------------------------------------------------------

--
-- Table structure for table `tblsessionterm`
--

CREATE TABLE `tblsessionterm` (
  `Id` int(10) NOT NULL,
  `sessionName` varchar(50) NOT NULL,
  `termId` varchar(50) NOT NULL,
  `isActive` varchar(10) NOT NULL,
  `dateCreated` varchar(50) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tblsessionterm`
--

INSERT INTO `tblsessionterm` (`Id`, `sessionName`, `termId`, `isActive`, `dateCreated`) VALUES
(1, '2024/2025', '1', '1', '2022-10-31'),
(3, '2024/2025', '2', '0', '2022-10-31');

-- --------------------------------------------------------

--
-- Table structure for table `tblstudents`
--

CREATE TABLE `tblstudents` (
  `Id` int(10) NOT NULL,
  `firstName` varchar(255) NOT NULL,
  `lastName` varchar(255) NOT NULL,
  `otherName` varchar(255) NOT NULL,
  `admissionNumber` varchar(255) NOT NULL,
  `password` varchar(50) NOT NULL,
  `classId` varchar(10) NOT NULL,
  `classArmId` varchar(10) NOT NULL,
  `dateCreated` varchar(50) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tblstudents`
--

INSERT INTO `tblstudents` (`Id`, `firstName`, `lastName`, `otherName`, `admissionNumber`, `password`, `classId`, `classArmId`, `dateCreated`) VALUES
(1, 'Aditya', 'Purkar', 'none', '23101', '12345', '1', '2', '2024-10-20'),
(3, 'Abhay', 'Girge', 'none', '23102', '12345', '1', '2', '2024-10-20'),
(4, 'Nikhil', 'Veer', 'none', '23103', '12345', '1', '2', '2024-10-20'),
(5, 'Pritam', 'Dhawale', 'none', '23104', '12345', '1', '4', '2024-10-20'),
(6, 'Priti', 'Tole', 'none', '23105', '12345', '1', '4', '2024-10-20'),
(7, 'Sneha', 'Shinde', 'none', '23106', '12345', '1', '4', '2024-10-20'),
(8, 'Shubham', 'Shelke', 'none', '23107', '12345', '3', '5', '2024-10-20'),
(9, 'Santoshi', 'Raut', 'none', '23108', '12345', '3', '5', '2024-10-20'),
(10, 'Komal', 'Madage', 'none', '23109', '12345', '4', '6', '2024-10-07'),
(11, 'Dhanashri', 'Ichake', 'none', '23110', '12345', '4', '6', '2024-10-07'),
(12, 'Mugdha', 'Kale', 'none', '23111', '12345', '4', '6', '2024-10-07'),
(13, 'Omkar', 'Deshmukh', 'none', '23112', '12345', '4', '6', '2024-10-07'),
(14, 'Kaustub', 'Jadhav', 'none', '23113', '12345', '4', '6', '2024-10-07'),
(15, 'Vanshika', 'Dominick', 'none', '23114', '12345', '4', '6', '2024-10-07'),
(16, 'Pushpak', 'Shelar', 'none', '23115', '12345', '4', '6', '2024-10-07'),
(17, 'Sahil', 'Theurkar', 'none', '23116', '12345', '4', '6', '2024-10-07');

-- --------------------------------------------------------

--
-- Table structure for table `tblterm`
--

CREATE TABLE `tblterm` (
  `Id` int(10) NOT NULL,
  `termName` varchar(20) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tblterm`
--

INSERT INTO `tblterm` (`Id`, `termName`) VALUES
(1, 'First'),
(2, 'Second'),
(3, 'Third');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `tbladmin`
--
ALTER TABLE `tbladmin`
  ADD PRIMARY KEY (`Id`);

--
-- Indexes for table `tblattendance`
--
ALTER TABLE `tblattendance`
  ADD PRIMARY KEY (`Id`);

--
-- Indexes for table `tblclass`
--
ALTER TABLE `tblclass`
  ADD PRIMARY KEY (`Id`);

--
-- Indexes for table `tblclassarms`
--
ALTER TABLE `tblclassarms`
  ADD PRIMARY KEY (`Id`);

--
-- Indexes for table `tblclassteacher`
--
ALTER TABLE `tblclassteacher`
  ADD PRIMARY KEY (`Id`);

--
-- Indexes for table `tblsessionterm`
--
ALTER TABLE `tblsessionterm`
  ADD PRIMARY KEY (`Id`);

--
-- Indexes for table `tblstudents`
--
ALTER TABLE `tblstudents`
  ADD PRIMARY KEY (`Id`);

--
-- Indexes for table `tblterm`
--
ALTER TABLE `tblterm`
  ADD PRIMARY KEY (`Id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `tbladmin`
--
ALTER TABLE `tbladmin`
  MODIFY `Id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `tblattendance`
--
ALTER TABLE `tblattendance`
  MODIFY `Id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=204;

--
-- AUTO_INCREMENT for table `tblclass`
--
ALTER TABLE `tblclass`
  MODIFY `Id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `tblclassarms`
--
ALTER TABLE `tblclassarms`
  MODIFY `Id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `tblclassteacher`
--
ALTER TABLE `tblclassteacher`
  MODIFY `Id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `tblsessionterm`
--
ALTER TABLE `tblsessionterm`
  MODIFY `Id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `tblstudents`
--
ALTER TABLE `tblstudents`
  MODIFY `Id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `tblterm`
--
ALTER TABLE `tblterm`
  MODIFY `Id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
