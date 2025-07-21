

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `godashop_k89`
--

-- --------------------------------------------------------

--
-- Table structure for table `action`
--

CREATE TABLE `action` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `description` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `action`
--



-- --------------------------------------------------------

--
-- Table structure for table `brand`
--

CREATE TABLE `brand` (
  `id` int(11) NOT NULL,
  `name` varchar(200) NOT NULL,
  `brand_image` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `brand`
--



-- --------------------------------------------------------

--
-- Table structure for table `category`
--

CREATE TABLE `category` (
  `id` int(11) NOT NULL,
  `name` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `category`
--

-- --------------------------------------------------------

--
-- Table structure for table `comment`
--

CREATE TABLE `comment` (
  `id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `email` varchar(100) NOT NULL,
  `fullname` varchar(100) NOT NULL,
  `star` float NOT NULL,
  `created_date` datetime NOT NULL,
  `description` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `comment`
--

-- --------------------------------------------------------

--
-- Table structure for table `customer`
--

CREATE TABLE `customer` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `password` varchar(61) NOT NULL,
  `mobile` varchar(15) NOT NULL,
  `email` varchar(100) NOT NULL,
  `login_by` varchar(20) NOT NULL,
  `ward_id` varchar(5) DEFAULT NULL,
  `shipping_name` varchar(200) NOT NULL,
  `shipping_mobile` varchar(15) NOT NULL,
  `housenumber_street` varchar(200) DEFAULT NULL,
  `is_active` tinyint(4) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `customer`
--


-- --------------------------------------------------------

--
-- Table structure for table `district`
--

CREATE TABLE `district` (
  `id` varchar(5) NOT NULL,
  `name` varchar(100) NOT NULL,
  `type` varchar(30) NOT NULL,
  `province_id` varchar(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `district`
--


-- --------------------------------------------------------

--
-- Table structure for table `image_item`
--

CREATE TABLE `image_item` (
  `id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `image_item`
--



-- --------------------------------------------------------

--
-- Table structure for table `newsletter`
--

CREATE TABLE `newsletter` (
  `email` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `newsletter`
--


-- --------------------------------------------------------

--
-- Table structure for table `order`
--

CREATE TABLE `order` (
  `id` int(11) NOT NULL,
  `created_date` datetime NOT NULL,
  `order_status_id` int(2) NOT NULL,
  `staff_id` int(10) DEFAULT NULL,
  `customer_id` int(10) NOT NULL,
  `shipping_fullname` varchar(100) NOT NULL,
  `shipping_mobile` varchar(15) NOT NULL,
  `payment_method` tinyint(4) NOT NULL DEFAULT 0 COMMENT '0:COD, 1: bank',
  `shipping_ward_id` varchar(5) DEFAULT NULL,
  `shipping_housenumber_street` varchar(200) NOT NULL,
  `shipping_fee` int(11) DEFAULT 0,
  `delivered_date` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `order`
--


-- --------------------------------------------------------

--
-- Table structure for table `order_item`
--

CREATE TABLE `order_item` (
  `product_id` int(10) NOT NULL,
  `order_id` int(10) NOT NULL,
  `qty` int(4) NOT NULL,
  `unit_price` int(11) NOT NULL,
  `total_price` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `order_item`
--



-- --------------------------------------------------------

--
-- Table structure for table `product`
--

CREATE TABLE `product` (
  `id` int(11) NOT NULL,
  `barcode` varchar(13) NOT NULL,
  `sku` varchar(20) NOT NULL,
  `name` varchar(300) NOT NULL,
  `price` int(11) NOT NULL,
  `discount_percentage` int(11) NOT NULL,
  `discount_from_date` date NOT NULL,
  `discount_to_date` date NOT NULL,
  `featured_image` varchar(100) NOT NULL,
  `inventory_qty` int(11) NOT NULL,
  `category_id` int(11) NOT NULL,
  `brand_id` int(11) DEFAULT NULL,
  `created_date` datetime NOT NULL,
  `description` text NOT NULL,
  `star` float DEFAULT NULL,
  `featured` tinyint(1) DEFAULT NULL COMMENT '1: nổi bật'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `product`
--



-- --------------------------------------------------------

--
-- Table structure for table `province`
--

CREATE TABLE `province` (
  `id` varchar(5) NOT NULL,
  `name` varchar(100) NOT NULL,
  `type` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci ROW_FORMAT=COMPACT;

--
-- Dumping data for table `province`
--


-- --------------------------------------------------------

--
-- Table structure for table `role`
--

CREATE TABLE `role` (
  `id` int(3) NOT NULL,
  `name` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `role`
--



-- --------------------------------------------------------

--
-- Table structure for table `role_action`
--

CREATE TABLE `role_action` (
  `role_id` int(11) NOT NULL,
  `action_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `role_action`
--



-- --------------------------------------------------------

--
-- Table structure for table `staff`
--

CREATE TABLE `staff` (
  `id` int(11) NOT NULL,
  `role_id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `mobile` varchar(15) NOT NULL,
  `username` varchar(100) NOT NULL,
  `password` varchar(61) NOT NULL,
  `email` varchar(100) NOT NULL,
  `is_active` tinyint(4) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `staff`
--

-- --------------------------------------------------------

--
-- Table structure for table `status`
--

CREATE TABLE `status` (
  `id` int(2) NOT NULL,
  `name` varchar(50) NOT NULL,
  `description` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `status`
--


-- --------------------------------------------------------

--
-- Table structure for table `transport`
--

CREATE TABLE `transport` (
  `id` int(10) NOT NULL,
  `province_id` varchar(5) DEFAULT NULL,
  `price` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `transport`
--


-- --------------------------------------------------------

--
-- Table structure for table `ward`
--

CREATE TABLE `ward` (
  `id` varchar(5) NOT NULL,
  `name` varchar(100) NOT NULL,
  `type` varchar(30) NOT NULL,
  `district_id` varchar(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `ward`
--


-- --------------------------------------------------------

--
-- Structure for view `view_product`
--
DROP TABLE IF EXISTS `view_product`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `view_product`  AS SELECT `product`.`id` AS `id`, `product`.`barcode` AS `barcode`, `product`.`sku` AS `sku`, `product`.`name` AS `name`, `product`.`price` AS `price`, `product`.`discount_percentage` AS `discount_percentage`, `product`.`discount_from_date` AS `discount_from_date`, `product`.`discount_to_date` AS `discount_to_date`, `product`.`featured_image` AS `featured_image`, `product`.`inventory_qty` AS `inventory_qty`, `product`.`category_id` AS `category_id`, `product`.`brand_id` AS `brand_id`, `product`.`created_date` AS `created_date`, `product`.`description` AS `description`, `product`.`star` AS `star`, `product`.`featured` AS `featured`, round(if(`product`.`discount_percentage` is null or `product`.`discount_from_date` > curdate() or `product`.`discount_to_date` < curdate(),`product`.`price`,`product`.`price` * (1 - `product`.`discount_percentage` / 100)),-3) AS `sale_price` FROM `product` ;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `action`
--
ALTER TABLE `action`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `brand`
--
ALTER TABLE `brand`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `comment`
--
ALTER TABLE `comment`
  ADD PRIMARY KEY (`id`) USING BTREE,
  ADD KEY `product_id` (`product_id`);

--
-- Indexes for table `customer`
--
ALTER TABLE `customer`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`),
  ADD KEY `ward_id` (`ward_id`);

--
-- Indexes for table `district`
--
ALTER TABLE `district`
  ADD PRIMARY KEY (`id`),
  ADD KEY `province_id` (`province_id`);

--
-- Indexes for table `image_item`
--
ALTER TABLE `image_item`
  ADD PRIMARY KEY (`id`),
  ADD KEY `product_id` (`product_id`);

--
-- Indexes for table `newsletter`
--
ALTER TABLE `newsletter`
  ADD PRIMARY KEY (`email`);

--
-- Indexes for table `order`
--
ALTER TABLE `order`
  ADD PRIMARY KEY (`id`),
  ADD KEY `order_order_status_fk_1` (`order_status_id`),
  ADD KEY `order_staff_fk_1` (`staff_id`),
  ADD KEY `order_customer_fk_1` (`customer_id`),
  ADD KEY `shipping_ward` (`shipping_ward_id`);

--
-- Indexes for table `order_item`
--
ALTER TABLE `order_item`
  ADD PRIMARY KEY (`product_id`,`order_id`),
  ADD KEY `order_item_product_fk_1` (`product_id`) USING BTREE,
  ADD KEY `order_item_order_fk_1` (`order_id`) USING BTREE;

--
-- Indexes for table `product`
--
ALTER TABLE `product`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `barcode` (`barcode`),
  ADD KEY `product_category_fk_1` (`category_id`),
  ADD KEY `brand_id` (`brand_id`);

--
-- Indexes for table `province`
--
ALTER TABLE `province`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `role`
--
ALTER TABLE `role`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `role_action`
--
ALTER TABLE `role_action`
  ADD PRIMARY KEY (`role_id`,`action_id`),
  ADD KEY `role_action_role_fk_1` (`role_id`),
  ADD KEY `role_action_action_fk_1` (`action_id`);

--
-- Indexes for table `staff`
--
ALTER TABLE `staff`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`,`email`),
  ADD UNIQUE KEY `email` (`email`),
  ADD UNIQUE KEY `username_2` (`username`),
  ADD KEY `staff_role_fk_1` (`role_id`);

--
-- Indexes for table `status`
--
ALTER TABLE `status`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `transport`
--
ALTER TABLE `transport`
  ADD PRIMARY KEY (`id`),
  ADD KEY `transport_province_id` (`province_id`);

--
-- Indexes for table `ward`
--
ALTER TABLE `ward`
  ADD PRIMARY KEY (`id`),
  ADD KEY `district_id` (`district_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `action`
--
ALTER TABLE `action`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=51;

--
-- AUTO_INCREMENT for table `brand`
--
ALTER TABLE `brand`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `category`
--
ALTER TABLE `category`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT for table `comment`
--
ALTER TABLE `comment`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=77;

--
-- AUTO_INCREMENT for table `customer`
--
ALTER TABLE `customer`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=108;

--
-- AUTO_INCREMENT for table `image_item`
--
ALTER TABLE `image_item`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `order`
--
ALTER TABLE `order`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- AUTO_INCREMENT for table `product`
--
ALTER TABLE `product`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=33;

--
-- AUTO_INCREMENT for table `role`
--
ALTER TABLE `role`
  MODIFY `id` int(3) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `staff`
--
ALTER TABLE `staff`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `status`
--
ALTER TABLE `status`
  MODIFY `id` int(2) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `transport`
--
ALTER TABLE `transport`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=64;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `comment`
--
ALTER TABLE `comment`
  ADD CONSTRAINT `comment_ibfk_1` FOREIGN KEY (`product_id`) REFERENCES `product` (`id`);

--
-- Constraints for table `customer`
--
ALTER TABLE `customer`
  ADD CONSTRAINT `customer_ibfk_1` FOREIGN KEY (`ward_id`) REFERENCES `ward` (`id`);

--
-- Constraints for table `district`
--
ALTER TABLE `district`
  ADD CONSTRAINT `district_ibfk_1` FOREIGN KEY (`province_id`) REFERENCES `province` (`id`);

--
-- Constraints for table `image_item`
--
ALTER TABLE `image_item`
  ADD CONSTRAINT `image_item_ibfk_1` FOREIGN KEY (`product_id`) REFERENCES `product` (`id`);

--
-- Constraints for table `order`
--
ALTER TABLE `order`
  ADD CONSTRAINT `order_customer_fk_1` FOREIGN KEY (`customer_id`) REFERENCES `customer` (`id`),
  ADD CONSTRAINT `order_ibfk_1` FOREIGN KEY (`shipping_ward_id`) REFERENCES `ward` (`id`),
  ADD CONSTRAINT `order_order_status_fk_1` FOREIGN KEY (`order_status_id`) REFERENCES `status` (`id`),
  ADD CONSTRAINT `order_staff_fk_1` FOREIGN KEY (`staff_id`) REFERENCES `staff` (`id`);

--
-- Constraints for table `order_item`
--
ALTER TABLE `order_item`
  ADD CONSTRAINT `order_detail_order_fk_1` FOREIGN KEY (`order_id`) REFERENCES `order` (`id`),
  ADD CONSTRAINT `order_detail_product_fk_1` FOREIGN KEY (`product_id`) REFERENCES `product` (`id`);

--
-- Constraints for table `product`
--
ALTER TABLE `product`
  ADD CONSTRAINT `product_category_fk_1` FOREIGN KEY (`category_id`) REFERENCES `category` (`id`),
  ADD CONSTRAINT `product_ibfk_1` FOREIGN KEY (`brand_id`) REFERENCES `brand` (`id`);

--
-- Constraints for table `role_action`
--
ALTER TABLE `role_action`
  ADD CONSTRAINT `role_action_action_fk_1` FOREIGN KEY (`action_id`) REFERENCES `action` (`id`),
  ADD CONSTRAINT `role_action_role_fk_1` FOREIGN KEY (`role_id`) REFERENCES `role` (`id`);

--
-- Constraints for table `staff`
--
ALTER TABLE `staff`
  ADD CONSTRAINT `staff_role_fk_1` FOREIGN KEY (`role_id`) REFERENCES `role` (`id`);

--
-- Constraints for table `transport`
--
ALTER TABLE `transport`
  ADD CONSTRAINT `transport_fk_1` FOREIGN KEY (`province_id`) REFERENCES `province` (`id`);

--
-- Constraints for table `ward`
--
ALTER TABLE `ward`
  ADD CONSTRAINT `ward_ibfk_1` FOREIGN KEY (`district_id`) REFERENCES `district` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
