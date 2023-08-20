-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Aug 20, 2023 at 06:35 PM
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
-- Database: `homeservicesdb`
--

-- --------------------------------------------------------

--
-- Table structure for table `bookings`
--

CREATE TABLE `bookings` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `service_id` bigint(20) UNSIGNED NOT NULL,
  `address` varchar(255) NOT NULL,
  `street_number` varchar(255) NOT NULL,
  `route` varchar(255) NOT NULL,
  `city` varchar(255) NOT NULL,
  `state` varchar(255) NOT NULL,
  `country` varchar(255) NOT NULL,
  `zipcode` varchar(255) NOT NULL,
  `payment_type` enum('cash','card') NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `contacts`
--

CREATE TABLE `contacts` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `phone` varchar(255) NOT NULL,
  `message` text NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `contacts`
--

INSERT INTO `contacts` (`id`, `name`, `email`, `phone`, `message`, `created_at`, `updated_at`) VALUES
(1, 'akib', 'akib@gmail.com', '01235646849', 'test message', '2023-08-17 07:50:17', '2023-08-17 07:50:17'),
(2, 'turjo', 'turjo@gmail.com', '01235459656', 'test message', '2023-08-17 07:52:07', '2023-08-17 07:52:07');

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
(3, '2014_10_12_200000_add_two_factor_columns_to_users_table', 1),
(4, '2019_08_19_000000_create_failed_jobs_table', 1),
(5, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(6, '2023_08_04_035408_create_sessions_table', 1),
(7, '2023_08_05_162730_add_phone_to_users_table', 2),
(9, '2023_08_08_113503_create_service_categories_table', 3),
(10, '2023_08_12_153406_create_services_table', 4),
(11, '2023_08_15_085634_add_featured_to_services_table', 5),
(12, '2023_08_15_121049_add_featured_to_service_categories_table', 6),
(13, '2023_08_16_032706_create_sliders_table', 7),
(14, '2023_08_16_173412_create_service_providers_table', 8),
(15, '2023_08_17_124425_create_contacts_table', 9),
(16, '2023_08_19_131951_create_bookings_table', 10);

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
-- Table structure for table `services`
--

CREATE TABLE `services` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `slug` varchar(255) NOT NULL,
  `tagline` varchar(255) NOT NULL,
  `service_category_id` bigint(20) UNSIGNED DEFAULT NULL,
  `price` decimal(8,2) NOT NULL,
  `discount` decimal(8,2) DEFAULT NULL,
  `discount_type` enum('fixed','percent') DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  `thumbnail` varchar(255) DEFAULT NULL,
  `description` longtext DEFAULT NULL,
  `inclusion` longtext DEFAULT NULL,
  `exclusion` longtext DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `featured` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `services`
--

INSERT INTO `services` (`id`, `name`, `slug`, `tagline`, `service_category_id`, `price`, `discount`, `discount_type`, `image`, `thumbnail`, `description`, `inclusion`, `exclusion`, `status`, `created_at`, `updated_at`, `featured`) VALUES
(1, 'sit sed doloribus eos', 'sit-sed-doloribus-eos', 'Voluptatum.', 19, 303.00, NULL, NULL, 'service_19.jpg', 'service_19.jpg', 'Saepe rerum consequatur voluptatem totam et. In consequatur incidunt eos sint dicta accusantium. Officiis aut sunt odit reiciendis voluptatem possimus. Est velit et ut velit cupiditate eum. Aliquid quia rem explicabo explicabo. Dolores quia temporibus totam adipisci porro qui quasi. Ut facilis consequatur illum deserunt aut. Facere nobis omnis pariatur animi.', 'Cupiditate suscipit.|Ut distinctio dolor.|Dolores nihil non.|Maxime id eum.|Officia itaque.', 'In nesciunt dolorem.|Et hic nemo harum.|Doloremque ut aut.|Temporibus quidem.|Ea alias qui itaque.', 1, '2023-08-12 10:39:18', '2023-08-12 10:39:18', 0),
(2, 'aut corrupti et asperiores', 'aut-corrupti-et-asperiores', 'Quos inventore.', 12, 353.00, NULL, NULL, 'service_4.jpg', 'service_4.jpg', 'aut corrupti et asperiores', 'Rerum labore.|Voluptatum.|Aperiam recusandae.|Laborum officiis.|Accusamus quia sint.', 'Repellat laboriosam.|Nihil minus et ut.|Maiores libero.|Deserunt enim.|Ipsum impedit quia.', 1, '2023-08-12 10:39:18', '2023-08-15 05:35:55', 1),
(3, 'sapiente et animi sequi', 'sapiente-et-animi-sequi', 'Quo dolores.', 16, 482.00, NULL, NULL, 'service_2.jpg', 'service_2.jpg', 'sapiente et animi sequi', 'Sunt nulla animi.|Impedit animi natus.|Quia sunt natus.|Est soluta optio.|Nesciunt eos.', 'Sunt sequi illum.|Non magnam quis.|Repellendus optio.|Quia voluptatibus.|Nostrum iste in.', 1, '2023-08-12 10:39:18', '2023-08-15 05:36:12', 1),
(4, 'dolorum architecto eligendi quia', 'dolorum-architecto-eligendi-quia', 'Aut modi sint ut.', 9, 470.00, NULL, NULL, 'service_7.jpg', 'service_7.jpg', 'Sequi vel sit sit consequatur tempora nemo delectus. Itaque a quia tenetur reiciendis mollitia. Corrupti eum similique aut est modi illum aliquam cupiditate. Ut officiis recusandae excepturi aut. Eos non optio explicabo sed id. Voluptatem itaque aut ab quisquam molestiae qui. Est cumque beatae laboriosam aspernatur error placeat. Praesentium deserunt qui molestiae id nam et. Debitis numquam quia voluptatem illum illum omnis.', 'Et eum quis et sunt.|Sit nemo voluptas.|Consequatur.|Quam consectetur et.|Qui modi id sunt.', 'Qui quidem voluptas.|Similique quia.|Rerum sequi nisi.|Consequatur omnis.|Quaerat maiores.', 1, '2023-08-12 10:39:18', '2023-08-12 10:39:18', 0),
(5, 'eius sequi quidem aliquam', 'eius-sequi-quidem-aliquam', 'At deleniti beatae.', 11, 239.00, NULL, NULL, 'service_12.jpg', 'service_12.jpg', 'eius sequi quidem aliquam', 'Qui dolorem eius.|Voluptatem tempore.|Officiis asperiores.|Ducimus repellendus.|Nulla dicta omnis.', 'Cupiditate nihil.|Et quas error odit.|Illum voluptates.|Laudantium ut ut.|Ducimus sit.', 1, '2023-08-12 10:39:18', '2023-08-15 05:36:35', 1),
(6, 'sit labore amet qui', 'sit-labore-amet-qui', 'Id totam ipsa in.', 1, 452.00, NULL, NULL, 'service_14.jpg', 'service_14.jpg', 'sit labore amet qui', 'Velit repellendus.|Delectus quia.|In culpa et quia.|Dolore dolores.|Esse sint dolor.', 'Magnam aliquid.|Qui earum possimus.|Quibusdam.|Consequuntur ipsum.|Ut voluptatem.', 1, '2023-08-12 10:39:18', '2023-08-15 05:38:14', 1),
(7, 'qui nemo voluptas aut', 'qui-nemo-voluptas-aut', 'Nulla non nihil sit.', 14, 455.00, NULL, NULL, 'service_8.jpg', 'service_8.jpg', 'qui nemo voluptas aut', 'Esse perspiciatis.|Voluptatem alias.|Porro tenetur et.|Pariatur possimus.|Et totam provident.', 'Et non non enim.|A totam id.|Cumque non ea ipsum.|Tempora ea illo qui.|Nam rerum.', 1, '2023-08-12 10:39:18', '2023-08-15 05:38:29', 1),
(8, 'nobis quisquam fugiat sint', 'nobis-quisquam-fugiat-sint', 'Et omnis ullam quos.', 8, 374.00, NULL, NULL, 'service_5.jpg', 'service_5.jpg', 'nobis quisquam fugiat sint', 'Est corrupti.|Veritatis omnis.|Doloribus et.|Exercitationem est.|Deserunt eaque.', 'Qui velit et.|Quas saepe eos.|Sint vitae quas et.|Sequi quisquam cum.|Quisquam veniam.', 1, '2023-08-12 10:39:18', '2023-08-15 05:38:44', 1),
(9, 'quia perspiciatis et nobis', 'quia-perspiciatis-et-nobis', 'Hic reprehenderit.', 20, 250.00, NULL, NULL, 'service_6.jpg', 'service_6.jpg', 'quia perspiciatis et nobis', 'Sed totam eaque.|Facere dolores.|Delectus.|Voluptas et porro.|Tempore in ullam id.', 'Omnis aut minus.|Consectetur.|Ut voluptatem.|Aut aliquam.|Dolorum tempora.', 1, '2023-08-12 10:39:18', '2023-08-15 05:36:53', 1),
(11, 'quia corrupti quibusdam vero', 'quia-corrupti-quibusdam-vero', 'Quod et voluptate.', 12, 372.00, NULL, NULL, 'service_13.jpg', 'service_13.jpg', 'quia corrupti quibusdam vero', 'Quibusdam quisquam.|Quidem molestias.|Ad omnis voluptates.|Explicabo ea animi.|Commodi eos ipsum.', 'Tenetur voluptate.|Est error voluptate.|Aut non quibusdam.|Aliquam architecto.|Dolores est cumque.', 1, '2023-08-12 10:39:18', '2023-08-15 05:37:16', 1),
(12, 'qui atque error ducimus', 'qui-atque-error-ducimus', 'Incidunt eum illo.', 17, 293.00, NULL, NULL, 'service_17.jpg', 'service_17.jpg', 'Adipisci reprehenderit corporis nihil et. Minima maxime velit nostrum hic. Vel unde debitis est totam dicta nihil ex. Iusto cumque iste vel et. Culpa numquam deserunt facilis temporibus qui veritatis explicabo. Quibusdam hic laborum excepturi voluptates omnis est ducimus. Aperiam aut est ea.', 'Occaecati nesciunt.|Officiis mollitia.|Ut assumenda quia.|Sed deserunt et ea.|Aliquid vel beatae.', 'Sit quasi.|Soluta ut hic.|Eaque molestias.|Molestiae sit neque.|Asperiores sunt.', 1, '2023-08-12 10:39:18', '2023-08-12 10:39:18', 0),
(13, 'sed dignissimos repellat voluptate', 'sed-dignissimos-repellat-voluptate', 'Labore sunt ad.', 4, 403.00, NULL, NULL, 'service_9.jpg', 'service_9.jpg', 'Omnis maiores repellendus quia quasi consequuntur dicta. Id voluptatem reiciendis soluta mollitia quisquam. Nostrum labore ut vel id voluptatem nostrum. Fuga cum quo ipsa quia. Quia natus perferendis ea sunt maxime. Id nobis tenetur possimus aliquam ea est dolore qui. Sapiente corrupti quo debitis culpa qui autem corporis. Aut occaecati et beatae aut distinctio corrupti.', 'Ea nostrum.|Sapiente sit saepe.|Asperiores est quo.|Suscipit dolor et.|Mollitia beatae.', 'Eum in qui fugiat.|Id consequatur.|Molestias et quos.|Ipsum eaque omnis.|Velit dignissimos.', 1, '2023-08-12 10:39:18', '2023-08-12 10:39:18', 0),
(14, 'enim qui qui cumque', 'enim-qui-qui-cumque', 'Exercitationem est.', 2, 382.00, NULL, NULL, 'service_11.jpg', 'service_11.jpg', 'Inventore architecto veritatis et non laborum eligendi autem. Nostrum ab facilis vero et. Voluptatem consequatur nemo saepe ullam atque delectus. Iusto nihil repellendus qui officia aperiam expedita. Ea ducimus voluptates vel enim ut sit. Quos ipsam doloribus ut tempora. Architecto voluptatibus necessitatibus voluptatem omnis. Delectus vero voluptatem sed pariatur asperiores.', 'Animi quam quis.|Et iusto eum enim.|Fugit vel in.|Ut dignissimos sit.|Error itaque eum.', 'Nemo corrupti.|Et dolor unde.|Cum quis sed ut sit.|Ut neque repellat.|Et hic sit omnis.', 1, '2023-08-12 10:39:18', '2023-08-12 10:39:18', 0),
(15, 'impedit aut enim sed', 'impedit-aut-enim-sed', 'Consectetur quos.', 6, 109.00, NULL, NULL, 'service_10.jpg', 'service_10.jpg', 'Dolorem assumenda dolorem quam nihil harum. Laborum velit placeat ut quisquam molestiae corrupti. Totam hic in impedit quia in. Et rerum numquam doloribus porro quod. Quam natus laboriosam unde impedit accusamus. Non quo ipsum exercitationem numquam. Placeat nisi est dolores vel repellat quia. Voluptates recusandae perspiciatis incidunt ut ab. Sunt veniam velit porro ducimus sint dolor.', 'Inventore quisquam.|Inventore hic autem.|Voluptatem nisi.|Qui error vel.|Qui repudiandae id.', 'Voluptas tenetur et.|Ratione qui iure.|Eveniet atque.|Soluta porro nemo.|Eos delectus dolor.', 1, '2023-08-12 10:39:18', '2023-08-12 10:39:18', 0),
(16, 'quo aut sed illum', 'quo-aut-sed-illum', 'Sint explicabo.', 14, 393.00, NULL, NULL, 'service_3.jpg', 'service_3.jpg', 'Porro nihil voluptatum dignissimos. Reprehenderit possimus totam modi rerum eos incidunt. Dignissimos provident ut facere et. Voluptatem accusantium aliquid ratione accusamus. Quo tempora atque sint rem et et architecto. Ab mollitia similique magnam tempora est aut. Omnis eos qui culpa id quo consectetur. Aut molestiae velit neque sunt omnis. Voluptatem alias eaque officia autem assumenda officia unde. Accusamus dolorem consequatur sed at omnis tempore.', 'Molestiae ut autem.|Ipsam enim.|Velit qui tenetur.|Eveniet tempore.|Quo ab molestias.', 'Nulla voluptatem.|Temporibus.|Nam quidem error.|Unde repellendus.|Molestiae qui.', 1, '2023-08-12 10:39:18', '2023-08-12 10:39:18', 0),
(17, 'dolor impedit qui natus', 'dolor-impedit-qui-natus', 'Voluptas qui dolor.', 16, 479.00, NULL, NULL, 'service_1.jpg', 'service_1.jpg', 'Quo ut accusamus enim vitae possimus tempora. Doloribus autem impedit maiores commodi. Quia corporis et praesentium soluta consectetur fugit praesentium ea. Ut assumenda consequatur accusamus eius nulla reprehenderit. Neque et quis voluptas qui. Aliquam reprehenderit voluptatibus tempore quidem optio et. Distinctio accusamus aut sapiente molestiae.', 'Ut id sit fugit est.|Et non quis eaque.|Adipisci.|Et odio autem qui.|Eum reprehenderit.', 'Voluptatibus.|Eos aut excepturi.|Iste labore fuga.|In et optio in est.|Aut consequatur qui.', 1, '2023-08-12 10:39:18', '2023-08-12 10:39:18', 0),
(18, 'voluptate unde veritatis est', 'voluptate-unde-veritatis-est', 'Fugit temporibus.', 1, 492.00, NULL, NULL, 'service_18.jpg', 'service_18.jpg', 'Amet voluptas cumque quaerat dolorum corrupti ut. Dolores eveniet soluta voluptatem unde consequatur id. Libero id culpa accusamus quas nobis et consectetur. Saepe soluta nisi dolor id dolorum quo. Minus autem vel adipisci et. Provident rem quae rerum eos illum dolore molestias. Beatae quam aut ut eveniet magni dolore a. Totam ut facere iste aperiam aut. Aut omnis repellendus maxime molestias. Maiores iste quibusdam reiciendis excepturi quis modi.', 'Quam et minima.|Autem velit dolores.|Itaque odit.|At beatae numquam.|Doloribus velit.', 'Illo quisquam.|Sit nihil labore.|Omnis est qui.|Eum veniam maiores.|Aut atque omnis.', 1, '2023-08-12 10:39:18', '2023-08-12 10:39:18', 0),
(19, 'cum quis quaerat quas', 'cum-quis-quaerat-quas', 'Qui ipsa quia illum.', 19, 172.00, NULL, NULL, 'service_20.jpg', 'service_20.jpg', 'Veniam minus fugiat hic in. Dolorem impedit consequatur qui totam. Ex eius iusto quo temporibus consequatur quia. Temporibus qui blanditiis non praesentium delectus quis nam eum. Rerum est et ut architecto et recusandae qui. Quas voluptas ut voluptatem magnam non aut nisi. Vel quam ratione molestiae consequatur est odit placeat. Eos aut ipsa mollitia quia. Alias non eos et fugit. Harum praesentium aliquid eligendi aspernatur sit sequi ut.', 'Alias perspiciatis.|Rerum qui facere.|Animi a et quisquam.|Deserunt voluptatem.|Est voluptas.', 'Assumenda aut.|Voluptate eveniet.|Consequatur.|Blanditiis.|Quia quia dolorem.', 1, '2023-08-12 10:39:18', '2023-08-12 10:39:18', 0),
(20, 'vel aut et hic', 'vel-aut-et-hic', 'Sit tenetur est non.', 9, 411.00, NULL, NULL, 'service_15.jpg', 'service_15.jpg', 'Ad numquam consequatur molestiae voluptatem blanditiis voluptatum totam. Qui aut qui officiis. Voluptatem ullam vel ut vero. Quaerat ad nam praesentium nihil quasi iusto veritatis. Dolorem magnam facilis autem similique. Nihil asperiores sint voluptates repellat est laboriosam libero. Est veniam sit nostrum ut.', 'Incidunt nulla ea.|Mollitia assumenda.|In ea dolorum.|Soluta est sit odio.|Est doloremque et.', 'Incidunt qui animi.|Explicabo assumenda.|A quos et delectus.|Est aperiam.|Ut eos consequuntur.', 1, '2023-08-12 10:39:18', '2023-08-12 10:39:18', 0),
(21, 'hic provident nesciunt sit', 'hic-provident-nesciunt-sit', 'Praesentium quo.', 18, 226.00, NULL, NULL, 'service_4.jpg', 'service_4.jpg', 'hic provident nesciunt sit', 'In eligendi vitae.|Labore aliquam.|Dicta enim dicta.|Aut neque repellat.|Quia dolor eius.', 'Aut magni sapiente.|Enim dolor odio ut.|Culpa et minus.|Mollitia nesciunt.|Sint dicta at rerum.', 1, '2023-08-13 09:37:20', '2023-08-15 05:39:37', 1),
(22, 'ex deleniti aut laborum', 'ex-deleniti-aut-laborum', 'Aut nisi quia.', 20, 390.00, NULL, NULL, 'service_2.jpg', 'service_2.jpg', 'Molestias maiores laboriosam quis. Iusto blanditiis quo molestiae. Ea architecto animi repudiandae magnam. Amet sequi quaerat id eos. Illum sint aperiam est enim vitae voluptatum assumenda. Quidem quaerat commodi animi et officia consequuntur. Vel debitis error nisi excepturi nulla vero modi. Qui ipsam in qui qui ex at.', 'Temporibus id dolor.|Consectetur quo.|Occaecati.|Et voluptates.|Accusamus quam.', 'Voluptate ut eum.|Est delectus.|Vitae corporis.|Atque sint.|Ex quasi et qui.', 1, '2023-08-13 09:37:20', '2023-08-13 09:37:20', 0),
(23, 'distinctio a alias possimus', 'distinctio-a-alias-possimus', 'Consequatur nulla.', 19, 354.00, NULL, NULL, 'service_17.jpg', 'service_17.jpg', 'Tenetur unde culpa distinctio qui. Quis doloremque inventore repellat sint. Ut occaecati et sint expedita veniam quis. Necessitatibus veritatis quia dolorum est et voluptatibus. Saepe inventore maxime optio debitis. Velit et nobis rerum. Fugiat quis aut soluta non enim. Nostrum aut iste voluptatem eos quod voluptatem. Deleniti molestiae ratione est laborum. Dolorem reiciendis recusandae nesciunt est saepe non aut voluptatibus. Magni pariatur ut aliquam velit placeat voluptas.', 'Illo et nemo dolor.|Necessitatibus a.|Sunt eum magni at.|Repellendus.|Commodi consequatur.', 'Quaerat ducimus.|Velit in architecto.|Odit quaerat et.|Repellendus esse.|Animi ut fugit.', 1, '2023-08-13 09:37:20', '2023-08-13 09:37:20', 0),
(24, 'unde enim ipsa eius', 'unde-enim-ipsa-eius', 'Nisi fugiat.', 20, 374.00, NULL, NULL, 'service_18.jpg', 'service_18.jpg', 'Tenetur voluptas deleniti neque itaque eum. Voluptas ratione minima tempore atque atque. Nam nihil nulla eum natus consequatur pariatur. Iste odit aperiam ad voluptatibus incidunt veniam quia. Explicabo voluptatum est numquam ab. Adipisci est officiis quis amet. Dolor sapiente dicta sunt hic. Modi quaerat perspiciatis quas inventore quae voluptatem voluptatibus. Iure minima dolores laudantium ratione. Et autem fugit est ut reprehenderit.', 'Itaque delectus.|Excepturi repellat.|Qui at voluptate.|Labore delectus.|Optio qui animi.', 'Nostrum nostrum ad.|Harum nam fugit.|Eligendi ea dolor.|Consequatur ducimus.|Minima harum et quo.', 1, '2023-08-13 09:37:20', '2023-08-13 09:37:20', 0),
(25, 'consectetur ut voluptas sed', 'consectetur-ut-voluptas-sed', 'Tempora minus velit.', 4, 261.00, NULL, NULL, 'service_19.jpg', 'service_19.jpg', 'Eius et illo laborum itaque. Perferendis eum sapiente aut. Sequi corrupti aut consectetur non. Omnis deleniti ex est et voluptates. Occaecati blanditiis quam ut temporibus nesciunt. Non error modi in commodi velit. Esse nobis ullam nulla sint. Debitis at odio voluptatem accusamus voluptatem. Deleniti labore illo voluptatum alias magnam. Culpa omnis exercitationem natus quisquam qui eum qui. Delectus facere atque officiis dolorem nam. Eligendi id eos veniam non et reiciendis saepe mollitia.', 'Quisquam qui.|Voluptas harum.|Odio placeat.|Qui maxime ab qui.|Molestias et.', 'Quia eius iure.|Autem libero fuga.|Non aspernatur.|Aut perspiciatis.|Ipsum numquam quia.', 1, '2023-08-13 09:37:20', '2023-08-13 09:37:20', 0),
(26, 'veniam consectetur quos perferendis', 'veniam-consectetur-quos-perferendis', 'Id omnis nulla.', 7, 179.00, NULL, NULL, 'service_12.jpg', 'service_12.jpg', 'Omnis iusto fugit tempore voluptas eos. Et tempora ut quis nulla. Maxime quod qui eaque voluptatibus. Quo quia id consequatur nemo ut excepturi repudiandae. Aut delectus autem ducimus aut ut. Expedita nemo est rerum saepe. Voluptatem ea nesciunt autem quaerat magnam. Qui maxime deleniti nostrum. Quos vero quia mollitia reiciendis. Est voluptates harum quia. Saepe rerum sed quam sed accusamus cumque rerum. Et nihil consequuntur et odio magni commodi aperiam. Et est perspiciatis ullam ad.', 'Ad iste provident.|Et quibusdam quos.|Sunt voluptates ut.|Autem et soluta.|Tempore.', 'Id quis expedita.|Et eos atque qui.|Et iste nostrum.|Dignissimos earum.|Repudiandae earum.', 1, '2023-08-13 09:37:20', '2023-08-13 09:37:20', 0),
(27, 'corporis illo sequi saepe', 'corporis-illo-sequi-saepe', 'Dolorum fuga quas.', 19, 293.00, NULL, NULL, 'service_8.jpg', 'service_8.jpg', 'Accusantium aut alias possimus velit porro cupiditate. A sed quia omnis quae corrupti. Ipsam exercitationem ut aliquam voluptatum. Quos vel voluptas ratione similique et. Vero reprehenderit occaecati fugiat laborum veniam ad sapiente. Praesentium quod voluptas minus vel nemo placeat. Et accusantium ut delectus. Et eius quos in architecto eos. Nam aliquam occaecati eligendi consequatur. Id et commodi asperiores numquam inventore adipisci. Eos voluptate sequi placeat.', 'Optio doloribus.|Eum eos et earum.|Distinctio aut.|Molestias harum.|Laboriosam eos sit.', 'Maxime atque beatae.|Voluptate sit et.|Perspiciatis.|Quas dignissimos.|Libero laboriosam.', 1, '2023-08-13 09:37:20', '2023-08-13 09:37:20', 0),
(28, 'animi quaerat facilis omnis', 'animi-quaerat-facilis-omnis', 'Ipsam sit optio et.', 2, 226.00, NULL, NULL, 'service_6.jpg', 'service_6.jpg', 'Exercitationem velit corporis sed quas id qui. Illum aspernatur molestias molestias minima. Nesciunt et at nihil dignissimos iste ut quisquam. Minus aut eum velit. Voluptatem mollitia autem vel voluptas excepturi in ipsam. Ipsa voluptas illum et architecto. Deleniti libero distinctio quas non dolorem velit ea. Aut qui qui est labore quis a. Perferendis facilis animi placeat quod. Tenetur temporibus et accusantium cupiditate esse totam.', 'A maiores unde quia.|Dolores cum nihil.|Et rerum non ipsam.|Corporis qui magni.|Magnam tempora modi.', 'Recusandae totam.|Labore vitae.|Libero.|Id ea repellat ut.|Quia labore.', 1, '2023-08-13 09:37:20', '2023-08-13 09:37:20', 0),
(29, 'quis eius magni cumque', 'quis-eius-magni-cumque', 'Sed sunt nulla.', 18, 180.00, NULL, NULL, 'service_9.jpg', 'service_9.jpg', 'Et id vel molestiae ducimus vero harum. Quia omnis culpa eos facilis fuga quas. Vitae nobis corrupti libero necessitatibus nihil magni odio ut. Officiis atque sed omnis fugit aut non. Iste quaerat facere qui necessitatibus velit et provident. Voluptas et eligendi inventore quia. Dolores quisquam quia qui autem itaque expedita tempora in. Vero commodi aut omnis sed illo hic. Non sunt amet voluptas nobis ut explicabo at quia.', 'Deleniti architecto.|Est natus quia.|Quos nostrum nemo.|Harum laudantium.|Qui voluptas quidem.', 'Esse enim.|Odit delectus nisi.|Exercitationem.|Aspernatur.|Blanditiis illum.', 1, '2023-08-13 09:37:20', '2023-08-13 09:37:20', 0),
(30, 'labore amet odio voluptatem', 'labore-amet-odio-voluptatem', 'Cupiditate et odio.', 17, 349.00, NULL, NULL, 'service_3.jpg', 'service_3.jpg', 'labore amet odio voluptatem', 'Excepturi amet.|Rerum ut.|Consectetur cum.|Dolor repellat.|Et tenetur officiis.', 'Omnis debitis.|Velit est quibusdam.|Quod quisquam nobis.|Tenetur adipisci.|Cupiditate nihil.', 1, '2023-08-13 09:37:20', '2023-08-15 05:40:12', 1),
(31, 'et nulla perferendis ducimus', 'et-nulla-perferendis-ducimus', 'Modi eos totam.', 10, 498.00, NULL, NULL, 'service_14.jpg', 'service_14.jpg', 'Nemo itaque rem in ut veritatis rerum. Corporis optio sapiente modi. Non et occaecati eum ratione aut. Aut aut ea libero. Aut omnis et assumenda voluptas dolores asperiores. Vero dolorum dolor corporis explicabo dicta at. Quos et distinctio et ipsum suscipit laboriosam numquam. Animi nostrum autem ad qui consequatur facilis at. Laborum soluta voluptas ducimus vero assumenda eius. Accusamus sapiente id saepe est non mollitia consequuntur saepe. In itaque reprehenderit maiores delectus tenetur.', 'Quo et earum aut.|Cum earum voluptas.|Sit eum doloremque.|Odio cum corrupti.|Ea minus distinctio.', 'Accusamus et.|Porro saepe et.|Reiciendis ad.|Ut provident maxime.|Alias optio et.', 1, '2023-08-13 09:37:20', '2023-08-13 09:37:20', 0),
(32, 'velit veniam deserunt magnam', 'velit-veniam-deserunt-magnam', 'Voluptatem laborum.', 5, 125.00, NULL, NULL, 'service_1.jpg', 'service_1.jpg', 'Natus mollitia impedit ut est vel et. Aperiam earum numquam repudiandae reiciendis. Perspiciatis id tempore eius aliquam qui pariatur cumque. Velit optio fugit aliquam voluptas molestiae soluta ut. Blanditiis sunt culpa aut quidem ullam eius dicta. Est ut dicta et voluptatibus. Ea vero ipsam architecto et. Voluptatem qui eveniet omnis optio possimus in. Maiores praesentium dolor quam pariatur nam quae. Animi numquam sed quia debitis illo.', 'Aliquam quae maxime.|Sed deleniti.|Aut corrupti ea aut.|Suscipit et quia.|Est praesentium.', 'Sint ut accusantium.|Earum velit aut.|Occaecati ab.|In est nulla.|A alias doloremque.', 1, '2023-08-13 09:37:20', '2023-08-13 09:37:20', 0),
(33, 'vitae ipsam aut et', 'vitae-ipsam-aut-et', 'Totam perspiciatis.', 19, 109.00, NULL, NULL, 'service_15.jpg', 'service_15.jpg', 'Delectus odit nobis amet explicabo omnis velit quam delectus. Ipsam consequatur repellendus est. Dolorem similique est eos pariatur alias eos molestias sit. Architecto fuga aut earum. Alias officiis repellendus numquam nihil ut. Qui dignissimos eos qui unde culpa natus. Consectetur eum ab at qui ut nam. Qui vitae exercitationem repellat nihil illum est. Neque doloribus cumque corporis dicta at magnam tempore. Nihil aut sapiente dicta aut dolorem. Fugit unde saepe rem iusto.', 'Qui est quia non.|Quisquam velit.|Laudantium qui eos.|Earum fugit.|Consequuntur id ut.', 'Optio beatae porro.|Perspiciatis.|Illo et dolor.|Dolor facere est.|Ipsum porro beatae.', 1, '2023-08-13 09:37:20', '2023-08-13 09:37:20', 0),
(34, 'in expedita soluta incidunt', 'in-expedita-soluta-incidunt', 'Est aut nostrum.', 10, 313.00, NULL, NULL, 'service_13.jpg', 'service_13.jpg', 'Odio et illum et aut quos enim. Quaerat voluptate velit mollitia. Quidem omnis eaque blanditiis ea cumque dolor culpa. Ut quae et pariatur minima in cumque quia. Debitis consectetur omnis molestiae nihil dolores vel. Non est consequatur sint delectus in. Repellat et vero tempora quae ex nisi laudantium.', 'Molestias repellat.|Voluptatem minus.|Nemo distinctio ab.|Ab unde molestiae.|Ea blanditiis.', 'Ipsa et quos minima.|Eos laborum ipsam.|At reprehenderit et.|Magni ut ullam.|Voluptas quas sequi.', 1, '2023-08-13 09:37:20', '2023-08-13 09:37:20', 0),
(35, 'dolores qui et sed', 'dolores-qui-et-sed', 'Recusandae.', 14, 139.00, NULL, NULL, 'service_16.jpg', 'service_16.jpg', 'Rem sit recusandae esse. Ea et adipisci corporis. Voluptas dolore iusto cupiditate. Incidunt beatae consequatur non voluptas et voluptates. Autem qui dicta numquam non. Reprehenderit tempore eligendi vero vel quam aliquid libero. Perferendis expedita cupiditate aspernatur impedit numquam. Consectetur commodi rerum vel sunt accusantium eos. Possimus et aspernatur quod dolores. Eius et corrupti quisquam natus delectus magnam est.', 'Porro et et.|Fugiat sint quaerat.|A est soluta magnam.|Incidunt.|Voluptatibus.', 'Exercitationem.|Et nam sit rerum.|Sit quo earum dolor.|Illo sequi vitae.|Totam animi.', 1, '2023-08-13 09:37:20', '2023-08-13 09:37:20', 0),
(36, 'occaecati iusto debitis nisi', 'occaecati-iusto-debitis-nisi', 'Praesentium et.', 8, 145.00, NULL, NULL, 'service_7.jpg', 'service_7.jpg', 'Laboriosam sunt fugit temporibus quod magni aut fugiat ad. Tenetur saepe non rerum consectetur rem. Officiis aliquam et nulla aperiam sunt qui nam. Non consequatur qui sint sint dolor nisi. Et quia necessitatibus enim ut. In qui quasi rem molestias labore quasi expedita qui. Aspernatur ut id ex assumenda sit asperiores. Dolor quos aliquid veritatis sit. Dolorum consequatur odit rem expedita rerum sit eveniet. Itaque nihil officiis voluptas laborum libero excepturi nobis.', 'Tempore qui.|Magnam facilis.|Molestiae.|Repellendus.|Tempore qui est.', 'Quidem in nemo.|Odit qui doloribus.|Ea ratione commodi.|Officia possimus.|Iure vitae omnis.', 1, '2023-08-13 09:37:20', '2023-08-13 09:37:20', 0),
(37, 'est at aperiam odio', 'est-at-aperiam-odio', 'Qui et ad similique.', 4, 100.00, NULL, NULL, 'service_11.jpg', 'service_11.jpg', 'Ut esse et nam sapiente est alias. Harum quibusdam et aspernatur et quia. Ut iste commodi in eligendi occaecati molestias officia. Laboriosam et ut rerum dolorem modi explicabo et. Debitis praesentium tenetur dolore necessitatibus nemo eaque. Doloribus non aliquid nobis asperiores illo nihil. Velit optio recusandae et dolores. Dolore harum quod vero ut aspernatur laboriosam.', 'Incidunt et impedit.|Est neque.|In doloribus.|Officia nisi fugiat.|Necessitatibus.', 'Distinctio iure.|Cupiditate.|Minima facilis.|Non et repellat.|Nobis est quia.', 1, '2023-08-13 09:37:20', '2023-08-13 09:37:20', 0),
(38, 'et ut quia et', 'et-ut-quia-et', 'Nobis hic.', 5, 325.00, NULL, NULL, 'service_5.jpg', 'service_5.jpg', 'Iure odit aut dolorum eum quod aut autem maxime. Facere at placeat aperiam commodi voluptas harum. Est quos aut nobis. Est voluptas aut tenetur minus qui expedita magnam. Perferendis exercitationem dolor velit fuga officiis et. Fugit provident aut dolores odio. Quia laudantium culpa quas dolores dolorem eos laboriosam ab. Laborum sunt et dolor mollitia quaerat labore ut. Aperiam molestiae maiores quia veniam. Sint dolores non ratione quis consequuntur.', 'Nihil sint maiores.|Harum consectetur.|Consectetur iure.|Ut vel nulla et est.|Doloremque expedita.', 'Dolorem odit.|Occaecati est non.|Sequi voluptatem ex.|Id sed voluptas.|Facilis et quia et.', 1, '2023-08-13 09:37:20', '2023-08-13 09:37:20', 0),
(39, 'ut repellat est sequi', 'ut-repellat-est-sequi', 'Quisquam eum quia.', 14, 420.00, NULL, NULL, 'service_10.jpg', 'service_10.jpg', 'Neque magnam minus repellat. Consequatur eos nihil voluptas fugiat maiores molestiae animi. Sunt possimus excepturi rerum possimus provident tempora porro ut. Laboriosam hic soluta alias hic nesciunt quibusdam. Est aspernatur non et minima. Beatae exercitationem veritatis perferendis molestias. Cum sequi illum animi vitae. Sunt vero corporis blanditiis. Repellendus voluptas soluta labore debitis tempora totam dolorum.', 'Blanditiis adipisci.|Minus est tenetur.|Placeat consectetur.|Optio cum debitis.|Est qui natus.', 'Possimus sapiente.|Ea voluptatum.|Et qui voluptas.|Ut dolore tempora.|Doloribus optio aut.', 1, '2023-08-13 09:37:20', '2023-08-13 09:37:20', 0),
(40, 'aliquam velit ut recusandae', 'aliquam-velit-ut-recusandae', 'Architecto.', 6, 374.00, NULL, NULL, 'service_20.jpg', 'service_20.jpg', 'Quis voluptatum ut omnis et voluptas error iste. Qui iste nostrum fugit eum hic. Quia et ea ut voluptas incidunt possimus voluptatem. Autem rem fuga illum quia quia placeat. Non voluptatibus tempore sunt labore. Numquam dignissimos cupiditate minus sunt cum. Sunt beatae laboriosam ea sed est commodi. Est iure voluptas sed maiores est totam. Beatae odit odit quae nobis minus saepe est. Deserunt consequatur ipsam sit et reprehenderit praesentium voluptas.', 'Beatae quis eos.|Dolorem maxime quo.|Nesciunt atque.|Officia harum.|Quos debitis ut.', 'Quo minima numquam.|Cum nemo corporis.|Eius aut qui sed.|Alias fuga.|Voluptates qui.', 1, '2023-08-13 09:37:20', '2023-08-13 09:37:20', 0),
(41, 'consequatur exercitationem fugit facere', 'consequatur-exercitationem-fugit-facere', 'Animi maxime.', 15, 468.00, NULL, NULL, 'service_15.jpg', 'service_15.jpg', 'Magnam qui sed ut in dolores quibusdam unde tempora. Delectus perspiciatis quidem quaerat voluptatem velit. Et vitae cupiditate et ipsa voluptas quo. Hic deserunt aut impedit consectetur cupiditate consequatur. Cum et explicabo et voluptatibus et aliquam ex autem. Voluptas aperiam quis nulla facilis.', 'Recusandae maiores.|Quibusdam id.|Aut ut aut quia.|Ex architecto.|Dolor voluptatem id.', 'Corrupti soluta.|Esse impedit.|Placeat id nemo et.|Excepturi ut nobis.|Molestiae quibusdam.', 1, '2023-08-16 11:02:47', '2023-08-16 11:02:47', 0),
(42, 'ab quia quis ullam', 'ab-quia-quis-ullam', 'Est provident est.', 8, 185.00, NULL, NULL, 'service_17.jpg', 'service_17.jpg', 'Laudantium unde accusantium sint. Voluptas esse magnam cumque magnam. Consequatur ab sit nam temporibus laborum qui. Non similique architecto ea sit sed totam veniam. Necessitatibus et sint possimus quae ut. Rerum tempore labore eaque explicabo recusandae eos. Eaque voluptatum corporis nisi velit saepe. Qui aut hic aut consequatur magni. Maiores quis dicta voluptatem soluta nisi. Velit quae rerum voluptates deleniti. Doloribus consectetur quia commodi.', 'Ipsam ab voluptatem.|Eaque quia placeat.|Vero quo dolor aut.|Eius ut est est.|Omnis ex quia.', 'Excepturi quia.|Rerum vitae rerum.|Vitae beatae eius.|Ullam dicta dolores.|Minus aperiam sed.', 1, '2023-08-16 11:02:47', '2023-08-16 11:02:47', 0),
(43, 'aut atque similique rerum', 'aut-atque-similique-rerum', 'Dolores dolor.', 20, 446.00, NULL, NULL, 'service_8.jpg', 'service_8.jpg', 'Nulla libero cupiditate voluptatem et sed dolor. Iusto non dolor quasi dolores similique consequatur inventore. Repudiandae maiores natus sint quaerat expedita aut corporis accusamus. Quasi molestias doloribus a ab. Vitae omnis velit eum est dolores. Dolorem veritatis et eaque error doloremque est. Et temporibus consequatur aliquam harum blanditiis. Tempore incidunt et et et. Nihil in quo ea accusantium. Sint sed voluptatum totam tempora voluptatibus.', 'Distinctio.|Eum quia inventore.|Reiciendis aliquid.|Placeat ducimus.|Et dolorem sunt qui.', 'Aliquam eligendi.|Aut cum molestias.|Deleniti illo.|Non repudiandae est.|Nisi laudantium est.', 1, '2023-08-16 11:02:47', '2023-08-16 11:02:47', 0),
(44, 'ea est ut maxime', 'ea-est-ut-maxime', 'Alias quis ad.', 6, 371.00, NULL, NULL, 'service_11.jpg', 'service_11.jpg', 'Qui ut eaque numquam est qui. Impedit ipsam neque quae placeat quam quaerat. Repellendus quo velit cumque quibusdam rerum vel. Dolor eum alias quisquam temporibus. Suscipit rem cum vel velit. Nobis corporis blanditiis expedita. Soluta quo nam aut velit. Vitae assumenda quia in asperiores cumque commodi pariatur. Corporis voluptate aspernatur dolorem voluptate quasi. Optio asperiores sit non ad est expedita voluptatem. A sint dolor perspiciatis quis corrupti.', 'Dolorum unde cum.|Accusantium soluta.|Voluptates commodi.|Voluptatem nobis.|Delectus atque.', 'Ex voluptatum rem.|Aliquid officiis ut.|Quo in ab pariatur.|Expedita alias aut.|Officia quas iusto.', 1, '2023-08-16 11:02:47', '2023-08-16 11:02:47', 0),
(45, 'maxime ex laborum explicabo', 'maxime-ex-laborum-explicabo', 'Cum impedit ipsam.', 14, 118.00, NULL, NULL, 'service_3.jpg', 'service_3.jpg', 'Explicabo aut quas repellendus deserunt aut voluptatem velit. Sint ullam rerum et ea. Ratione illum ut repellendus minima commodi neque voluptates. Qui sint autem ducimus. Sint rerum magnam corporis et et. Qui corrupti et et magni ratione quasi. Nesciunt officia dolorum doloribus qui dolor. Sint culpa modi totam tenetur in ut eum. Exercitationem quasi atque iste nemo enim nemo. Sunt debitis saepe rerum reiciendis nulla sint. Ratione iure dolorem suscipit.', 'Doloremque sed.|Quia qui quo.|Sed minima beatae.|Optio magni.|Pariatur.', 'Cumque et officia.|Consequatur est.|Et voluptas et.|Praesentium.|Est ducimus.', 1, '2023-08-16 11:02:47', '2023-08-16 11:02:47', 0),
(46, 'in illo et facere', 'in-illo-et-facere', 'Sunt ut aspernatur.', 8, 321.00, NULL, NULL, 'service_4.jpg', 'service_4.jpg', 'Iste ab molestias sed id. Non sit eos fugit neque quasi. Et aliquam est tempora excepturi. Earum atque fugit dolore eveniet. Non ut eligendi tempora tempora. Qui explicabo distinctio est. Sequi fuga dicta quia a consequatur. Minus nostrum distinctio voluptatem dolorum eius. Quibusdam pariatur ipsam enim ut animi quod sunt. Non quae sed iusto est. Quia laudantium distinctio est est molestias excepturi cupiditate.', 'Aut numquam qui ad.|Hic sunt id cumque.|Neque doloribus.|Architecto neque.|Corporis qui et.', 'Sed odio minima.|Nisi nesciunt.|Illum quia ea.|Ipsam laborum ut.|Provident quia.', 1, '2023-08-16 11:02:47', '2023-08-16 11:02:47', 0),
(47, 'nobis qui et distinctio', 'nobis-qui-et-distinctio', 'Alias quasi aliquid.', 5, 480.00, NULL, NULL, 'service_2.jpg', 'service_2.jpg', 'Quaerat similique beatae deleniti et asperiores iure voluptates. Hic id vel provident laborum eligendi velit fugit. Et nobis nobis sint doloribus voluptate. Enim corporis velit delectus aspernatur placeat. Perferendis perspiciatis minus officia quasi laborum repudiandae debitis perspiciatis. Quia aliquid commodi ut praesentium blanditiis minus a.', 'Sapiente suscipit.|Nulla possimus.|Tempora quis quia.|Ut sapiente fugit.|Nesciunt debitis.', 'Quia et enim ipsum.|Eaque et architecto.|Nobis culpa.|Non natus quis quo.|Aut laboriosam.', 1, '2023-08-16 11:02:47', '2023-08-16 11:02:47', 0),
(48, 'quia quibusdam qui aspernatur', 'quia-quibusdam-qui-aspernatur', 'Qui quasi omnis.', 16, 348.00, NULL, NULL, 'service_10.jpg', 'service_10.jpg', 'Fuga quas dolorem nesciunt harum sit. Nobis hic itaque dolore voluptatem ad expedita. Et ut nam officiis distinctio fugiat quis dolores nulla. Velit voluptatibus a mollitia. Debitis doloremque sit vel est illo itaque qui non. Aperiam magni quia assumenda voluptas sit. Fugiat laboriosam et dicta ipsa consequatur et. Officiis consequatur laboriosam porro sint.', 'Repellat qui magnam.|Dolore quia quo.|Ex cum magnam.|Et neque autem.|Perferendis laborum.', 'Ipsum molestiae.|Dolores cumque.|Ea quis et voluptas.|Soluta voluptatem.|Deserunt voluptas.', 1, '2023-08-16 11:02:47', '2023-08-16 11:02:47', 0),
(49, 'molestias enim aut voluptatem', 'molestias-enim-aut-voluptatem', 'Qui delectus sit.', 17, 259.00, NULL, NULL, 'service_14.jpg', 'service_14.jpg', 'Quidem quo eius ducimus fugit rerum cupiditate amet. Eos quia excepturi impedit in voluptatum nisi. Laborum aut aut et. Iste quae voluptatibus earum perferendis officia sapiente. Non sapiente necessitatibus et dolor. Quam earum dolore deserunt. Ut eveniet voluptatibus ut eos vero repudiandae. Autem molestiae ratione molestiae voluptatibus exercitationem. Itaque ut rerum laborum facilis sint voluptas qui.', 'Voluptas facilis.|Culpa impedit.|Officiis neque ut.|Dignissimos.|Placeat quaerat ex.', 'Quia temporibus.|Ut ipsum doloremque.|Enim aut aspernatur.|Occaecati ut quod.|Enim maiores.', 1, '2023-08-16 11:02:47', '2023-08-16 11:02:47', 0),
(50, 'voluptas porro est error', 'voluptas-porro-est-error', 'Voluptatem aperiam.', 3, 150.00, NULL, NULL, 'service_12.jpg', 'service_12.jpg', 'Tenetur sed ipsum consequatur minus. Velit quae cum nihil necessitatibus repudiandae est optio. Aliquid quis qui et omnis nesciunt veritatis non molestias. Sed laudantium at eum aut. Accusantium aut sed exercitationem non dicta debitis quo. Eveniet commodi sint nihil omnis odio. Consectetur vero laboriosam aperiam. Non excepturi officiis quo recusandae totam impedit. Beatae delectus quia ipsum quam. Modi atque quaerat consectetur facere.', 'Dolorem et placeat.|Aut qui omnis harum.|Et odit aspernatur.|Voluptate deleniti.|Eum quam accusamus.', 'Possimus itaque.|Ut voluptatum illum.|Laudantium debitis.|Nisi beatae facilis.|Explicabo et.', 1, '2023-08-16 11:02:47', '2023-08-16 11:02:47', 0),
(51, 'quas autem aliquam esse', 'quas-autem-aliquam-esse', 'Odio quasi id.', 12, 438.00, NULL, NULL, 'service_16.jpg', 'service_16.jpg', 'Nisi et natus dicta magni quas delectus. Sed et ipsa eveniet illo. Nam eum nostrum et rerum qui illum minima et. Quasi incidunt quasi cum repudiandae similique voluptatem voluptas placeat. Molestias qui blanditiis nam et modi. Nisi ducimus quasi illum dolore ab. Cum quae repellat consequatur maxime non dolorem. Omnis temporibus aut id corrupti iusto similique. Perspiciatis qui corporis tempora placeat. Omnis est sit omnis occaecati earum sequi. Eum perferendis molestias velit est et.', 'Repellat enim.|Fuga sed aut.|Rerum nulla vitae.|Praesentium autem.|Repellat qui atque.', 'Sunt sapiente.|Maiores ratione.|Perferendis porro.|Laudantium quo modi.|Aut debitis.', 1, '2023-08-16 11:02:47', '2023-08-16 11:02:47', 0),
(52, 'voluptate magnam qui aut', 'voluptate-magnam-qui-aut', 'Autem commodi.', 1, 423.00, NULL, NULL, 'service_5.jpg', 'service_5.jpg', 'Adipisci rerum sit error eius. Dolores consequatur quod saepe voluptatibus quia. Qui aperiam dicta ab nemo dolorum. Officiis qui nihil consequatur iure non ratione fugit. Vel quam non quia neque nostrum. Iusto quis perferendis quasi eos quam quos. Et nesciunt aliquid ducimus exercitationem ducimus. Aut quia iusto qui voluptates. Aut et tenetur sint pariatur. Ut pariatur illo at voluptatem. Aperiam architecto rem eum voluptatem fugiat dolorem.', 'Ut aut eum possimus.|Enim repudiandae.|Sed delectus.|Voluptates illum.|Aut ut voluptatem.', 'Porro eos fugiat.|Dolor sit quis ab.|Sint ad cumque.|Libero rerum.|Quidem est.', 1, '2023-08-16 11:02:47', '2023-08-16 11:02:47', 0),
(53, 'aut sapiente consequatur id', 'aut-sapiente-consequatur-id', 'Et enim dolores.', 2, 460.00, NULL, NULL, 'service_20.jpg', 'service_20.jpg', 'Est libero et ad tempora. Ipsum nulla quo sint ipsum nostrum quam. Architecto exercitationem id fugiat cum. Quibusdam et sit voluptate laborum nam. Accusantium dicta voluptate incidunt delectus sed dicta consequuntur. Aut quas eos explicabo ea minima voluptatem. Ducimus quis atque omnis cum exercitationem. Aliquid dolorem neque sit ipsum ex eius.', 'Ea qui esse.|Minus reiciendis.|Hic magni vitae.|Et mollitia qui.|Quos veniam soluta.', 'Ea molestias velit.|Vitae delectus.|Optio culpa dolorum.|Et voluptatem.|Quod est ut nam.', 1, '2023-08-16 11:02:47', '2023-08-16 11:02:47', 0),
(54, 'ea non ea porro', 'ea-non-ea-porro', 'Aut et voluptatem.', 18, 408.00, NULL, NULL, 'service_1.jpg', 'service_1.jpg', 'Delectus quae repellat magnam aliquid vel. Unde cumque aut officiis tenetur. Id delectus aspernatur nam occaecati. Vitae quia exercitationem omnis hic. Veniam asperiores ad necessitatibus laborum est in dignissimos. Dignissimos mollitia rem laboriosam sapiente. Perspiciatis recusandae excepturi necessitatibus sint dolorum. Mollitia aspernatur sunt cumque et facere omnis. Porro illo distinctio deleniti consequuntur omnis saepe. Aut et omnis cumque sint.', 'Voluptatem.|Nulla ut minus.|Voluptas rem sit.|Alias placeat.|Omnis officiis.', 'Corporis est et.|Non placeat minima.|Minus commodi quasi.|Est sed non omnis.|Soluta adipisci et.', 1, '2023-08-16 11:02:47', '2023-08-16 11:02:47', 0),
(55, 'velit rerum velit quia', 'velit-rerum-velit-quia', 'Doloremque.', 11, 430.00, NULL, NULL, 'service_7.jpg', 'service_7.jpg', 'Minus quia est laborum voluptatem. Itaque dignissimos optio qui aut rerum non. Rerum consequatur magni voluptatem at. Tempora quia consequuntur nulla quia minima et. Quia quisquam aut quibusdam ipsum dolor nihil. Velit aut eius neque eligendi beatae et. Itaque consequatur quas et eos dolor fugit. Eos totam quos aut commodi error magnam veniam nisi.', 'Laborum accusamus.|Unde aut omnis.|Nam est voluptatum.|Vel deleniti optio.|Totam ut dolore.', 'Alias perspiciatis.|Fuga qui et eius.|Praesentium.|Id perspiciatis.|Necessitatibus iure.', 1, '2023-08-16 11:02:47', '2023-08-16 11:02:47', 0),
(56, 'excepturi et numquam tempora', 'excepturi-et-numquam-tempora', 'Cumque delectus.', 12, 361.00, NULL, NULL, 'service_9.jpg', 'service_9.jpg', 'Iure ut vero modi. Provident quasi natus quo voluptatibus autem. Recusandae veniam odio non expedita enim eaque voluptatem. Quo enim mollitia consequatur quam. Laborum necessitatibus corrupti molestiae. Aut voluptatibus molestiae sunt aliquid recusandae. Quia eius atque reiciendis unde eveniet exercitationem quibusdam in. Molestias velit amet iste excepturi in assumenda quibusdam.', 'Enim sit qui.|Ipsa minima sit.|Ut repudiandae quia.|Est et animi rerum.|Labore ut ipsa in.', 'Est est nisi.|Debitis hic et.|Vel omnis esse est.|Voluptatem est.|Aut quas totam quo.', 1, '2023-08-16 11:02:47', '2023-08-16 11:02:47', 0),
(57, 'est accusantium eos autem', 'est-accusantium-eos-autem', 'Minus aut et et.', 6, 432.00, NULL, NULL, 'service_18.jpg', 'service_18.jpg', 'Blanditiis est assumenda dolorem necessitatibus. Placeat animi in pariatur perspiciatis. Illum dicta dicta dolorem maiores sapiente ipsam tempore libero. Et praesentium magni autem velit. Rerum et eaque earum fuga saepe nisi. Impedit aut nihil consequuntur voluptatem vel et nemo. Voluptates magni cum sit rerum. At ratione magni velit et reiciendis sed eveniet. At quia quis illo porro ad aut.', 'Veniam quia quos.|Fugiat placeat.|Cupiditate.|At quisquam minima.|Ratione sequi.', 'Aspernatur qui.|Quasi et error ipsa.|Quod soluta optio.|Ipsam non repellat.|Delectus fugit sed.', 1, '2023-08-16 11:02:47', '2023-08-16 11:02:47', 0),
(58, 'a voluptate eum facilis', 'a-voluptate-eum-facilis', 'Accusantium minus.', 16, 429.00, NULL, NULL, 'service_13.jpg', 'service_13.jpg', 'A sunt ducimus qui sed. Numquam natus sed aut totam voluptatem. Similique autem hic est consequatur enim rerum cum commodi. Minus minus voluptatem occaecati inventore deleniti. Mollitia assumenda perferendis non iusto consequuntur numquam. Quo quia molestiae voluptas perferendis non. Voluptatem fuga reprehenderit ea sit harum non deserunt dolore.', 'Autem ipsam sed non.|Non porro non a.|Alias aspernatur.|Ad et reiciendis.|Error fugiat odio.', 'Molestias sit.|Est provident.|Porro autem dicta.|Quia sit aliquid.|Inventore aliquid.', 1, '2023-08-16 11:02:47', '2023-08-16 11:02:47', 0),
(59, 'adipisci et qui necessitatibus', 'adipisci-et-qui-necessitatibus', 'Et consequuntur.', 13, 404.00, NULL, NULL, 'service_6.jpg', 'service_6.jpg', 'Harum omnis nemo maxime consequuntur quod. Sunt et voluptatum optio ipsum a quas. Voluptatum nihil dolorum est error. Odio repellendus quia natus illum atque. Dolorem sunt ad facere natus temporibus. Enim tenetur nemo illo quis. Sit pariatur id non dolorum temporibus illum. Consequatur est ut quidem excepturi ullam. Non velit magni assumenda quo. Animi mollitia veniam veniam neque eligendi tempore velit eos.', 'Ut est rerum.|Nisi et placeat aut.|Distinctio minus.|Molestias saepe.|Aut exercitationem.', 'Adipisci rerum aut.|Doloribus sunt.|Nihil sunt sed est.|Eligendi magni quia.|Reprehenderit quis.', 1, '2023-08-16 11:02:47', '2023-08-16 11:02:47', 0),
(60, 'voluptatum aspernatur cum earum', 'voluptatum-aspernatur-cum-earum', 'Nulla rerum dolorem.', 14, 467.00, NULL, NULL, 'service_19.jpg', 'service_19.jpg', 'Tempora autem deserunt commodi possimus saepe. Mollitia eos perspiciatis nam et. Vel omnis nisi temporibus accusamus. Maiores illo repellendus debitis quo aut alias. Velit velit enim perspiciatis accusantium assumenda aliquid. Voluptas enim fuga perspiciatis voluptatibus mollitia praesentium. Consectetur eum aperiam rem sint doloremque. Dolorum quisquam enim et veniam sunt quasi totam. Ut ut omnis architecto. Laborum saepe enim molestias perspiciatis possimus sapiente et.', 'Quia dolores.|Ut expedita.|Impedit tempore.|Odio placeat.|Pariatur voluptatem.', 'Dolores sequi eos.|Et fugit rem.|Autem dignissimos.|Autem sunt.|Omnis vitae nihil.', 1, '2023-08-16 11:02:47', '2023-08-16 11:02:47', 0),
(61, 'eligendi qui beatae vitae', 'eligendi-qui-beatae-vitae', 'Ab cum id quas et.', 15, 267.00, NULL, NULL, 'service_2.jpg', 'service_2.jpg', 'Quas quis sed aut reprehenderit voluptate minima quae eum. Nesciunt dolor sed nisi ut. Eligendi est dolore cum hic. Facere voluptatem porro nobis quis vel corporis. Dicta sunt omnis blanditiis necessitatibus qui. Quasi ex perspiciatis vel tenetur. Odio voluptas ut sint rerum amet qui. Culpa similique voluptas facilis alias expedita ipsum. Veritatis sint omnis vel quis consequatur. Eos deserunt rerum optio minus nam itaque. Aut commodi aliquid ratione praesentium incidunt est neque ea.', 'Consectetur et.|Molestiae voluptas.|Maxime est dolorum.|Esse qui laboriosam.|Debitis dolore.', 'Quidem fugit.|Ex optio dolorem.|Sed nihil qui sint.|Officia enim qui.|Totam alias eveniet.', 1, '2023-08-16 18:36:00', '2023-08-16 18:36:00', 0),
(62, 'qui aperiam quo qui', 'qui-aperiam-quo-qui', 'Ratione saepe.', 11, 382.00, NULL, NULL, 'service_10.jpg', 'service_10.jpg', 'Iusto voluptatibus est velit harum nihil consequatur. Et doloribus dolorem quam facilis facilis iure. Perferendis vel quis similique. Veniam voluptatibus repellat rerum quos. Doloribus dolores blanditiis enim quo voluptatem. Voluptates beatae reprehenderit reprehenderit nam voluptatem ad. Debitis magnam error ullam aspernatur et. Repellat neque quo excepturi suscipit in distinctio. Quasi vitae quia totam vel. Odio iste voluptatem voluptatibus earum veritatis.', 'Esse omnis quaerat.|Iusto est sed ut et.|Aliquam architecto.|Unde optio.|Architecto quia.', 'Voluptatibus.|Quas qui cupiditate.|Ut commodi qui et.|Repellat sint.|Hic consequatur.', 1, '2023-08-16 18:36:00', '2023-08-16 18:36:00', 0),
(63, 'eos incidunt quia ea', 'eos-incidunt-quia-ea', 'Distinctio et et.', 12, 139.00, NULL, NULL, 'service_15.jpg', 'service_15.jpg', 'Itaque qui doloribus asperiores sed aut officiis. Dolor dolorem sint fugit eos veniam est ipsam consequatur. Sed eos sequi itaque ut. Fugiat eos voluptates eos voluptatem vel impedit ad. Consequatur perferendis quas quasi numquam. Iure nemo qui corporis nulla numquam quasi et nam. Reprehenderit ad cupiditate perferendis assumenda fugit aut.', 'At ab et neque sed.|Vero est nemo totam.|At et dicta.|Illum asperiores.|Mollitia aperiam.', 'Adipisci quis iste.|Ea officiis libero.|Repellat occaecati.|In quia voluptatem.|Quia et.', 1, '2023-08-16 18:36:00', '2023-08-16 18:36:00', 0),
(64, 'earum molestias sed dolorum', 'earum-molestias-sed-dolorum', 'Qui itaque quo.', 10, 424.00, NULL, NULL, 'service_11.jpg', 'service_11.jpg', 'Id fugit dolorem deserunt sapiente doloremque culpa voluptas. Natus soluta sint autem non corporis quaerat in. Ipsum sint molestias quos omnis et inventore dolores. Quod velit in eveniet inventore. Officiis asperiores ex consequatur voluptatem error maxime temporibus error. Ea qui mollitia totam dolorem. Cupiditate laboriosam vel voluptatem quisquam doloremque libero quae. Sunt sint eos asperiores rem rerum fugiat consequatur.', 'Dolorem molestias.|Qui aperiam.|Qui qui est.|Veritatis.|Quia earum dolore.', 'Impedit similique.|Molestiae corporis.|Consequatur libero.|Aut molestias.|Architecto ut.', 1, '2023-08-16 18:36:00', '2023-08-16 18:36:00', 0),
(65, 'adipisci officia sed rerum', 'adipisci-officia-sed-rerum', 'Adipisci.', 4, 188.00, NULL, NULL, 'service_18.jpg', 'service_18.jpg', 'Est impedit dolorem necessitatibus sed et voluptas in. Minima aspernatur repellendus distinctio. Est non delectus nisi quia alias delectus cumque officiis. Sint deserunt dolorem aut quam quia voluptatem quibusdam. Itaque ut at tempora. Corporis tempore animi nihil dolores accusamus rem dolor ipsa. Quis nihil quod nulla laborum amet dolore blanditiis.', 'Omnis sint est.|Aut expedita nemo.|Quidem deleniti.|Ab aspernatur sint.|Soluta qui deserunt.', 'Eos saepe minus.|Vel et dolor ab.|Eum ea quod.|Sint ipsam repellat.|At asperiores nulla.', 1, '2023-08-16 18:36:00', '2023-08-16 18:36:00', 0),
(66, 'voluptatem nulla fuga nesciunt', 'voluptatem-nulla-fuga-nesciunt', 'In blanditiis enim.', 7, 133.00, NULL, NULL, 'service_1.jpg', 'service_1.jpg', 'Placeat iure sit dolor veniam est laborum est. Possimus ducimus error deleniti. Molestiae quo cum eos dolorem. Quae animi accusantium sunt reprehenderit voluptas soluta. Quas voluptatem non et vitae et. Qui veniam molestiae sint ipsa rerum illo cumque. Dignissimos rerum in in adipisci labore assumenda explicabo. Temporibus accusantium labore et ut. Minima ullam delectus pariatur architecto fugit.', 'Ut ipsam eos eum.|Omnis id voluptatem.|Est sit eius ut.|Nobis quis.|Est doloremque.', 'Dolore quis aut eum.|Quisquam recusandae.|Iste et quia.|Modi ullam.|Molestiae hic alias.', 1, '2023-08-16 18:36:00', '2023-08-16 18:36:00', 0),
(67, 'ut commodi consequuntur ea', 'ut-commodi-consequuntur-ea', 'Aut rerum.', 5, 161.00, NULL, NULL, 'service_7.jpg', 'service_7.jpg', 'Tempore consequuntur unde facere voluptatem rerum numquam. Quisquam odit quia molestiae in molestiae iure. Suscipit est ut earum inventore quasi accusantium qui. Pariatur est tempore libero aperiam ad unde. Qui nisi voluptatem consequuntur sunt voluptas quidem iste dolorem. Amet autem quae autem porro dolorem quasi impedit. Quibusdam voluptas aut ut quaerat modi. Nostrum aut repellat vitae vero atque officia est. Sunt sed voluptatem vero dolore.', 'Nostrum tempora.|Iste harum magnam.|Eius sunt non.|Magnam natus esse.|Sint et est.', 'Consequatur quia et.|Sunt est.|Eveniet blanditiis.|Velit id suscipit.|Possimus explicabo.', 1, '2023-08-16 18:36:00', '2023-08-16 18:36:00', 0),
(68, 'ut sint culpa aliquam', 'ut-sint-culpa-aliquam', 'Dolor est quia.', 6, 420.00, NULL, NULL, 'service_6.jpg', 'service_6.jpg', 'Dolor eos maxime est impedit aut et occaecati. Totam nemo vero sit voluptas repudiandae aut labore non. Recusandae voluptatibus voluptas rerum magnam dicta omnis. Quia ratione facilis labore enim. Porro ea accusantium repellat quas recusandae. Harum incidunt ipsam quae nesciunt ea eos. Ratione maiores atque quis doloribus. Fuga odit voluptatem hic qui error a. Maiores nihil voluptatibus est aut voluptas aut. Dolorum aut fugiat et ad architecto laborum.', 'Nesciunt.|Quis sed molestiae.|Est occaecati aut.|Eum aut consectetur.|Perspiciatis sunt.', 'Officiis qui.|Et ipsam doloribus.|Quo ut consectetur.|Et dolores corrupti.|Vel iste expedita.', 1, '2023-08-16 18:36:00', '2023-08-16 18:36:00', 0);
INSERT INTO `services` (`id`, `name`, `slug`, `tagline`, `service_category_id`, `price`, `discount`, `discount_type`, `image`, `thumbnail`, `description`, `inclusion`, `exclusion`, `status`, `created_at`, `updated_at`, `featured`) VALUES
(69, 'eum architecto minus omnis', 'eum-architecto-minus-omnis', 'Velit enim quod.', 19, 441.00, NULL, NULL, 'service_20.jpg', 'service_20.jpg', 'Dolor numquam numquam illo rerum repellendus sit. Ipsam quis non ab laborum placeat modi sed. A et officiis rerum id voluptas ex quia. Sint est eveniet perferendis. Libero recusandae voluptatem quasi explicabo. Quo ab repellendus non similique tempore laudantium consectetur. Doloribus voluptatem quo ipsam vitae eveniet aut qui aliquam.', 'Eaque est dolores.|Natus recusandae.|Temporibus ipsam.|Quia optio dicta.|Earum et similique.', 'Expedita temporibus.|Itaque qui qui.|Deleniti.|Deserunt nemo illum.|Ut in deleniti.', 1, '2023-08-16 18:36:00', '2023-08-16 18:36:00', 0),
(70, 'consequatur consectetur voluptatem quaerat', 'consequatur-consectetur-voluptatem-quaerat', 'Sunt tempore sed.', 8, 368.00, NULL, NULL, 'service_4.jpg', 'service_4.jpg', 'Ut atque iste aut non non sunt. Ex magnam atque suscipit quod voluptas quisquam in magni. Voluptatibus velit non necessitatibus quidem sed ut. Placeat amet est quam commodi quasi sint est doloribus. Accusantium iste enim est impedit doloremque. Perspiciatis velit quisquam pariatur quia dolores. Quae saepe repudiandae molestiae molestiae optio. Dicta dolorum dolores labore delectus omnis totam aut.', 'Maxime molestias.|Et quaerat nemo aut.|Asperiores omnis.|Ut blanditiis.|Similique.', 'Ut quo quo corrupti.|Error similique.|Dignissimos rerum.|Sunt ducimus.|Maxime qui velit et.', 1, '2023-08-16 18:36:00', '2023-08-16 18:36:00', 0),
(71, 'illo unde deleniti quod', 'illo-unde-deleniti-quod', 'Impedit velit.', 10, 124.00, NULL, NULL, 'service_5.jpg', 'service_5.jpg', 'Dignissimos et saepe cum omnis. Ratione cum maiores ut reprehenderit. Ea cupiditate enim culpa. Molestias et totam modi consequatur. Qui natus et natus suscipit similique quia quas. Culpa at nihil facilis quo sed voluptates. Beatae cumque explicabo ducimus vitae harum fuga quo autem. Aut iusto est et ut quia iure. Error nesciunt ex ea non. Harum aliquid eius et. Hic dolorum explicabo dolor impedit est. Sunt saepe quasi dolor quam est. Voluptas nostrum est sit vel rem.', 'Omnis vitae ipsam.|Ut laudantium quis.|Sit reiciendis.|Dignissimos minima.|Dolores quo omnis.', 'Deleniti.|Sunt sunt natus non.|Incidunt ratione.|Et ex dolorem saepe.|Ut voluptates quia.', 1, '2023-08-16 18:36:00', '2023-08-16 18:36:00', 0),
(72, 'ut dicta minima consequatur', 'ut-dicta-minima-consequatur', 'Aut sit culpa natus.', 9, 188.00, NULL, NULL, 'service_3.jpg', 'service_3.jpg', 'Et in ab inventore molestiae voluptas. Placeat neque dolore sit iure tenetur. Et perferendis enim modi minima aut voluptas inventore. Optio delectus suscipit dolores placeat placeat. Mollitia nihil maiores non nulla dolores nesciunt. Velit unde vel temporibus ut sed. Omnis ipsum qui qui est voluptas placeat. Esse ut error voluptas voluptatem doloribus aperiam modi. Illum eum et voluptas delectus non dolorum nesciunt.', 'Doloremque nesciunt.|Assumenda non aut.|Est dolorum quia.|Qui quae dolorem.|Ut temporibus.', 'Error accusamus.|Eos sed commodi.|Error et voluptas.|Nulla aut velit.|Facilis cum optio.', 1, '2023-08-16 18:36:00', '2023-08-16 18:36:00', 0),
(73, 'ipsa voluptas omnis voluptatibus', 'ipsa-voluptas-omnis-voluptatibus', 'Autem asperiores.', 7, 271.00, NULL, NULL, 'service_13.jpg', 'service_13.jpg', 'Beatae ducimus porro occaecati libero temporibus. Perferendis suscipit fugit quo. Incidunt aut dolores voluptatem at quibusdam voluptas. Expedita similique natus sint provident accusamus. Impedit quo et est eligendi sed quia sed. Est mollitia facilis id libero ut et in. Accusamus quia ipsam sunt vel autem assumenda qui.', 'Enim voluptatem aut.|Dolorum et rerum.|Et nam tempora.|Voluptas et quia.|Qui assumenda magni.', 'Nisi enim est qui.|Similique ipsam eum.|Corrupti sit rerum.|Qui aperiam.|Magni soluta rerum.', 1, '2023-08-16 18:36:00', '2023-08-16 18:36:00', 0),
(74, 'provident aperiam molestiae blanditiis', 'provident-aperiam-molestiae-blanditiis', 'Et sint est tempore.', 13, 206.00, NULL, NULL, 'service_17.jpg', 'service_17.jpg', 'Magni quae nam voluptatem dolore molestias omnis. Eum quo provident sed ullam. Repellendus doloribus laudantium voluptas minus. Accusamus eos minima minus natus sit. Non placeat ea sequi et ipsam natus accusantium. Et vero est velit eos nemo. Est repellendus repellendus beatae illo. Quam quia qui minus adipisci et. Harum minima qui et et inventore natus mollitia.', 'Distinctio.|Quo rerum sit.|Modi omnis illum.|Iusto unde.|Atque et voluptatem.', 'Eum praesentium.|Id error et ut.|Sed quae quasi.|Amet occaecati.|Hic saepe odio.', 1, '2023-08-16 18:36:00', '2023-08-16 18:36:00', 0),
(75, 'dolorem ut itaque eius', 'dolorem-ut-itaque-eius', 'Eos quisquam id.', 9, 491.00, NULL, NULL, 'service_19.jpg', 'service_19.jpg', 'Voluptatem necessitatibus officia fugiat enim voluptatem quae deserunt sint. Et vero et alias ut vel quidem est. Soluta iusto quia et consequatur. Laborum quia quae necessitatibus doloribus. Consequatur dolore officiis sunt. Quis delectus velit maxime labore asperiores dolorem. Corporis vel atque officiis possimus enim quisquam quasi.', 'Maxime autem.|Et culpa velit.|Ullam nam est.|Accusamus et fugiat.|Est et architecto.', 'Repellat omnis.|Recusandae.|Voluptatibus quas.|Quod totam.|Possimus culpa.', 1, '2023-08-16 18:36:00', '2023-08-16 18:36:00', 0),
(76, 'non vel nisi quis', 'non-vel-nisi-quis', 'Rerum molestias.', 8, 357.00, NULL, NULL, 'service_16.jpg', 'service_16.jpg', 'Vero ut molestiae dolorem rem quia vel maiores. Ut corrupti nemo nemo repudiandae. Quia suscipit itaque perferendis tenetur occaecati sit dolorem sint. Ut qui quos vel delectus. Corporis consequatur minima rerum ut perspiciatis nam aliquam. Aspernatur maxime aspernatur dolorem enim. Sunt et accusantium consectetur qui. Aliquid omnis velit non quia saepe cumque nihil. Aut temporibus earum iure est et rerum. Voluptatem quo eius vero omnis.', 'Quam placeat.|Explicabo dolores.|Harum inventore.|Quasi ea dolor.|Non ut et eius hic.', 'Ipsam impedit.|Autem omnis ipsam.|Quisquam nisi qui.|Ex qui est id.|Non molestiae sequi.', 1, '2023-08-16 18:36:00', '2023-08-16 18:36:00', 0),
(77, 'quae et nihil non', 'quae-et-nihil-non', 'Ducimus incidunt.', 16, 108.00, NULL, NULL, 'service_8.jpg', 'service_8.jpg', 'Veritatis vel minus natus veritatis dolorum dignissimos iste. Nihil optio laudantium suscipit qui. Voluptatibus dolores enim at non eum ab qui. Velit quidem inventore et porro provident cumque. Exercitationem et voluptate ut repudiandae fuga quas. Tenetur doloremque natus et eius. At rem sit nulla.', 'Aliquid adipisci.|Illo suscipit culpa.|Dignissimos.|Quae et.|Dolorem aspernatur.', 'Voluptas vero sint.|Cupiditate sit.|Inventore non.|Atque velit eum.|Voluptates in.', 1, '2023-08-16 18:36:00', '2023-08-16 18:36:00', 0),
(78, 'ad ipsa dolores pariatur', 'ad-ipsa-dolores-pariatur', 'Laborum quos.', 20, 496.00, NULL, NULL, 'service_9.jpg', 'service_9.jpg', 'Consequatur nemo assumenda quas ipsam quisquam est temporibus. Ut suscipit aliquam mollitia veniam quia. Sit harum qui ipsum temporibus. Vel ratione laboriosam sit et aliquam magni. Ipsum est porro sunt numquam doloremque eaque cum eligendi. Vero culpa aliquid sunt sed aut ducimus sunt. Dignissimos suscipit ducimus quae et ut sit. Quod eaque voluptates voluptatibus non itaque.', 'Aut quis quo ut.|Dolores voluptatem.|Consequatur.|Necessitatibus.|Aut esse quis autem.', 'Quo excepturi.|Voluptatem impedit.|Et fuga ut illum.|Minus similique.|Nam vero sed.', 1, '2023-08-16 18:36:00', '2023-08-16 18:36:00', 0),
(79, 'ipsa optio nostrum ex', 'ipsa-optio-nostrum-ex', 'Quis cum in et.', 8, 143.00, NULL, NULL, 'service_14.jpg', 'service_14.jpg', 'Itaque ea repudiandae qui unde facere fugit repudiandae natus. Corrupti sapiente vero architecto iure sed et eligendi nemo. Necessitatibus velit qui reprehenderit. Nihil natus corporis in dicta harum placeat ut. A odio maxime consequuntur nobis earum molestiae. Exercitationem distinctio voluptatum ducimus tenetur ab quia. Praesentium ut occaecati quisquam eligendi id. Voluptatem beatae maxime aliquam qui debitis sit. Aut et vel nam incidunt consequatur qui. Vel minima et quos omnis.', 'Ipsam libero.|Dolore quis quaerat.|Nisi enim dolorem.|Laboriosam quae ut.|Non explicabo et.', 'Veniam dolores.|Quia minima.|Earum ut placeat.|Distinctio.|Cumque dolorem.', 1, '2023-08-16 18:36:00', '2023-08-16 18:36:00', 0),
(80, 'facilis nobis laboriosam perspiciatis', 'facilis-nobis-laboriosam-perspiciatis', 'Sed nesciunt.', 2, 341.00, NULL, NULL, 'service_12.jpg', 'service_12.jpg', 'Iure incidunt eos itaque necessitatibus ea. Tenetur et optio iste perferendis laboriosam voluptatem ut. Ut ipsam cum ut ut nobis. At sapiente quaerat sequi ut. Est amet provident culpa consequatur eum. Enim quia fugiat fugiat dolorum. Tenetur labore laborum fugit iste. Error inventore eos modi odit et ea perferendis. Qui atque sit quisquam voluptas. Quibusdam nihil voluptas dolores adipisci provident odit maiores. Et tempore eos quia quibusdam quam.', 'Fugiat doloribus.|Et non nemo amet.|Fuga quia libero.|Aperiam vel et aut.|Officia ab at.', 'Atque quia rerum ut.|Quia tempore sunt.|Iure nihil id nihil.|Eum consectetur.|Consequatur.', 1, '2023-08-16 18:36:00', '2023-08-16 18:36:00', 0),
(81, 'quidem id velit non', 'quidem-id-velit-non', 'Quam et natus.', 19, 408.00, NULL, NULL, 'service_10.jpg', 'service_10.jpg', 'Nisi voluptatem aut laboriosam sunt minus. Unde velit iste nobis modi tenetur. Qui omnis quam occaecati id distinctio illo. Sint enim laudantium quibusdam magni est. Est distinctio assumenda laborum corrupti vel voluptatem. Nemo et repellendus quia consequuntur consequatur est. Ut quibusdam omnis saepe ut saepe. Aut sapiente ratione quod. Omnis magni dolores odio enim neque. Odit et vero sed et dolorem veritatis. Numquam ut sed excepturi dolorum velit aut omnis.', 'Reiciendis autem.|Repudiandae id.|Ab consequuntur.|Porro quos quia vel.|Quaerat deserunt.', 'Illum sint quo et.|Mollitia.|Et iure non placeat.|Assumenda atque.|Et architecto.', 1, '2023-08-17 06:31:02', '2023-08-17 06:31:02', 0),
(82, 'et aut est vel', 'et-aut-est-vel', 'Nobis ullam qui est.', 17, 163.00, NULL, NULL, 'service_4.jpg', 'service_4.jpg', 'Totam porro veniam iusto enim quia quos laborum. Architecto officiis reprehenderit autem aliquid non officia. Quis sequi et ea possimus. Dolor sapiente laborum qui fugit consequatur fugit et. Non architecto eum consectetur dolorem. Qui eum eligendi deleniti et ex enim. Ut vel dicta ut velit. Beatae ut velit quam vel. Qui sit ipsa quam maxime accusantium odio aliquam repellendus. Distinctio eveniet explicabo distinctio est. Est et velit ex ipsa accusamus. Ducimus ratione aut nisi nulla.', 'Ut accusantium.|Placeat nesciunt.|Consequuntur magni.|Alias ut et nam.|Aut et maxime.', 'Beatae error.|Et omnis libero.|Adipisci autem aut.|A sapiente est.|Sit quidem.', 1, '2023-08-17 06:31:02', '2023-08-17 06:31:02', 0),
(83, 'atque debitis culpa fugit', 'atque-debitis-culpa-fugit', 'Facere voluptas.', 19, 204.00, NULL, NULL, 'service_19.jpg', 'service_19.jpg', 'Distinctio quis assumenda harum at ut quis quia. Harum necessitatibus esse temporibus animi. Non suscipit et recusandae nesciunt soluta corrupti voluptate. Voluptatem tempore qui inventore eius autem. Voluptatem quis aut nam voluptas. Ab et repudiandae sapiente magni aut molestiae recusandae. Aperiam magnam omnis itaque sed recusandae. Nobis asperiores et est voluptas enim necessitatibus amet.', 'A rerum expedita.|Quae molestiae.|Occaecati id.|Consequatur quas ut.|Voluptatem nihil.', 'Modi in ut optio ea.|Voluptatibus.|Necessitatibus.|Est est modi et.|Qui aut aut dolores.', 1, '2023-08-17 06:31:02', '2023-08-17 06:31:02', 0),
(84, 'fugit doloribus est dolorem', 'fugit-doloribus-est-dolorem', 'Quia veritatis.', 3, 184.00, NULL, NULL, 'service_5.jpg', 'service_5.jpg', 'Illum rerum voluptas aliquam eveniet dolor numquam et. Eum porro at porro minus. Non consectetur quibusdam eos perspiciatis. Asperiores cumque et rerum facere. Sed et praesentium libero adipisci iure beatae eum quam. Accusamus et minima autem quis sapiente earum magni. Minima necessitatibus quo velit qui nihil ex. Tempora accusantium aut molestiae maiores quos. Voluptatem ut rem necessitatibus quod consequatur rerum velit. Itaque occaecati et repellat vero voluptate.', 'Nihil atque.|Aspernatur nostrum.|Quo quia possimus.|Ratione incidunt.|Recusandae quaerat.', 'Commodi dolorem.|Sapiente iusto sunt.|Sint commodi qui.|Neque fuga.|Id esse et et velit.', 1, '2023-08-17 06:31:02', '2023-08-17 06:31:02', 0),
(85, 'laboriosam mollitia possimus numquam', 'laboriosam-mollitia-possimus-numquam', 'Quibusdam in.', 20, 262.00, NULL, NULL, 'service_7.jpg', 'service_7.jpg', 'Sed sint doloribus dolor occaecati soluta. Non id velit animi alias. Fuga omnis expedita perferendis quam debitis. Iste facere dolorem distinctio. Omnis facere a vel perspiciatis. Est temporibus minus facilis aut animi ut. Mollitia amet omnis distinctio unde. Minima modi optio qui autem ea cumque.', 'Omnis amet commodi.|Iste laudantium.|Quisquam qui.|Ut qui ipsam sit.|Repudiandae vel aut.', 'Itaque omnis ipsa.|Aperiam qui quia.|Esse magni dolore.|Nesciunt qui ut.|Facilis aut eveniet.', 1, '2023-08-17 06:31:02', '2023-08-17 06:31:02', 0),
(86, 'animi officiis tempore quasi', 'animi-officiis-tempore-quasi', 'Amet exercitationem.', 2, 337.00, NULL, NULL, 'service_6.jpg', 'service_6.jpg', 'Sit omnis consequatur nostrum quasi nulla facere fugiat. Et et dicta sint asperiores unde. A ea voluptatem modi corporis porro. Voluptatum delectus sed eligendi in ut dolores. Et iste et recusandae doloribus fugit quibusdam soluta. Est est ab quos. Aliquid ab nihil natus. Voluptatum dolor enim nam qui rerum iste aliquid. Sed qui velit beatae beatae sint. Et ea architecto tempora veritatis est deserunt. Repellendus vel mollitia vero fugiat quae. Magnam et aut aut a esse non.', 'Rerum natus in.|Sunt aperiam quia.|Accusamus qui nobis.|Ipsa ullam.|Laudantium.', 'Temporibus a sit.|Ut rerum et dolores.|Qui ipsa et.|Perspiciatis qui.|Molestias corporis.', 1, '2023-08-17 06:31:02', '2023-08-17 06:31:02', 0),
(87, 'ipsum sint eos et', 'ipsum-sint-eos-et', 'Omnis quia et.', 13, 480.00, NULL, NULL, 'service_14.jpg', 'service_14.jpg', 'Facilis cumque dolore aut quia est odio. Enim aut voluptates aliquid et esse qui nihil. Eum harum repudiandae sit est. Placeat commodi cum voluptatem esse. Illo mollitia consequatur doloremque. Temporibus aspernatur ab qui. Non adipisci totam similique nesciunt atque quia ullam aut. Vel ipsa sint iste enim quidem perspiciatis. Ea quaerat ullam et vel. Quaerat itaque et voluptatibus quaerat eos cumque sit.', 'Voluptatum cum vero.|Omnis libero error.|Sed fugiat optio.|Suscipit et vitae.|Sit sed rerum.', 'Quia repudiandae.|Asperiores a cumque.|Est minima sunt ut.|Unde doloribus eos.|Ipsam in et iure.', 1, '2023-08-17 06:31:02', '2023-08-17 06:31:02', 0),
(88, 'totam id beatae doloremque', 'totam-id-beatae-doloremque', 'Sequi quia nesciunt.', 15, 353.00, NULL, NULL, 'service_1.jpg', 'service_1.jpg', 'Dolor sint magni voluptate ipsa animi omnis vitae. Repellat exercitationem maxime aut nihil. Sint sint incidunt et ea dolor eligendi. Harum magnam nemo quo sit dolorum. Ea amet distinctio id non nam aliquid. Enim dolorem velit et architecto sed amet. Aut quia inventore laborum explicabo nihil molestiae. Quidem accusamus dolore laboriosam rerum. Eius ut dolorem aut. Est itaque similique repellendus neque. Illo ducimus aut sit blanditiis omnis. Esse qui beatae sapiente provident.', 'Atque similique.|Modi hic nulla.|Numquam reiciendis.|Dolore nihil quod.|Natus non vero.', 'Enim aut non.|Ut aut neque.|Minima et ut.|Est deleniti iste.|Est aut sed aliquam.', 1, '2023-08-17 06:31:02', '2023-08-17 06:31:02', 0),
(89, 'illum consequuntur cum mollitia', 'illum-consequuntur-cum-mollitia', 'Maxime omnis illum.', 16, 304.00, NULL, NULL, 'service_2.jpg', 'service_2.jpg', 'Id blanditiis quo fugit voluptatem dolorem voluptatibus veritatis. Nemo aliquid molestias ab libero qui. Sed repudiandae ducimus dolore nesciunt. Consequatur quibusdam reiciendis rerum ea voluptatem ducimus. Delectus ea maiores consequatur quos nostrum nesciunt. At eos velit expedita dolorem qui.', 'Eum voluptatem et.|Reprehenderit aut.|Repudiandae totam.|Et ex ea.|Hic corporis magnam.', 'Est ut.|Aliquam optio omnis.|Unde voluptatum.|Fuga ipsam qui.|Voluptas et quae.', 1, '2023-08-17 06:31:02', '2023-08-17 06:31:02', 0),
(90, 'ut earum eaque aut', 'ut-earum-eaque-aut', 'Debitis id.', 3, 155.00, NULL, NULL, 'service_18.jpg', 'service_18.jpg', 'Dignissimos velit corrupti impedit eum voluptates omnis. Quia odio rem aspernatur suscipit in doloremque. Sequi recusandae perspiciatis ut incidunt maiores. Voluptatem rerum cum autem doloribus aperiam in. Amet nostrum quis occaecati occaecati vel est vel. Perferendis iusto rerum molestias rerum quod doloribus. Debitis rerum dolorem aperiam incidunt. Ipsa voluptate sint maiores quia ut quia tempora. Qui facilis quis magnam eaque non.', 'Ut corporis sed.|Dolore suscipit.|Dolorum magnam.|Repellendus.|Facere sit.', 'Dolore quae ut.|Aspernatur qui quis.|Et reiciendis.|Qui necessitatibus.|Quae est alias.', 1, '2023-08-17 06:31:02', '2023-08-17 06:31:02', 0),
(91, 'consequatur occaecati aut sequi', 'consequatur-occaecati-aut-sequi', 'Harum suscipit.', 5, 494.00, NULL, NULL, 'service_8.jpg', 'service_8.jpg', 'Saepe quasi aperiam ipsam mollitia vel voluptas excepturi. Vitae et fugiat molestias aut sint. Excepturi molestiae at numquam in voluptatem similique quod. Blanditiis quibusdam ad nesciunt doloremque et repellat labore. Culpa voluptatum aspernatur omnis eos qui quia quo ea. Possimus perferendis ut ut id. Occaecati nesciunt eligendi sunt doloremque reiciendis.', 'Provident.|Eaque doloribus.|Laborum quia.|Nobis quis voluptas.|Minima minus.', 'Asperiores quis.|Nihil omnis ad.|Exercitationem.|Facilis et expedita.|Aut id ea a placeat.', 1, '2023-08-17 06:31:02', '2023-08-17 06:31:02', 0),
(92, 'praesentium nemo beatae dicta', 'praesentium-nemo-beatae-dicta', 'Aut et doloremque.', 7, 228.00, NULL, NULL, 'service_11.jpg', 'service_11.jpg', 'Soluta nisi quisquam aperiam alias. Ut doloribus et quis voluptas dicta. Voluptas quaerat a quisquam rerum ut quidem. Aperiam possimus dolorum tenetur quia. Delectus id officia fugit voluptatem labore est consequuntur aut. Eveniet reprehenderit eos officiis ipsum fugit placeat. Tenetur itaque quis adipisci eligendi velit sequi.', 'Explicabo ut quo.|Voluptatibus.|Officia aut minima.|Cupiditate.|Aut id id sapiente.', 'Ipsam quidem qui.|Eveniet culpa non.|Cupiditate.|Placeat esse.|Velit est ex.', 1, '2023-08-17 06:31:02', '2023-08-17 06:31:02', 0),
(93, 'soluta reiciendis veritatis quia', 'soluta-reiciendis-veritatis-quia', 'Sequi totam.', 6, 285.00, NULL, NULL, 'service_17.jpg', 'service_17.jpg', 'Et delectus eum repellendus ullam. Deserunt quod corporis voluptatum nisi facere. Non nesciunt et labore omnis dolor. Voluptates sint minus illum officia velit temporibus minima. Adipisci provident quia qui autem. Quasi aut maiores et corporis qui. Nihil quos voluptatem expedita sed. Possimus in autem sed aliquam doloribus enim veritatis. Delectus est amet ut est qui deleniti. Architecto neque et aspernatur. Ex hic quisquam itaque ducimus nesciunt aut necessitatibus.', 'Accusamus est.|Aspernatur eligendi.|Ut et possimus.|Dolorum non.|Id numquam et aut.', 'Iste excepturi.|Sit qui reiciendis.|Sed quibusdam nisi.|Repellat commodi.|Vel dolorum non quo.', 1, '2023-08-17 06:31:02', '2023-08-17 06:31:02', 0),
(94, 'nesciunt earum perspiciatis veniam', 'nesciunt-earum-perspiciatis-veniam', 'Et doloremque.', 19, 111.00, NULL, NULL, 'service_12.jpg', 'service_12.jpg', 'Quos tenetur quis nesciunt sit beatae aut. Sunt ut repellat libero velit ipsam voluptas ad. Corrupti reiciendis ipsum officia et. Consectetur iure quibusdam fugit dolor blanditiis aspernatur. Ut incidunt rerum dignissimos inventore rem. Quisquam aperiam nisi harum officiis dolorem et cupiditate. Sit excepturi quidem velit dolorem. Omnis est et neque ipsum aut.', 'A distinctio eum.|Cum necessitatibus.|Vero voluptatum.|Hic quisquam quod.|Ut sapiente et.', 'Asperiores hic.|Quis consequatur.|Quo alias incidunt.|Ut aut voluptas.|Ratione qui atque.', 1, '2023-08-17 06:31:02', '2023-08-17 06:31:02', 0),
(95, 'nostrum quisquam voluptatem rerum', 'nostrum-quisquam-voluptatem-rerum', 'Illum iure non et.', 19, 214.00, NULL, NULL, 'service_16.jpg', 'service_16.jpg', 'Quasi magni rerum soluta sit consequatur modi. Odit sint molestias accusantium deserunt incidunt ipsum. Quo ut autem assumenda a molestias distinctio quam. Tenetur fuga non non inventore ipsum voluptatem voluptatem. Veritatis laboriosam accusantium tempora nulla ratione minima labore. Quae quam vero et voluptatem vel sed quaerat. Impedit laboriosam labore similique sunt et aut. Non et quos dolorum est quam repudiandae.', 'Pariatur culpa vel.|Velit fugit qui.|Voluptatum.|Consequuntur quis.|Velit nostrum qui.', 'Corporis.|Sint temporibus non.|Et amet officiis et.|Quasi quis quis.|Optio voluptatibus.', 1, '2023-08-17 06:31:02', '2023-08-17 06:31:02', 0),
(96, 'illo ipsa quo quia', 'illo-ipsa-quo-quia', 'Veniam aut eos ut.', 11, 240.00, NULL, NULL, 'service_13.jpg', 'service_13.jpg', 'Illum earum ea quam reiciendis et. Reiciendis sint maiores debitis nihil. Aliquid quam iste totam excepturi ipsam quia harum. Maiores iusto illum aut labore dicta est. Corporis a voluptatem dolore occaecati et rerum. Quidem et quia qui et delectus et tenetur. Non sunt non quos facilis ea aut quod. Similique iusto accusamus aut eos porro. Quos consequatur esse et assumenda consequatur. Ad non magni aperiam necessitatibus. Quia qui consequuntur rerum repudiandae. Quia officiis vero magni sit.', 'Magni perferendis.|Dolorem cumque sed.|Ut ratione eius.|Reiciendis minima.|Voluptates amet.', 'In doloremque fugit.|Explicabo ullam id.|Ad deleniti enim.|Rerum tempora.|Reiciendis aut.', 1, '2023-08-17 06:31:02', '2023-08-17 06:31:02', 0),
(97, 'cumque et qui dolor', 'cumque-et-qui-dolor', 'Deserunt quaerat et.', 4, 130.00, NULL, NULL, 'service_15.jpg', 'service_15.jpg', 'Nihil alias cupiditate quos expedita voluptatem numquam. Dolorem aut perspiciatis officiis. Provident velit sapiente natus minus adipisci explicabo. Modi autem culpa ut ipsum voluptatum quidem. Dolores illo officia ut eum esse mollitia. Vero provident nam ea distinctio maiores. Eum alias rem eius totam quaerat praesentium ut. Quia adipisci est quis velit omnis a enim. Laboriosam provident nam temporibus officiis nihil vero veritatis. Saepe exercitationem deserunt quia vel id.', 'Quae sit fugiat.|Id magnam rem.|Nihil quia.|Ex et inventore.|Est vel nulla.', 'Non hic.|Molestiae pariatur.|Laborum vitae ut.|Debitis minima nam.|Quod ipsam maiores.', 1, '2023-08-17 06:31:02', '2023-08-17 06:31:02', 0),
(98, 'esse veniam aut aperiam', 'esse-veniam-aut-aperiam', 'Eos eos reiciendis.', 19, 259.00, NULL, NULL, 'service_20.jpg', 'service_20.jpg', 'Esse ipsa omnis soluta dolore nihil vel ut. Ducimus officiis sed itaque quibusdam voluptatem quisquam. Voluptatem est occaecati dolorem corporis. Similique numquam ducimus assumenda praesentium minima. Quas ducimus sequi nam. Et illo hic laboriosam quod qui. Iste cupiditate eaque maiores a odit. Nam magni autem et nisi. Nulla dolores unde repudiandae quia. Earum quis quia adipisci magnam.', 'Optio maxime neque.|Sed magnam deserunt.|Sit enim.|Qui quis et alias.|Recusandae non.', 'Quasi blanditiis.|Illo et.|Animi voluptatibus.|Error omnis.|Vero aliquid.', 1, '2023-08-17 06:31:02', '2023-08-17 06:31:02', 0),
(99, 'ullam ut placeat voluptatem', 'ullam-ut-placeat-voluptatem', 'Accusantium neque.', 4, 455.00, NULL, NULL, 'service_9.jpg', 'service_9.jpg', 'Laudantium in eos quidem est aut provident. Consectetur in aut ullam numquam illum. Quas aut aut culpa est omnis enim odio. Sed eveniet quia soluta quibusdam ea sequi velit. Repellendus minus consectetur repellat esse. Eius est vel asperiores qui voluptatum excepturi incidunt. Sunt facere magni eos tempora iste modi iure. Reprehenderit quia excepturi iusto laboriosam.', 'Libero est rerum.|Sed reiciendis a.|Vel accusamus odio.|Nam suscipit.|Quis repellat.', 'Officia.|Aut tempora.|Facere id ratione.|Laborum omnis.|Molestias labore.', 1, '2023-08-17 06:31:02', '2023-08-17 06:31:02', 0),
(100, 'delectus id eum qui', 'delectus-id-eum-qui', 'Rerum tempore.', 17, 391.00, NULL, NULL, 'service_3.jpg', 'service_3.jpg', 'Aliquam sunt ipsum quibusdam rerum. Explicabo perspiciatis rerum eveniet quod iure expedita alias. Iusto inventore est tenetur voluptatum qui dolores enim. Harum et reiciendis quis voluptates consequuntur voluptatem. Nisi est dolorem qui unde voluptatum. Rem minima est quis. Sed magnam sequi qui et enim culpa officia. Esse nihil voluptas totam. Rerum autem eligendi tempore quaerat vel molestiae ea natus. Omnis ipsa eligendi dolor.', 'Laudantium.|Placeat harum fugit.|Enim id ipsa.|Enim facilis ut.|Doloribus quia vel.', 'In sed maiores.|Accusamus inventore.|Nam molestias sint.|Qui velit rerum.|Maiores sint ipsum.', 1, '2023-08-17 06:31:02', '2023-08-17 06:31:02', 0);

-- --------------------------------------------------------

--
-- Table structure for table `service_categories`
--

CREATE TABLE `service_categories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `slug` varchar(255) NOT NULL,
  `image` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `featured` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `service_categories`
--

INSERT INTO `service_categories` (`id`, `name`, `slug`, `image`, `created_at`, `updated_at`, `featured`) VALUES
(1, 'AC', 'ac', '1521969345.png', NULL, NULL, 0),
(2, 'Beauty', 'beauty', '1521969358.png', NULL, '2023-08-15 10:41:59', 1),
(3, 'Plumbing', 'plumbing', '1521969409.png', NULL, '2023-08-15 10:16:36', 1),
(4, 'Electrical', 'electrical', '1521969419.png', NULL, '2023-08-15 10:16:51', 1),
(5, 'Shower Filter', 'shower-filter', '1521969430.png', NULL, '2023-08-15 10:17:05', 1),
(6, 'Home Cleaning', 'home-cleaning', '1521969446.png', NULL, NULL, 0),
(7, 'Carpentry', 'carpentry', '1521969454.png', NULL, '2023-08-15 10:17:18', 1),
(8, 'Pest Control', 'pest-control', '1521969464.png', NULL, '2023-08-15 10:33:10', 1),
(9, 'Chimney Hob', 'chimney-hob', '1521969490.png', NULL, '2023-08-15 10:32:40', 1),
(10, 'Water Purifier', 'water-purifier', '1521972593.png', NULL, '2023-08-15 10:17:28', 1),
(11, 'Computer Repair', 'computer-repair', '1521969512.png', NULL, '2023-08-15 10:42:29', 1),
(12, 'TV', 'tv', '1521969522.png', NULL, '2023-08-15 10:32:24', 1),
(13, 'Refrigerator', 'refrigerator', '1521969536.png', NULL, '2023-08-15 10:33:23', 1),
(14, 'Geyser', 'geyser', '1521969558.png', NULL, NULL, 0),
(15, 'Car', 'car', '1521969576.png', NULL, '2023-08-15 10:18:06', 1),
(16, 'Document', 'document', '1521974355.png', NULL, NULL, 0),
(17, 'Movers & Packers', 'movers-packers', '1521969599.png', NULL, NULL, 0),
(18, 'Home Automation', 'home-automation', '1521969622.png', NULL, '2023-08-15 10:17:46', 1),
(19, 'Laundry', 'laundry', '1521972624.png', NULL, NULL, 0),
(20, 'Painting', 'painting', '1521972643.png', NULL, '2023-08-15 10:32:59', 1);

-- --------------------------------------------------------

--
-- Table structure for table `service_providers`
--

CREATE TABLE `service_providers` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `image` varchar(255) DEFAULT NULL,
  `about` varchar(255) DEFAULT NULL,
  `city` varchar(255) DEFAULT NULL,
  `service_category_id` bigint(20) UNSIGNED DEFAULT NULL,
  `service_locations` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `service_providers`
--

INSERT INTO `service_providers` (`id`, `user_id`, `image`, `about`, `city`, `service_category_id`, `service_locations`, `created_at`, `updated_at`) VALUES
(1, 9, '1692275648.jpg', 'Hi I am successful service provider', 'Dhaka, Bangladesh', 4, 'Dhanmondi', '2023-08-17 06:32:38', '2023-08-17 06:34:08');

-- --------------------------------------------------------

--
-- Table structure for table `sessions`
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
-- Dumping data for table `sessions`
--

INSERT INTO `sessions` (`id`, `user_id`, `ip_address`, `user_agent`, `payload`, `last_activity`) VALUES
('rtB9XEwE41K6dwOP0NzjwRJjrMuaxvcrcv4vNXgu', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/115.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiRWdjeWxRTFdERnRKRUl3UFFuYk52RWpXTmc3R205WDBIckYxWGllaSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NDA6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9zZXJ2aWNlLWNhdGVnb3JpZXMiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1691851970);

-- --------------------------------------------------------

--
-- Table structure for table `sliders`
--

CREATE TABLE `sliders` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(255) NOT NULL,
  `image` varchar(255) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `sliders`
--

INSERT INTO `sliders` (`id`, `title`, `image`, `status`, `created_at`, `updated_at`) VALUES
(1, 'ELECTRICAL', '1692205702.jpg', 1, '2023-08-16 11:08:22', '2023-08-16 11:08:22'),
(2, 'Tools', '1692205742.jpg', 1, '2023-08-16 11:09:02', '2023-08-16 11:09:02');

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
  `two_factor_secret` text DEFAULT NULL,
  `two_factor_recovery_codes` text DEFAULT NULL,
  `two_factor_confirmed_at` timestamp NULL DEFAULT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `current_team_id` bigint(20) UNSIGNED DEFAULT NULL,
  `profile_photo_path` varchar(2048) DEFAULT NULL,
  `utype` varchar(255) NOT NULL DEFAULT 'CST',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `two_factor_secret`, `two_factor_recovery_codes`, `two_factor_confirmed_at`, `remember_token`, `current_team_id`, `profile_photo_path`, `utype`, `created_at`, `updated_at`, `phone`) VALUES
(1, 'shakil', 'safeelectricalhw@gmail.com', NULL, '$2y$10$ISLmvg0aEApEnMm7AZaByOS40UK7QVxY5dTwvhlYSgO13TGJJOfWO', NULL, NULL, NULL, 't7qhqdtmIndiRTnoJ2eg2wqR43GWp67uMq8PI8WAZFlZKRiq3kFeMS3dfXU0', NULL, NULL, 'CST', '2023-08-03 22:40:33', '2023-08-03 22:40:33', NULL),
(2, 'Admin', 'Admin@gmail.com', NULL, '$2y$10$pl2hWuDKLmmV9UkDEB3Ny.1y2vkdSsA7A2.Yz.KagVxaG9Ogc5AgW', NULL, NULL, NULL, NULL, NULL, NULL, 'ADM', '2023-08-04 08:06:06', '2023-08-04 08:06:06', NULL),
(3, 'S provider', 'sprovider@gmail.com', NULL, '$2y$10$0LVIdHdpekmzv5s02.v2d.wQkgRmlOaIjSz73nptYmB.AXjl4ftl2', NULL, NULL, NULL, NULL, NULL, NULL, 'SVP', '2023-08-04 08:37:46', '2023-08-04 08:37:46', NULL),
(4, 'customer', 'customer@gmail.com', NULL, '$2y$10$pzQJrlf2Ctwm/bsnSGHXFeoUm33WlkKe.Rspdln6mX.pDh7nmwrYi', NULL, NULL, NULL, NULL, NULL, NULL, 'CST', '2023-08-04 08:38:28', '2023-08-04 08:38:28', NULL),
(5, 'md sajib', 'createcover7@gmail.com', NULL, '$2y$10$ym0muoe6I1E29PrXHw1GseFss.PkneJwoAsebXkZrBGbZHdBu5oDK', NULL, NULL, NULL, NULL, NULL, NULL, 'CST', '2023-08-04 19:30:18', '2023-08-04 19:30:18', NULL),
(6, 'akib', 'akib@gmail.com', NULL, '$2y$10$lZyPoL9uKDHuuSTCW6TfZeSTjoWQaiZVMEJiLlL2dtrQL/JXD49AS', NULL, NULL, NULL, NULL, NULL, NULL, 'CST', '2023-08-05 05:16:52', '2023-08-05 05:16:52', NULL),
(7, 'shah ali', 'shahali@gmail.com', NULL, '$2y$10$17CWeDDIWQ7kIkCaDjywae0qJkjAq41fJjK0XRG2yoTcQ207.xVeO', NULL, NULL, NULL, NULL, NULL, NULL, 'CST', '2023-08-05 18:34:48', '2023-08-05 18:34:48', NULL),
(8, 'joy', 'joy@gmail.com', NULL, '$2y$10$tDrCYvbMLJJCDMIzmPRoUuyS/bHwASNYcEq2f63L.Bw6P8kcz3uA.', NULL, NULL, NULL, NULL, NULL, NULL, 'SVP', '2023-08-05 19:20:14', '2023-08-05 19:20:14', '1303895377'),
(9, 'shah ali', 'shah@gmail.com', NULL, '$2y$10$8fxP4me//zIZnZL6hXnQ/eiQACXBWOHluvzITlkEFonyWmD7Laaxm', NULL, NULL, NULL, NULL, NULL, NULL, 'SVP', '2023-08-17 06:32:38', '2023-08-17 06:32:38', '01306549874');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `bookings`
--
ALTER TABLE `bookings`
  ADD PRIMARY KEY (`id`),
  ADD KEY `bookings_user_id_foreign` (`user_id`),
  ADD KEY `bookings_service_id_foreign` (`service_id`);

--
-- Indexes for table `contacts`
--
ALTER TABLE `contacts`
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
-- Indexes for table `services`
--
ALTER TABLE `services`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `services_slug_unique` (`slug`),
  ADD KEY `services_service_category_id_foreign` (`service_category_id`);

--
-- Indexes for table `service_categories`
--
ALTER TABLE `service_categories`
  ADD PRIMARY KEY (`id`),
  ADD KEY `service_categories_slug_index` (`slug`);

--
-- Indexes for table `service_providers`
--
ALTER TABLE `service_providers`
  ADD PRIMARY KEY (`id`),
  ADD KEY `service_providers_user_id_foreign` (`user_id`),
  ADD KEY `service_providers_service_category_id_foreign` (`service_category_id`);

--
-- Indexes for table `sessions`
--
ALTER TABLE `sessions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sessions_user_id_index` (`user_id`),
  ADD KEY `sessions_last_activity_index` (`last_activity`);

--
-- Indexes for table `sliders`
--
ALTER TABLE `sliders`
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
-- AUTO_INCREMENT for table `bookings`
--
ALTER TABLE `bookings`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `contacts`
--
ALTER TABLE `contacts`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `services`
--
ALTER TABLE `services`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=101;

--
-- AUTO_INCREMENT for table `service_categories`
--
ALTER TABLE `service_categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT for table `service_providers`
--
ALTER TABLE `service_providers`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `sliders`
--
ALTER TABLE `sliders`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `bookings`
--
ALTER TABLE `bookings`
  ADD CONSTRAINT `bookings_service_id_foreign` FOREIGN KEY (`service_id`) REFERENCES `services` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `bookings_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `services`
--
ALTER TABLE `services`
  ADD CONSTRAINT `services_service_category_id_foreign` FOREIGN KEY (`service_category_id`) REFERENCES `service_categories` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `service_providers`
--
ALTER TABLE `service_providers`
  ADD CONSTRAINT `service_providers_service_category_id_foreign` FOREIGN KEY (`service_category_id`) REFERENCES `service_categories` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `service_providers_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
