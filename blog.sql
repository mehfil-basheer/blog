-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Aug 23, 2024 at 12:50 PM
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
-- Database: `blog`
--

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
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2019_08_19_000000_create_failed_jobs_table', 1),
(4, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(5, '2024_08_22_205618_create_posts_table', 2),
(6, '2024_08_23_055156_create_tags_table', 3),
(7, '2024_08_23_065835_create_post_likes_table', 4),
(8, '2024_08_23_073723_create_post_comments_table', 5),
(9, '2024_08_23_082706_create_post_comment_likes_table', 6),
(10, '2024_08_23_082721_create_post_comment_replies_table', 6);

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

--
-- Dumping data for table `personal_access_tokens`
--

INSERT INTO `personal_access_tokens` (`id`, `tokenable_type`, `tokenable_id`, `name`, `token`, `abilities`, `last_used_at`, `expires_at`, `created_at`, `updated_at`) VALUES
(1, 'App\\Models\\User', 1, 'auth_token', '0a95fc4e222ff418a91f578ca0accfdc7ef02a3fd5aebf2336b54ea8719e55a3', '[\"*\"]', NULL, NULL, '2024-08-22 15:14:07', '2024-08-22 15:14:07'),
(2, 'App\\Models\\User', 1, 'auth_token', '77868b8e0b894365ac872d59d2e0c6987760662edc36c407f98cf97959a4b07c', '[\"*\"]', NULL, NULL, '2024-08-22 15:16:18', '2024-08-22 15:16:18'),
(3, 'App\\Models\\User', 1, 'auth_token', 'e03dc9112230e29fd0b299d08057414d4aa98e03e7bf0628b884683fc7340905', '[\"*\"]', '2024-08-23 04:24:09', NULL, '2024-08-22 15:35:34', '2024-08-23 04:24:09'),
(4, 'App\\Models\\User', 2, 'auth_token', '3988638ea767ff0123af81f621670c94a52148c0ae0a91e02acce8370ab3df47', '[\"*\"]', '2024-08-23 04:28:53', NULL, '2024-08-23 00:30:06', '2024-08-23 04:28:53'),
(5, 'App\\Models\\User', 1, 'auth_token', '9548477422b3153095b194bee399d42b08975bc3f99d470c4f7f12a9631a8b60', '[\"*\"]', '2024-08-23 01:47:04', NULL, '2024-08-23 01:44:37', '2024-08-23 01:47:04'),
(6, 'App\\Models\\User', 3, 'auth_token', 'f5a92353812493444770dba7534544913a292a9d857da996d9a5f77290acad59', '[\"*\"]', '2024-08-23 01:56:23', NULL, '2024-08-23 01:54:45', '2024-08-23 01:56:23'),
(7, 'App\\Models\\User', 3, 'auth_token', 'b7662974870504613e80395248771e80c89df4b408ebcd23edac460e48f616fc', '[\"*\"]', '2024-08-23 03:53:18', NULL, '2024-08-23 01:56:46', '2024-08-23 03:53:18'),
(8, 'App\\Models\\User', 3, 'auth_token', 'e547e540443dfaa177cb42f4cb830b6e530db20c786c17ab495c1c4ecf9cba09', '[\"*\"]', '2024-08-23 04:31:59', NULL, '2024-08-23 03:54:51', '2024-08-23 04:31:59'),
(9, 'App\\Models\\User', 3, 'auth_token', '0541ea75a2cfb3d2eb4d77384ca33de22e5f024eaca092cbd6dd1c8efe94c46e', '[\"*\"]', NULL, NULL, '2024-08-23 05:07:38', '2024-08-23 05:07:38');

-- --------------------------------------------------------

--
-- Table structure for table `posts`
--

CREATE TABLE `posts` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `image` varchar(255) DEFAULT NULL,
  `createdBy` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `posts`
--

INSERT INTO `posts` (`id`, `title`, `description`, `image`, `createdBy`, `created_at`, `updated_at`) VALUES
(2, 'first post', 'discription', NULL, 1, '2024-08-22 15:49:59', '2024-08-22 15:49:59'),
(3, 'first post', 'discription', NULL, 2, '2024-08-23 00:41:44', '2024-08-23 00:41:44'),
(4, 'first post', 'discription', NULL, 2, '2024-08-23 00:42:38', '2024-08-23 00:42:38'),
(5, 'second post', 'discription', NULL, 2, '2024-08-23 04:09:53', '2024-08-23 04:09:53'),
(6, 'seconda post', 'discription', NULL, 2, '2024-08-23 04:12:40', '2024-08-23 04:12:40'),
(7, 'seconda post', 'discription', NULL, 2, '2024-08-23 04:12:51', '2024-08-23 04:12:51'),
(8, 'seconda post', 'discription', NULL, 2, '2024-08-23 04:13:01', '2024-08-23 04:13:01'),
(9, 'seconda post', 'discription', NULL, 2, '2024-08-23 04:13:16', '2024-08-23 04:13:16'),
(10, 'seconda post', 'discription', NULL, 2, '2024-08-23 04:13:35', '2024-08-23 04:13:35'),
(11, 'seconda post', 'discription', NULL, 2, '2024-08-23 04:15:07', '2024-08-23 04:15:07'),
(12, 'seconda post', 'discription', NULL, 2, '2024-08-23 04:17:14', '2024-08-23 04:17:14'),
(13, 'seconda post', 'discription', NULL, 2, '2024-08-23 04:18:18', '2024-08-23 04:18:18'),
(14, 'seconda post', 'discription', NULL, 2, '2024-08-23 04:19:28', '2024-08-23 04:19:28'),
(15, 'secondaaa post', 'discription', NULL, 2, '2024-08-23 04:20:22', '2024-08-23 04:20:22'),
(16, 'secondaaa post', 'discription', NULL, 2, '2024-08-23 04:21:03', '2024-08-23 04:21:03');

-- --------------------------------------------------------

--
-- Table structure for table `post_comments`
--

CREATE TABLE `post_comments` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `comments` text NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `post_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `post_comments`
--

INSERT INTO `post_comments` (`id`, `comments`, `user_id`, `post_id`, `created_at`, `updated_at`) VALUES
(1, 'new comment1', 3, 4, '2024-08-23 02:14:44', '2024-08-23 02:14:44'),
(2, 'new comment2', 3, 4, '2024-08-23 02:15:40', '2024-08-23 02:15:40'),
(3, 'new comment2', 3, 4, '2024-08-23 02:18:51', '2024-08-23 02:18:51'),
(4, 'new comment2', 3, 4, '2024-08-23 02:19:51', '2024-08-23 02:19:51'),
(5, 'new comment2', 3, 4, '2024-08-23 02:20:25', '2024-08-23 02:20:25');

-- --------------------------------------------------------

--
-- Table structure for table `post_comment_likes`
--

CREATE TABLE `post_comment_likes` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `comment_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `post_comment_likes`
--

INSERT INTO `post_comment_likes` (`id`, `user_id`, `comment_id`, `created_at`, `updated_at`) VALUES
(1, 3, 1, '2024-08-23 02:59:50', '2024-08-23 02:59:50'),
(2, 3, 1, '2024-08-23 03:01:17', '2024-08-23 03:01:17'),
(3, 3, 1, '2024-08-23 03:02:07', '2024-08-23 03:02:07'),
(4, 3, 1, '2024-08-23 03:02:48', '2024-08-23 03:02:48'),
(5, 3, 1, '2024-08-23 03:04:01', '2024-08-23 03:04:01');

-- --------------------------------------------------------

--
-- Table structure for table `post_comment_replies`
--

CREATE TABLE `post_comment_replies` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `comments` text NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `comment_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `post_comment_replies`
--

INSERT INTO `post_comment_replies` (`id`, `comments`, `user_id`, `comment_id`, `created_at`, `updated_at`) VALUES
(1, 'nycc', 3, 1, '2024-08-23 03:12:54', '2024-08-23 03:12:54');

-- --------------------------------------------------------

--
-- Table structure for table `post_likes`
--

CREATE TABLE `post_likes` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `post_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `post_likes`
--

INSERT INTO `post_likes` (`id`, `user_id`, `post_id`, `created_at`, `updated_at`) VALUES
(1, 2, 4, '2024-08-23 01:44:17', '2024-08-23 01:44:17'),
(2, 1, 4, '2024-08-23 01:44:53', '2024-08-23 01:44:53'),
(4, 3, 4, '2024-08-23 01:58:28', '2024-08-23 01:58:28');

-- --------------------------------------------------------

--
-- Table structure for table `tags`
--

CREATE TABLE `tags` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `post_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `tags`
--

INSERT INTO `tags` (`id`, `user_id`, `post_id`, `created_at`, `updated_at`) VALUES
(1, 2, 4, '2024-08-23 00:42:38', '2024-08-23 00:42:38'),
(2, 1, 4, '2024-08-23 00:42:38', '2024-08-23 00:42:38'),
(7, 2, 5, '2024-08-23 04:09:53', '2024-08-23 04:09:53'),
(8, 1, 5, '2024-08-23 04:09:53', '2024-08-23 04:09:53'),
(9, 2, 6, '2024-08-23 04:12:40', '2024-08-23 04:12:40'),
(10, 1, 6, '2024-08-23 04:12:40', '2024-08-23 04:12:40'),
(11, 2, 7, '2024-08-23 04:12:51', '2024-08-23 04:12:51'),
(12, 1, 7, '2024-08-23 04:12:51', '2024-08-23 04:12:51'),
(13, 2, 8, '2024-08-23 04:13:01', '2024-08-23 04:13:01'),
(14, 1, 8, '2024-08-23 04:13:01', '2024-08-23 04:13:01'),
(15, 2, 9, '2024-08-23 04:13:16', '2024-08-23 04:13:16'),
(16, 1, 9, '2024-08-23 04:13:16', '2024-08-23 04:13:16'),
(17, 2, 10, '2024-08-23 04:13:35', '2024-08-23 04:13:35'),
(18, 1, 10, '2024-08-23 04:13:35', '2024-08-23 04:13:35'),
(19, 2, 11, '2024-08-23 04:15:07', '2024-08-23 04:15:07'),
(20, 1, 11, '2024-08-23 04:15:07', '2024-08-23 04:15:07'),
(21, 2, 12, '2024-08-23 04:17:14', '2024-08-23 04:17:14'),
(22, 1, 12, '2024-08-23 04:17:14', '2024-08-23 04:17:14'),
(23, 2, 13, '2024-08-23 04:18:18', '2024-08-23 04:18:18'),
(24, 1, 13, '2024-08-23 04:18:18', '2024-08-23 04:18:18'),
(25, 2, 14, '2024-08-23 04:19:28', '2024-08-23 04:19:28'),
(26, 1, 14, '2024-08-23 04:19:28', '2024-08-23 04:19:28'),
(27, 2, 15, '2024-08-23 04:20:22', '2024-08-23 04:20:22'),
(28, 1, 15, '2024-08-23 04:20:22', '2024-08-23 04:20:22'),
(29, 2, 16, '2024-08-23 04:21:03', '2024-08-23 04:21:03'),
(30, 1, 16, '2024-08-23 04:21:03', '2024-08-23 04:21:03');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `username` varchar(255) NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `username`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'MehfilBasheer', 'mehfilbasheer@gmail.com', '', NULL, '$2y$10$CQzrAD5XlCFPjd.LQW3DK.z9RSDE4Y5bH4f.kZ2l9iZcb02x150tK', NULL, '2024-08-22 15:14:07', '2024-08-22 15:14:07'),
(2, 'sikwaaysha', 'sikwaaysha@gmail.com', '', NULL, '$2y$10$13tEahdfgHfNsUn2AlJAIe5HxqgmOzhlfdDWCkkDImYwuwauNgHV.', NULL, '2024-08-23 00:30:05', '2024-08-23 00:30:05'),
(3, 'newuser', 'newuser@gmail.com', 'newuser', NULL, '$2y$10$7F8gmpp2k8ZXtRR89pwQo.VpKE7weiDoB2jFsnD9CHul3oA1qxKX2', NULL, '2024-08-23 01:54:44', '2024-08-23 01:54:44');

--
-- Indexes for dumped tables
--

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
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
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
  ADD PRIMARY KEY (`id`),
  ADD KEY `posts_createdby_foreign` (`createdBy`);

--
-- Indexes for table `post_comments`
--
ALTER TABLE `post_comments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `post_comments_user_id_foreign` (`user_id`),
  ADD KEY `post_comments_post_id_foreign` (`post_id`);

--
-- Indexes for table `post_comment_likes`
--
ALTER TABLE `post_comment_likes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `post_comment_likes_user_id_foreign` (`user_id`),
  ADD KEY `post_comment_likes_comment_id_foreign` (`comment_id`);

--
-- Indexes for table `post_comment_replies`
--
ALTER TABLE `post_comment_replies`
  ADD PRIMARY KEY (`id`),
  ADD KEY `post_comment_replies_user_id_foreign` (`user_id`),
  ADD KEY `post_comment_replies_comment_id_foreign` (`comment_id`);

--
-- Indexes for table `post_likes`
--
ALTER TABLE `post_likes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `post_likes_user_id_foreign` (`user_id`),
  ADD KEY `post_likes_post_id_foreign` (`post_id`);

--
-- Indexes for table `tags`
--
ALTER TABLE `tags`
  ADD PRIMARY KEY (`id`),
  ADD KEY `tags_user_id_foreign` (`user_id`),
  ADD KEY `tags_post_id_foreign` (`post_id`);

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
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `posts`
--
ALTER TABLE `posts`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `post_comments`
--
ALTER TABLE `post_comments`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `post_comment_likes`
--
ALTER TABLE `post_comment_likes`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `post_comment_replies`
--
ALTER TABLE `post_comment_replies`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `post_likes`
--
ALTER TABLE `post_likes`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `tags`
--
ALTER TABLE `tags`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `posts`
--
ALTER TABLE `posts`
  ADD CONSTRAINT `posts_createdby_foreign` FOREIGN KEY (`createdBy`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `post_comments`
--
ALTER TABLE `post_comments`
  ADD CONSTRAINT `post_comments_post_id_foreign` FOREIGN KEY (`post_id`) REFERENCES `posts` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `post_comments_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `post_comment_likes`
--
ALTER TABLE `post_comment_likes`
  ADD CONSTRAINT `post_comment_likes_comment_id_foreign` FOREIGN KEY (`comment_id`) REFERENCES `post_comments` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `post_comment_likes_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `post_comment_replies`
--
ALTER TABLE `post_comment_replies`
  ADD CONSTRAINT `post_comment_replies_comment_id_foreign` FOREIGN KEY (`comment_id`) REFERENCES `post_comments` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `post_comment_replies_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `post_likes`
--
ALTER TABLE `post_likes`
  ADD CONSTRAINT `post_likes_post_id_foreign` FOREIGN KEY (`post_id`) REFERENCES `posts` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `post_likes_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `tags`
--
ALTER TABLE `tags`
  ADD CONSTRAINT `tags_post_id_foreign` FOREIGN KEY (`post_id`) REFERENCES `posts` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `tags_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
