-- phpMyAdmin SQL Dump
-- version 4.9.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jul 11, 2021 at 11:34 PM
-- Server version: 10.4.8-MariaDB
-- PHP Version: 7.1.33

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `sim_cards_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `customers`
--

CREATE TABLE `customers` (
  `id` int(11) NOT NULL,
  `customer_name` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `customers`
--

INSERT INTO `customers` (`id`, `customer_name`) VALUES
(1, 'Nasiphi'),
(2, 'Uminathi'),
(3, 'Azinani'),
(4, 'Zizo');

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `id` varchar(50) NOT NULL,
  `simId` int(11) NOT NULL,
  `customer_id` int(11) NOT NULL,
  `address` varchar(100) NOT NULL,
  `city` varchar(50) NOT NULL,
  `zip_code` varchar(50) NOT NULL,
  `country` varchar(50) NOT NULL,
  `status` enum('Processing','Pending','Completed') NOT NULL,
  `createdAt` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`id`, `simId`, `customer_id`, `address`, `city`, `zip_code`, `country`, `status`, `createdAt`) VALUES
('7d21e748-2798-4e17-945b-5c682d7d2b3b', 1, 2, 'Caltorn', 'Johannesburg', '5032', 'South Africa', 'Pending', '2021-07-11'),
('ac5a1605b03f9f20c45cf203782a7a32', 3, 3, 'Jepee', 'Johannesburg', '2013', 'South Africa', 'Processing', '2021-07-11'),
('d84aa6f0cda76d4e8d01e786c0d5450f', 4, 1, '24 Woodmead', 'iDutywa', '3000', 'South Africa', 'Pending', '2021-07-07');

-- --------------------------------------------------------

--
-- Table structure for table `simcards`
--

CREATE TABLE `simcards` (
  `simId` int(11) NOT NULL,
  `name` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `simcards`
--

INSERT INTO `simcards` (`simId`, `name`) VALUES
(4, 'Sim 8ta'),
(3, 'Sim CellC'),
(1, 'Sim MTN'),
(2, 'SIM Telkom');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `customers`
--
ALTER TABLE `customers`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `simId_2` (`simId`),
  ADD KEY `simId` (`simId`),
  ADD KEY `customer_id` (`customer_id`);

--
-- Indexes for table `simcards`
--
ALTER TABLE `simcards`
  ADD PRIMARY KEY (`simId`),
  ADD UNIQUE KEY `name` (`name`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `customers`
--
ALTER TABLE `customers`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `simcards`
--
ALTER TABLE `simcards`
  MODIFY `simId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`id`),
  ADD CONSTRAINT `orders_ibfk_2` FOREIGN KEY (`simId`) REFERENCES `simcards` (`simId`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
