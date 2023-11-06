-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 06, 2023 at 05:22 AM
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
-- Database: `car_management`
--

-- --------------------------------------------------------

--
-- Table structure for table `cardetails`
--

CREATE TABLE `cardetails` (
  `Id` int(11) NOT NULL,
  `OwnerId` int(11) DEFAULT NULL,
  `CarName` varchar(255) DEFAULT NULL,
  `Model` varchar(255) DEFAULT NULL,
  `CarNumber` varchar(255) DEFAULT NULL,
  `Location` varchar(255) DEFAULT NULL,
  `TotalOwnersOfTheCar` varchar(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `cardetails`
--

INSERT INTO `cardetails` (`Id`, `OwnerId`, `CarName`, `Model`, `CarNumber`, `Location`, `TotalOwnersOfTheCar`) VALUES
(1, 1, 'bmw', 'x7', 'TN33R8886', 'CBE', '1'),
(2, 1, 'BMW', 'M8', 'TN38RJ7777', 'CBE', '1'),
(3, 2, 'HONDA', 'CITY', 'KL07TT7890', 'PALAKKAD', '2'),
(4, 1, 'AUDI', 'Q7', 'TN07TN7', 'CBE', '3'),
(8, 1, 'POLO', 'GT', 'TN38RR2020', 'CBE', '2');

-- --------------------------------------------------------

--
-- Table structure for table `carsales`
--

CREATE TABLE `carsales` (
  `Id` int(11) NOT NULL,
  `CarId` int(11) DEFAULT NULL,
  `SoldDate` date DEFAULT NULL,
  `SalesStatus` varchar(50) DEFAULT NULL,
  `DeliveryStatus` varchar(50) DEFAULT NULL,
  `SellingPrice` decimal(10,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `carsales`
--

INSERT INTO `carsales` (`Id`, `CarId`, `SoldDate`, `SalesStatus`, `DeliveryStatus`, `SellingPrice`) VALUES
(1, 1, '2023-10-25', 'Sold', 'Delivered', 25000.00),
(2, 2, '2023-10-26', 'Sold', 'Delivered', 350000.00),
(3, 1, '2023-11-03', 'Sold', 'Delivered', 400000.00),
(7, 4, '2023-10-30', 'Sold', 'Delivered', 300000.00);

-- --------------------------------------------------------

--
-- Table structure for table `carslist`
--

CREATE TABLE `carslist` (
  `Id` int(11) NOT NULL,
  `CarId` int(11) DEFAULT NULL,
  `EntryDate` varchar(255) DEFAULT NULL,
  `ExitDate` varchar(255) DEFAULT NULL,
  `ExitStatus` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `carslist`
--

INSERT INTO `carslist` (`Id`, `CarId`, `EntryDate`, `ExitDate`, `ExitStatus`) VALUES
(1, 1, '2023-10-25', NULL, 'Inside');

-- --------------------------------------------------------

--
-- Table structure for table `ownerdetails`
--

CREATE TABLE `ownerdetails` (
  `Id` int(11) NOT NULL,
  `OwnerName` varchar(255) DEFAULT NULL,
  `OwnerNumber` varchar(255) DEFAULT NULL,
  `OwnerAddress` varchar(255) DEFAULT NULL,
  `OwnerPrice` decimal(10,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `ownerdetails`
--

INSERT INTO `ownerdetails` (`Id`, `OwnerName`, `OwnerNumber`, `OwnerAddress`, `OwnerPrice`) VALUES
(1, 'RICHARD', '9345272743', 'PODANUR, COIMBATORE', 200000.00),
(2, 'RICHIE', '9345272744', 'PODANUR,CBE', 1000000.00),
(3, 'RJ', '9345272745', 'PODANUR,CBE', 500000.00),
(4, 'richu', '9445574016', 'CBE', 250000.00),
(5, 'D.RICHARD', '9994244242', 'COIMBATORE', 600000.00),
(6, 'Richard.D', '9842609185', 'CBE', 450000.00),
(8, 'rj', '9842609185', 'CBE', 300000.00),
(11, 'richu', '984269185', 'CBE', 600000.00);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `cardetails`
--
ALTER TABLE `cardetails`
  ADD PRIMARY KEY (`Id`),
  ADD KEY `OwnerId` (`OwnerId`);

--
-- Indexes for table `carsales`
--
ALTER TABLE `carsales`
  ADD PRIMARY KEY (`Id`),
  ADD KEY `CarId` (`CarId`);

--
-- Indexes for table `carslist`
--
ALTER TABLE `carslist`
  ADD PRIMARY KEY (`Id`),
  ADD KEY `CarId` (`CarId`);

--
-- Indexes for table `ownerdetails`
--
ALTER TABLE `ownerdetails`
  ADD PRIMARY KEY (`Id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `cardetails`
--
ALTER TABLE `cardetails`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `carsales`
--
ALTER TABLE `carsales`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `carslist`
--
ALTER TABLE `carslist`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `ownerdetails`
--
ALTER TABLE `ownerdetails`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `cardetails`
--
ALTER TABLE `cardetails`
  ADD CONSTRAINT `cardetails_ibfk_1` FOREIGN KEY (`OwnerId`) REFERENCES `ownerdetails` (`Id`);

--
-- Constraints for table `carsales`
--
ALTER TABLE `carsales`
  ADD CONSTRAINT `carsales_ibfk_1` FOREIGN KEY (`CarId`) REFERENCES `cardetails` (`Id`);

--
-- Constraints for table `carslist`
--
ALTER TABLE `carslist`
  ADD CONSTRAINT `carslist_ibfk_1` FOREIGN KEY (`CarId`) REFERENCES `cardetails` (`Id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
