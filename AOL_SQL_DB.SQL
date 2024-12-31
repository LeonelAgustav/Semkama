-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 29, 2024 at 01:37 PM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `semkama_application`
--

-- --------------------------------------------------------

--
-- Table structure for table `currentstock`
--

CREATE TABLE `currentstock` (
  `productcode` varchar(45) NOT NULL,
  `quantity` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `currentstock`
--

INSERT INTO `currentstock` (`productcode`, `quantity`) VALUES
('PROD-1', 100),
('PROD-2', 100),
('PROD-3', 100),
('PROD-4', 100),
('PROD-5', 100),
('PROD-6', 100),
('PROD-7', 100);

-- --------------------------------------------------------

--
-- Table structure for table `customers`
--

CREATE TABLE `customers` (
  `cid` int(11) NOT NULL,
  `customercode` varchar(45) NOT NULL,
  `fullname` varchar(45) NOT NULL,
  `location` varchar(45) NOT NULL,
  `phone` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `customers`
--

INSERT INTO `customers` (`cid`, `customercode`, `fullname`, `location`, `phone`) VALUES
(1, 'CUS-1', 'Agus Salim', 'Jakarta', '081234567890'),
(2, 'CUS-2', 'Dewi Sartika', 'Bandung', '082123456789'),
(3, 'CUS-3', 'Surya Saputra', 'Surabaya', '083234567890'),
(4, 'CUS-4', 'Citra Kirana', 'Yogyakarta', '084345678901'),
(5, 'CUS-5', 'Bambang Pamungkas', 'Semarang', '085456789012');

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `order_id` int(11) NOT NULL,
  `cid` int(11) NOT NULL,
  `pid` int(11) DEFAULT NULL,
  `quantity` int(10) NOT NULL,
  `order_date` timestamp NOT NULL DEFAULT current_timestamp(),
  `total_amount` decimal(10,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`order_id`, `cid`, `pid`, `quantity`, `order_date`, `total_amount`) VALUES
(32, 1, 3, 10, '2024-12-21 21:44:52', 1000000.00),
(33, 1, 3, 5, '2024-12-21 21:45:21', 500000.00),
(34, 2, 3, 2, '2024-12-21 21:56:06', 200000.00),
(38, 1, 5, 22, '2024-12-21 22:28:27', 14300000.00),
(39, 1, 1, 1, '2024-12-21 22:28:36', 80000.00),
(40, 1, 3, 10, '2024-12-21 22:30:43', 1000000.00);

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `pid` int(11) NOT NULL,
  `productcode` varchar(45) NOT NULL,
  `productname` varchar(45) NOT NULL,
  `unit` varchar(45) NOT NULL,
  `sellprice` double NOT NULL,
  `brand` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`pid`, `productcode`, `productname`, `unit`, `sellprice`, `brand`) VALUES
(1, 'PROD-1', 'Cabai', 'Dus', 80000, 'Cabaiku'),
(2, 'PROD-2', 'Kopi Bubuk', 'Karung', 500000, 'Kopiku'),
(3, 'PROD-3', 'Mie Instasn', 'Dus', 100000, 'Mie Gagap'),
(4, 'PROD-4', 'Tepung Terigu', 'Sak', 200000, 'Tepungku'),
(5, 'PROD-5', 'Gula Pasir', 'Dus', 650000, 'Gulaku'),
(6, 'PROD-6', 'Minyak Goreng', 'Dus', 180000, 'Bimoli'),
(7, 'PROD-7', 'Garam', 'Dus', 70000, 'Garamku');

-- --------------------------------------------------------

--
-- Table structure for table `staff`
--

CREATE TABLE `staff` (
  `staffcode` varchar(10) NOT NULL,
  `fullname` varchar(100) NOT NULL,
  `phone` varchar(15) NOT NULL,
  `role` enum('Staff Gudang','Staff Kurir') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `staff`
--

INSERT INTO `staff` (`staffcode`, `fullname`, `phone`, `role`) VALUES
('STF-1', 'Hendra ', '08218234', 'Staff Gudang'),
('STF-2', 'Ardi ', '082394892', 'Staff Gudang'),
('STF-3', 'Agus ', '08223468', 'Staff Gudang'),
('STF-4', 'Beni ', '0870824', 'Staff Kurir'),
('STF-5', 'Lukman ', '087983852', 'Staff Kurir'),
('STF-6', 'Remi ', '087982461', 'Staff Kurir');

-- --------------------------------------------------------

--
-- Table structure for table `suppliers`
--

CREATE TABLE `suppliers` (
  `sid` int(11) NOT NULL,
  `suppliercode` varchar(45) NOT NULL,
  `fullname` varchar(45) NOT NULL,
  `location` varchar(45) NOT NULL,
  `mobile` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `suppliers`
--

INSERT INTO `suppliers` (`sid`, `suppliercode`, `fullname`, `location`, `mobile`) VALUES
(1, 'SUP-1', 'Distributor Beras Nusantara', 'Jakarta', '021123456'),
(2, 'SUP-2', 'Distributor Tepung Terigu', 'Surabaya', '031123456'),
(3, 'SUP-3', 'Distributor Bumbu Dapur', 'Yogyakarta', '0274123456'),
(4, 'SUP-4', 'PT Pangan Jaya', 'Jakarta', '02199567'),
(5, 'SUP-5', 'Sumber Minyak Sentosa', 'Surabaya', '03199887'),
(6, 'SUP-6', 'Gula Makmur Perkasa', 'Medan', '06199877');

-- --------------------------------------------------------

--
-- Table structure for table `transaction_in`
--

CREATE TABLE `transaction_in` (
  `purchaseID` int(11) NOT NULL,
  `suppliercode` varchar(45) NOT NULL,
  `productcode` varchar(45) NOT NULL,
  `date` varchar(45) NOT NULL,
  `quantity` int(11) NOT NULL,
  `totalcost` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `transaction_in`
--

INSERT INTO `transaction_in` (`purchaseID`, `suppliercode`, `productcode`, `date`, `quantity`, `totalcost`) VALUES
(1, 'SUP-4', 'PROD-1', 'Tue Dec 17 12:49:41 WIB 2024', 100, 7800000),
(2, 'SUP-4', 'PROD-2', 'Tue Dec 17 12:49:41 WIB 2024', 100, 49000000),
(3, 'SUP-4', 'PROD-3', 'Tue Dec 17 12:49:41 WIB 2024', 100, 9800000),
(4, 'SUP-4', 'PROD-4', 'Tue Dec 17 12:49:41 WIB 2024', 100, 19800000),
(5, 'SUP-4', 'PROD-5', 'Tue Dec 17 12:49:41 WIB 2024', 100, 63800000),
(6, 'SUP-4', 'PROD-6', 'Tue Dec 17 12:49:41 WIB 2024', 100, 17500000),
(7, 'SUP-4', 'PROD-7', 'Thu Dec 12 00:00:00 WIB 2024', 100, 6500000);

-- --------------------------------------------------------

--
-- Table structure for table `transaction_out`
--

CREATE TABLE `transaction_out` (
  `salesid` int(11) NOT NULL,
  `date` varchar(45) NOT NULL,
  `productcode` varchar(45) NOT NULL,
  `customercode` varchar(45) NOT NULL,
  `quantity` int(11) NOT NULL,
  `revenue` double NOT NULL,
  `soldby` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `transaction_out`
--

INSERT INTO `transaction_out` (`salesid`, `date`, `productcode`, `customercode`, `quantity`, `revenue`, `soldby`) VALUES
(1, '2024-12-27', 'PROD-1', 'CUS-1', 10, 800000, 'Beni '),
(2, '2024-12-27', 'PROD-2', 'CUS-1', 5, 2500000, 'Beni '),
(3, '2024-12-27', 'PROD-3', 'CUS-2', 8, 800000, 'Beni '),
(4, '2024-12-27', 'PROD-4', 'CUS-3', 3, 600000, 'Beni '),
(5, '2024-12-27', 'PROD-5', 'CUS-4', 7, 4550000, 'Beni '),
(6, '2024-12-27', 'PROD-6', 'CUS-5', 12, 2160000, 'Beni '),
(7, '2024-12-27', 'PROD-7', 'CUS-1', 15, 1050000, 'Beni '),
(8, '2024-12-27', 'PROD-1', 'CUS-2', 9, 720000, 'Beni '),
(9, '2024-12-27', 'PROD-2', 'CUS-3', 4, 2000000, 'Beni '),
(10, '2024-12-27', 'PROD-3', 'CUS-4', 10, 1000000, 'Beni '),
(11, '2024-12-27', 'PROD-4', 'CUS-5', 5, 1000000, 'Beni '),
(12, '2024-12-27', 'PROD-5', 'CUS-1', 6, 3900000, 'Beni '),
(13, '2024-12-27', 'PROD-6', 'CUS-2', 11, 1980000, 'Beni '),
(14, '2024-12-27', 'PROD-7', 'CUS-3', 14, 980000, 'Beni '),
(15, '2024-12-27', 'PROD-1', 'CUS-4', 12, 960000, 'Beni '),
(16, '2024-12-27', 'PROD-2', 'CUS-5', 6, 3000000, 'Lukman '),
(17, '2024-12-27', 'PROD-3', 'CUS-1', 7, 700000, 'Lukman '),
(18, '2024-12-27', 'PROD-4', 'CUS-2', 4, 800000, 'Lukman '),
(19, '2024-12-27', 'PROD-5', 'CUS-3', 9, 5850000, 'Lukman '),
(20, '2024-12-27', 'PROD-6', 'CUS-4', 10, 1800000, 'Lukman '),
(21, '2024-12-27', 'PROD-7', 'CUS-5', 16, 1120000, 'Lukman '),
(22, '2024-12-27', 'PROD-1', 'CUS-1', 11, 880000, 'Lukman '),
(23, '2024-12-27', 'PROD-2', 'CUS-2', 7, 3500000, 'Lukman '),
(24, '2024-12-27', 'PROD-3', 'CUS-3', 9, 900000, 'Lukman '),
(25, '2024-12-27', 'PROD-4', 'CUS-4', 2, 400000, 'Lukman '),
(26, '2024-12-27', 'PROD-5', 'CUS-1', 8, 5200000, 'Remi '),
(27, '2024-12-27', 'PROD-6', 'CUS-2', 13, 2340000, 'Remi '),
(28, '2024-12-27', 'PROD-7', 'CUS-3', 17, 1190000, 'Remi '),
(29, '2024-12-27', 'PROD-1', 'CUS-4', 14, 1120000, 'Remi '),
(30, '2024-12-27', 'PROD-2', 'CUS-5', 8, 4000000, 'Remi ');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `name` varchar(45) NOT NULL,
  `location` varchar(45) NOT NULL,
  `phone` varchar(10) NOT NULL,
  `username` varchar(20) NOT NULL,
  `password` varchar(200) NOT NULL,
  `usertype` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `location`, `phone`, `username`, `password`, `usertype`) VALUES
(1, 'tama', 'malang', '0928373927', 'tama', 'tama', 'ADMINISTRATOR'),
(2, 'aaron', 'malang', '092832341', 'aaron', 'aaron', 'ADMINISTRATOR'),
(3, 'leonel', 'malang', '08234234', 'leonel', 'leonel', 'ADMINISTRATOR'),
(4, 'Hendra ', 'malang', '08218234', 'hendra', 'hendra', 'STAFF'),
(5, 'Ardi ', 'malang', '082394892', 'ardi', 'hendra', 'STAFF'),
(6, 'Agus ', 'malang', '08223468', 'agus', 'hendra', 'STAFF'),
(7, 'Remi ', 'malang', '087982461', 'remi', 'remi', 'STAFF'),
(8, 'Lukman', 'Malang', '087983852 ', 'lukman', 'lukman', 'STAFF'),
(9, 'Beni ', 'malang', '0870824', 'beni', 'beni', 'STAFF');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `currentstock`
--
ALTER TABLE `currentstock`
  ADD PRIMARY KEY (`productcode`);

--
-- Indexes for table `customers`
--
ALTER TABLE `customers`
  ADD PRIMARY KEY (`cid`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`order_id`),
  ADD KEY `customer_id` (`cid`),
  ADD KEY `product_id` (`pid`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`pid`),
  ADD UNIQUE KEY `productcode_UNIQUE` (`productcode`);

--
-- Indexes for table `staff`
--
ALTER TABLE `staff`
  ADD PRIMARY KEY (`staffcode`);

--
-- Indexes for table `suppliers`
--
ALTER TABLE `suppliers`
  ADD PRIMARY KEY (`sid`);

--
-- Indexes for table `transaction_in`
--
ALTER TABLE `transaction_in`
  ADD PRIMARY KEY (`purchaseID`);

--
-- Indexes for table `transaction_out`
--
ALTER TABLE `transaction_out`
  ADD PRIMARY KEY (`salesid`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `customers`
--
ALTER TABLE `customers`
  MODIFY `cid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `order_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=41;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `pid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `suppliers`
--
ALTER TABLE `suppliers`
  MODIFY `sid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `transaction_in`
--
ALTER TABLE `transaction_in`
  MODIFY `purchaseID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `transaction_out`
--
ALTER TABLE `transaction_out`
  MODIFY `salesid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=62;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

CREATE VIEW `view_product_sales_summary` AS
SELECT 
    p.productcode,
    p.productname,
    p.brand,
    IFNULL(SUM(t_out.quantity), 0) AS total_quantity_sold,
    IFNULL(SUM(t_out.revenue), 0.00) AS total_revenue,
    IFNULL(cs.quantity, 0) AS current_stock
FROM 
    `products` p
LEFT JOIN 
    `transaction_out` t_out ON p.productcode = t_out.productcode
LEFT JOIN
    `currentstock` cs ON p.productcode = cs.productcode
GROUP BY
    p.productcode, p.productname, p.brand, cs.quantity;

DELIMITER //

CREATE PROCEDURE `sp_AddNewProduct` (
    IN p_productcode VARCHAR(45),
    IN p_productname VARCHAR(45),
    IN p_unit VARCHAR(45),
    IN p_sellprice DOUBLE,
    IN p_brand VARCHAR(45),
    IN p_initial_quantity INT
)
BEGIN
    START TRANSACTION;
    IF EXISTS (SELECT 1 FROM `products` WHERE `productcode` = p_productcode) THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Error: Product code already exists.';
    ELSE
        INSERT INTO `products` (`productcode`, `productname`, `unit`, `sellprice`, `brand`)
        VALUES (p_productcode, p_productname, p_unit, p_sellprice, p_brand);
        INSERT INTO `currentstock` (`productcode`, `quantity`)
        VALUES (p_productcode, IFNULL(p_initial_quantity, 0));
    END IF;
    COMMIT;
END //

DELIMITER //

CREATE PROCEDURE `sp_AddNewUser` (
    IN p_name VARCHAR(45),
    IN p_location VARCHAR(45),
    IN p_phone VARCHAR(10),
    IN p_username VARCHAR(20),
    IN p_password VARCHAR(200),
    IN p_usertype VARCHAR(45)
)
BEGIN
    START TRANSACTION;
    IF EXISTS (SELECT 1 FROM `users` WHERE `username` = p_username) THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Error: Username already exists.';
    ELSE
        INSERT INTO `users` (`name`, `location`, `phone`, `username`, `password`, `usertype`)
        VALUES (p_name, p_location, p_phone, p_username, p_password, p_usertype);
    END IF;
    COMMIT;
END //

DELIMITER ;

CALL sp_AddNewProduct('PROD-8', 'Beras Premium', 'Karung', 120000, 'Berasku', 50);
CALL sp_AddNewProduct('PROD-9', 'Minuman Energi', 'Dus', 50000, 'EnergiMax', 0);
CALL sp_AddNewProduct('PROD-10', 'Teh Botol', 'Botol', 30000, 'Tehku', NULL);

CALL sp_AddNewUser('Alice Johnson', 'Surabaya', '0834567890', 'alicej', 'hashed_pw_alice', 'ADMINISTRATOR');
CALL sp_AddNewUser('Bob Williams', 'Medan', '0845678901', 'bobw', 'hashed_pw_bob', 'STAFF');
CALL sp_AddNewUser('Charlie Brown', 'Makassar', '0856789012', 'alicej', 'hashed_pw_charlie', 'STAFF');
