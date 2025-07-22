-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jul 22, 2025 at 07:50 PM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.0.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `rental_management`
--

-- --------------------------------------------------------

--
-- Table structure for table `bank_detail`
--

CREATE TABLE `bank_detail` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `bank_name` varchar(255) NOT NULL,
  `account_name` varchar(255) NOT NULL,
  `account_number` varchar(255) NOT NULL,
  `phone_number` varchar(255) DEFAULT NULL,
  `branch` varchar(255) DEFAULT NULL,
  `status` varchar(255) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `bank_detail`
--

INSERT INTO `bank_detail` (`id`, `user_id`, `bank_name`, `account_name`, `account_number`, `phone_number`, `branch`, `status`, `created_at`, `updated_at`) VALUES
(1, 1, 'NIC ASIA', 'Kaman Admiun', '123123123123123', NULL, 'KTM', '1', '2025-07-13 12:38:48', '2025-07-13 12:38:48'),
(2, 5, 'NIC Asis Bank', 'Saugat Panday', '123123123897812', '9812312341', 'Thimi', '1', '2025-07-22 01:51:35', '2025-07-22 01:51:35'),
(3, 4, 'NIMB ACE', 'Swastab Aacharya', '100023490908123', '9834121415', 'Kapan', '1', '2025-07-22 01:56:06', '2025-07-22 01:56:06');

-- --------------------------------------------------------

--
-- Table structure for table `category`
--

CREATE TABLE `category` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `status` varchar(255) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `category`
--

INSERT INTO `category` (`id`, `name`, `status`, `created_at`, `updated_at`) VALUES
(1, 'Electronics', '1', '2025-03-11 10:51:08', '2025-03-11 10:51:08'),
(2, 'Home Decor', '1', '2025-03-11 10:51:16', '2025-03-11 10:51:16'),
(3, 'Extra', '1', '2025-03-11 10:51:20', '2025-03-11 10:51:20'),
(4, 'Apartments and Rooms', '1', '2025-07-22 01:59:01', '2025-07-22 01:59:01');

-- --------------------------------------------------------

--
-- Table structure for table `coupencodes`
--

CREATE TABLE `coupencodes` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `code` varchar(255) NOT NULL,
  `validfrom` varchar(255) NOT NULL,
  `validupto` varchar(255) NOT NULL,
  `discount` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2025_01_01_000000_create_users_table', 1),
(2, '2025_01_02_100000_create_password_resets_table', 1),
(3, '2025_01_03_141923_create_profile', 1),
(4, '2025_01_04_145527_create_bank_detail_table', 1),
(5, '2025_01_05_140316_create_category', 1),
(6, '2025_01_06_194346_create_products_table', 1),
(7, '2025_01_07_165458_create_orders_table', 1),
(8, '2025_01_08_064539_create_coupencodes_table', 1),
(9, '2025_01_08_113739_create_transactions_table', 1),
(10, '2025_01_08_145223_create_order_products_table', 1),
(11, '2025_01_09_162451_create_newsletter_table', 1),
(12, '2025_03_11_171901_update_p_status_updated_by_column_type', 2),
(13, '2025_07_14_164759_transaction_code', 3),
(14, '2025_07_14_165246_transaction_code', 4);

-- --------------------------------------------------------

--
-- Table structure for table `newsletter`
--

CREATE TABLE `newsletter` (
  `sno` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `Customer_Emailid` varchar(255) NOT NULL,
  `Delivery_Address` text NOT NULL,
  `Order_Details` text DEFAULT NULL,
  `Coupen_Code` varchar(255) DEFAULT NULL,
  `Amount` decimal(10,2) NOT NULL,
  `payment` decimal(10,2) NOT NULL,
  `deposite_Amount` decimal(10,2) DEFAULT NULL,
  `delivery_charge` decimal(10,2) DEFAULT NULL,
  `required_date` date DEFAULT NULL,
  `product_id` bigint(20) UNSIGNED NOT NULL,
  `paymentmode` varchar(255) NOT NULL,
  `payment_status` tinyint(4) NOT NULL DEFAULT 0,
  `start_date` date NOT NULL,
  `end_date` date NOT NULL,
  `Shipping_Status` varchar(255) NOT NULL DEFAULT 'pending',
  `Delivery_Status` varchar(255) NOT NULL DEFAULT 'pending',
  `Order_Cancel_Status` tinyint(4) NOT NULL DEFAULT 0,
  `Order_Cancelled_On` varchar(255) DEFAULT NULL,
  `p_status` varchar(255) DEFAULT NULL,
  `p_status_Updated_By` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`id`, `Customer_Emailid`, `Delivery_Address`, `Order_Details`, `Coupen_Code`, `Amount`, `payment`, `deposite_Amount`, `delivery_charge`, `required_date`, `product_id`, `paymentmode`, `payment_status`, `start_date`, `end_date`, `Shipping_Status`, `Delivery_Status`, `Order_Cancel_Status`, `Order_Cancelled_On`, `p_status`, `p_status_Updated_By`, `created_at`, `updated_at`) VALUES
(1, 'test@gmail.com', 'Test,Test<br>Test,Test,Nepal<br>,1231231231,1231231231', '<br>Product Name:Mobile Phone, Quantity: 2<br> Price:1500', NULL, 4150.00, 3550.00, 600.00, 100.00, '2025-03-12', 2, 'Online', 0, '2025-03-12', '2025-03-13', 'Shipped', '11-03-2025 10:51:22', 0, NULL, 'completed', 'commonkhadka@gmail.com', '2025-03-11 11:22:43', '2025-03-11 17:06:22'),
(2, 'test@gmail.com', 'Test,Test<br>Test,Test,Nepal<br>,1231231231,1231231231', '<br>Product Name:Mobile Phone, Quantity: 2<br> Price:1500', NULL, 4150.00, 3550.00, 600.00, 100.00, '2025-07-15', 2, 'COD', 0, '2025-07-15', '2025-07-16', 'Processing', 'pending', 0, NULL, 'pending', 'commonkhadka@gmail.com', '2025-07-13 12:45:07', '2025-07-13 12:47:58'),
(3, 'test2@gmail.com', 'test,test<br>test,test,Nepal<br>,1231231231,1231231231', '<br>Product Name:Basket, Quantity: 5<br> Price:10', NULL, 225.00, 215.00, 10.00, 100.00, '2025-07-14', 1, 'Online', 0, '2025-07-14', '2025-07-16', 'pending', 'pending', 0, NULL, NULL, NULL, '2025-07-14 09:54:29', '2025-07-14 09:54:29'),
(4, 'test2@gmail.com', 'test,test<br>test,test,Nepal<br>,1231231231,1231231231', '<br>Product Name:Basket, Quantity: 1<br> Price:10', NULL, 113.50, 111.50, 2.00, 100.00, '2025-07-14', 1, 'Online', 0, '2025-07-14', '2025-07-15', 'pending', 'pending', 0, NULL, NULL, NULL, '2025-07-14 10:46:33', '2025-07-14 10:46:33'),
(5, 'test2@gmail.com', 'test,test<br>test,test,Nepal<br>,1231231231,1231231231', '<br>Product Name:Basket, Quantity: 1<br> Price:10', NULL, 113.50, 111.50, 2.00, 100.00, '2025-07-14', 1, 'Online', 0, '2025-07-14', '2025-07-15', 'pending', 'pending', 0, NULL, NULL, NULL, '2025-07-14 10:51:13', '2025-07-14 10:51:13'),
(6, 'test2@gmail.com', 'test,test<br>test,test,Nepal<br>,1231231231,1231231231', '<br>Product Name:Basket, Quantity: 1<br> Price:10', NULL, 113.50, 111.50, 2.00, 100.00, '2025-07-14', 1, 'Online', 0, '2025-07-14', '2025-07-15', 'pending', 'pending', 0, NULL, NULL, NULL, '2025-07-14 10:53:03', '2025-07-14 10:53:03'),
(7, 'test2@gmail.com', 'test,test<br>test,test,Nepal<br>,1231231231,1231231231', '<br>Product Name:Basket, Quantity: 1<br> Price:10', NULL, 113.50, 111.50, 2.00, 100.00, '2025-07-14', 1, 'Online', 0, '2025-07-14', '2025-07-15', 'pending', 'pending', 0, NULL, NULL, NULL, '2025-07-14 11:06:15', '2025-07-14 11:06:15'),
(8, 'test2@gmail.com', 'test,test<br>test,test,Nepal<br>,1231231231,1231231231', '<br>Product Name:Basket, Quantity: 1<br> Price:10', NULL, 113.50, 111.50, 2.00, 100.00, '2025-07-14', 1, 'Online', 1, '2025-07-14', '2025-07-15', 'pending', 'pending', 0, NULL, 'completed', NULL, '2025-07-14 11:08:55', '2025-07-14 11:09:25'),
(9, 'test2@gmail.com', 'test,test<br>test,test,Nepal<br>,1231231231,1231231231', '<br>Product Name:Basket, Quantity: 1<br> Price:10', NULL, 113.50, 111.50, 2.00, 100.00, '2025-07-14', 1, 'Online', 0, '2025-07-14', '2025-07-15', 'pending', 'pending', 0, NULL, NULL, NULL, '2025-07-14 11:23:08', '2025-07-14 11:23:08'),
(10, 'test2@gmail.com', 'test,test<br>test,test,Nepal<br>,1231231231,1231231231', '<br>Product Name:Basket, Quantity: 1<br> Price:10', NULL, 297.50, 295.50, 2.00, 100.00, '2025-07-14', 1, 'Online', 0, '2025-07-14', '2025-07-31', 'pending', 'pending', 0, NULL, NULL, NULL, '2025-07-14 11:57:22', '2025-07-14 11:57:22'),
(11, 'test2@gmail.com', 'test,test<br>test,test,Nepal<br>,1231231231,1231231231', '<br>Product Name:Basket, Quantity: 1<br> Price:10', NULL, 297.50, 295.50, 2.00, 100.00, '2025-07-14', 1, 'Online', 0, '2025-07-14', '2025-07-31', 'pending', 'pending', 0, NULL, NULL, NULL, '2025-07-14 11:59:39', '2025-07-14 11:59:39'),
(12, 'test@gmail.com', 'Test,Test<br>Test,Test,Nepal<br>,1231231231,1231231231', '<br>Product Name:Mobile Phone, Quantity: 45<br> Price:1500', NULL, 91125.00, 77625.00, 13500.00, 0.00, '2025-07-18', 2, 'Online', 0, '2025-07-18', '2025-07-19', 'pending', 'pending', 0, NULL, NULL, NULL, '2025-07-18 12:08:48', '2025-07-18 12:08:48'),
(13, 'test@gmail.com', 'Test,Test<br>Test,Test,Nepal<br>,1231231231,1231231231', '<br>Product Name:Mobile Phone, Quantity: 1<br> Price:1500<br>Product Name:Anime Posters, Quantity: 10<br> Price:100', NULL, 8325.00, 7625.00, 700.00, 150.00, '2025-07-20', 3, 'Online', 0, '2025-07-20', '2025-07-25', 'Pending', 'pending', 0, NULL, 'Deposite-Refunded', 'commonkhadka@gmail.com', '2025-07-20 11:58:27', '2025-07-20 12:01:00'),
(14, 'acharya.swastab45@gmail.com', 'Budhanilkantha-12, Kapan, Kathamandu,<br>Kathmandu,Bagmati,Nepal<br>,9812356712,', '<br>Product Name:2 BHK flat, Quantity: 1<br> Price:500', NULL, 28325.00, 18325.00, 10000.00, 500.00, '2025-07-22', 5, 'Online', 0, '2025-07-22', '2025-08-22', 'pending', 'pending', 0, NULL, NULL, NULL, '2025-07-22 02:30:52', '2025-07-22 02:30:52'),
(15, 'napsap070@gmail.com', 'Kamerutar-5, Madyapur thimi, Bhaktapur,<br>Bhaktapur,Bagmati,Nepal<br>,9812314897,', '<br>Product Name:Mobile Phone, Quantity: 5<br> Price:1500', NULL, 70600.00, 69100.00, 1500.00, 100.00, '2025-07-23', 2, 'Online', 0, '2025-07-23', '2025-07-31', 'pending', 'pending', 0, NULL, NULL, NULL, '2025-07-22 06:07:07', '2025-07-22 06:07:07');

-- --------------------------------------------------------

--
-- Table structure for table `order_products`
--

CREATE TABLE `order_products` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `order_id` bigint(20) UNSIGNED NOT NULL,
  `product_id` bigint(20) UNSIGNED NOT NULL,
  `quantity` int(11) NOT NULL DEFAULT 1,
  `start_date` date DEFAULT NULL,
  `end_date` date DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `order_products`
--

INSERT INTO `order_products` (`id`, `order_id`, `product_id`, `quantity`, `start_date`, `end_date`, `created_at`, `updated_at`) VALUES
(1, 1, 2, 2, '2025-03-12', '2025-03-13', '2025-03-11 11:22:43', '2025-03-11 11:22:43'),
(2, 2, 2, 2, '2025-07-15', '2025-07-16', '2025-07-13 12:45:07', '2025-07-13 12:45:07'),
(3, 3, 1, 5, '2025-07-14', '2025-07-16', '2025-07-14 09:54:29', '2025-07-14 09:54:29'),
(4, 4, 1, 1, '2025-07-14', '2025-07-15', '2025-07-14 10:46:33', '2025-07-14 10:46:33'),
(5, 5, 1, 1, '2025-07-14', '2025-07-15', '2025-07-14 10:51:13', '2025-07-14 10:51:13'),
(6, 6, 1, 1, '2025-07-14', '2025-07-15', '2025-07-14 10:53:03', '2025-07-14 10:53:03'),
(7, 7, 1, 1, '2025-07-14', '2025-07-15', '2025-07-14 11:06:15', '2025-07-14 11:06:15'),
(8, 8, 1, 1, '2025-07-14', '2025-07-15', '2025-07-14 11:08:55', '2025-07-14 11:08:55'),
(9, 9, 1, 1, '2025-07-14', '2025-07-15', '2025-07-14 11:23:08', '2025-07-14 11:23:08'),
(10, 10, 1, 1, '2025-07-14', '2025-07-31', '2025-07-14 11:57:22', '2025-07-14 11:57:22'),
(11, 11, 1, 1, '2025-07-14', '2025-07-31', '2025-07-14 11:59:39', '2025-07-14 11:59:39'),
(12, 12, 2, 45, '2025-07-18', '2025-07-19', '2025-07-18 12:08:48', '2025-07-18 12:08:48'),
(13, 13, 2, 1, '2025-07-20', '2025-07-21', '2025-07-20 11:58:27', '2025-07-20 11:58:27'),
(14, 13, 3, 10, '2025-07-20', '2025-07-25', '2025-07-20 11:58:27', '2025-07-20 11:58:27'),
(15, 14, 5, 1, '2025-07-22', '2025-08-22', '2025-07-22 02:30:52', '2025-07-22 02:30:52'),
(16, 15, 2, 5, '2025-07-23', '2025-07-31', '2025-07-22 06:07:07', '2025-07-22 06:07:07');

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `priority` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `url` varchar(255) NOT NULL,
  `rating` int(11) DEFAULT NULL,
  `price` int(11) DEFAULT NULL,
  `discount` int(11) DEFAULT NULL,
  `image1` varchar(255) DEFAULT NULL,
  `image2` varchar(255) DEFAULT NULL,
  `image3` varchar(255) DEFAULT NULL,
  `image4` varchar(255) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `keywords` varchar(255) DEFAULT NULL,
  `meta_description` varchar(255) DEFAULT NULL,
  `status` varchar(255) NOT NULL DEFAULT '1',
  `cost` int(11) DEFAULT NULL,
  `payment_status` varchar(255) DEFAULT NULL,
  `featured` varchar(255) DEFAULT NULL,
  `owner_id` bigint(20) UNSIGNED DEFAULT NULL,
  `quantity` int(11) DEFAULT NULL,
  `delivery_charges` int(11) DEFAULT NULL,
  `additional_info` text DEFAULT NULL,
  `category_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `priority`, `name`, `description`, `url`, `rating`, `price`, `discount`, `image1`, `image2`, `image3`, `image4`, `title`, `keywords`, `meta_description`, `status`, `cost`, `payment_status`, `featured`, `owner_id`, `quantity`, `delivery_charges`, `additional_info`, `category_id`, `created_at`, `updated_at`) VALUES
(1, 1, 'Basket', 'This is very useful basket.', 'acf6b566-7d71-46b1-93d9-f163c4f59453', NULL, 10, NULL, 'acf6b566-7d71-46b1-93d9-f163c4f59453-1-.jpg', 'acf6b566-7d71-46b1-93d9-f163c4f59453-2-.jpg', NULL, NULL, NULL, NULL, NULL, '1', 10, NULL, '1', 2, 2, 100, '<b>This is extra large description.</b>', 2, '2025-03-11 10:52:16', '2025-07-22 12:03:02'),
(2, 1, 'Mobile Phone', 'This is mobile phone', '00bb2adc-23e7-4673-abc6-f97cc1670213', NULL, 1500, NULL, '00bb2adc-23e7-4673-abc6-f97cc1670213-1-.jpg', '00bb2adc-23e7-4673-abc6-f97cc1670213-2-.jpg', NULL, NULL, NULL, NULL, NULL, '1', 1500, NULL, '1', 3, 44, 100, '<div><b>This is Iphone</b></div>', 1, '2025-03-11 11:11:54', '2025-07-22 06:04:23'),
(3, 1, 'Anime Posters', 'Posters', '19f42d23-8039-439a-a876-1df2fc9830b7', NULL, 100, NULL, '19f42d23-8039-439a-a876-1df2fc9830b7-1-.jpg', '19f42d23-8039-439a-a876-1df2fc9830b7-2-.jpg', NULL, NULL, NULL, NULL, NULL, '1', 200, NULL, '1', 1, 120, 50, '<div><br></div>', 3, '2025-07-20 10:59:45', '2025-07-20 12:00:54'),
(4, 1, 'Beautiful Bungalow for Rent in Kapan', 'This is Beautiful Bungalow for Rent in Kapan', '44ad9a5e-25f6-4416-930c-e612cec48928', NULL, 1200, NULL, '44ad9a5e-25f6-4416-930c-e612cec48928-1-.jpg', '44ad9a5e-25f6-4416-930c-e612cec48928-2-.jpg', '44ad9a5e-25f6-4416-930c-e612cec48928-3-.jpg', '44ad9a5e-25f6-4416-930c-e612cec48928-4-.jpg', NULL, NULL, NULL, '1', 100000, NULL, '1', 4, 1, 100, '<div class=\"col-md-7 col-sm-7\" style=\"box-sizing: inherit; width: 425.825px; min-height: 1px; -webkit-box-flex: 0; flex-basis: 58.3333%; max-width: 58.3333%; color: rgb(41, 43, 44); font-family: -apple-system, BlinkMacSystemFont, &quot;Segoe UI&quot;, Roboto, &quot;Helvetica Neue&quot;, Arial, sans-serif;\"><div><span style=\"font-size: 1rem;\">Located in the peaceful and well-connected neighborhood of Bakhundol, Lalitpur, this beautiful bungalow offers a perfect blend of space, comfort, and privacy — ideal for residential living.</span></div><h3 data-start=\"344\" data-end=\"369\" style=\"box-sizing: inherit; font-family: inherit; line-height: 1.1; color: rgb(0, 0, 0); font-size: 22px; text-transform: uppercase;\"><span data-start=\"348\" data-end=\"369\" style=\"box-sizing: inherit; font-weight: bolder;\">Property Details:</span></h3><ul data-start=\"370\" data-end=\"611\" style=\"box-sizing: inherit; margin-top: 0px; margin-bottom: 1rem;\"><li data-start=\"370\" data-end=\"396\" style=\"box-sizing: inherit;\"><div><span data-start=\"372\" data-end=\"386\" style=\"box-sizing: inherit; font-weight: bolder;\">Land Area:</span>&nbsp;28 Aana</div></li><li data-start=\"397\" data-end=\"463\" style=\"box-sizing: inherit;\"><div><span data-start=\"399\" data-end=\"412\" style=\"box-sizing: inherit; font-weight: bolder;\">Bedrooms:</span>&nbsp;5 BHK (4 attached bathrooms + 1 common bathroom)</div></li><li data-start=\"464\" data-end=\"508\" style=\"box-sizing: inherit;\"><div><span data-start=\"466\" data-end=\"477\" style=\"box-sizing: inherit; font-weight: bolder;\">Garden:</span>&nbsp;Spacious private garden area</div></li><li data-start=\"509\" data-end=\"559\" style=\"box-sizing: inherit;\"><div><span data-start=\"511\" data-end=\"523\" style=\"box-sizing: inherit; font-weight: bolder;\">Parking:</span>&nbsp;Capacity for 2 cars and 4–5 bikes</div></li><li data-start=\"560\" data-end=\"611\" style=\"box-sizing: inherit;\"><div><span data-start=\"562\" data-end=\"570\" style=\"box-sizing: inherit; font-weight: bolder;\">Use:</span>&nbsp;Suitable for residential purposes only</div></li></ul><div>This charming property is perfect for families looking for a serene environment while staying close to essential amenities.</div></div><div class=\"col-md-5 col-sm-5\" style=\"box-sizing: inherit; width: 304.163px; min-height: 1px; -webkit-box-flex: 0; flex-basis: 41.6667%; max-width: 41.6667%; color: rgb(41, 43, 44); font-family: -apple-system, BlinkMacSystemFont, &quot;Segoe UI&quot;, Roboto, &quot;Helvetica Neue&quot;, Arial, sans-serif;\"><br><div class=\"property-price\" style=\"box-sizing: inherit;\"></div></div>', 4, '2025-07-22 02:02:31', '2025-07-22 11:56:23'),
(5, 1, '2 BHK flat', 'This 2 bhk flat on rent', '75789f1a-50eb-48ec-819f-a85a0b105ee7', NULL, 500, NULL, '75789f1a-50eb-48ec-819f-a85a0b105ee7-1-.jpg', '75789f1a-50eb-48ec-819f-a85a0b105ee7-2-.jpg', '75789f1a-50eb-48ec-819f-a85a0b105ee7-3-.jpg', '75789f1a-50eb-48ec-819f-a85a0b105ee7-4-.jpg', NULL, NULL, NULL, '1', 50000, NULL, '1', 5, 0, 500, '<div><div>&nbsp;Price : 18,000</div><div># 2BHK also available on Ground Floor</div><div># Furniture : Non Furnished</div><div># Type : Residential</div><div># Facing : North</div><div># Entrance : Separate</div><div># Located near Shikhar School<br></div><div># First Floor : 2 bedroom, 1 living room, 1 kitchen &amp; 1 bathroom</div><div># Public Transportation : 250 meter</div><div># Water : Available 24hrs (inar) (need to buy during dry season)<br></div><div># Land Size : 5 aana</div><div># Road Size : 18 ft pitched</div></div>', 4, '2025-07-22 02:06:29', '2025-07-22 02:28:40'),
(6, 1, 'Speaker Set', 'This is speaker/ sound system set.', '5f27561d-ea80-4b9e-8296-fbae8430f878', NULL, 800, NULL, '5f27561d-ea80-4b9e-8296-fbae8430f878-1-.jpg', '5f27561d-ea80-4b9e-8296-fbae8430f878-2-.jpg', '5f27561d-ea80-4b9e-8296-fbae8430f878-3-.jpg', NULL, NULL, NULL, NULL, '0', 5000, NULL, NULL, 5, 5, NULL, '<div>Sound system set perfect for event and funxctions</div>', 1, '2025-07-22 02:18:20', '2025-07-22 02:20:56'),
(7, 3, '2 BHK Flat -Kapan', 'This is flat for rent in kapan area', '0e899ecf-c5df-400e-8580-854c503ec362', NULL, 600, NULL, '0e899ecf-c5df-400e-8580-854c503ec362-1-.jpg', '0e899ecf-c5df-400e-8580-854c503ec362-2-.jpg', '0e899ecf-c5df-400e-8580-854c503ec362-3-.jpg', '0e899ecf-c5df-400e-8580-854c503ec362-4-.jpg', NULL, NULL, NULL, '0', 80000, NULL, NULL, 4, 2, NULL, '<div>24 hrs -<b>&nbsp;Water and electricity.</b></div><div>Parking space for bike only.</div>', 4, '2025-07-22 02:22:09', '2025-07-22 02:23:06');

-- --------------------------------------------------------

--
-- Table structure for table `profile`
--

CREATE TABLE `profile` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `first_name` varchar(255) NOT NULL,
  `last_name` varchar(255) NOT NULL,
  `country` varchar(255) DEFAULT NULL,
  `state` varchar(255) DEFAULT NULL,
  `district` varchar(255) DEFAULT NULL,
  `city` varchar(255) DEFAULT NULL,
  `address_1` varchar(255) DEFAULT NULL,
  `address_2` varchar(255) DEFAULT NULL,
  `mobile_1` varchar(255) NOT NULL,
  `mobile_2` varchar(255) DEFAULT NULL,
  `citizenship` varchar(255) DEFAULT NULL,
  `verified` varchar(255) NOT NULL DEFAULT '0',
  `status` varchar(255) NOT NULL DEFAULT '0',
  `pincode` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `profile`
--

INSERT INTO `profile` (`id`, `user_id`, `first_name`, `last_name`, `country`, `state`, `district`, `city`, `address_1`, `address_2`, `mobile_1`, `mobile_2`, `citizenship`, `verified`, `status`, `pincode`, `created_at`, `updated_at`) VALUES
(1, 2, 'Test', 'Test', 'Nepal', 'Test', 'Test', 'Test', 'Test', 'Test', '1231231231', '1231231231', '1741710785.jpg', '1', '0', '123123123', '2025-03-11 10:48:05', '2025-03-11 10:50:26'),
(2, 3, 'test', 'test', 'Nepal', 'test', 'test', 'test', 'test', 'test', '1231231231', '1231231231', '1741712152.jpg', '1', '0', '123123123', '2025-03-11 11:10:52', '2025-03-11 11:13:30'),
(3, 1, 'Kaman', 'khadka', 'Nepal', 'Koshi', 'Jhapa', 'Birtamode', 'Birtamode, Jhapa', NULL, '9824053197', NULL, '1752431000.jpg', '0', '0', '57204', '2025-07-13 12:38:20', '2025-07-13 12:38:20'),
(4, 5, 'Saugat', 'Panday', 'Nepal', 'Bagmati', 'Bhaktapur', 'Bhaktapur', 'Kamerutar-5, Madyapur thimi, Bhaktapur', NULL, '9812314897', NULL, '1753169712.jpg', '1', '0', '57222', '2025-07-22 01:50:12', '2025-07-22 01:52:50'),
(5, 4, 'Swastab', 'Aacharya', 'Nepal', 'Bagmati', 'Kathmandu', 'Kathmandu', 'Budhanilkantha-12, Kapan, Kathamandu', NULL, '9812356712', NULL, '1753170028.jpg', '1', '0', '67123', '2025-07-22 01:55:28', '2025-07-22 01:56:43');

-- --------------------------------------------------------

--
-- Table structure for table `transactions`
--

CREATE TABLE `transactions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `TXNID` varchar(255) NOT NULL,
  `Oder_No` int(11) NOT NULL,
  `email` varchar(255) NOT NULL,
  `amount` double(8,2) NOT NULL,
  `status` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `transaction_code` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `transactions`
--

INSERT INTO `transactions` (`id`, `TXNID`, `Oder_No`, `email`, `amount`, `status`, `created_at`, `updated_at`, `transaction_code`) VALUES
(1, 'dc430104-0dbe-49dd-b5fd-7bc34517efe4', 1, 'test@gmail.com', 4150.00, 'pending', '2025-03-11 11:22:43', '2025-03-11 11:22:43', NULL),
(2, '66dbb252-1fd3-4e18-8b03-f5699914fa93', 2, 'test@gmail.com', 4150.00, 'pending', '2025-07-13 12:45:08', '2025-07-13 12:45:08', NULL),
(3, '580f3b06-8602-46a9-b43b-268ba6f4c1af', 3, 'test2@gmail.com', 225.00, 'pending', '2025-07-14 09:54:30', '2025-07-14 09:54:30', NULL),
(4, '71e8f299-0d3b-4889-8d8b-1b19b9d4365d', 4, 'test2@gmail.com', 113.50, 'pending', '2025-07-14 10:46:33', '2025-07-14 10:46:33', NULL),
(5, '21d6b3c0-1999-4ade-a522-5dbcf767b9c9', 5, 'test2@gmail.com', 113.50, 'pending', '2025-07-14 10:51:13', '2025-07-14 10:51:13', NULL),
(6, '4f8f1b22-245f-4357-b024-59f49c90a5e6', 6, 'test2@gmail.com', 113.50, 'pending', '2025-07-14 10:53:03', '2025-07-14 10:53:03', NULL),
(7, '831995e8-deea-4d7c-be12-96cc8d40d181', 7, 'test2@gmail.com', 113.50, 'pending', '2025-07-14 11:06:15', '2025-07-14 11:06:15', NULL),
(8, 'c5745c5c-2af3-4fb4-b337-107a5bd3f62f', 8, 'test2@gmail.com', 113.50, 'payment_success', '2025-07-14 11:08:55', '2025-07-14 11:09:25', '000B84Z'),
(9, '4ea775b4-5b36-46d4-a77c-a9b6e4181df5', 9, 'test2@gmail.com', 113.50, 'pending', '2025-07-14 11:23:08', '2025-07-14 11:23:08', NULL),
(10, 'd172799a-abde-402f-afd9-40e73e26bf29', 10, 'test2@gmail.com', 297.50, 'pending', '2025-07-14 11:57:22', '2025-07-14 11:57:22', NULL),
(11, 'b37aaa41-f8ce-4653-8b6c-917ee4d2d8e7', 11, 'test2@gmail.com', 297.50, 'pending', '2025-07-14 11:59:40', '2025-07-14 11:59:40', NULL),
(12, '28dfb0f3-8723-462d-9537-d1a2e41ca2fe', 12, 'test@gmail.com', 91125.00, 'pending', '2025-07-18 12:08:49', '2025-07-18 12:08:49', NULL),
(13, '0f69f2c0-8831-4a35-9bf9-b8ff30231a1f', 13, 'test@gmail.com', 8325.00, 'pending', '2025-07-20 11:58:27', '2025-07-20 11:58:27', NULL),
(14, 'd48426d6-b2b9-4a16-971e-d69a3a21d483', 14, 'acharya.swastab45@gmail.com', 28325.00, 'pending', '2025-07-22 02:30:52', '2025-07-22 02:30:52', NULL),
(15, '3955fcdb-ff1f-4a23-8556-29f6bf13e98e', 15, 'napsap070@gmail.com', 70600.00, 'pending', '2025-07-22 06:07:07', '2025-07-22 06:07:07', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  `address1` varchar(255) DEFAULT NULL,
  `address2` varchar(255) DEFAULT NULL,
  `city` varchar(255) DEFAULT NULL,
  `pincode` varchar(255) DEFAULT NULL,
  `state` varchar(255) DEFAULT NULL,
  `country` varchar(255) DEFAULT NULL,
  `mnumber` varchar(255) DEFAULT NULL,
  `alternativemno` varchar(255) DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `role` varchar(255) NOT NULL DEFAULT 'user',
  `status` varchar(255) NOT NULL DEFAULT '1',
  `email_verified` tinyint(1) NOT NULL DEFAULT 0,
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `image`, `address1`, `address2`, `city`, `pincode`, `state`, `country`, `mnumber`, `alternativemno`, `password`, `role`, `status`, `email_verified`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'Admin Common', 'commonkhadka@gmail.com', '2025-03-07 04:36:55', '1741363655.jpg', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '$2y$10$/GaXHwyAuwCWWflevHJQ1eiR4Zf.sS2/MDEJdGX/3kijbrT2bNM62', 'admin', '1', 1, 'Xz0byFrLxQllawnxT7ZyYs3TUcbQlNY5b0GahfgNiJs1IssgJx1Pu6z24FRI', '2025-03-07 04:36:16', '2025-07-13 12:36:31'),
(2, 'test', 'test@gmail.com', '2025-03-11 10:49:00', '1741710799.jpg', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '$2y$10$ZUWIhcctv68Ff6QATz067OwrovcniqyMXBNd1YDeSSSdtBBh/txpq', 'user', '1', 1, NULL, '2025-03-11 10:47:07', '2025-03-11 10:49:00'),
(3, 'test 2', 'test2@gmail.com', '2025-03-11 11:11:11', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '$2y$10$1qYbEVW39MjnCzprr2eQ3uNGRCs/lgtMnbDiHZB9TOAIzqzu6Z8wC', 'user', '1', 1, NULL, '2025-03-11 10:53:45', '2025-03-11 11:11:11'),
(4, 'Swastab Aacharya', 'acharya.swastab45@gmail.com', '2025-07-22 01:47:53', '1753169934.jpg', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '$2y$10$pImmF5Pf3B16MDFXpqtZW.cbFtWwVHFdgn9ke0seOtmsTKcqL24XK', 'user', '1', 1, NULL, '2025-07-22 01:44:30', '2025-07-22 01:53:54'),
(5, 'Saugat Panday', 'napsap070@gmail.com', '2025-07-22 01:47:44', '1753169619.jpg', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '$2y$10$vgNvcKPknZjxWXwU1.dHkuKvaF9aY2pVgFxm4jx34K0iy6szBpnfq', 'user', '1', 1, NULL, '2025-07-22 01:46:41', '2025-07-22 01:48:39');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `bank_detail`
--
ALTER TABLE `bank_detail`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `bank_detail_account_number_unique` (`account_number`),
  ADD KEY `bank_detail_user_id_foreign` (`user_id`);

--
-- Indexes for table `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `coupencodes`
--
ALTER TABLE `coupencodes`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `newsletter`
--
ALTER TABLE `newsletter`
  ADD PRIMARY KEY (`sno`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`),
  ADD KEY `orders_product_id_foreign` (`product_id`);

--
-- Indexes for table `order_products`
--
ALTER TABLE `order_products`
  ADD PRIMARY KEY (`id`),
  ADD KEY `order_products_order_id_foreign` (`order_id`),
  ADD KEY `order_products_product_id_foreign` (`product_id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`),
  ADD KEY `products_category_id_foreign` (`category_id`);

--
-- Indexes for table `profile`
--
ALTER TABLE `profile`
  ADD PRIMARY KEY (`id`),
  ADD KEY `profile_user_id_foreign` (`user_id`);

--
-- Indexes for table `transactions`
--
ALTER TABLE `transactions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `bank_detail`
--
ALTER TABLE `bank_detail`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `category`
--
ALTER TABLE `category`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `coupencodes`
--
ALTER TABLE `coupencodes`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `newsletter`
--
ALTER TABLE `newsletter`
  MODIFY `sno` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `order_products`
--
ALTER TABLE `order_products`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `profile`
--
ALTER TABLE `profile`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `transactions`
--
ALTER TABLE `transactions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `bank_detail`
--
ALTER TABLE `bank_detail`
  ADD CONSTRAINT `bank_detail_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `orders_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `order_products`
--
ALTER TABLE `order_products`
  ADD CONSTRAINT `order_products_order_id_foreign` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `order_products_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `products`
--
ALTER TABLE `products`
  ADD CONSTRAINT `products_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `category` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `profile`
--
ALTER TABLE `profile`
  ADD CONSTRAINT `profile_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
