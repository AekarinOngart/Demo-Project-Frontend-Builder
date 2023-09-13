-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Sep 13, 2023 at 09:31 PM
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
-- Database: `keychrondb`
--

-- --------------------------------------------------------

--
-- Table structure for table `product_k`
--

CREATE TABLE `product_k` (
  `product_id` int(11) NOT NULL,
  `product_name` varchar(255) DEFAULT NULL,
  `product_price` decimal(10,2) DEFAULT NULL,
  `product_quantity` int(10) DEFAULT NULL,
  `product_image` varchar(255) DEFAULT 'https://cdn.shopify.com/s/files/1/0328/6034/0364/products/1200x1200_K2-Dark-Grey-Blue_2048x.jpg'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `product_k`
--

INSERT INTO `product_k` (`product_id`, `product_name`, `product_price`, `product_quantity`, `product_image`) VALUES
(1, 'Keychron K2 Mechanical Keyboard แมคคานิคอลคีย์บอร์ดไร้สาย', 3890.00, 20, 'https://cdn.shopify.com/s/files/1/0328/6034/0364/products/1200x1200_K2-Dark-Grey-Blue_2048x.jpg'),
(2, 'Keychron K4 Mechanical Keyboard แมคคานิคอลคีย์บอร์ดไร้สาย', 4390.00, NULL, 'https://cdn.shopify.com/s/files/1/0328/6034/0364/products/1200x1200_K2-Dark-Grey-Blue_2048x.jpg'),
(3, 'Keychron K3 Mechanical Keyboard แมคคานิคอลคีย์บอร์ดไร้สาย', 3890.00, NULL, 'https://cdn.shopify.com/s/files/1/0328/6034/0364/products/1200x1200_K2-Dark-Grey-Blue_2048x.jpg'),
(4, 'Keychron K1 Mechanical Keyboard แมคคานิคอลคีย์บอร์ดไร้สาย (Version 5)', 4090.00, NULL, 'https://cdn.shopify.com/s/files/1/0328/6034/0364/products/1200x1200_K2-Dark-Grey-Blue_2048x.jpg'),
(5, 'Keychron K10 Mechanical Keyboard แมคคานิคอลคีย์บอร์ดไร้สาย', 4390.00, NULL, 'https://cdn.shopify.com/s/files/1/0328/6034/0364/products/1200x1200_K2-Dark-Grey-Blue_2048x.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `product_k_detail`
--

CREATE TABLE `product_k_detail` (
  `id` int(11) NOT NULL,
  `color` varchar(255) NOT NULL,
  `switch` varchar(255) NOT NULL,
  `language` enum('eng','thai') NOT NULL,
  `quantity` int(11) NOT NULL,
  `product_id` int(11) DEFAULT NULL,
  `image_1` varchar(255) DEFAULT NULL,
  `image_2` varchar(255) DEFAULT NULL,
  `image_3` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `product_k_detail`
--

INSERT INTO `product_k_detail` (`id`, `color`, `switch`, `language`, `quantity`, `product_id`, `image_1`, `image_2`, `image_3`) VALUES
(1, 'Dark Grey', 'Red', 'eng', 10, 1, NULL, NULL, NULL),
(2, 'Dark Grey', 'Red', 'thai', 10, 1, NULL, NULL, NULL);

--
-- Triggers `product_k_detail`
--
DELIMITER $$
CREATE TRIGGER `update_product_k_quantity` AFTER INSERT ON `product_k_detail` FOR EACH ROW BEGIN
    DECLARE total_quantity INT;

    -- คำนวณผลรวมของ quantity จาก product_k_detail สำหรับ product_id นี้
    SELECT SUM(quantity) INTO total_quantity
    FROM product_k_detail
    WHERE product_id = NEW.product_id;

    -- อัปเดตคอลัมน์ product_quantity ใน product_k
    UPDATE product_k
    SET product_quantity = total_quantity
    WHERE product_id = NEW.product_id;
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `product_k_pro`
--

CREATE TABLE `product_k_pro` (
  `product_id` int(11) NOT NULL,
  `product_name` varchar(255) DEFAULT NULL,
  `product_price` decimal(10,2) DEFAULT NULL,
  `product_quantity` int(11) DEFAULT NULL,
  `product_image` varchar(255) DEFAULT 'https://cdn.shopify.com/s/files/1/0328/6034/0364/products/K8-Pro-Black-A-Red_2048x.jpg'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `product_k_pro`
--

INSERT INTO `product_k_pro` (`product_id`, `product_name`, `product_price`, `product_quantity`, `product_image`) VALUES
(1, 'Keychron K8 Pro Mechanical Keyboard แมคคานิคอลคีย์บอร์ดไร้สาย (QMK/VIA)', 4590.00, 8, 'https://cdn.shopify.com/s/files/1/0328/6034/0364/products/K8-Pro-Black-A-Red_2048x.jpg'),
(2, 'Keychron K3 Pro Mechanical Keyboard แมคคานิคอลคีย์บอร์ดไร้สาย (QMK/VIA)', 4390.00, NULL, 'https://cdn.shopify.com/s/files/1/0328/6034/0364/products/K8-Pro-Black-A-Red_2048x.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `product_k_pro_detail`
--

CREATE TABLE `product_k_pro_detail` (
  `id` int(11) NOT NULL,
  `color` varchar(255) NOT NULL,
  `switch` varchar(255) NOT NULL,
  `language` enum('eng','thai') NOT NULL,
  `quantity` int(11) NOT NULL,
  `product_id` int(11) DEFAULT NULL,
  `image_1` varchar(255) DEFAULT NULL,
  `image_2` varchar(255) DEFAULT NULL,
  `image_3` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `product_k_pro_detail`
--

INSERT INTO `product_k_pro_detail` (`id`, `color`, `switch`, `language`, `quantity`, `product_id`, `image_1`, `image_2`, `image_3`) VALUES
(1, 'Dark grey', 'Red', 'eng', 2, 1, NULL, NULL, NULL),
(2, 'Light Grey', 'Blue', 'eng', 2, 1, NULL, NULL, NULL),
(3, 'Dark grey', 'Red', 'thai', 2, 1, NULL, NULL, NULL),
(4, 'Light Grey', 'Blue', 'thai', 2, 1, NULL, NULL, NULL);

--
-- Triggers `product_k_pro_detail`
--
DELIMITER $$
CREATE TRIGGER `update_product_k_pro_quantity` AFTER INSERT ON `product_k_pro_detail` FOR EACH ROW BEGIN
    DECLARE total_quantity INT;

    -- คำนวณผลรวมของ quantity จาก product_k_pro_detail สำหรับ product_id นี้
    SELECT SUM(quantity) INTO total_quantity
    FROM product_k_pro_detail
    WHERE product_id = NEW.product_id;

    -- อัปเดตคอลัมน์ product_quantity ใน product_k_pro
    UPDATE product_k_pro
    SET product_quantity = total_quantity
    WHERE product_id = NEW.product_id;
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `product_q`
--

CREATE TABLE `product_q` (
  `product_id` int(11) NOT NULL,
  `product_name` varchar(255) DEFAULT NULL,
  `product_price` decimal(10,2) DEFAULT NULL,
  `product_quantity` int(11) DEFAULT NULL,
  `product_image` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `product_q`
--

INSERT INTO `product_q` (`product_id`, `product_name`, `product_price`, `product_quantity`, `product_image`) VALUES
(1, 'Keychron Q2 Custom Mechanical Keyboard คัสต้อมแมคคานิคอลคีย์บอร์ด (QMK/VIA)', 6590.00, NULL, 'https://cdn.shopify.com/s/files/1/0328/6034/0364/products/Q2-Black-A-Red_2048x.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `product_q_detail`
--

CREATE TABLE `product_q_detail` (
  `id` int(11) NOT NULL,
  `color` varchar(255) NOT NULL,
  `switch` varchar(255) NOT NULL,
  `language` enum('eng','thai') NOT NULL,
  `quantity` int(11) NOT NULL,
  `product_id` int(11) DEFAULT NULL,
  `image_1` varchar(255) DEFAULT NULL,
  `image_2` varchar(255) DEFAULT NULL,
  `image_3` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Triggers `product_q_detail`
--
DELIMITER $$
CREATE TRIGGER `update_product_q_quantity` AFTER INSERT ON `product_q_detail` FOR EACH ROW BEGIN
    DECLARE total_quantity INT;

    -- คำนวณผลรวมของ quantity จาก product_q_detail สำหรับ product_id นี้
    SELECT SUM(quantity) INTO total_quantity
    FROM product_q_detail
    WHERE product_id = NEW.product_id;

    -- อัปเดตคอลัมน์ product_quantity ใน product_q
    UPDATE product_q
    SET product_quantity = total_quantity
    WHERE product_id = NEW.product_id;
END
$$
DELIMITER ;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `product_k`
--
ALTER TABLE `product_k`
  ADD PRIMARY KEY (`product_id`);

--
-- Indexes for table `product_k_detail`
--
ALTER TABLE `product_k_detail`
  ADD PRIMARY KEY (`id`),
  ADD KEY `product_id` (`product_id`);

--
-- Indexes for table `product_k_pro`
--
ALTER TABLE `product_k_pro`
  ADD PRIMARY KEY (`product_id`);

--
-- Indexes for table `product_k_pro_detail`
--
ALTER TABLE `product_k_pro_detail`
  ADD PRIMARY KEY (`id`),
  ADD KEY `product_id` (`product_id`);

--
-- Indexes for table `product_q`
--
ALTER TABLE `product_q`
  ADD PRIMARY KEY (`product_id`);

--
-- Indexes for table `product_q_detail`
--
ALTER TABLE `product_q_detail`
  ADD PRIMARY KEY (`id`),
  ADD KEY `product_id` (`product_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `product_k`
--
ALTER TABLE `product_k`
  MODIFY `product_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `product_k_detail`
--
ALTER TABLE `product_k_detail`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `product_k_pro`
--
ALTER TABLE `product_k_pro`
  MODIFY `product_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `product_k_pro_detail`
--
ALTER TABLE `product_k_pro_detail`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `product_q`
--
ALTER TABLE `product_q`
  MODIFY `product_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `product_q_detail`
--
ALTER TABLE `product_q_detail`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `product_k_detail`
--
ALTER TABLE `product_k_detail`
  ADD CONSTRAINT `product_k_detail_ibfk_1` FOREIGN KEY (`product_id`) REFERENCES `product_k` (`product_id`);

--
-- Constraints for table `product_k_pro_detail`
--
ALTER TABLE `product_k_pro_detail`
  ADD CONSTRAINT `product_k_pro_detail_ibfk_1` FOREIGN KEY (`product_id`) REFERENCES `product_k_pro` (`product_id`);

--
-- Constraints for table `product_q_detail`
--
ALTER TABLE `product_q_detail`
  ADD CONSTRAINT `product_q_detail_ibfk_1` FOREIGN KEY (`product_id`) REFERENCES `product_q` (`product_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
