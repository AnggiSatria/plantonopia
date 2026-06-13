-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 08 Des 2024 pada 11.50
-- Versi server: 10.4.32-MariaDB
-- Versi PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `plantopia`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `cache`
--

CREATE TABLE `cache` (
  `key` varchar(255) NOT NULL,
  `value` mediumtext NOT NULL,
  `expiration` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `cache_locks`
--

CREATE TABLE `cache_locks` (
  `key` varchar(255) NOT NULL,
  `owner` varchar(255) NOT NULL,
  `expiration` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `carts`
--

CREATE TABLE `carts` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `product_id` bigint(20) UNSIGNED NOT NULL,
  `quantity` int(11) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `categories`
--

CREATE TABLE `categories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `categories`
--

INSERT INTO `categories` (`id`, `name`, `created_at`, `updated_at`) VALUES
(1, 'Hias', '2024-12-08 03:49:18', '2024-12-08 03:49:18'),
(2, 'Hidroponik', '2024-12-08 03:49:18', '2024-12-08 03:49:18');

-- --------------------------------------------------------

--
-- Struktur dari tabel `failed_jobs`
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
-- Struktur dari tabel `jobs`
--

CREATE TABLE `jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `queue` varchar(255) NOT NULL,
  `payload` longtext NOT NULL,
  `attempts` tinyint(3) UNSIGNED NOT NULL,
  `reserved_at` int(10) UNSIGNED DEFAULT NULL,
  `available_at` int(10) UNSIGNED NOT NULL,
  `created_at` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `job_batches`
--

CREATE TABLE `job_batches` (
  `id` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `total_jobs` int(11) NOT NULL,
  `pending_jobs` int(11) NOT NULL,
  `failed_jobs` int(11) NOT NULL,
  `failed_job_ids` longtext NOT NULL,
  `options` mediumtext DEFAULT NULL,
  `cancelled_at` int(11) DEFAULT NULL,
  `created_at` int(11) NOT NULL,
  `finished_at` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '0001_01_01_000000_create_users_table', 1),
(2, '0001_01_01_000001_create_cache_table', 1),
(3, '0001_01_01_000002_create_jobs_table', 1),
(4, '2024_11_05_052950_add_type_to_users_table', 1),
(5, '2024_11_16_162748_create_products_table', 1),
(6, '2024_11_16_162850_create_categories_table', 1),
(7, '2024_11_24_071338_create_carts_table', 1),
(8, '2024_11_24_083922_create_shippings_table', 1),
(9, '2024_11_24_100028_create_wishlists_table', 1),
(10, '2024_11_27_064249_create_orders_table', 1),
(11, '2024_11_27_065019_create_order_items_table', 1);

-- --------------------------------------------------------

--
-- Struktur dari tabel `orders`
--

CREATE TABLE `orders` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `shipping_type` varchar(255) NOT NULL,
  `shipping_price` double NOT NULL,
  `sub_total` double NOT NULL,
  `grand_total` double NOT NULL,
  `payment` varchar(255) NOT NULL,
  `address` text NOT NULL,
  `status` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `order_items`
--

CREATE TABLE `order_items` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `order_id` bigint(20) UNSIGNED NOT NULL,
  `product_title` varchar(255) NOT NULL,
  `product_category` varchar(255) NOT NULL,
  `product_description` text NOT NULL,
  `product_image` varchar(255) NOT NULL,
  `product_price` double NOT NULL,
  `quantity` int(11) NOT NULL,
  `total` double NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `password_reset_tokens`
--

CREATE TABLE `password_reset_tokens` (
  `email` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `products`
--

CREATE TABLE `products` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `category_id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `product_image` varchar(255) NOT NULL,
  `price` double NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `products`
--

INSERT INTO `products` (`id`, `category_id`, `title`, `description`, `product_image`, `price`, `created_at`, `updated_at`) VALUES
(1, 1, 'Non dolorem.', 'Sit nostrum labore explicabo magnam eos est qui debitis cupiditate magni placeat eum repudiandae quia cum eos sed eos est quidem rerum id nemo aliquid.', 'https://via.placeholder.com/150x150.png/007777?text=product+Faker+reprehenderit', 3879757.61, '2024-12-08 03:49:18', '2024-12-08 03:49:18'),
(2, 1, 'Corporis omnis eos.', 'Qui enim itaque possimus ea sint est dolore sit eos qui similique consequatur saepe id.', 'https://via.placeholder.com/150x150.png/002222?text=product+Faker+aut', 2.97, '2024-12-08 03:49:18', '2024-12-08 03:49:18'),
(3, 1, 'Voluptas ea.', 'Dolorem dolor corporis repellendus dolore in sed facilis cumque aliquid voluptatem et impedit qui amet deserunt repudiandae aspernatur facere quidem.', 'https://via.placeholder.com/150x150.png/003355?text=product+Faker+mollitia', 46313702.39, '2024-12-08 03:49:18', '2024-12-08 03:49:18'),
(4, 1, 'Sunt deleniti harum.', 'Assumenda alias tempore exercitationem dolorem rerum fugit laborum doloremque eum quas tenetur asperiores ea autem fuga ut sint repellat ut fugit quaerat modi earum.', 'https://via.placeholder.com/150x150.png/00ddee?text=product+Faker+eveniet', 17.17, '2024-12-08 03:49:18', '2024-12-08 03:49:18'),
(5, 1, 'Aliquam explicabo occaecati.', 'Cumque molestias laudantium rem fugit laudantium quia voluptatibus ad cum laboriosam debitis suscipit libero commodi voluptatibus omnis impedit natus id cupiditate distinctio sed et nihil mollitia possimus voluptatem.', 'https://via.placeholder.com/150x150.png/003399?text=product+Faker+iste', 1.11, '2024-12-08 03:49:18', '2024-12-08 03:49:18'),
(6, 1, 'At nostrum architecto.', 'Vel accusantium facere a aspernatur at aperiam alias illo qui vel dolore nulla.', 'https://via.placeholder.com/150x150.png/00aa44?text=product+Faker+officiis', 400.5, '2024-12-08 03:49:18', '2024-12-08 03:49:18'),
(7, 1, 'Veniam dolores.', 'Saepe maiores aliquam necessitatibus dolores hic et id ipsam debitis maiores quis nihil alias quis voluptatem maxime ut at qui eum in ut magnam qui sequi et in.', 'https://via.placeholder.com/150x150.png/00dd55?text=product+Faker+totam', 33608452.46, '2024-12-08 03:49:18', '2024-12-08 03:49:18'),
(8, 1, 'Adipisci velit.', 'Unde alias in perspiciatis ut aliquam quas non consectetur rerum minus quasi consequatur delectus.', 'https://via.placeholder.com/150x150.png/00ee44?text=product+Faker+nihil', 646244.72, '2024-12-08 03:49:18', '2024-12-08 03:49:18'),
(9, 1, 'Ullam facilis blanditiis.', 'Dolorem autem veritatis qui molestiae totam eaque ut consectetur sunt optio id et et nostrum architecto eligendi perferendis commodi voluptates et dolorum cum sed quia.', 'https://via.placeholder.com/150x150.png/0099bb?text=product+Faker+repudiandae', 0.52, '2024-12-08 03:49:18', '2024-12-08 03:49:18'),
(10, 1, 'Rerum aut placeat.', 'Nemo necessitatibus delectus quod iure quos optio numquam esse dolorum cum vel similique tempore sint sit accusamus voluptas quia ullam optio molestiae pariatur voluptatem voluptatum dolore.', 'https://via.placeholder.com/150x150.png/0088dd?text=product+Faker+officiis', 908512.19, '2024-12-08 03:49:18', '2024-12-08 03:49:18'),
(11, 1, 'Quia quia.', 'Voluptatibus porro non sit nostrum id eos a rerum dolorum cupiditate accusantium adipisci excepturi ea nobis neque omnis unde quasi maxime eveniet quae itaque eius provident eius.', 'https://via.placeholder.com/150x150.png/008866?text=product+Faker+eum', 518674.5, '2024-12-08 03:49:18', '2024-12-08 03:49:18'),
(12, 1, 'Ut earum dolorem.', 'Natus commodi suscipit et a distinctio ut quia magnam cum non non nobis iusto magni eius laudantium velit vero.', 'https://via.placeholder.com/150x150.png/003322?text=product+Faker+soluta', 0, '2024-12-08 03:49:18', '2024-12-08 03:49:18'),
(13, 1, 'Quia sint quisquam.', 'Totam dolor accusantium qui voluptas voluptas perferendis illum inventore maxime voluptas expedita doloremque velit odio aspernatur cum sit delectus eos aut.', 'https://via.placeholder.com/150x150.png/0066ff?text=product+Faker+pariatur', 78313.85, '2024-12-08 03:49:18', '2024-12-08 03:49:18'),
(14, 1, 'Nesciunt velit.', 'Ut cumque ipsam voluptas ullam architecto necessitatibus fugit ut voluptas ullam ut rem commodi cum quia voluptatem et exercitationem est aut aut voluptates ratione esse et minus culpa blanditiis.', 'https://via.placeholder.com/150x150.png/00bb55?text=product+Faker+perferendis', 3444.99, '2024-12-08 03:49:18', '2024-12-08 03:49:18'),
(15, 1, 'Asperiores neque provident.', 'Velit corrupti dolorum ratione qui ullam necessitatibus temporibus possimus nulla quia mollitia quis omnis aut voluptatem voluptate enim et nobis cumque distinctio ut.', 'https://via.placeholder.com/150x150.png/00ff33?text=product+Faker+omnis', 40695.84, '2024-12-08 03:49:18', '2024-12-08 03:49:18'),
(16, 2, 'Praesentium sunt odio.', 'Voluptas aut ipsam deleniti sunt veritatis veniam vel voluptas velit unde quo impedit quis deserunt.', 'https://via.placeholder.com/150x150.png/000099?text=product+Faker+ad', 7.51, '2024-12-08 03:49:18', '2024-12-08 03:49:18'),
(17, 2, 'Nihil non doloremque.', 'Accusamus dolorem sit asperiores molestiae dolore corrupti dolorem error ut ut iusto ut nostrum qui eum minima nisi quis quasi rem quidem nostrum voluptatibus.', 'https://via.placeholder.com/150x150.png/0033bb?text=product+Faker+ut', 19515216.52, '2024-12-08 03:49:18', '2024-12-08 03:49:18'),
(18, 2, 'Soluta aut qui.', 'Architecto corporis sed neque commodi in ea est qui eveniet quis adipisci qui non placeat non enim ut voluptatem aut.', 'https://via.placeholder.com/150x150.png/0000bb?text=product+Faker+error', 451003.99, '2024-12-08 03:49:18', '2024-12-08 03:49:18'),
(19, 2, 'Est omnis quo.', 'Qui quisquam id voluptatem numquam ipsum nam aut non perspiciatis animi omnis at dolores earum animi cumque iusto harum eos quo quod dolorum optio.', 'https://via.placeholder.com/150x150.png/0088cc?text=product+Faker+consequuntur', 479.81, '2024-12-08 03:49:18', '2024-12-08 03:49:18'),
(20, 2, 'Asperiores blanditiis harum.', 'Tempore enim sint amet laudantium nihil velit at consectetur incidunt enim ratione et.', 'https://via.placeholder.com/150x150.png/002299?text=product+Faker+consequuntur', 621210.13, '2024-12-08 03:49:18', '2024-12-08 03:49:18'),
(21, 2, 'Corrupti corporis eos.', 'Sint alias omnis at qui molestias voluptates dolor quo sapiente ducimus illum est voluptas id est dolores numquam maiores quas atque.', 'https://via.placeholder.com/150x150.png/0011cc?text=product+Faker+in', 616.52, '2024-12-08 03:49:18', '2024-12-08 03:49:18'),
(22, 2, 'Molestiae maxime in.', 'Provident molestiae et laudantium at iure amet dolor id vel voluptate architecto ut quibusdam corporis vitae perspiciatis.', 'https://via.placeholder.com/150x150.png/009966?text=product+Faker+neque', 2527.3, '2024-12-08 03:49:18', '2024-12-08 03:49:18'),
(23, 2, 'Nihil suscipit id.', 'Porro veniam qui sed repellat porro autem saepe aut commodi a autem accusantium ullam rerum dolorem atque dolorem temporibus illum optio.', 'https://via.placeholder.com/150x150.png/00bb22?text=product+Faker+inventore', 184951.53, '2024-12-08 03:49:18', '2024-12-08 03:49:18'),
(24, 2, 'Dicta sit.', 'Quo inventore a ipsa ut voluptas quibusdam perspiciatis veniam aut amet aut voluptatem rerum voluptatum quae quaerat nihil.', 'https://via.placeholder.com/150x150.png/0000ff?text=product+Faker+non', 2545.79, '2024-12-08 03:49:18', '2024-12-08 03:49:18'),
(25, 2, 'Dolores qui voluptatibus.', 'Nesciunt accusamus velit possimus sequi omnis qui facilis sit temporibus reiciendis ipsa maiores quaerat ducimus minus praesentium in corporis iusto.', 'https://via.placeholder.com/150x150.png/0033ee?text=product+Faker+sit', 774.31, '2024-12-08 03:49:18', '2024-12-08 03:49:18'),
(26, 2, 'Velit nesciunt sequi.', 'Sit recusandae sint ut aut culpa alias illo laboriosam corporis cum repudiandae tenetur ratione possimus.', 'https://via.placeholder.com/150x150.png/000033?text=product+Faker+repellendus', 3352466.02, '2024-12-08 03:49:18', '2024-12-08 03:49:18'),
(27, 2, 'Ad vitae recusandae.', 'Natus laudantium qui enim cum qui commodi ea ut nisi quis magnam quis est sit.', 'https://via.placeholder.com/150x150.png/0088dd?text=product+Faker+veniam', 4089.26, '2024-12-08 03:49:18', '2024-12-08 03:49:18'),
(28, 2, 'Architecto enim.', 'Voluptatum voluptates aperiam ut quam quidem enim vitae est omnis qui sunt qui quidem aliquam consequatur maxime est debitis neque deserunt fuga delectus totam veritatis rem at qui.', 'https://via.placeholder.com/150x150.png/00ffff?text=product+Faker+debitis', 449867.92, '2024-12-08 03:49:18', '2024-12-08 03:49:18'),
(29, 2, 'Quasi asperiores.', 'Qui autem corrupti dolorem dolores sed dolores sequi consectetur labore excepturi quia blanditiis officia non et eaque id dolor qui ut beatae ut vitae id at.', 'https://via.placeholder.com/150x150.png/00bb99?text=product+Faker+suscipit', 6597.35, '2024-12-08 03:49:18', '2024-12-08 03:49:18'),
(30, 2, 'Quo earum sit.', 'Ut fuga facere iusto dignissimos aliquam qui assumenda iste consequatur voluptatibus dolor sint vero.', 'https://via.placeholder.com/150x150.png/00aa11?text=product+Faker+dolorem', 26083780.74, '2024-12-08 03:49:18', '2024-12-08 03:49:18');

-- --------------------------------------------------------

--
-- Struktur dari tabel `sessions`
--

CREATE TABLE `sessions` (
  `id` varchar(255) NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `ip_address` varchar(45) DEFAULT NULL,
  `user_agent` text DEFAULT NULL,
  `payload` longtext NOT NULL,
  `last_activity` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `sessions`
--

INSERT INTO `sessions` (`id`, `user_id`, `ip_address`, `user_agent`, `payload`, `last_activity`) VALUES
('mHwZt5J7gYg5pWDm6NdcCfQDLnW5jRCYOuINcKgt', 1, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'YTo0OntzOjY6Il90b2tlbiI7czo0MDoiSUdmSXFiYmNmSXRUVnIzZW41ak5wakFjMDVEMkpVdk45Vmlzb242ZyI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6Mzc6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hZG1pbi9kYXNoYm9hcmQiO31zOjUwOiJsb2dpbl93ZWJfNTliYTM2YWRkYzJiMmY5NDAxNTgwZjAxNGM3ZjU4ZWE0ZTMwOTg5ZCI7aToxO30=', 1733655015),
('tjkZkORY4UwYkxwFAjJGLvV41Ytf88n6vWugBoZO', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36 Edg/131.0.0.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiRmE2OWZaVHR2clgxU3pUUEdYMm1SMzkydEcwMDc1WWJJTUVpMkdTTSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjE6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1733654975);

-- --------------------------------------------------------

--
-- Struktur dari tabel `shippings`
--

CREATE TABLE `shippings` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `type` varchar(255) NOT NULL,
  `price` double NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `shippings`
--

INSERT INTO `shippings` (`id`, `type`, `price`, `created_at`, `updated_at`) VALUES
(1, 'Regular', 12000, '2024-12-08 03:49:18', '2024-12-08 03:49:18'),
(2, 'Same Day', 30000, '2024-12-08 03:49:18', '2024-12-08 03:49:18'),
(3, 'Economy', 7500, '2024-12-08 03:49:18', '2024-12-08 03:49:18');

-- --------------------------------------------------------

--
-- Struktur dari tabel `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `type` tinyint(4) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`, `type`) VALUES
(1, 'Admin User', 'admin@example.com', NULL, '$2y$12$dQx56H7VVRhLSSnw8x5eV.jiLzheIpCxRgtkoG6cAH6asyIC4.XfC', NULL, '2024-12-08 03:49:18', '2024-12-08 03:49:18', 1),
(2, 'User', 'user@example.com', NULL, '$2y$12$c3DokaV4Uq2Yk/YVWnVMxuqvl.bUH6y4FxunSBMCBjqRXo7OVil0u', NULL, '2024-12-08 03:49:18', '2024-12-08 03:49:18', 0);

-- --------------------------------------------------------

--
-- Struktur dari tabel `wishlists`
--

CREATE TABLE `wishlists` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `product_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `cache`
--
ALTER TABLE `cache`
  ADD PRIMARY KEY (`key`);

--
-- Indeks untuk tabel `cache_locks`
--
ALTER TABLE `cache_locks`
  ADD PRIMARY KEY (`key`);

--
-- Indeks untuk tabel `carts`
--
ALTER TABLE `carts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `carts_user_id_foreign` (`user_id`),
  ADD KEY `carts_product_id_foreign` (`product_id`);

--
-- Indeks untuk tabel `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indeks untuk tabel `jobs`
--
ALTER TABLE `jobs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `jobs_queue_index` (`queue`);

--
-- Indeks untuk tabel `job_batches`
--
ALTER TABLE `job_batches`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`),
  ADD KEY `orders_user_id_foreign` (`user_id`);

--
-- Indeks untuk tabel `order_items`
--
ALTER TABLE `order_items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `order_items_order_id_foreign` (`order_id`);

--
-- Indeks untuk tabel `password_reset_tokens`
--
ALTER TABLE `password_reset_tokens`
  ADD PRIMARY KEY (`email`);

--
-- Indeks untuk tabel `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `sessions`
--
ALTER TABLE `sessions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sessions_user_id_index` (`user_id`),
  ADD KEY `sessions_last_activity_index` (`last_activity`);

--
-- Indeks untuk tabel `shippings`
--
ALTER TABLE `shippings`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- Indeks untuk tabel `wishlists`
--
ALTER TABLE `wishlists`
  ADD PRIMARY KEY (`id`),
  ADD KEY `wishlists_user_id_foreign` (`user_id`),
  ADD KEY `wishlists_product_id_foreign` (`product_id`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `carts`
--
ALTER TABLE `carts`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `categories`
--
ALTER TABLE `categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT untuk tabel `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `jobs`
--
ALTER TABLE `jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT untuk tabel `orders`
--
ALTER TABLE `orders`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `order_items`
--
ALTER TABLE `order_items`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `products`
--
ALTER TABLE `products`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT untuk tabel `shippings`
--
ALTER TABLE `shippings`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT untuk tabel `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT untuk tabel `wishlists`
--
ALTER TABLE `wishlists`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- Ketidakleluasaan untuk tabel pelimpahan (Dumped Tables)
--

--
-- Ketidakleluasaan untuk tabel `carts`
--
ALTER TABLE `carts`
  ADD CONSTRAINT `carts_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `carts_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Ketidakleluasaan untuk tabel `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `orders_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Ketidakleluasaan untuk tabel `order_items`
--
ALTER TABLE `order_items`
  ADD CONSTRAINT `order_items_order_id_foreign` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON DELETE CASCADE;

--
-- Ketidakleluasaan untuk tabel `wishlists`
--
ALTER TABLE `wishlists`
  ADD CONSTRAINT `wishlists_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `wishlists_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
