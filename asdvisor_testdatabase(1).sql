-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Feb 26, 2024 at 08:01 AM
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
-- Database: `asdvisor_testdatabase`
--

-- --------------------------------------------------------

--
-- Table structure for table `accounts`
--

CREATE TABLE `accounts` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `first_name` varchar(255) NOT NULL,
  `last_name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `birthdate` varchar(255) NOT NULL,
  `gender` varchar(255) NOT NULL,
  `contact` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `account_level` varchar(255) NOT NULL,
  `remember_token` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `accounts`
--

INSERT INTO `accounts` (`id`, `first_name`, `last_name`, `email`, `birthdate`, `gender`, `contact`, `password`, `account_level`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'jhosua', 'fungo', 'jhosuafungo@gmail.com', '11/27/2000', 'male', '09983404371', '$2y$12$3wQeZi.T5TpX.LJcqptxSOI9yH/oSFNeDPv3fDxZwTEbDAJTc4ooy', 'Parents', 'NULL', '2024-02-20 01:33:46', '2024-02-20 01:33:46'),
(2, 'Vansley', 'Duque', 'vansley@gmail.com', '05/27/2001', 'male', '12312312312', '$2y$12$tpGsmUzYiy.vxEpyQ2j2EOpSe.znJjG8dAtkVaXJPWN0eSx/r7AG.', 'Doctor', 'NULL', '2024-02-20 01:35:01', '2024-02-20 01:35:01'),
(3, 'francis', 'taino', 'francis@gmail.com', '10/10/2000', 'male', '12312312312', '$2y$12$7p33ROIuY8L5JZSDuqPenedoj.xSwkx6q6Dq1lVZ6aC7rehGmpD.a', 'Doctor', 'NULL', '2024-02-20 01:36:11', '2024-02-20 01:36:11');

-- --------------------------------------------------------

--
-- Table structure for table `appointments`
--

CREATE TABLE `appointments` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `doctor_id` varchar(255) NOT NULL,
  `parent_id` bigint(20) UNSIGNED NOT NULL,
  `doctor_schedule_id` varchar(255) NOT NULL,
  `appointment_date` varchar(255) NOT NULL,
  `status` varchar(255) NOT NULL,
  `deleted_at` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `appointments`
--

INSERT INTO `appointments` (`id`, `doctor_id`, `parent_id`, `doctor_schedule_id`, `appointment_date`, `status`, `deleted_at`, `created_at`, `updated_at`) VALUES
(1, '2', 1, '2024-02-21', '11:00 AM', 'confirmed', NULL, '2024-02-20 01:42:30', '2024-02-20 02:58:56'),
(2, '2', 1, '2024-02-27', '3:00 PM', 'canceled', NULL, '2024-02-20 01:42:37', '2024-02-20 23:56:17'),
(3, '2', 1, '2024-02-23', '11:00 AM', 'confirmed', NULL, '2024-02-21 01:38:34', '2024-02-21 01:39:37'),
(4, '2', 1, '2024-02-27', '11:00 AM', 'confirmed', NULL, '2024-02-24 10:27:56', '2024-02-24 10:29:38');

-- --------------------------------------------------------

--
-- Table structure for table `childprofiles`
--

CREATE TABLE `childprofiles` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `first_name` varchar(255) NOT NULL,
  `last_name` varchar(255) NOT NULL,
  `height` varchar(255) NOT NULL,
  `weight` varchar(255) NOT NULL,
  `gender` varchar(255) NOT NULL,
  `age` varchar(255) NOT NULL,
  `birthdate` varchar(255) NOT NULL,
  `account_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `childprofiles`
--

INSERT INTO `childprofiles` (`id`, `first_name`, `last_name`, `height`, `weight`, `gender`, `age`, `birthdate`, `account_id`, `created_at`, `updated_at`) VALUES
(1, 'Allan', 'Miguel', '180', '50', 'male', '16', '11/27/2000', 1, '2024-02-20 03:22:15', '2024-02-20 03:22:15');

-- --------------------------------------------------------

--
-- Table structure for table `child_history`
--

CREATE TABLE `child_history` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `date` varchar(255) NOT NULL,
  `image` varchar(255) DEFAULT NULL,
  `description` longtext NOT NULL,
  `category` varchar(255) NOT NULL,
  `parent_id` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `child_id` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `child_history`
--

INSERT INTO `child_history` (`id`, `date`, `image`, `description`, `category`, `parent_id`, `created_at`, `updated_at`, `child_id`) VALUES
(1, '10/23/2023', 'default-image', '<div>lorem ipsum dolor lorem ipsum dolor</div>', 'temper_tantrums', '1', '2024-02-20 23:11:52', '2024-02-20 23:11:52', '1'),
(2, '11/10/2023', 'default-image', '<div>lorem ipsum dolodolor</div><div><br></div>', 'oversensitivity', '1', '2024-02-20 23:45:24', '2024-02-20 23:45:24', '1'),
(3, '01/23/2024', 'default-image', '<div>lorem ipsum dolor</div>', 'temper_tantrums', '1', '2024-02-20 23:48:25', '2024-02-20 23:48:25', '1'),
(4, '01/01/2024', 'default-image', '<div>lorem ipsum dolor</div>', 'temper_tantrums', '1', '2024-02-20 23:48:40', '2024-02-20 23:48:40', '1'),
(5, '10/10/2023', 'default-image', '<div><b>lorem ip</b></div>', 'oversensitivity', '1', '2024-02-21 00:58:36', '2024-02-21 00:58:36', '1');

-- --------------------------------------------------------

--
-- Table structure for table `comments`
--

CREATE TABLE `comments` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `parent_id` varchar(255) NOT NULL,
  `post_id` varchar(255) NOT NULL,
  `body` longtext NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `comments`
--

INSERT INTO `comments` (`id`, `parent_id`, `post_id`, `body`, `created_at`, `updated_at`) VALUES
(1, '1', '1', 'Huwag muna', '2024-02-20 05:27:33', '2024-02-20 05:27:33'),
(2, '1', '1', 'true brother true', '2024-02-20 05:49:04', '2024-02-20 05:49:04'),
(3, '1', '1', 'a', '2024-02-20 05:51:36', '2024-02-20 05:51:36'),
(4, '1', '1', 'real', '2024-02-20 05:54:36', '2024-02-20 05:54:36'),
(5, '1', '1', 'gagag', '2024-02-20 05:55:35', '2024-02-20 05:55:35'),
(6, '1', '2', 'gagagaga', '2024-02-20 05:59:08', '2024-02-20 05:59:08'),
(7, '1', '2', 'real shit bro this is fire', '2024-02-20 05:59:48', '2024-02-20 05:59:48'),
(8, '1', '1', 'Lorem ipsum dolor', '2024-02-20 06:00:17', '2024-02-20 06:00:17'),
(9, '1', '1', 'you need to check in with a neurodevelopmental doctor!', '2024-02-20 06:00:55', '2024-02-20 06:00:55'),
(10, '1', '1', 'real', '2024-02-20 06:42:31', '2024-02-20 06:42:31'),
(11, '1', '5', 'hi', '2024-02-20 23:51:04', '2024-02-20 23:51:04'),
(12, '1', '3', 'hahaha', '2024-02-21 01:27:56', '2024-02-21 01:27:56');

-- --------------------------------------------------------

--
-- Table structure for table `daily_cares`
--

CREATE TABLE `daily_cares` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `doctor_id` varchar(255) NOT NULL,
  `title` varchar(255) NOT NULL,
  `body` longtext NOT NULL,
  `image` varchar(255) DEFAULT NULL,
  `deleted_at` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `daily_cares`
--

INSERT INTO `daily_cares` (`id`, `doctor_id`, `title`, `body`, `image`, `deleted_at`, `created_at`, `updated_at`) VALUES
(1, '2', 'This is a guide on how to help your child with ASD!', '<div><br></div><div><span style=\"font-size: 1em;\">Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec vitae maximus tellus. Mauris scelerisque augue vel </span><b style=\"font-size: 1em;\">felis sagittis commodo</b><span style=\"font-size: 1em;\">. Nunc bibendum ut lacus ac tempor. In tempus ipsum dui. Vestibulum fringilla metus erat, eu gravida odio volutpat vitae. Curabitur efficitur purus non luctus fermentum. Pellentesque efficitur vulputate augue sodales aliquam. Integer eget felis interdum, tincidunt orci vel, ultrices arcu. Donec non lacus tempor, sagittis sapien quis, viverra erat. In id venenatis nisl.</span><b style=\"font-size: 1em;\"> In sit amet ante non leo sodales vestibulum.</b></div><div><ul><li><span style=\"font-size: 1em;\">Sed justo nulla, eleifend id tincidunt at, congue id nulla. Proin vel diam quis est euismod suscipit. Nunc eu aliquet mauris. Morbi faucibus, erat nec aliquet viverra, nibh massa vulputate leo, at dictum dolor tellus vel dolor. </span><b style=\"font-size: 1em;\">Integer vulputate nulla et lorem euismod, eu mollis orci consequat.</b><span style=\"font-size: 1em;\"> Nunc iaculis nulla id risus condimentum, eu elementum nisl molestie. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. </span><b style=\"font-size: 1em;\">Fusce ut nunc tincidunt purus accumsan facilisis pellentesque sed libero.</b><span style=\"font-size: 1em;\"> Maecenas malesuada tellus et est ullamcorper, in laoreet tellus ullamcorper. Suspendisse potenti.</span></li><li><i style=\"font-size: 1em;\"><u>Mauris id tempor quam</u>, nec vestibulum odio</i><span style=\"font-size: 1em;\">. Pellentesque fermentum nisi vitae justo dignissim varius. Donec id aliquam enim. Nullam rhoncus magna eget mi pretium molestie. Praesent commodo, ex vel faucibus maximus, </span><i style=\"font-size: 1em;\"><u>mi mi rutrum sapien, ut sodales leo metus quis leo. Integer bibendum fringilla velit, in ultricies orci malesuada ut. Pellentesque a ultrices era</u></i><span style=\"font-size: 1em;\">t. Suspendisse potenti. Curabitur id dui commodo, tincidunt mauris maximus, ornare metus. Cras auctor hendrerit elementum. Fusce lacinia vestibulum erat eget iaculis. In id iaculis risus, non tristique felis.</span><br></li></ul></div>', 'default-image', NULL, '2024-02-20 01:41:00', '2024-02-20 01:41:00'),
(2, '2', 'Real Thoughts of A Doctor', '<div><br></div><div>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec vitae maximus tellus. Mauris scelerisque augue vel felis sagittis commodo. Nunc bibendum ut lacus ac tempor. In tempus ipsum dui. Vestibulum fringilla metus erat, eu gravida odio volutpat vitae. Curabitur efficitur purus non luctus fermentum. Pellentesque efficitur vulputate augue sodales aliquam. Integer eget felis interdum, tincidunt orci vel, ultrices arcu. Donec non lacus tempor, sagittis sapien quis, viverra erat. In id venenatis nisl. In sit amet ante non leo sodales vestibulum.</div><div><br></div><div>Sed justo nulla, eleifend id tincidunt at, congue id nulla. Proin vel diam quis est euismod suscipit. Nunc eu aliquet mauris. Morbi faucibus, erat nec aliquet viverra, nibh massa vulputate leo, at dictum dolor tellus vel dolor. Integer vulputate nulla et lorem euismod, eu mollis orci consequat. Nunc iaculis nulla id risus condimentum, eu elementum nisl molestie. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Fusce ut nunc tincidunt purus accumsan facilisis pellentesque sed libero. Maecenas malesuada tellus et est ullamcorper, in laoreet tellus ullamcorper. Suspendisse potenti.</div>', 'default-image', NULL, '2024-02-20 01:41:36', '2024-02-20 01:41:36'),
(3, '2', 'How to take care of your child', '<div><i>Lorem ipsum dolor</i></div>', 'default-image', NULL, '2024-02-20 23:51:59', '2024-02-20 23:51:59');

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(255) NOT NULL,
  `connection` text NOT NULL,
  `queue` text NOT NULL,
  `payload` longtext NOT NULL,
  `exception` longtext NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
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
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_reset_tokens_table', 1),
(3, '2019_08_19_000000_create_failed_jobs_table', 1),
(4, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(5, '2024_01_20_190309_create_account_table', 1),
(6, '2024_01_23_075350_create_childprofiles_table', 1),
(7, '2024_01_27_055921_create_appointments_table', 1),
(8, '2024_01_28_120155_create_daily_cares_table', 1),
(9, '2024_02_13_112926_create_posts_table', 1),
(11, '2024_02_20_121258_create_comments_table', 2),
(12, '2024_02_21_065304_create_child_history_table', 3);

-- --------------------------------------------------------

--
-- Table structure for table `password_reset_tokens`
--

CREATE TABLE `password_reset_tokens` (
  `email` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `token` varchar(64) NOT NULL,
  `abilities` text DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `posts`
--

CREATE TABLE `posts` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `parent_id` varchar(255) NOT NULL,
  `title` varchar(255) NOT NULL,
  `body` text NOT NULL,
  `image_path` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `posts`
--

INSERT INTO `posts` (`id`, `parent_id`, `title`, `body`, `image_path`, `created_at`, `updated_at`) VALUES
(1, '1', 'I need help, I need assistance on my child!', '<div>He\'s writhing in pain, and I don\'t know what to do, I need your help guys PLEASE!</div>', NULL, '2024-02-20 01:46:01', '2024-02-20 01:46:01'),
(2, '1', 'It\'s a new day!', '<div><b><u><i>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec vitae maximus tellus. Mauris scelerisque augue vel felis sagittis commodo.</i></u></b> Nunc bibendum ut lacus ac tempor. In tempus ipsum dui. Vestibulum fringilla metus erat, eu gravida odio volutpat vitae. Curabitur efficitur purus non luctus fermentum. Pellentesque efficitur vulputate augue sodales aliquam. Integer eget felis interdum, tincidunt orci vel, ultrices arcu. Donec non lacus tempor, sagittis sapien quis, viverra erat. In id venenatis nisl. In sit amet ante non leo sodales vestibulum.</div>', NULL, '2024-02-20 01:51:29', '2024-02-20 01:51:29'),
(3, '1', 'gagagag', '<div>[style.htmlBoxStyle, { height: contentHeight }Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Nisi vitae suscipit tellus mauris. Diam sit amet nisl suscipit. Nibh cras pulvinar mattis nunc sed. Ultricies tristique nulla aliquet enim tortor at auctor urna nunc. Pretium aenean pharetra magna ac. Massa placerat duis ultricies lacus sed turpis tincidunt id. Sit amet porttitor eget dolor morbi non arcu risus. Eu ultrices vitae auctor eu augue ut lectus arcu. Phasellus egestas tellus rutrum tellus. Neque aliquam vestibulum morbi blandit cursus risus at. Aliquam sem et tortor consequat id porta nibh venenatis cras. Pellentesque habitant morbi tristique senectus. Phasellus vestibulum lorem sed risus ultricies tristique nulla aliquet. Nulla aliquet porttitor lacus luctus. Id donec ultrices tincidunt arcu. Ultricies integer quis auctor elit sed vulputate mi. Ipsum suspendisse ultrices gravida dictum fusce ut placerat orci nulla.</div><div><br></div><div>Sodales neque sodales ut etiam. Donec enim diam vulputate ut pharetra sit amet aliquam. Suspendisse faucibus interdum posuere lorem ipsum dolor sit amet. Augue eget arcu dictum varius duis. Nibh cras pulvinar mattis nunc sed blandit. Mattis enim ut tellus elementum sagittis vitae et leo. Libero nunc consequat interdum varius sit amet. Mauris pellentesque pulvinar pellentesque habitant morbi tristique. A pellentesque sit amet porttitor eget dolor morbi non arcu. Nec feugiat in fermentum posuere. Sit amet volutpat consequat mauris nunc congue nisi vitae suscipit. Tellus in metus vulputate eu scelerisque felis imperdiet. Elementum eu facilisis sed odio morbi. Nulla facilisi cras fermentum odio eu feugiat pretium nibh ipsum.</div><div><br></div><div>Quis varius quam quisque id diam. Sit amet aliquam id diam maecenas ultricies mi eget mauris. Aliquet lectus proin nibh nisl condimentum id venenatis. Sed viverra tellus in hac habitasse. Nisl vel pretium lectus quam. Enim diam vulputate ut pharetra sit amet aliquam. Elit eget gravida cum sociis natoque. Venenatis urna cursus eget nunc scelerisque viverra mauris in. Velit ut tortor pretium viverra suspendisse potenti nullam ac tortor. Lorem sed risus ultricies tristique nulla aliquet enim tortor at. Cursus sit amet dictum sit. Phasellus faucibus scelerisque eleifend donec pretium vulputate sapien. Vulputate eu scelerisque felis imperdiet proin. Ante metus dictum at tempor commodo ullamcorper. Diam quis enim lobortis scelerisque fermentum.</div>', NULL, '2024-02-20 02:07:17', '2024-02-20 02:07:17'),
(4, '1', 'hahahahaha', '<div>ahhahahahahahaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa</div>', NULL, '2024-02-20 02:15:29', '2024-02-20 02:15:29'),
(5, '1', 'The second post', '<div><b>lorem ipsum</b> dolor</div>', NULL, '2024-02-20 23:50:55', '2024-02-20 23:50:55');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `accounts`
--
ALTER TABLE `accounts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `appointments`
--
ALTER TABLE `appointments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `appointments_parent_id_foreign` (`parent_id`);

--
-- Indexes for table `childprofiles`
--
ALTER TABLE `childprofiles`
  ADD PRIMARY KEY (`id`),
  ADD KEY `childprofiles_account_id_foreign` (`account_id`);

--
-- Indexes for table `child_history`
--
ALTER TABLE `child_history`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `comments`
--
ALTER TABLE `comments`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `daily_cares`
--
ALTER TABLE `daily_cares`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_reset_tokens`
--
ALTER TABLE `password_reset_tokens`
  ADD PRIMARY KEY (`email`);

--
-- Indexes for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Indexes for table `posts`
--
ALTER TABLE `posts`
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
-- AUTO_INCREMENT for table `accounts`
--
ALTER TABLE `accounts`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `appointments`
--
ALTER TABLE `appointments`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `childprofiles`
--
ALTER TABLE `childprofiles`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `child_history`
--
ALTER TABLE `child_history`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `comments`
--
ALTER TABLE `comments`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `daily_cares`
--
ALTER TABLE `daily_cares`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `posts`
--
ALTER TABLE `posts`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `appointments`
--
ALTER TABLE `appointments`
  ADD CONSTRAINT `appointments_parent_id_foreign` FOREIGN KEY (`parent_id`) REFERENCES `accounts` (`id`);

--
-- Constraints for table `childprofiles`
--
ALTER TABLE `childprofiles`
  ADD CONSTRAINT `childprofiles_account_id_foreign` FOREIGN KEY (`account_id`) REFERENCES `accounts` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
