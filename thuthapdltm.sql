-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Máy chủ: 127.0.0.1:3307
-- Thời gian đã tạo: Th10 21, 2025 lúc 05:58 AM
-- Phiên bản máy phục vụ: 10.4.32-MariaDB
-- Phiên bản PHP: 8.1.25

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Cơ sở dữ liệu: `thuthapdltm`
--

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `admins`
--

CREATE TABLE `admins` (
  `id` int(11) NOT NULL,
  `username` varchar(50) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `admins`
--

INSERT INTO `admins` (`id`, `username`, `password`, `created_at`) VALUES
(1, 'admin', 'e10adc3949ba59abbe56e057f20f883e', '2025-11-21 03:18:45');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `categories`
--

CREATE TABLE `categories` (
  `id` int(11) NOT NULL,
  `name` varchar(150) NOT NULL,
  `parent_id` int(11) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `platforms`
--

CREATE TABLE `platforms` (
  `id` int(11) NOT NULL,
  `code` varchar(50) NOT NULL,
  `name` varchar(100) NOT NULL,
  `base_url` varchar(255) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `platforms`
--

INSERT INTO `platforms` (`id`, `code`, `name`, `base_url`, `created_at`) VALUES
(1, 'other', 'sieuthiyte.com.vn', NULL, '2025-11-21 02:46:17'),
(2, 'tiki', 'tiki.vn', NULL, '2025-11-21 03:09:58'),
(3, 'sieuthiyte', 'sieuthiyte.com.vn', NULL, '2025-11-21 03:59:50');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `products`
--

CREATE TABLE `products` (
  `id` bigint(20) NOT NULL,
  `platform_id` int(11) NOT NULL,
  `category_id` int(11) DEFAULT NULL,
  `title` varchar(255) NOT NULL,
  `normalized_key` varchar(255) DEFAULT NULL,
  `product_url` text NOT NULL,
  `image_url` text DEFAULT NULL,
  `shop_name` varchar(255) DEFAULT NULL,
  `price_current` bigint(20) DEFAULT NULL,
  `price_original` bigint(20) DEFAULT NULL,
  `sold_quantity` int(11) DEFAULT NULL,
  `rating_avg` decimal(2,1) DEFAULT NULL,
  `rating_count` int(11) DEFAULT NULL,
  `is_active` tinyint(1) DEFAULT 1,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT NULL,
  `last_scraped_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `products`
--

INSERT INTO `products` (`id`, `platform_id`, `category_id`, `title`, `normalized_key`, `product_url`, `image_url`, `shop_name`, `price_current`, `price_original`, `sold_quantity`, `rating_avg`, `rating_count`, `is_active`, `created_at`, `updated_at`, `last_scraped_at`) VALUES
(1, 2, NULL, 'Điện thoại Tecno Spark GO 1 (3GB/64GB) - Hàng Chính Hãng', '-i-n-tho-i-tecno-spark-go-1-3gb-64gb-h-ng-ch-nh-h-ng', 'https://tiki.vn/dien-thoai-tecno-spark-go-1-3gb-64gb-hang-chinh-hang-p277930407.html?spid=277930411', 'https://salt.tikicdn.com/cache/280x280/ts/product/3e/c0/33/8b84b5235168b3659a9220325840d2b8.png', NULL, 2190000, 2190000, 72, 4.0, 3, 1, '2025-11-21 04:13:41', NULL, '2025-11-21 04:13:41'),
(2, 2, NULL, 'Máy Tính Bảng Galaxy Tab S10 FE Wifi (8GB/128GB) - Hàng Chính Hãng', 'm-y-t-nh-b-ng-galaxy-tab-s10-fe-wifi-8gb-128gb-h-ng-ch-nh-h-ng', 'https://tiki.vn/may-tinh-bang-galaxy-tab-s10-fe-wifi-8gb-128gb-hang-chinh-hang-p277812880.html?spid=277812884', 'https://salt.tikicdn.com/cache/280x280/ts/product/54/9d/a3/432eddf53e1681ff4d68ad12d67faa3b.jpg', NULL, 8490000, 11990000, 9, 5.0, 1, 1, '2025-11-21 04:13:41', NULL, '2025-11-21 04:13:41'),
(3, 2, NULL, 'Điện Thoại Xiaomi Redmi Note 14 5G 8GB/256GB - Hàng Chính Hãng', '-i-n-tho-i-xiaomi-redmi-note-14-5g-8gb-256gb-h-ng-ch-nh-h-ng', 'https://tiki.vn/dien-thoai-xiaomi-redmi-note-14-5g-8gb-256gb-hang-chinh-hang-p277811118.html?spid=277811120', 'https://salt.tikicdn.com/cache/280x280/ts/product/f2/d2/e1/f25544e006966abf0f3800a2c0b1e18b.jpg', NULL, 6029000, 7290000, 1, 0.0, 0, 1, '2025-11-21 04:13:41', NULL, '2025-11-21 04:13:41'),
(4, 2, NULL, 'Điện thoại Samsung Galaxy A26 5G (8/128GB), Mặt lưng kính, AI-Circle to Search, Camera HDR chụp đêm sáng rõ - Hàng chính hãng', '-i-n-tho-i-samsung-galaxy-a26-5g-8-128gb-m-t-l-ng-k-nh-ai-circle-to-search-camera-hdr-ch-p-m-s-ng-r-h-ng-ch-nh-h-ng', 'https://tiki.vn/dien-thoai-samsung-galaxy-a26-5g-8-128gb-mat-lung-kinh-ai-circle-to-search-camera-hdr-chup-dem-sang-ro-hang-chinh-hang-p277777809.html?spid=277777813', 'https://salt.tikicdn.com/cache/280x280/ts/product/e3/9d/b3/7a965246188ce9d42ea6041b66f707da.jpg', NULL, 5290000, 6990000, 2759, 5.0, 18, 1, '2025-11-21 04:13:41', NULL, '2025-11-21 04:13:41'),
(5, 2, NULL, 'Điện Thoại Samsung Galaxy A06 5G 4GB/128GB - Hàng Chính Hãng', '-i-n-tho-i-samsung-galaxy-a06-5g-4gb-128gb-h-ng-ch-nh-h-ng', 'https://tiki.vn/dien-thoai-samsung-a06-5g-4gb-128gb-hang-chinh-hang-p277737595.html?spid=277737599', 'https://salt.tikicdn.com/cache/280x280/ts/product/54/43/66/455eeffaf69969ae183e6e8bf44649d9.jpg', NULL, 2639000, 4490000, 17, 4.0, 6, 1, '2025-11-21 04:13:41', NULL, '2025-11-21 04:13:41'),
(6, 2, NULL, 'Máy tính bảng iPad Gen 11 (A16) WiFi', 'm-y-t-nh-b-ng-ipad-gen-11-a16-wifi', 'https://tiki.vn/may-tinh-bang-ipad-gen-11-a16-wifi-p277619147.html?spid=277619155', 'https://salt.tikicdn.com/cache/280x280/ts/product/b7/2a/79/5a477585d8b95154800b3d577aac42f2.jpg', NULL, 8490000, 9990000, 336, 5.0, 49, 1, '2025-11-21 04:13:41', NULL, '2025-11-21 04:13:41'),
(7, 2, NULL, 'Điện Thoại Samsung Galaxy A36 5G 8GB/128GB - Hàng Chính Hãng', '-i-n-tho-i-samsung-galaxy-a36-5g-8gb-128gb-h-ng-ch-nh-h-ng', 'https://tiki.vn/dien-thoai-samsung-a36-5g-8gb-128gb-hang-chinh-hang-p277512620.html?spid=277512626', 'https://salt.tikicdn.com/cache/280x280/ts/product/1d/33/6b/a090d6f8da2d6a4b0e2fb94b37169ff4.jpg', NULL, 8290000, 8290000, 9, 5.0, 3, 1, '2025-11-21 04:13:41', NULL, '2025-11-21 04:13:41'),
(8, 2, NULL, 'Điện Thoại Xiaomi Redmi 13 8GB/128GB - Hàng Chính Hãng', '-i-n-tho-i-xiaomi-redmi-13-8gb-128gb-h-ng-ch-nh-h-ng', 'https://tiki.vn/dien-thoai-xiaomi-redmi-13-8gb-128gb-hang-chinh-hang-p277360579.html?spid=277360587', 'https://salt.tikicdn.com/cache/280x280/ts/product/24/4a/2f/11d371022ec1e410bfbf7d8f95af10e7.jpg', NULL, 3229000, 4690000, 12, 5.0, 1, 1, '2025-11-21 04:13:41', NULL, '2025-11-21 04:13:41'),
(9, 2, NULL, 'Điện thoại Itel it9310 4G, Màn 3 inch , kết nối - WIFI - FB - Youtube - Hàng chính hãng', '-i-n-tho-i-itel-it9310-4g-m-n-3-inch-k-t-n-i-wifi-fb-youtube-h-ng-ch-nh-h-ng', 'https://tiki.vn/dien-thoai-itel-it9310-4g-ket-noi-wifi-facebookk-youtube-hang-chinh-hang-p277326226.html?spid=277333093', 'https://salt.tikicdn.com/cache/280x280/ts/product/84/25/95/cb115a7ce384af61faf189c67ccc6e2b.jpg', NULL, 645000, 645000, 7, 3.0, 2, 1, '2025-11-21 04:13:41', NULL, '2025-11-21 04:13:41'),
(10, 2, NULL, 'Điện Thoại Xiaomi Redmi 14C 6GB/128GB - Hàng Chính Hãng', '-i-n-tho-i-xiaomi-redmi-14c-6gb-128gb-h-ng-ch-nh-h-ng', 'https://tiki.vn/dien-thoai-xiaomi-redmi-14c-6gb-128gb-hang-chinh-hang-p277311630.html?spid=277311636', 'https://salt.tikicdn.com/cache/280x280/ts/product/4e/e9/a5/625ef7979f8b3c5c1ead5925da256db4.jpg', NULL, 2689000, 3690000, 16, 5.0, 1, 1, '2025-11-21 04:13:41', NULL, '2025-11-21 04:13:41'),
(11, 2, NULL, 'Điện Thoại Xiaomi Redmi Note 14 6GB/128GB - Hàng Chính Hãng', '-i-n-tho-i-xiaomi-redmi-note-14-6gb-128gb-h-ng-ch-nh-h-ng', 'https://tiki.vn/dien-thoai-xiaomi-redmi-note-14-6gb-128gb-hang-chinh-hang-p277175913.html?spid=277175917', 'https://salt.tikicdn.com/cache/280x280/ts/product/10/ab/85/a4099a15951fa60cdcbe24ac461725ae.jpg', NULL, 4159000, 4990000, 13, 4.0, 8, 1, '2025-11-21 04:13:41', NULL, '2025-11-21 04:13:41'),
(12, 2, NULL, 'Điện thoại Samsung Galaxy S25, Điện thoại AI, Tìm kiếm thông minh, Video camera đêm Nightography, Chip Snapdragon - Hàng Chính Hãng', '-i-n-tho-i-samsung-galaxy-s25-i-n-tho-i-ai-t-m-ki-m-th-ng-minh-video-camera-m-nightography-chip-snapdragon-h-ng-ch-nh-h-ng', 'https://tiki.vn/dien-thoai-samsung-galaxy-s25-dien-thoai-ai-tim-kiem-thong-minh-video-camera-dem-nightography-chip-snapdragon-hang-chinh-hang-p277063012.html?spid=277165128', 'https://salt.tikicdn.com/cache/280x280/ts/product/3a/f1/92/26171c22498fcfa3f602d8666f239eae.jpg', NULL, 17590000, 22990000, 18, 5.0, 5, 1, '2025-11-21 04:13:41', NULL, '2025-11-21 04:13:41'),
(13, 2, NULL, 'Điện thoại ZTE Blade A34 (4GB/64GB) Màn hình 6.6\", Pin 5000mAh - Hàng chính hãng', '-i-n-tho-i-zte-blade-a34-4gb-64gb-m-n-h-nh-6-6-pin-5000mah-h-ng-ch-nh-h-ng', 'https://tiki.vn/dien-thoai-zte-blade-a34-4gb-64gb-man-hinh-6-6-pin-5000mah-hang-chinh-hang-p277014407.html?spid=277026883', 'https://salt.tikicdn.com/cache/280x280/ts/product/1b/f2/db/a8eeee5be0a5cb9a1726d5c9a02ff378.jpg', NULL, 1699000, 2190000, 7, 5.0, 2, 1, '2025-11-21 04:13:41', NULL, '2025-11-21 04:13:41'),
(14, 2, NULL, 'Điện thoại Xiaomi Redmi Note 14 6GB/128GB - Hàng Chính Hãng', '-i-n-tho-i-xiaomi-redmi-note-14-6gb-128gb-h-ng-ch-nh-h-ng', 'https://tiki.vn/dien-thoai-xiaomi-redmi-note-14-6gb-128gb-hang-chinh-hang-p277007015.html?spid=277007021', 'https://salt.tikicdn.com/cache/280x280/ts/product/0b/fb/e0/8b6b96db507c4d58a84c021a2f10bd34.png', NULL, 3830000, 4990000, 6480, 5.0, 64, 1, '2025-11-21 04:13:41', NULL, '2025-11-21 04:13:41'),
(15, 2, NULL, 'Điện Thoại Samsung Galaxy A06 4GB/64GB - Hàng Chính Hãng', '-i-n-tho-i-samsung-galaxy-a06-4gb-64gb-h-ng-ch-nh-h-ng', 'https://tiki.vn/dien-thoai-samsung-a06-4gb-64gb-hang-chinh-hang-p276944892.html?spid=276944894', 'https://salt.tikicdn.com/cache/280x280/ts/product/e6/77/8d/695ccf826070451961cb58f5afa5da57.jpg', NULL, 2189000, 3190000, 15, 4.0, 4, 1, '2025-11-21 04:13:41', NULL, '2025-11-21 04:13:41'),
(16, 2, NULL, 'Máy đọc sách New Kindle 2024, 16Gb Mới nguyên Seal - Hàng chính hãng', 'm-y-c-s-ch-new-kindle-2024-16gb-m-i-nguy-n-seal-h-ng-ch-nh-h-ng', 'https://tiki.vn/may-doc-sach-new-kindle-2024-16gb-moi-nguyen-seal-hang-chinh-hang-p276539826.html?spid=276540793', 'https://salt.tikicdn.com/cache/280x280/ts/product/81/97/07/ef850ab65d627136e37df90097857451.jpg', NULL, 3590000, 3990000, 8, 5.0, 1, 1, '2025-11-21 04:13:41', NULL, '2025-11-21 04:13:41'),
(17, 2, NULL, 'Điện thoại Realme V60 (6GB/128GB) 5G , Chíp Dimensity 6300, Rom tiếng việt - Hàng nhập khẩu', '-i-n-tho-i-realme-v60-6gb-128gb-5g-ch-p-dimensity-6300-rom-ti-ng-vi-t-h-ng-nh-p-kh-u', 'https://tiki.vn/dien-thoai-realme-v60-6gb-128gb-5g-chip-dimensity-6300-rom-tieng-viet-hang-nhap-khau-p276410628.html?spid=276410632', 'https://salt.tikicdn.com/cache/280x280/ts/product/23/cc/4d/4e8dc54b550ca5438b8f3b4d5e786f7e.jpg', NULL, 2799000, 3999000, 6, 5.0, 2, 1, '2025-11-21 04:13:41', NULL, '2025-11-21 04:13:41'),
(18, 2, NULL, 'Điện thoại Masstel izi 16 4G - Hàng chính hãng', '-i-n-tho-i-masstel-izi-16-4g-h-ng-ch-nh-h-ng', 'https://tiki.vn/dien-thoai-masstel-izi-16-4g-hang-chinh-hang-p276314708.html?spid=276314710', 'https://salt.tikicdn.com/cache/280x280/ts/product/20/10/20/0590c71068184207b66d1a0e6cd6e0af.jpg', NULL, 609000, 629000, 3, 5.0, 2, 1, '2025-11-21 04:13:41', NULL, '2025-11-21 04:13:41'),
(19, 2, NULL, 'Điện Thoại Samsung Galaxy A06 4GB/128GB - Hàng Chính Hãng', '-i-n-tho-i-samsung-galaxy-a06-4gb-128gb-h-ng-ch-nh-h-ng', 'https://tiki.vn/dien-thoai-samsung-a06-4gb-128gb-hang-chinh-hang-p276274790.html?spid=276274792', 'https://salt.tikicdn.com/cache/280x280/ts/product/09/0e/5b/58aaf66e130a4127e9ebac714fff04fd.jpg', NULL, 2529000, 3490000, 14, 5.0, 4, 1, '2025-11-21 04:13:41', NULL, '2025-11-21 04:13:41'),
(20, 2, NULL, 'Apple iPhone 16 Pro', 'apple-iphone-16-pro', 'https://tiki.vn/apple-iphone-16-pro-p276110023.html?spid=276110029', 'https://salt.tikicdn.com/cache/280x280/ts/product/f7/ea/dd/53765af30c1da20b27dc20629bb31c1d.jpg', NULL, 24990000, 28990000, 242, 5.0, 42, 1, '2025-11-21 04:13:41', NULL, '2025-11-21 04:13:41'),
(21, 2, NULL, 'Điện Thoại Oppo A3 6GB/128GB - Hàng Chính Hãng', '-i-n-tho-i-oppo-a3-6gb-128gb-h-ng-ch-nh-h-ng', 'https://tiki.vn/dien-thoai-oppo-a3-6gb-128gb-hang-chinh-hang-p276046675.html?spid=276046677', 'https://salt.tikicdn.com/cache/280x280/ts/product/3d/1e/e1/d25d2401827612ce66f96d1805a7c146.jpg', NULL, 3989000, 4990000, 1, 0.0, 0, 1, '2025-11-21 04:13:41', NULL, '2025-11-21 04:13:41'),
(22, 2, NULL, 'Điện thoại Itel it8010 4G - Hàng Chính Hãng', '-i-n-tho-i-itel-it8010-4g-h-ng-ch-nh-h-ng', 'https://tiki.vn/dien-thoai-itel-it8010-4g-hang-chinh-hang-p275913708.html?spid=276275007', 'https://salt.tikicdn.com/cache/280x280/ts/product/dc/cb/30/8bb2bc0a8c218f7700ce19a6afcec881.png', NULL, 299000, 299000, 28, 4.0, 3, 1, '2025-11-21 04:13:41', NULL, '2025-11-21 04:13:41'),
(23, 2, NULL, 'Điện Thoại Nokia 220 4G - Hàng Chính Hãng', '-i-n-tho-i-nokia-220-4g-h-ng-ch-nh-h-ng', 'https://tiki.vn/dien-thoai-nokia-220-4g-hang-chinh-hang-p275386982.html?spid=275386986', 'https://salt.tikicdn.com/cache/280x280/ts/product/c2/86/5c/a027350956eb8d6ea6adc459ab55a6d8.jpg', NULL, 999000, 1190000, 15, 5.0, 3, 1, '2025-11-21 04:13:41', NULL, '2025-11-21 04:13:41'),
(24, 2, NULL, 'Điện thoại Redmi Note 12R 5G 6/128GB Snapdragon 4 Gen 2, Rom Quốc tế có sẳn Tiếng việt - Hàng nhập khẩu', '-i-n-tho-i-redmi-note-12r-5g-6-128gb-snapdragon-4-gen-2-rom-qu-c-t-c-s-n-ti-ng-vi-t-h-ng-nh-p-kh-u', 'https://tiki.vn/dien-thoai-redmi-note-12r-5g-6-128gb-snapdragon-4-gen-2-rom-quoc-te-co-san-tieng-viet-hang-nhap-khau-p274544634.html?spid=274544644', 'https://salt.tikicdn.com/cache/280x280/ts/product/43/b8/49/e2fc95922f52f6b546b3159e2e64454d.jpg', NULL, 3099000, 3590000, 28, 5.0, 9, 1, '2025-11-21 04:13:41', NULL, '2025-11-21 04:13:41'),
(25, 2, NULL, 'Điện thoại ZTE Libero 5G IV - 4GB/128GB Dimensity 700 , Kháng nước IP67 , Sạc nhanh 22,5W - Mới nguyên seal - Hàng nhập khẩu', '-i-n-tho-i-zte-libero-5g-iv-4gb-128gb-dimensity-700-kh-ng-n-c-ip67-s-c-nhanh-22-5w-m-i-nguy-n-seal-h-ng-nh-p-kh-u', 'https://tiki.vn/dien-thoai-zte-libero-5g-iv-4gb-128gb-dimensity-700-khang-nuoc-ip67-sac-nhanh-22-5w-moi-nguyen-seal-hang-nhap-khau-p274191773.html?spid=274191775', 'https://salt.tikicdn.com/cache/280x280/ts/product/81/00/e6/90ead980cb6221148ca246fc9c14e623.jpg', NULL, 2269000, 2990000, 13, 4.0, 4, 1, '2025-11-21 04:13:41', NULL, '2025-11-21 04:13:41'),
(26, 2, NULL, 'Máy Tính Bảng Samsung Galaxy Tab A9 Plus Wifi 4GB/64GB - Đã Kích Hoạt Bảo Hành Điện Tử - Hàng Chính Hãng', 'm-y-t-nh-b-ng-samsung-galaxy-tab-a9-plus-wifi-4gb-64gb-k-ch-ho-t-b-o-h-nh-i-n-t-h-ng-ch-nh-h-ng', 'https://tiki.vn/may-tinh-bang-samsung-galaxy-tab-a9-plus-wifi-4gb-64gb-hang-chinh-hang-p274101262.html?spid=274101980', 'https://salt.tikicdn.com/cache/280x280/ts/product/11/05/33/c86a2665b38da0da05c3dde562cf022c.png', NULL, 3550000, 5990000, 446, 4.0, 104, 1, '2025-11-21 04:13:41', NULL, '2025-11-21 04:13:41'),
(27, 2, NULL, 'Điện Thoại Oppo A58 6GB/128GB - Hàng Chính Hãng', '-i-n-tho-i-oppo-a58-6gb-128gb-h-ng-ch-nh-h-ng', 'https://tiki.vn/dien-thoai-oppo-a58-6gb-128gb-hang-chinh-hang-p270975124.html?spid=270975155', 'https://salt.tikicdn.com/cache/280x280/ts/product/91/e7/7e/24461c4d1f848b11eaa4ff444f1ec5f9.jpg', NULL, 3890000, 4990000, 29503, 5.0, 148, 1, '2025-11-21 04:13:41', NULL, '2025-11-21 04:13:41'),
(28, 2, NULL, 'Máy đọc sách All New Kindle Paperwhite 5 (11th Gen) - Hàng chính hãng', 'm-y-c-s-ch-all-new-kindle-paperwhite-5-11th-gen-h-ng-ch-nh-h-ng', 'https://tiki.vn/may-doc-sach-all-new-kindle-paperwhite-5-11th-gen-hang-nhap-khau-p252586291.html?spid=262699580', 'https://salt.tikicdn.com/cache/280x280/ts/product/e1/b3/36/e47b71970a5309bbd5b230257a64aacd.jpg', NULL, 3590000, 3590000, 139, 5.0, 106, 1, '2025-11-21 04:13:41', NULL, '2025-11-21 04:13:41'),
(29, 2, NULL, 'Điện thoại Xiaomi Redmi Note 10 JE 5G 4GB/64GB - Màn 90HZ - Chống Nước IP68 - Hàng Nhập Khẩu - Bản quốc tế', '-i-n-tho-i-xiaomi-redmi-note-10-je-5g-4gb-64gb-m-n-90hz-ch-ng-n-c-ip68-h-ng-nh-p-kh-u-b-n-qu-c-t-', 'https://tiki.vn/dien-thoai-xiaomi-redmi-note-10-je-5g-4gb-64gb-man-90hz-chong-nuoc-ip68-hang-nhap-khau-ban-quoc-te-p230155305.html?spid=230155309', 'https://salt.tikicdn.com/cache/280x280/ts/product/d4/e9/12/02af66cd50c05398bb27285f43905e85.jpg', NULL, 2429000, 3990000, 167, 4.0, 62, 1, '2025-11-21 04:13:41', NULL, '2025-11-21 04:13:41'),
(30, 2, NULL, 'Điện Thoại Bàn Panasonic KX-TSC11 - Hàng Chính Hãng - Trắng', '-i-n-tho-i-b-n-panasonic-kx-tsc11-h-ng-ch-nh-h-ng-tr-ng', 'https://tiki.vn/dien-thoai-ban-panasonic-kx-tsc11-hang-chinh-hang-p204237269.html?spid=204267315', 'https://salt.tikicdn.com/cache/280x280/ts/product/84/dd/92/991b033392f01d334d1ce248d69e1daa.jpg', NULL, 620000, 620000, 292, 5.0, 51, 1, '2025-11-21 04:13:41', NULL, '2025-11-21 04:13:41'),
(31, 2, NULL, 'Combo máy đọc sách Kindle Paperwhite 5 (11th gen) tặng kèm bao da ( Cover ) - Hàng nhập khẩu', 'combo-m-y-c-s-ch-kindle-paperwhite-5-11th-gen-t-ng-k-m-bao-da-cover-h-ng-nh-p-kh-u', 'https://tiki.vn/combo-may-doc-sach-kindle-paperwhite-5-8gb-black-11th-gen-tang-kem-bao-da-cover-hang-nhap-khau-p201067649.html?spid=184640915', 'https://salt.tikicdn.com/cache/280x280/ts/product/05/49/8f/e093321a9f3ed55fe77e8c83bfca8c55.jpg', NULL, 3590000, 3590000, 576, 5.0, 116, 1, '2025-11-21 04:13:41', NULL, '2025-11-21 04:13:41'),
(32, 2, NULL, 'Apple iPhone 14', 'apple-iphone-14', 'https://tiki.vn/apple-iphone-14-p197214029.html?spid=197214049', 'https://salt.tikicdn.com/cache/280x280/ts/product/ba/f6/94/0385f9e510386f0a10c8756ff7a61a4f.png', NULL, 17990000, 17990000, 706, 5.0, 166, 1, '2025-11-21 04:13:41', NULL, '2025-11-21 04:13:41'),
(33, 2, NULL, 'Điện thoại bàn Panasonic KX-TGD310 hàng chính hãng', '-i-n-tho-i-b-n-panasonic-kx-tgd310-h-ng-ch-nh-h-ng', 'https://tiki.vn/dien-thoai-ban-panasonic-kx-tgd310-hang-chinh-hang-p181927774.html?spid=181927775', 'https://salt.tikicdn.com/cache/280x280/ts/product/98/d1/15/b90f8523563a566d553a97d5474dee78.jpg', NULL, 1190000, 1190000, 31, 4.0, 8, 1, '2025-11-21 04:13:41', NULL, '2025-11-21 04:13:41'),
(34, 2, NULL, 'Điện thoại bàn Panasonix KX-TGD312 hàng chính hãng', '-i-n-tho-i-b-n-panasonix-kx-tgd312-h-ng-ch-nh-h-ng', 'https://tiki.vn/dien-thoai-ban-panasonix-kx-tgd312-hang-chinh-hang-p181927736.html?spid=181927737', 'https://salt.tikicdn.com/cache/280x280/ts/product/a9/d3/c3/e0db04f1b762462ca82d6f0aac15909d.jpg', NULL, 1850000, 1850000, 28, 5.0, 6, 1, '2025-11-21 04:13:41', NULL, '2025-11-21 04:13:41'),
(35, 2, NULL, 'Điện thoại Itel Magic X Pro 4G ,Kết nối WIFI,Chia sẻ WIFI cho máy khác - Hàng chính hãng', '-i-n-tho-i-itel-magic-x-pro-4g-k-t-n-i-wifi-chia-s-wifi-cho-m-y-kh-c-h-ng-ch-nh-h-ng', 'https://tiki.vn/dien-thoai-itel-it9200-4g-wifi-hang-chinh-hang-p181452535.html?spid=181452537', 'https://salt.tikicdn.com/cache/280x280/ts/product/27/06/cf/fe27f98370126ef93aa9284afb3e4714.jpg', NULL, 619000, 790000, 155, 4.0, 31, 1, '2025-11-21 04:13:41', NULL, '2025-11-21 04:13:41'),
(36, 2, NULL, 'Điện thoại bàn Panasonic KX-TS560 hàng chính hãng', '-i-n-tho-i-b-n-panasonic-kx-ts560-h-ng-ch-nh-h-ng', 'https://tiki.vn/dien-thoai-ban-panasonic-kx-ts560-hang-chinh-hang-p170727266.html?spid=170727268', 'https://salt.tikicdn.com/cache/280x280/ts/product/6c/d3/57/b0a6e797eca715efa377cf7247071fe8.jpg', NULL, 688000, 688000, 53, 5.0, 14, 1, '2025-11-21 04:13:41', NULL, '2025-11-21 04:13:41'),
(37, 2, NULL, 'Điện thoại bàn Panasonic KX-TGF310 hàng chính hãng', '-i-n-tho-i-b-n-panasonic-kx-tgf310-h-ng-ch-nh-h-ng', 'https://tiki.vn/dien-thoai-ban-panasonic-kx-tgf310-hang-chinh-hang-p164318603.html?spid=164318604', 'https://salt.tikicdn.com/cache/280x280/ts/product/dc/72/f9/bbe51405ebc1681123970efd01f32163.jpg', NULL, 2350000, 2350000, 38, 5.0, 6, 1, '2025-11-21 04:13:41', NULL, '2025-11-21 04:13:41'),
(38, 2, NULL, 'Điện thoại bàn Panasonic  KX-TS500MX-hàng chính hãng', '-i-n-tho-i-b-n-panasonic-kx-ts500mx-h-ng-ch-nh-h-ng', 'https://tiki.vn/dien-thoai-ban-kxts500-hang-chinh-hang-p163914808.html?spid=163914814', 'https://salt.tikicdn.com/cache/280x280/ts/product/2f/8c/8e/a27e99afa7d4bb5a1df206f6523fe4c8.jpg', NULL, 320000, 320000, 988, 5.0, 139, 1, '2025-11-21 04:13:41', NULL, '2025-11-21 04:13:41'),
(39, 2, NULL, 'Máy đọc sách All New Kindle Paperwhite 5 (11th Gen) - Hàng nhập khẩu', 'm-y-c-s-ch-all-new-kindle-paperwhite-5-11th-gen-h-ng-nh-p-kh-u', 'https://tiki.vn/may-doc-sach-all-new-kindle-paperwhite-5-11th-gen-hang-nhap-khau-p125182567.html?spid=125182569', 'https://salt.tikicdn.com/cache/280x280/ts/product/14/2f/c6/a161edd03cf817a13d4c3255d1467f0a.jpg', NULL, 3990000, 3990000, 1583, 5.0, 409, 1, '2025-11-21 04:13:41', NULL, '2025-11-21 04:13:41'),
(40, 2, NULL, 'Điện thoại bàn không dây Panasonic KX-TGB110-Hàng Chính Hãng', '-i-n-tho-i-b-n-kh-ng-d-y-panasonic-kx-tgb110-h-ng-ch-nh-h-ng', 'https://tiki.vn/dien-thoai-ban-khong-day-panasonic-kx-tgb110-hang-chinh-hang-p11251951.html?spid=51326642', 'https://salt.tikicdn.com/cache/280x280/ts/product/28/d0/4f/f307b473d3b46f9f03efc8062d11713c.jpg', NULL, 950000, 950000, 17, 5.0, 1, 1, '2025-11-21 04:13:41', NULL, '2025-11-21 04:13:41'),
(41, 2, NULL, 'Điện thoại OPPO A3 8GB/128GB - Hàng Chính Hãng', '-i-n-tho-i-oppo-a3-8gb-128gb-h-ng-ch-nh-h-ng', 'https://tiki.vn/dien-thoai-oppo-a3-6gb-128gb-hang-chinh-hang-p278219968.html?spid=278219978', 'https://salt.tikicdn.com/cache/280x280/ts/product/06/86/b4/83714e05899252ed2497c12553219ae0.jpg', NULL, 4090000, 5290000, 3975, 4.0, 7, 1, '2025-11-21 04:13:41', NULL, '2025-11-21 04:13:41'),
(42, 2, NULL, 'Điện thoại OPPO Reno13 F 5G 12GB/512GB - Hàng Chính Hãng', '-i-n-tho-i-oppo-reno13-f-5g-12gb-512gb-h-ng-ch-nh-h-ng', 'https://tiki.vn/dien-thoai-oppo-reno13-f-5g-12gb-512gb-hang-chinh-hang-p278219887.html?spid=278219889', 'https://salt.tikicdn.com/cache/280x280/ts/product/5f/c7/5d/e8f39d53e1324bd2536ee9eae98ee988.png', NULL, 8250000, 11990000, 11, 5.0, 1, 1, '2025-11-21 04:13:41', NULL, '2025-11-21 04:13:41'),
(43, 2, NULL, 'Điện Thoại Realme C75x 6GB/128GB - Hàng Chính Hãng', '-i-n-tho-i-realme-c75x-6gb-128gb-h-ng-ch-nh-h-ng', 'https://tiki.vn/dien-thoai-realme-c75x-6gb-128gb-hang-chinh-hang-p277944451.html?spid=277944455', 'https://salt.tikicdn.com/cache/280x280/ts/product/84/c0/46/88c40a491eccd75e6df3afa5176d149a.jpg', NULL, 3929000, 4690000, 1, 0.0, 0, 1, '2025-11-21 04:13:41', NULL, '2025-11-21 04:13:41'),
(44, 2, NULL, 'Điện Thoại Samsung Galaxy A06 5G 4GB/64GB - Hàng Chính Hãng', '-i-n-tho-i-samsung-galaxy-a06-5g-4gb-64gb-h-ng-ch-nh-h-ng', 'https://tiki.vn/dien-thoai-samsung-a06-5g-4gb-64gb-hang-chinh-hang-p277944334.html?spid=277944336', 'https://salt.tikicdn.com/cache/280x280/ts/product/a5/a0/34/8d34647a6f97612e08a6869a6a7729ab.jpg', NULL, 2369000, 3490000, NULL, 5.0, 1, 1, '2025-11-21 04:13:41', NULL, '2025-11-21 04:13:41'),
(45, 2, NULL, 'Điện Thoại Oppo A58 8GB/128GB - Hàng Chính Hãng', '-i-n-tho-i-oppo-a58-8gb-128gb-h-ng-ch-nh-h-ng', 'https://tiki.vn/dien-thoai-oppo-a58-8gb-128gb-hang-chinh-hang-p277738691.html?spid=277738695', 'https://salt.tikicdn.com/cache/280x280/ts/product/2e/5c/33/6857f633bba8589fbcf4c81c48a989c3.jpg', NULL, 3879000, 5490000, 4, 5.0, 1, 1, '2025-11-21 04:13:41', NULL, '2025-11-21 04:13:41'),
(46, 2, NULL, 'Điện Thoại Xiaomi Redmi 13 6GB/128GB - Hàng Chính Hãng', '-i-n-tho-i-xiaomi-redmi-13-6gb-128gb-h-ng-ch-nh-h-ng', 'https://tiki.vn/dien-thoai-xiaomi-redmi-13-6gb-128gb-hang-chinh-hang-p277737629.html?spid=277737631', 'https://salt.tikicdn.com/cache/280x280/ts/product/67/24/2d/17d53a9ca3b08d40d39bff3b6fb979cb.jpg', NULL, 2939000, 4290000, 7, 5.0, 3, 1, '2025-11-21 04:13:41', NULL, '2025-11-21 04:13:41'),
(47, 2, NULL, 'Điện thoại Samsung Galaxy A26 5G (8GB/128GB) - Hàng chính hãng', '-i-n-tho-i-samsung-galaxy-a26-5g-8gb-128gb-h-ng-ch-nh-h-ng', 'https://tiki.vn/dien-thoai-samsung-galaxy-a26-5g-8gb-128gb-hang-chinh-hang-p277707642.html?spid=277707652', 'https://salt.tikicdn.com/cache/280x280/ts/product/7a/f6/21/92920e66452234d959ea338c5f6e738a.jpg', NULL, 5649000, 6990000, NULL, 0.0, 0, 1, '2025-11-21 04:13:41', NULL, '2025-11-21 04:13:41'),
(48, 2, NULL, 'Điện Thoại Samsung Galaxy A26 5G 8GB/128GB - Hàng Chính Hãng', '-i-n-tho-i-samsung-galaxy-a26-5g-8gb-128gb-h-ng-ch-nh-h-ng', 'https://tiki.vn/dien-thoai-samsung-a26-5g-8gb-128gb-hang-chinh-hang-p277704510.html?spid=277704512', 'https://salt.tikicdn.com/cache/280x280/ts/product/a7/fe/de/bc4d3269a46128e7c9c9ecb3f0e4c213.jpg', NULL, 5487000, 6990000, 2, 0.0, 0, 1, '2025-11-21 04:13:41', NULL, '2025-11-21 04:13:41'),
(49, 2, NULL, 'Điện thoại Samsung Galaxy A06 5G (4GB/64GB) - Hàng chính hãng', '-i-n-tho-i-samsung-galaxy-a06-5g-4gb-64gb-h-ng-ch-nh-h-ng', 'https://tiki.vn/dien-thoai-samsung-galaxy-a06-5g-4gb-64gb-hang-chinh-hang-p277646748.html?spid=277646750', 'https://salt.tikicdn.com/cache/280x280/ts/product/e6/df/a4/7313484a4a3e03fd625d61ffee4478e0.jpg', NULL, 3460000, 3490000, NULL, 5.0, 1, 1, '2025-11-21 04:13:41', NULL, '2025-11-21 04:13:41'),
(50, 2, NULL, 'Điện thoại Smartphone Vivo Y19s siêu bền - RAM 4GB ROM 128GB - Màu đen và xanh - 5500mAh - Hàng chính hãng', '-i-n-tho-i-smartphone-vivo-y19s-si-u-b-n-ram-4gb-rom-128gb-m-u-en-v-xanh-5500mah-h-ng-ch-nh-h-ng', 'https://tiki.vn/vivo-y19s-4gb-128gb-p277607297.html?spid=277608199', 'https://salt.tikicdn.com/cache/280x280/ts/product/43/2c/ac/16c0f54cb6034936f9dcd799344bcb5a.jpg', NULL, 3050000, 3050000, NULL, 0.0, 0, 1, '2025-11-21 04:13:41', NULL, '2025-11-21 04:13:41'),
(51, 2, NULL, 'Điện thoại Samsung Galaxy A56 5G (8GB/128GB) - Hàng chính hãng', '-i-n-tho-i-samsung-galaxy-a56-5g-8gb-128gb-h-ng-ch-nh-h-ng', 'https://tiki.vn/dien-thoai-samsung-galaxy-a56-5g-8gb-128gb-hang-chinh-hang-p277499293.html?spid=277499297', 'https://salt.tikicdn.com/cache/280x280/ts/product/f0/b5/3a/acded00be6f7204ec6f7ed2bd0a0d0c9.jpg', NULL, 8249000, 9990000, 1, 2.0, 1, 1, '2025-11-21 04:13:41', NULL, '2025-11-21 04:13:41'),
(52, 2, NULL, 'Điện thoại Samsung Galaxy S25 Ultra (12GB/256GB) - Hàng chính hãng', '-i-n-tho-i-samsung-galaxy-s25-ultra-12gb-256gb-h-ng-ch-nh-h-ng', 'https://tiki.vn/dien-thoai-samsung-galaxy-s25-ultra-12gb-256gb-hang-chinh-hang-p277484785.html?spid=277489459', 'https://salt.tikicdn.com/cache/280x280/ts/product/44/54/20/c826120c67aaf3cabacd2085793e0731.jpg', NULL, 33790000, 33990000, NULL, 0.0, 0, 1, '2025-11-21 04:13:41', NULL, '2025-11-21 04:13:41'),
(53, 2, NULL, 'Điện thoại Xiaomi Redmi Note 14 (6GB/128GB) - Hàng chính hãng', '-i-n-tho-i-xiaomi-redmi-note-14-6gb-128gb-h-ng-ch-nh-h-ng', 'https://tiki.vn/dien-thoai-xiaomi-redmi-note-14-6gb-128gb-hang-chinh-hang-p277356260.html?spid=277356266', 'https://salt.tikicdn.com/cache/280x280/ts/product/2a/9b/c5/5ad0420f493daac7668fe29440bd0d26.jpg', NULL, 4960000, 4990000, NULL, 0.0, 0, 1, '2025-11-21 04:13:41', NULL, '2025-11-21 04:13:41'),
(54, 2, NULL, 'Điện thoại Xiaomi Redmi Note 14 Pro+ 5G (8GB/256GB) - Hàng chính hãng', '-i-n-tho-i-xiaomi-redmi-note-14-pro-5g-8gb-256gb-h-ng-ch-nh-h-ng', 'https://tiki.vn/dien-thoai-xiaomi-redmi-note-14-pro-5g-8gb-256gb-hang-chinh-hang-p277356193.html?spid=277356199', 'https://salt.tikicdn.com/cache/280x280/ts/product/8e/29/10/17ea04e162b7f63bf7bc178b7597bb21.jpg', NULL, 10890000, 10990000, NULL, 0.0, 0, 1, '2025-11-21 04:13:41', NULL, '2025-11-21 04:13:41'),
(55, 2, NULL, 'Điện thoại Xiaomi Redmi A3 (4GB/128GB) Màn hình 6.71inch,pin 5000mAh - Hàng chính hãng', '-i-n-tho-i-xiaomi-redmi-a3-4gb-128gb-m-n-h-nh-6-71inch-pin-5000mah-h-ng-ch-nh-h-ng', 'https://tiki.vn/dien-thoai-xiaomi-redmi-a3-4gb-128gb-man-hinh-6-71inch-pin-5000mah-hang-chinh-hang-p277315392.html?spid=277315398', 'https://salt.tikicdn.com/cache/280x280/ts/product/b9/93/94/38d38f6ad31d05094e90e48f97bf454c.jpg', NULL, 2099000, 2690000, NULL, 0.0, 0, 1, '2025-11-21 04:13:41', NULL, '2025-11-21 04:13:41'),
(56, 2, NULL, 'Điện Thoại Xiaomi Redmi A3 3GB/64GB - Hàng Chính Hãng', '-i-n-tho-i-xiaomi-redmi-a3-3gb-64gb-h-ng-ch-nh-h-ng', 'https://tiki.vn/dien-thoai-xiaomi-redmi-a3-3gb-64gb-hang-chinh-hang-p277175955.html?spid=277175957', 'https://salt.tikicdn.com/cache/280x280/ts/product/76/59/a1/300e65677f36d963cc26cb0196b8456e.jpg', NULL, 1849000, 2490000, 6, 0.0, 0, 1, '2025-11-21 04:13:41', NULL, '2025-11-21 04:13:41'),
(57, 2, NULL, 'Điện Thoại Xiaomi Redmi Note 14 Pro+ 5G 8GB/256GB - Hàng Chính Hãng', '-i-n-tho-i-xiaomi-redmi-note-14-pro-5g-8gb-256gb-h-ng-ch-nh-h-ng', 'https://tiki.vn/dien-thoai-xiaomi-redmi-note-14-pro-5g-8gb-256gb-hang-chinh-hang-p277049062.html?spid=277049066', 'https://salt.tikicdn.com/cache/280x280/ts/product/fb/52/cc/3f3c2ab723989d8e38cc92199dfbc03d.jpg', NULL, 8979000, 10990000, NULL, 5.0, 1, 1, '2025-11-21 04:13:41', NULL, '2025-11-21 04:13:41'),
(58, 2, NULL, 'Điện Thoại Xiaomi 14T Pro 5G 12GB/512GB - Hàng Chính Hãng', '-i-n-tho-i-xiaomi-14t-pro-5g-12gb-512gb-h-ng-ch-nh-h-ng', 'https://tiki.vn/dien-thoai-xiaomi-14t-pro-5g-12gb-512gb-hang-chinh-hang-p277041250.html?spid=277041254', 'https://salt.tikicdn.com/cache/280x280/ts/product/a1/cf/1c/c2fde85b2e3c31232de22db7ca6f5639.jpg', NULL, 14739000, 17990000, 2, 0.0, 0, 1, '2025-11-21 04:13:41', NULL, '2025-11-21 04:13:41'),
(59, 2, NULL, 'Điện thoại Realme Note 50 , Màn 90HZ (3GB/64GB) Rom quốc tế - Hàng chính hãng', '-i-n-tho-i-realme-note-50-m-n-90hz-3gb-64gb-rom-qu-c-t-h-ng-ch-nh-h-ng', 'https://tiki.vn/dien-thoai-realme-note-50-3gb-64gb-rom-quoc-te-hang-nhap-khau-nhat-p277030799.html?spid=277030804', 'https://salt.tikicdn.com/cache/280x280/ts/product/41/cd/bb/1602f9d78df7386eb039261a9a8ea17d.jpg', NULL, 1999000, 2690000, 4, 5.0, 1, 1, '2025-11-21 04:13:41', NULL, '2025-11-21 04:13:41'),
(60, 2, NULL, 'Điện thoại Samsung Galaxy A16 LTE - Hàng chính hãng', '-i-n-tho-i-samsung-galaxy-a16-lte-h-ng-ch-nh-h-ng', 'https://tiki.vn/samsung-galaxy-a16-lte-hang-chinh-hang-p276925932.html?spid=276925934', 'https://salt.tikicdn.com/cache/280x280/ts/product/fb/78/0c/f88ea8836a305f29cfe7f21a0f4029f2.jpg', NULL, 5040000, 5090000, 2, 5.0, 1, 1, '2025-11-21 04:13:41', NULL, '2025-11-21 04:13:41'),
(61, 2, NULL, 'Máy đọc sách Kindle Scribe 2024 Kèm bút Premium - Hàng chính hãng', 'm-y-c-s-ch-kindle-scribe-2024-k-m-b-t-premium-h-ng-ch-nh-h-ng', 'https://tiki.vn/may-doc-sach-kindle-scribe-2024-kem-but-premium-hang-chinh-hang-p276529979.html?spid=276530026', 'https://salt.tikicdn.com/cache/280x280/ts/product/1a/8d/9a/54af0264658dcec523b1a4e3a97f1971.jpg', NULL, 12190000, 12990000, 1, 0.0, 0, 1, '2025-11-21 04:13:41', NULL, '2025-11-21 04:13:41'),
(62, 2, NULL, 'Điện thoại Samsung Galaxy S24 FE - Hàng chính hãng', '-i-n-tho-i-samsung-galaxy-s24-fe-h-ng-ch-nh-h-ng', 'https://tiki.vn/dien-thoai-samsung-galaxy-s24-fe-hang-chinh-hang-p276489194.html?spid=276489200', 'https://salt.tikicdn.com/cache/280x280/ts/product/1c/d1/67/56351f169dc3528c0af7e5f3e6955234.jpg', NULL, 11449000, 16990000, NULL, 0.0, 0, 1, '2025-11-21 04:13:41', NULL, '2025-11-21 04:13:41'),
(63, 2, NULL, 'Combo Máy đọc sách Amazon Kindle Paperwhite 6 (Gen 12th) Kèm Bao Da, Mới nguyên Seal - Hàng chính hãng', 'combo-m-y-c-s-ch-amazon-kindle-paperwhite-6-gen-12th-k-m-bao-da-m-i-nguy-n-seal-h-ng-ch-nh-h-ng', 'https://tiki.vn/combo-may-doc-sach-amazon-kindle-paperwhite-6-gen-12th-kem-bao-da-moi-nguyen-seal-hang-chinh-hang-p276465090.html?spid=276465100', 'https://salt.tikicdn.com/cache/280x280/ts/product/01/be/79/15314677596e5076541f60fc98999dbe.jpg', NULL, 4850000, 4890000, 4, 0.0, 0, 1, '2025-11-21 04:13:41', NULL, '2025-11-21 04:13:41'),
(64, 2, NULL, 'Máy đọc sách Amazon Kindle Paperwhite 6 (Gen 12th), Mới nguyên Seal - Hàng chính hãng', 'm-y-c-s-ch-amazon-kindle-paperwhite-6-gen-12th-m-i-nguy-n-seal-h-ng-ch-nh-h-ng', 'https://tiki.vn/may-doc-sach-amazon-kindle-paperwhite-6-gen-12th-hang-chinh-hang-p276448920.html?spid=276448922', 'https://salt.tikicdn.com/cache/280x280/ts/product/59/e7/74/68080c04130bb376a971ea54196b6f60.jpg', NULL, 4850000, 4890000, 22, 5.0, 3, 1, '2025-11-21 04:13:41', NULL, '2025-11-21 04:13:41'),
(65, 2, NULL, 'Điện thoại Xiaomi Redmi 14C - Hàng chính hãng', '-i-n-tho-i-xiaomi-redmi-14c-h-ng-ch-nh-h-ng', 'https://tiki.vn/dien-thoai-xiaomi-redmi-14c-hang-chinh-hang-p276369646.html?spid=276082758', 'https://salt.tikicdn.com/cache/280x280/ts/product/16/87/35/c2224c70077d1eea2418571b4211323d.jpg', NULL, 3260000, 3290000, 1, 0.0, 0, 1, '2025-11-21 04:13:41', NULL, '2025-11-21 04:13:41'),
(66, 2, NULL, 'Xiaomi Redmi Note 12 5G 8GB/128GB ,Màn AMOLED 120Hz , Snapdragon 4 Gen 1 ,Sạc 33W ,Rom tiếng việt - Hàng nhập khẩu', 'xiaomi-redmi-note-12-5g-8gb-128gb-m-n-amoled-120hz-snapdragon-4-gen-1-s-c-33w-rom-ti-ng-vi-t-h-ng-nh-p-kh-u', 'https://tiki.vn/xiaomi-redmi-note-12-5g-8gb-128gb-man-amoled-120hz-snapdragon-4-gen-1-sac-33w-rom-tieng-viet-hang-nhap-khau-p276099688.html?spid=276099690', 'https://salt.tikicdn.com/cache/280x280/ts/product/f8/38/b4/a2383801c67f21de9aca169a306bf39e.jpg', NULL, 3169000, 3999000, 10, 3.0, 3, 1, '2025-11-21 04:13:41', NULL, '2025-11-21 04:13:41'),
(67, 2, NULL, 'Điện Thoại Xiaomi Redmi 14C 4GB/128GB - Hàng Chính Hãng', '-i-n-tho-i-xiaomi-redmi-14c-4gb-128gb-h-ng-ch-nh-h-ng', 'https://tiki.vn/dien-thoai-xiaomi-redmi-14c-4gb-128gb-hang-chinh-hang-p276062770.html?spid=276062772', 'https://salt.tikicdn.com/cache/280x280/ts/product/bd/34/3f/8365843a7d8ee076c466438fe09fd60a.jpg', NULL, 2499000, 3290000, 2, 0.0, 0, 1, '2025-11-21 04:13:41', NULL, '2025-11-21 04:13:41'),
(68, 2, NULL, 'Máy đọc sách Pocketbook Era Color- Hàng chính hãng', 'm-y-c-s-ch-pocketbook-era-color-h-ng-ch-nh-h-ng', 'https://tiki.vn/may-doc-sach-pocketbook-era-color-hang-chinh-hang-p275407523.html?spid=275407524', 'https://salt.tikicdn.com/cache/280x280/ts/product/1f/88/22/5271fea71782871aa651a66e25db20fa.png', NULL, 5990000, 7500000, 7, 4.0, 2, 1, '2025-11-21 04:13:41', NULL, '2025-11-21 04:13:41'),
(69, 2, NULL, 'Điện Thoại Nokia 3210 4G - Hàng Chính Hãng', '-i-n-tho-i-nokia-3210-4g-h-ng-ch-nh-h-ng', 'https://tiki.vn/dien-thoai-nokia-3210-4g-hang-chinh-hang-p275386649.html?spid=275386653', 'https://salt.tikicdn.com/cache/280x280/ts/product/62/8d/25/a4929ffdfd4faac5679bb7f068efa4e5.jpg', NULL, 1599000, 1790000, 4, 5.0, 2, 1, '2025-11-21 04:13:41', NULL, '2025-11-21 04:13:41'),
(70, 2, NULL, 'Điện thoại OPPO A2M 5G 6GB/128GB , Dimensity 6020 , Màn 90Hz , Rom tiếng việt - Hàng chính hãng', '-i-n-tho-i-oppo-a2m-5g-6gb-128gb-dimensity-6020-m-n-90hz-rom-ti-ng-vi-t-h-ng-ch-nh-h-ng', 'https://tiki.vn/dien-thoai-oppo-a2m-5g-6gb-128gb-dimensity-6020-man-90hz-rom-tieng-viet-hang-chinh-hang-p274639765.html?spid=274639776', 'https://salt.tikicdn.com/cache/280x280/ts/product/63/bd/3f/fb7658b0316f4a930d29dbd22bbd22fa.jpg', NULL, 3690000, 3690000, 14, 4.0, 3, 1, '2025-11-21 04:13:41', NULL, '2025-11-21 04:13:41'),
(71, 2, NULL, 'Điện Thoại Xiaomi Redmi Note 13 Pro 5G 8GB/128GB Snapdragon 7s Gen 2 , Màn OLED 120Hz, Rom Tiếng việt - Hàng nhập khẩu', '-i-n-tho-i-xiaomi-redmi-note-13-pro-5g-8gb-128gb-snapdragon-7s-gen-2-m-n-oled-120hz-rom-ti-ng-vi-t-h-ng-nh-p-kh-u', 'https://tiki.vn/dien-thoai-xiaomi-redmi-note-13-pro-5g-8gb-128gb-snapdragon-7s-gen-2-man-oled-120hz-rom-tieng-viet-hang-nhap-khau-p274638659.html?spid=274638661', 'https://salt.tikicdn.com/cache/280x280/ts/product/e2/46/d7/6c4179b0a95c74d323e44d2bb1c5bef5.jpg', NULL, 4699000, 5690000, 66, 4.0, 25, 1, '2025-11-21 04:13:41', NULL, '2025-11-21 04:13:41'),
(72, 2, NULL, 'Điện thoại Xiaomi Redmi 13R 5G 6GB/128GB Dimensity 6100+ , Màn 90Hz , Rom quốc tế có sẳn Tiếng việt - Hàng nhập khẩu', '-i-n-tho-i-xiaomi-redmi-13r-5g-6gb-128gb-dimensity-6100-m-n-90hz-rom-qu-c-t-c-s-n-ti-ng-vi-t-h-ng-nh-p-kh-u', 'https://tiki.vn/dien-thoai-redmi-note-13r-5g-4gb-128gb-dimensity-6100-man-90hz-rom-quoc-te-co-san-tieng-viet-hang-nhap-khau-p274638430.html?spid=274638438', 'https://salt.tikicdn.com/cache/280x280/ts/product/4f/7b/47/8ddc593e26f0e5a0c8f767ed58383eeb.jpg', NULL, 3590000, 3590000, 24, 5.0, 6, 1, '2025-11-21 04:13:41', NULL, '2025-11-21 04:13:41'),
(73, 2, NULL, 'Máy Tính Bảng Học Tập Smart Study 1, Hàng Chính Hãng, Cho Trẻ Từ 5-12 Tuổi, 64GB, Tích Hợp Chương Trình Học Tập Toàn Diện', 'm-y-t-nh-b-ng-h-c-t-p-smart-study-1-h-ng-ch-nh-h-ng-cho-tr-t-5-12-tu-i-64gb-t-ch-h-p-ch-ng-tr-nh-h-c-t-p-to-n-di-n', 'https://tiki.vn/may-tinh-bang-hoc-tap-smart-study-1-ban-dac-biet-cho-tre-tu-5-12-tuoi-64gb-tich-hop-chuong-trinh-hoc-tap-toan-dien-p274361820.html?spid=274361821', 'https://salt.tikicdn.com/cache/280x280/ts/product/40/20/30/0c329b44a3e2517967587bfc28bb5ff8.jpg', NULL, 7900000, 7900000, NULL, 0.0, 0, 1, '2025-11-21 04:13:41', NULL, '2025-11-21 04:13:41'),
(74, 2, NULL, 'Điện Thoại Xiaomi Redmi Note 13 8GB/128GB - Hàng Chính Hãng', '-i-n-tho-i-xiaomi-redmi-note-13-8gb-128gb-h-ng-ch-nh-h-ng', 'https://tiki.vn/dien-thoai-xiaomi-redmi-note-13-8gb-128gb-hang-chinh-hang-p274099409.html?spid=274099411', 'https://salt.tikicdn.com/cache/280x280/ts/product/9a/5d/96/ea8d3e19d25f6562a912d0ddee6b41df.jpg', NULL, 3969000, 5290000, 7, 4.0, 3, 1, '2025-11-21 04:13:41', NULL, '2025-11-21 04:13:41'),
(75, 2, NULL, 'Điện Thoại Xiaomi Redmi Note 13 6GB/128GB - Hàng Chính Hãng', '-i-n-tho-i-xiaomi-redmi-note-13-6gb-128gb-h-ng-ch-nh-h-ng', 'https://tiki.vn/dien-thoai-xiaomi-redmi-note-13-6gb-128gb-hang-chinh-hang-p273990229.html?spid=273990231', 'https://salt.tikicdn.com/cache/280x280/ts/product/ea/6d/92/5917ee4c9a1124d82298b4695cd742b1.jpg', NULL, 3679000, 4890000, 18, 4.0, 6, 1, '2025-11-21 04:13:41', NULL, '2025-11-21 04:13:41'),
(76, 2, NULL, 'Máy tính bảng Kindle Fire HD 10 2023 13th - Hàng nhập khẩu', 'm-y-t-nh-b-ng-kindle-fire-hd-10-2023-13th-h-ng-nh-p-kh-u', 'https://tiki.vn/may-tinh-bang-kindle-fire-hd-10-2023-13th-p273653444.html?spid=276940252', 'https://salt.tikicdn.com/cache/280x280/ts/product/1c/4a/8d/dcf11350bc4d2906b635700acd856b33.jpg', NULL, 2590000, 2590000, 1, 5.0, 1, 1, '2025-11-21 04:13:41', NULL, '2025-11-21 04:13:41'),
(77, 2, NULL, 'Máy tính bảng Kindle Fire HD10 2023 13th - 32Gb - Hàng chính hãng', 'm-y-t-nh-b-ng-kindle-fire-hd10-2023-13th-32gb-h-ng-ch-nh-h-ng', 'https://tiki.vn/may-tinh-bang-kindle-fire-hd10-2023-13th-32gb-hang-nhap-khau-p273559020.html?spid=273559024', 'https://salt.tikicdn.com/cache/280x280/ts/product/7b/ba/b2/179bb5d5fc63d2723f6ac8e51544e2fa.jpg', NULL, 3590000, 3590000, 9, 5.0, 2, 1, '2025-11-21 04:13:41', NULL, '2025-11-21 04:13:41'),
(78, 2, NULL, 'Máy tính bảng Xelex Gama Tab X8 EDU (Hàng chính hãng)', 'm-y-t-nh-b-ng-xelex-gama-tab-x8-edu-h-ng-ch-nh-h-ng-', 'https://tiki.vn/may-tinh-bang-xelex-gama-tab-x8-edu-p249782771.html?spid=249782772', 'https://salt.tikicdn.com/cache/280x280/ts/product/1d/c2/aa/f2c04f0289d29269144c7f156064298b.jpg', NULL, 2890000, 2890000, NULL, 0.0, 0, 1, '2025-11-21 04:13:41', NULL, '2025-11-21 04:13:41'),
(79, 2, NULL, 'Điện thoại bàn Panasonic KX-TGB110 hàng chính hãng', '-i-n-tho-i-b-n-panasonic-kx-tgb110-h-ng-ch-nh-h-ng', 'https://tiki.vn/dien-thoai-ban-panasonic-kx-tgb110-p164213695.html?spid=164213696', 'https://salt.tikicdn.com/cache/280x280/ts/product/77/b0/69/63bbae55fe5a5a096392c6d325e8fc95.jpg', NULL, 850000, 850000, 74, 5.0, 18, 1, '2025-11-21 04:13:41', NULL, '2025-11-21 04:13:41'),
(80, 2, NULL, 'Máy đọc sách Kobo Libra (Libra Colour, Libra 2) - hàng nhập khẩu', 'm-y-c-s-ch-kobo-libra-libra-colour-libra-2-h-ng-nh-p-kh-u', 'https://tiki.vn/may-doc-sach-kobo-libra-libra-colour-libra-2-hang-nhap-khau-p139632023.html?spid=275176274', 'https://salt.tikicdn.com/cache/280x280/ts/product/a5/29/a3/ee921c75202c1ddbe6a33112e61775cc.jpg', NULL, 8600000, 8600000, 209, 5.0, 56, 1, '2025-11-21 04:13:41', NULL, '2025-11-21 04:13:41'),
(81, 2, NULL, 'Điện thoại Realme C61 (4GB/128GB) - Hàng chính hãng', '-i-n-tho-i-realme-c61-4gb-128gb-h-ng-ch-nh-h-ng', 'https://tiki.vn/dien-thoai-realme-c61-4gb-128gb-hang-chinh-hang-p277966957.html?spid=277966959', 'https://salt.tikicdn.com/cache/280x280/ts/product/37/8a/93/0f9767399e65a017675f2226e330d873.jpg', NULL, 3560000, 3590000, NULL, 0.0, 0, 1, '2025-11-21 04:13:41', NULL, '2025-11-21 04:13:41'),
(82, 2, NULL, 'Điện thoại Realme Note 50 (4GB/128GB) - Hàng chính hãng', '-i-n-tho-i-realme-note-50-4gb-128gb-h-ng-ch-nh-h-ng', 'https://tiki.vn/dien-thoai-realme-note-50-4gb-128gb-hang-chinh-hang-p277966171.html?spid=277966173', 'https://salt.tikicdn.com/cache/280x280/ts/product/87/bb/e3/5955b0d91a23bbb4b103dd23417df0ab.jpg', NULL, 2880000, 2890000, NULL, 0.0, 0, 1, '2025-11-21 04:13:41', NULL, '2025-11-21 04:13:41'),
(83, 2, NULL, 'Điện thoại vivo Y28 (8GB+128GB) - Hàng chính hãng - 1 Đổi 1 tháng đầu tiên - Bảo hành 12 tháng', '-i-n-tho-i-vivo-y28-8gb-128gb-h-ng-ch-nh-h-ng-1-i-1-th-ng-u-ti-n-b-o-h-nh-12-th-ng', 'https://tiki.vn/dien-thoai-vivo-y28-8gb-128gb-chinh-hang-1-doi-1-thang-dau-tien-bao-hanh-12-thang-p277962391.html?spid=277962419', 'https://salt.tikicdn.com/cache/280x280/ts/product/23/5c/ef/2b234e9da67ef62983be5ddcc7abb5f3.jpg', NULL, 5790000, 5790000, NULL, 0.0, 0, 1, '2025-11-21 04:13:41', NULL, '2025-11-21 04:13:41'),
(84, 2, NULL, 'Điện Thoại Xiaomi Redmi A5 3GB/64GB - Hàng Chính Hãng', '-i-n-tho-i-xiaomi-redmi-a5-3gb-64gb-h-ng-ch-nh-h-ng', 'https://tiki.vn/dien-thoai-xiaomi-redmi-a5-3gb-64gb-hang-chinh-hang-p277944378.html?spid=277944380', 'https://salt.tikicdn.com/cache/280x280/ts/product/a7/10/57/83a9b9157ac078ab812494171f3e8ed2.jpg', NULL, 2329000, 2790000, NULL, 0.0, 0, 1, '2025-11-21 04:13:41', NULL, '2025-11-21 04:13:41'),
(85, 2, NULL, 'Điện thoại Xiaomi Redmi A5 (3GB/64GB) - Hàng chính hãng', '-i-n-tho-i-xiaomi-redmi-a5-3gb-64gb-h-ng-ch-nh-h-ng', 'https://tiki.vn/dien-thoai-xiaomi-redmi-a5-3gb-64gb-hang-chinh-hang-p277877804.html?spid=277877810', 'https://salt.tikicdn.com/cache/280x280/ts/product/31/be/c1/72b0d8a54972f88b9c08904bb1a06186.jpg', NULL, 2489000, 2790000, NULL, 0.0, 0, 1, '2025-11-21 04:13:41', NULL, '2025-11-21 04:13:41'),
(86, 2, NULL, '[MỚI] Điện thoại vivo V50 Lite (12GB/256GB) - Hàng chính hãng - Bảo hành 12 tháng - 1 Đổi 1 trong tháng đầu tiên', '-m-i-i-n-tho-i-vivo-v50-lite-12gb-256gb-h-ng-ch-nh-h-ng-b-o-h-nh-12-th-ng-1-i-1-trong-th-ng-u-ti-n', 'https://tiki.vn/sap-ra-mat-dien-thoai-vivo-v-series-hang-chinh-hang-bao-hanh-12-thang-p277751466.html?spid=277814986', 'https://salt.tikicdn.com/cache/280x280/ts/product/45/87/eb/a7daed29f2a778bd141f04d6b1ec46b3.jpg', NULL, 10990000, 10990000, NULL, 0.0, 0, 1, '2025-11-21 04:13:41', NULL, '2025-11-21 04:13:41'),
(87, 2, NULL, '[MỚI] Điện thoại vivo Y04 (6GB+128GB) - Hàng chính hãng - 1 Đổi 1 trong tháng đầu tiên - Bảo hành 12 tháng', '-m-i-i-n-tho-i-vivo-y04-6gb-128gb-h-ng-ch-nh-h-ng-1-i-1-trong-th-ng-u-ti-n-b-o-h-nh-12-th-ng', 'https://tiki.vn/moi-dien-thoai-vivo-y04-6gb-128gb-hang-chinh-hang-1-doi-1-trong-thang-dau-tien-bao-hanh-12-thang-p277728993.html?spid=277743624', 'https://salt.tikicdn.com/cache/280x280/ts/product/98/7b/d5/b99c27b6b37537bcbc87cc691cb0c3d7.jpg', NULL, 2990000, 2990000, NULL, 0.0, 0, 1, '2025-11-21 04:13:41', NULL, '2025-11-21 04:13:41'),
(88, 2, NULL, 'Điện Thoại Realme Note 60x 3GB/64GB - Hàng Chính Hãng', '-i-n-tho-i-realme-note-60x-3gb-64gb-h-ng-ch-nh-h-ng', 'https://tiki.vn/dien-thoai-realme-note-60x-3gb-64gb-hang-chinh-hang-p277360298.html?spid=277360300', 'https://salt.tikicdn.com/cache/280x280/ts/product/d2/da/2a/defead18638c34058e80160a57bb7604.jpg', NULL, 2069000, 2690000, NULL, 0.0, 0, 1, '2025-11-21 04:13:41', NULL, '2025-11-21 04:13:41'),
(89, 2, NULL, 'Điện Thoại Realme Note 50 4GB/128GB - Hàng Chính Hãng', '-i-n-tho-i-realme-note-50-4gb-128gb-h-ng-ch-nh-h-ng', 'https://tiki.vn/dien-thoai-realme-note-50-4gb-128gb-hang-chinh-hang-p277357126.html?spid=277357128', 'https://salt.tikicdn.com/cache/280x280/ts/product/47/58/f3/6d41bd4c0b787fcd2dda8c6abf4fadda.jpg', NULL, 2429000, 2890000, 1, 0.0, 0, 1, '2025-11-21 04:13:41', NULL, '2025-11-21 04:13:41'),
(90, 2, NULL, 'Điện Thoại Realme Note 60 4GB/128GB - Hàng Chính Hãng', '-i-n-tho-i-realme-note-60-4gb-128gb-h-ng-ch-nh-h-ng', 'https://tiki.vn/dien-thoai-realme-note-60-4gb-128gb-hang-chinh-hang-p277356914.html?spid=277356916', 'https://salt.tikicdn.com/cache/280x280/ts/product/e2/2e/47/411b05dfdb8ea4af33a3d29d6f4321fb.jpg', NULL, 2489000, 3390000, 1, 0.0, 0, 1, '2025-11-21 04:13:41', NULL, '2025-11-21 04:13:41'),
(91, 2, NULL, 'Điện thoại Realme Note 60 (4GB/128GB) - Hàng chính hãng', '-i-n-tho-i-realme-note-60-4gb-128gb-h-ng-ch-nh-h-ng', 'https://tiki.vn/dien-thoai-realme-note-60-4gb-128gb-hang-chinh-hang-p277356569.html?spid=277356571', 'https://salt.tikicdn.com/cache/280x280/ts/product/86/6f/23/639a669903ce366ebd0679cb4615937a.jpg', NULL, 3360000, 3390000, NULL, 0.0, 0, 1, '2025-11-21 04:13:41', NULL, '2025-11-21 04:13:41'),
(92, 2, NULL, 'Điện thoại Xiaomi Redmi Note 9T 4GB/128GB 5G Dimensity 800U 5G, Có NFC , Rom tiếng việt - Hàng nhập khẩu Nhật', '-i-n-tho-i-xiaomi-redmi-note-9t-4gb-128gb-5g-dimensity-800u-5g-c-nfc-rom-ti-ng-vi-t-h-ng-nh-p-kh-u-nh-t', 'https://tiki.vn/dien-thoai-xiaomi-redmi-note-9t-4gb-128gb-5g-dimensity-800u-5g-co-nfc-rom-tieng-viet-hang-nhap-khau-nhat-p277315433.html?spid=277326234', 'https://salt.tikicdn.com/cache/280x280/ts/product/29/e8/0d/a540fa81d960d0eba2ee341715a64f01.jpg', NULL, 2369000, 4690000, NULL, 0.0, 0, 1, '2025-11-21 04:13:41', NULL, '2025-11-21 04:13:41'),
(93, 2, NULL, 'Điện Thoại Xiaomi Redmi Note 14 Pro 8GB/256GB - Hàng Chính Hãng', '-i-n-tho-i-xiaomi-redmi-note-14-pro-8gb-256gb-h-ng-ch-nh-h-ng', 'https://tiki.vn/dien-thoai-xiaomi-redmi-note-14-pro-8gb-256gb-hang-chinh-hang-p277174952.html?spid=277174956', 'https://salt.tikicdn.com/cache/280x280/ts/product/96/44/b5/6f7e8fa9d18f9abbdcacc7e2d7b794c1.jpg', NULL, 6679000, 7990000, 1, 0.0, 0, 1, '2025-11-21 04:13:41', NULL, '2025-11-21 04:13:41'),
(94, 2, NULL, 'Điện Thoại Oppo Reno13 F 8GB/256GB - Hàng Chính Hãng', '-i-n-tho-i-oppo-reno13-f-8gb-256gb-h-ng-ch-nh-h-ng', 'https://tiki.vn/dien-thoai-oppo-reno13-f-8gb-256gb-hang-chinh-hang-p277005407.html?spid=277005409', 'https://salt.tikicdn.com/cache/280x280/ts/product/da/ec/79/f31335449810145467d96a53a1007369.jpg', NULL, 7849000, 8990000, 2, 4.0, 2, 1, '2025-11-21 04:13:41', NULL, '2025-11-21 04:13:41'),
(95, 2, NULL, 'Điện thoại Xiaomi Redmi 14C (4GB/128GB) - Hàng chính hãng', '-i-n-tho-i-xiaomi-redmi-14c-4gb-128gb-h-ng-ch-nh-h-ng', 'https://tiki.vn/dien-thoai-xiaomi-redmi-14c-4gb-128gb-hang-chinh-hang-p277004858.html?spid=277004862', 'https://salt.tikicdn.com/cache/280x280/ts/product/38/97/5d/3cda0fba7efa3a90c3bae17bd0cce6fe.jpg', NULL, 2659000, 3290000, NULL, 0.0, 0, 1, '2025-11-21 04:13:41', NULL, '2025-11-21 04:13:41'),
(96, 2, NULL, 'Combo Máy đọc sách Kindle Paperwhite 6 12th Kids 16Gb kèm Cover Amazon, Không quảng cáo - Hàng chính hãng', 'combo-m-y-c-s-ch-kindle-paperwhite-6-12th-kids-16gb-k-m-cover-amazon-kh-ng-qu-ng-c-o-h-ng-ch-nh-h-ng', 'https://tiki.vn/combo-may-doc-sach-kindle-paperwhite-6-12th-kids-16gb-kem-cover-amazon-khong-quang-cao-hang-chinh-hang-p276500411.html?spid=276500415', 'https://salt.tikicdn.com/cache/280x280/ts/product/fc/53/d9/045da58e1a4652d033e7d59abafc6da6.jpg', NULL, 4990000, 4990000, NULL, 0.0, 0, 1, '2025-11-21 04:13:41', NULL, '2025-11-21 04:13:41'),
(97, 2, NULL, 'Máy đọc sách Basic 2024 màn hình 6 inch, độ phân giải 300ppi, dung Lượng 16GB, cổng sạc type C - HÀNG CHÍNH HÃNG', 'm-y-c-s-ch-basic-2024-m-n-h-nh-6-inch-ph-n-gi-i-300ppi-dung-l-ng-16gb-c-ng-s-c-type-c-h-ng-ch-nh-h-ng', 'https://tiki.vn/may-doc-sach-basic-2024-man-hinh-6-inch-do-phan-giai-300ppi-dung-luong-16gb-cong-sac-type-c-p276451993.html?spid=276452016', 'https://salt.tikicdn.com/cache/280x280/ts/product/5b/6f/09/63fb919564695f96cc902f513bdc62e1.jpg', NULL, 3590000, 3590000, NULL, 0.0, 0, 1, '2025-11-21 04:13:41', NULL, '2025-11-21 04:13:41'),
(98, 2, NULL, 'Điện thoại Masstel izi S1 4G - Hàng chính hãng', '-i-n-tho-i-masstel-izi-s1-4g-h-ng-ch-nh-h-ng', 'https://tiki.vn/dien-thoai-masstel-izi-s1-4g-hang-chinh-hang-p276104423.html?spid=276104425', 'https://salt.tikicdn.com/cache/280x280/ts/product/51/63/5c/abc9be8280687e9c321f7b7e28cb86cb.jpg', NULL, 509000, 629000, 3, 0.0, 0, 1, '2025-11-21 04:13:41', NULL, '2025-11-21 04:13:41'),
(99, 2, NULL, 'Điện Thoại Oppo A79 5G 8GB/256GB - Hàng Chính Hãng', '-i-n-tho-i-oppo-a79-5g-8gb-256gb-h-ng-ch-nh-h-ng', 'https://tiki.vn/dien-thoai-oppo-a79-5g-8gb-256gb-hang-chinh-hang-p275627388.html?spid=275627390', 'https://salt.tikicdn.com/cache/280x280/ts/product/bd/dd/0d/3f82285813e7de41ca7e71eeaa655974.jpg', NULL, 5879000, 7490000, 1, 0.0, 0, 1, '2025-11-21 04:13:41', NULL, '2025-11-21 04:13:41'),
(100, 2, NULL, 'Máy tính bảng học tập thông minh Nexta Edutab Kid cho bé từ 5-8 tuổi - quản lý thời gian cho trẻ - 1 đổi 1 trong vòng 30 ngày, bảo hành 12 tháng', 'm-y-t-nh-b-ng-h-c-t-p-th-ng-minh-nexta-edutab-kid-cho-b-t-5-8-tu-i-qu-n-l-th-i-gian-cho-tr-1-i-1-trong-v-ng-30-ng-y-b-o-h-nh-12-th-ng', 'https://tiki.vn/may-tinh-bang-hoc-tap-gia-re-nexta-edutab-kid-cho-be-tu-5-8-tuoi-man-hinh-full-hd-64gb-bao-da-kinh-dan-cuong-luc-hang-chinh-hang-p274560616.html?spid=274560620', 'https://salt.tikicdn.com/cache/280x280/ts/product/3f/32/a7/3b5cf10d73da787880c96d21fc7e9bcd.jpg', NULL, 2990000, 2990000, 6, 5.0, 3, 1, '2025-11-21 04:13:41', NULL, '2025-11-21 04:13:41'),
(101, 2, NULL, 'Điện thoại Masstel izi T2 4G(LTE), Màn hình 2.4 inch, Đèn pin siêu sáng, Loa to - Hàng chính hãng', '-i-n-tho-i-masstel-izi-t2-4g-lte-m-n-h-nh-2-4-inch-n-pin-si-u-s-ng-loa-to-h-ng-ch-nh-h-ng', 'https://tiki.vn/dien-thoai-masstel-izi-t2-4g-lte-man-hinh-2-4-inch-den-pin-sieu-sang-loa-to-hang-chinh-hang-p274524050.html?spid=274524062', 'https://salt.tikicdn.com/cache/280x280/ts/product/20/f4/90/4483bca6b0b51c0edc514499e44485fe.jpg', NULL, 559000, 559000, 9, 5.0, 3, 1, '2025-11-21 04:13:41', NULL, '2025-11-21 04:13:41'),
(102, 2, NULL, 'Điện thoại người già Masstel Fami 12S 4G(LTE) , Bàn phím chữ số to, Loa lớn , Máy viền thép chắc chắn - Hàng chính hãng', '-i-n-tho-i-ng-i-gi-masstel-fami-12s-4g-lte-b-n-ph-m-ch-s-to-loa-l-n-m-y-vi-n-th-p-ch-c-ch-n-h-ng-ch-nh-h-ng', 'https://tiki.vn/dien-thoai-masstel-fami-12s-4g-lte-ban-phim-chu-so-to-fm-khong-day-hang-chinh-hang-p274524033.html?spid=274524037', 'https://salt.tikicdn.com/cache/280x280/ts/product/11/9f/0f/7b7e5a12cccbd7433f1f9b7c45a82e25.jpg', NULL, 599000, 650000, 2, 0.0, 0, 1, '2025-11-21 04:13:41', NULL, '2025-11-21 04:13:41'),
(103, 2, NULL, 'Điện thoại Masstel Fami 60S 4G(LTE) ,Bàn phím lớn, Khung viền kim loại - Hàng chính hãng', '-i-n-tho-i-masstel-fami-60s-4g-lte-b-n-ph-m-l-n-khung-vi-n-kim-lo-i-h-ng-ch-nh-h-ng', 'https://tiki.vn/dien-thoai-masstel-fami-60s-4g-lte-ban-phim-lon-khung-vien-kim-loai-hang-chinh-hang-p274516245.html?spid=274516249', 'https://salt.tikicdn.com/cache/280x280/ts/product/0c/ed/72/16b922d2f044b86415f30e54e558d5d8.jpg', NULL, 689000, 699000, 3, 5.0, 1, 1, '2025-11-21 04:13:41', NULL, '2025-11-21 04:13:41'),
(104, 2, NULL, 'Điện thoại Xiaomi Redmi Note 13 Pro 4G (8GB/128GB) - Hàng chính hãng', '-i-n-tho-i-xiaomi-redmi-note-13-pro-4g-8gb-128gb-h-ng-ch-nh-h-ng', 'https://tiki.vn/dien-thoai-xiaomi-redmi-note-13-pro-4g-8gb-128gb-hang-chinh-hang-p274375122.html?spid=274375124', 'https://salt.tikicdn.com/cache/280x280/ts/product/4c/fd/70/61e4e0ab85e2394b65ac46ef3631277b.JPG', NULL, 7240000, 7290000, NULL, 0.0, 0, 1, '2025-11-21 04:13:41', NULL, '2025-11-21 04:13:41'),
(105, 2, NULL, 'Máy tính bảng học tập thông minh Nexta Edutab Pro cho trẻ 9-12 tuổi - giải pháp học tập - quản lý thời gian cho trẻ - bảo hảnh 12 tháng', 'm-y-t-nh-b-ng-h-c-t-p-th-ng-minh-nexta-edutab-pro-cho-tr-9-12-tu-i-gi-i-ph-p-h-c-t-p-qu-n-l-th-i-gian-cho-tr-b-o-h-nh-12-th-ng', 'https://tiki.vn/may-tinh-bang-hoc-tap-thong-minh-nexta-edutab-pro-10-4-inch-toi-uu-cho-tre-9-12-tuoi-64gb-tich-hop-ung-dung-hoc-tap-hang-nhap-khau-p274364026.html?spid=274379797', 'https://salt.tikicdn.com/cache/280x280/ts/product/48/e7/ba/4b5300093733207ac09d0d495990d73e.jpg', NULL, 3990000, 3990000, NULL, 0.0, 0, 1, '2025-11-21 04:13:41', NULL, '2025-11-21 04:13:41'),
(106, 2, NULL, 'Điện Thoại Oppo A38 4GB/128GB - Hàng Chính Hãng', '-i-n-tho-i-oppo-a38-4gb-128gb-h-ng-ch-nh-h-ng', 'https://tiki.vn/dien-thoai-oppo-a38-4gb-128gb-hang-chinh-hang-p274156763.html?spid=274156767', 'https://salt.tikicdn.com/cache/280x280/ts/product/b6/cc/da/163e97e549fe83aaa3d9460f4e689877.jpg', NULL, 3129000, 4490000, NULL, 0.0, 0, 1, '2025-11-21 04:13:41', NULL, '2025-11-21 04:13:41'),
(107, 2, NULL, 'Điện thoại Masstel Fami 8 4G(LTE) Gọi HD call , Bàn phím chữ số lớn,Loa to - Hàng chính hãng', '-i-n-tho-i-masstel-fami-8-4g-lte-g-i-hd-call-b-n-ph-m-ch-s-l-n-loa-to-h-ng-ch-nh-h-ng', 'https://tiki.vn/dien-thoai-masstel-fami-8-4g-lte-goi-hd-call-ban-phim-chu-so-lon-loa-to-hang-chinh-hang-p274019962.html?spid=274019972', 'https://salt.tikicdn.com/cache/280x280/ts/product/0d/0d/57/7fc4581afd12819be4be25caa518cf87.jpg', NULL, 519000, 669000, 14, 4.0, 2, 1, '2025-11-21 04:13:41', NULL, '2025-11-21 04:13:41'),
(108, 2, NULL, 'Điện Thoại Oppo A18 4GB/64GB - Hàng Chính Hãng', '-i-n-tho-i-oppo-a18-4gb-64gb-h-ng-ch-nh-h-ng', 'https://tiki.vn/dien-thoai-oppo-a18-4gb-64gb-hang-chinh-hang-p273668660.html?spid=273668662', 'https://salt.tikicdn.com/cache/280x280/ts/product/75/3f/17/e11da64ff2d74dc16c8dab530d479e47.jpg', NULL, 2619000, 3690000, 6, 5.0, 4, 1, '2025-11-21 04:13:41', NULL, '2025-11-21 04:13:41');
INSERT INTO `products` (`id`, `platform_id`, `category_id`, `title`, `normalized_key`, `product_url`, `image_url`, `shop_name`, `price_current`, `price_original`, `sold_quantity`, `rating_avg`, `rating_count`, `is_active`, `created_at`, `updated_at`, `last_scraped_at`) VALUES
(109, 2, NULL, 'Điện thoại Xiaomi Redmi 13C (4+128GB) | 6.74\" 90Hz| Media Tek Helio G85| 5000mAh - Hàng chính hãng', '-i-n-tho-i-xiaomi-redmi-13c-4-128gb-6-74-90hz-media-tek-helio-g85-5000mah-h-ng-ch-nh-h-ng', 'https://tiki.vn/dien-thoai-xiaomi-redmi-13c-4-128gb-6-74-90hz-media-tek-helio-g85-5000mah-hang-chinh-hang-p273412211.html?spid=273412217', 'https://salt.tikicdn.com/cache/280x280/ts/product/b2/d0/df/c2c4471df532b5a9e4244e15b5676215.jpg', NULL, 3290000, 3290000, 9, 0.0, 0, 1, '2025-11-21 04:13:41', NULL, '2025-11-21 04:13:41'),
(110, 2, NULL, 'Điện thoại Xiaomi Redmi 13C (4GB/128GB) - Hàng chính hãng - Bảo hành 18 tháng', '-i-n-tho-i-xiaomi-redmi-13c-4gb-128gb-h-ng-ch-nh-h-ng-b-o-h-nh-18-th-ng', 'https://tiki.vn/dien-thoai-xiaomi-redmi-13c-4gb-128gb-hang-chinh-hang-bao-hanh-18-thang-p273373420.html?spid=273373422', 'https://salt.tikicdn.com/cache/280x280/ts/product/f2/57/75/5110a44c973ed88c8608cbc65064dbbd.jpg', NULL, 3090000, 3090000, 7, 4.0, 2, 1, '2025-11-21 04:13:41', NULL, '2025-11-21 04:13:41'),
(111, 2, NULL, 'Điện thoại Libero 5G III - 4/64GB Dimensity 700 ,Màn OLED ,Kháng nước IP57 - Hàng nhập khẩu nhật', '-i-n-tho-i-libero-5g-iii-4-64gb-dimensity-700-m-n-oled-kh-ng-n-c-ip57-h-ng-nh-p-kh-u-nh-t', 'https://tiki.vn/dien-thoai-zte-libero-5g-iii-4-64gb-dimensity-700-man-oled-khang-nuoc-ip57-hang-nhap-khau-nhat-p272850971.html?spid=274142098', 'https://salt.tikicdn.com/cache/280x280/ts/product/3a/56/28/e0c93dc48e79579ab1f7b57e2bbe6f75.jpg', NULL, 2990000, 2990000, 11, 5.0, 4, 1, '2025-11-21 04:13:41', NULL, '2025-11-21 04:13:41'),
(112, 2, NULL, 'Điện thoại Samsung Galaxy A05s (4GB/128GB) - Hàng chính hãng', '-i-n-tho-i-samsung-galaxy-a05s-4gb-128gb-h-ng-ch-nh-h-ng', 'https://tiki.vn/dien-thoai-samsung-galaxy-a05s-4gb-128gb-hang-chinh-hang-p272273680.html?spid=273364804', 'https://salt.tikicdn.com/cache/280x280/ts/product/c1/28/d8/af9156032b3dd9297d7a7c3a73128928.jpg', NULL, 3990000, 3990000, NULL, 0.0, 0, 1, '2025-11-21 04:13:41', NULL, '2025-11-21 04:13:41'),
(113, 2, NULL, 'Điện thoại OPPO A58 6GB/128GB , Sạc nhanh 33W - Hàng Chính Hãng', '-i-n-tho-i-oppo-a58-6gb-128gb-s-c-nhanh-33w-h-ng-ch-nh-h-ng', 'https://tiki.vn/dien-thoai-oppo-a58-6gb-128gb-sac-nhanh-33w-hang-chinh-hang-p271954384.html?spid=271954388', 'https://salt.tikicdn.com/cache/280x280/ts/product/8c/80/88/c83c3f2fe6281a892666b5d3b3a0b963.jpg', NULL, 4990000, 4990000, 3, 5.0, 2, 1, '2025-11-21 04:13:41', NULL, '2025-11-21 04:13:41'),
(114, 2, NULL, 'Máy đọc sách Kobo Clara (Clara Colour, Clara BW, Clara 2e, Clara HD) - 6inch, 16gb - Hàng Chính Hãng', 'm-y-c-s-ch-kobo-clara-clara-colour-clara-bw-clara-2e-clara-hd-6inch-16gb-h-ng-ch-nh-h-ng', 'https://tiki.vn/may-doc-sach-kobo-clara-hang-chinh-hang-p270794184.html?spid=275380047', 'https://salt.tikicdn.com/cache/280x280/ts/product/59/85/37/15f2af9b79eb2cbe9e09130ab5ecbab3.jpg', NULL, 5500000, 5500000, 47, 5.0, 20, 1, '2025-11-21 04:13:41', NULL, '2025-11-21 04:13:41'),
(115, 2, NULL, 'Điện thoại Xiaomi Redmi Note 10T 5G 4GB/64GB - Màn 90HZ - Chống Nước IP68 - Hàng Nhập Khẩu - Bản quốc tế', '-i-n-tho-i-xiaomi-redmi-note-10t-5g-4gb-64gb-m-n-90hz-ch-ng-n-c-ip68-h-ng-nh-p-kh-u-b-n-qu-c-t-', 'https://tiki.vn/dien-thoai-xiaomi-redmi-note-10t-5g-4gb-64gb-man-90hz-chong-nuoc-ip68-hang-nhap-khau-ban-quoc-te-p230157205.html?spid=230157209', 'https://salt.tikicdn.com/cache/280x280/ts/product/bf/75/49/c8aa5e2218348a6b422259d67bd516dc.jpg', NULL, 2599000, 4190000, 78, 5.0, 30, 1, '2025-11-21 04:13:41', NULL, '2025-11-21 04:13:41'),
(116, 2, NULL, 'Điện thoại Mobell F209 4G ,Loa to, Phím lớn - Hàng chính hãng', '-i-n-tho-i-mobell-f209-4g-loa-to-ph-m-l-n-h-ng-ch-nh-h-ng', 'https://tiki.vn/dien-thoai-mobell-f209-4g-loa-to-phim-lon-hang-chinh-hang-p217276360.html?spid=217276362', 'https://salt.tikicdn.com/cache/280x280/ts/product/f2/f7/67/91fafcc5eff8a64fa487fcf19bcc6c19.jpg', NULL, 629000, 769000, 7, 4.0, 3, 1, '2025-11-21 04:13:41', NULL, '2025-11-21 04:13:41'),
(117, 2, NULL, 'Điện thoại Samsung Galaxy Z Fold4 5G (12GB/256GB) - Hàng chính hãng', '-i-n-tho-i-samsung-galaxy-z-fold4-5g-12gb-256gb-h-ng-ch-nh-h-ng', 'https://tiki.vn/dien-thoai-samsung-galaxy-z-fold4-5g-12gb-256gb-hang-chinh-hang-p196197701.html?spid=196197705', 'https://salt.tikicdn.com/cache/280x280/ts/product/c9/07/6d/6e783dcd433ef3774fcc2632a19651b3.jpg', NULL, 40790000, 40990000, NULL, 0.0, 0, 1, '2025-11-21 04:13:41', NULL, '2025-11-21 04:13:41'),
(118, 2, NULL, 'Điện thoại OnePlus 10T 5G - Hàng Chính Hãng', '-i-n-tho-i-oneplus-10t-5g-h-ng-ch-nh-h-ng', 'https://tiki.vn/dien-thoai-oneplus-10t-5g-hang-chinh-hang-p193366048.html?spid=193366050', 'https://salt.tikicdn.com/cache/280x280/ts/product/92/e0/e0/f614498043ec158a71d483658099e6f6.jpg', NULL, 15990000, 15990000, NULL, 0.0, 0, 1, '2025-11-21 04:13:41', NULL, '2025-11-21 04:13:41'),
(119, 2, NULL, 'Điện Thoại IP Phone Fanvil X1S - Hàng Chính Hãng', '-i-n-tho-i-ip-phone-fanvil-x1s-h-ng-ch-nh-h-ng', 'https://tiki.vn/dien-thoai-ip-phone-fanvil-x1s-hang-chinh-hang-p53380152.html?spid=68169992', 'https://salt.tikicdn.com/cache/280x280/ts/product/a7/ca/61/b87fe4db89fdff3ff664cadaa9942414.jpg', NULL, 950000, 950000, NULL, 0.0, 0, 1, '2025-11-21 04:13:41', NULL, '2025-11-21 04:13:41'),
(120, 2, NULL, 'Điện thoại bàn không dây Panasonic KX-TGF310 - Hàng Chính Hãng', '-i-n-tho-i-b-n-kh-ng-d-y-panasonic-kx-tgf310-h-ng-ch-nh-h-ng', 'https://tiki.vn/dien-thoai-ban-khong-day-panasonic-kx-tgf310-hang-chinh-hang-p21317020.html?spid=49185318', 'https://salt.tikicdn.com/cache/280x280/ts/product/01/79/d6/3993a1a8ba77d5dfb475e5b5613c3a97.jpg', NULL, 2790000, 2790000, 7, 0.0, 0, 1, '2025-11-21 04:13:41', NULL, '2025-11-21 04:13:41'),
(121, 2, NULL, 'Điện Thoại Xiaomi POCO M6 8GB/256GB - Hàng Chính Hãng', '-i-n-tho-i-xiaomi-poco-m6-8gb-256gb-h-ng-ch-nh-h-ng', 'https://tiki.vn/dien-thoai-xiaomi-poco-m6-8gb-256gb-hang-chinh-hang-p278843336.html?spid=278843340', 'https://salt.tikicdn.com/cache/280x280/ts/product/94/0e/fd/c5932f22eeb8e1b38b2f17060e17931c.jpg', NULL, 4249000, 5290000, NULL, 0.0, 0, 1, '2025-11-21 04:13:41', NULL, '2025-11-21 04:13:41'),
(122, 2, NULL, 'Điện Thoại Xiaomi POCO M7 Pro 5G 12GB/512GB - Hàng Chính Hãng', '-i-n-tho-i-xiaomi-poco-m7-pro-5g-12gb-512gb-h-ng-ch-nh-h-ng', 'https://tiki.vn/dien-thoai-xiaomi-poco-m7-pro-5g-12gb-512gb-hang-chinh-hang-p278834265.html?spid=278834267', 'https://salt.tikicdn.com/cache/280x280/ts/product/e7/3a/90/a17d9017af6f6d5862057f7d6a3f941a.jpg', NULL, 6779000, 7990000, NULL, 0.0, 0, 1, '2025-11-21 04:13:41', NULL, '2025-11-21 04:13:41'),
(123, 2, NULL, 'Máy tính bảng Xiaomi Pad 7 11.2\" Wifi (8GB/128GB) - Hàng chính hãng', 'm-y-t-nh-b-ng-xiaomi-pad-7-11-2-wifi-8gb-128gb-h-ng-ch-nh-h-ng', 'https://tiki.vn/may-tinh-bang-xiaomi-pad-7-11-2-wifi-8gb-128gb-hang-chinh-hang-p278831476.html?spid=278831478', 'https://salt.tikicdn.com/cache/280x280/ts/product/40/e6/26/d3d393e3bc25aa0a1e874480c914b060.jpg', NULL, 10200000, 10300000, NULL, 0.0, 0, 1, '2025-11-21 04:13:41', NULL, '2025-11-21 04:13:41'),
(124, 2, NULL, 'Máy tính bảng Xiaomi Redmi Pad Pro 12.1\" (6GB/128GB) - Hàng chính hãng', 'm-y-t-nh-b-ng-xiaomi-redmi-pad-pro-12-1-6gb-128gb-h-ng-ch-nh-h-ng', 'https://tiki.vn/may-tinh-bang-xiaomi-redmi-pad-pro-12-1-6gb-128gb-hang-chinh-hang-p278819814.html?spid=278819819', 'https://salt.tikicdn.com/cache/280x280/ts/product/6c/25/aa/0fd0e34e5861661184bd8ce4300e50c3.jpg', NULL, 7110000, 7160000, NULL, 0.0, 0, 1, '2025-11-21 04:13:41', NULL, '2025-11-21 04:13:41'),
(125, 2, NULL, 'Điện thoại Xiaomi Redmi 15C (6GB/128GB) - Hàng chính hãng', '-i-n-tho-i-xiaomi-redmi-15c-6gb-128gb-h-ng-ch-nh-h-ng', 'https://tiki.vn/dien-thoai-xiaomi-redmi-15c-6gb-128gb-hang-chinh-hang-p278814651.html?spid=278849574', 'https://salt.tikicdn.com/cache/280x280/ts/product/4f/56/cc/78e5c86c3f9d0faa76552ad77cc57dcc.jpg', NULL, 3499000, 3990000, NULL, 0.0, 0, 1, '2025-11-21 04:13:41', NULL, '2025-11-21 04:13:41'),
(126, 2, NULL, 'Apple iPhone Air', 'apple-iphone-air', 'https://tiki.vn/apple-iphone-air-p278630285.html?spid=278630809', 'https://salt.tikicdn.com/cache/280x280/ts/product/18/ed/34/445b055a1153fee00a8ab6185d2b28b0.jpg', NULL, 28990000, 31990000, 26, 5.0, 3, 1, '2025-11-21 04:13:41', NULL, '2025-11-21 04:13:41'),
(127, 2, NULL, 'Điện thoại Oppo A5i (4GB/128GB) - Hàng chính hãng', '-i-n-tho-i-oppo-a5i-4gb-128gb-h-ng-ch-nh-h-ng', 'https://tiki.vn/dien-thoai-oppo-a5i-4gb-128gb-hang-chinh-hang-p278607963.html?spid=278607965', 'https://salt.tikicdn.com/cache/280x280/ts/product/9a/4e/cd/6858ca07ae041559bf6142d83432a62a.jpg', NULL, 3269000, 4490000, NULL, 0.0, 0, 1, '2025-11-21 04:13:41', NULL, '2025-11-21 04:13:41'),
(128, 2, NULL, 'Điện Thoại Samsung Galaxy A17 5G 8GB/128GB - Hàng Chính Hãng', '-i-n-tho-i-samsung-galaxy-a17-5g-8gb-128gb-h-ng-ch-nh-h-ng', 'https://tiki.vn/dien-thoai-samsung-galaxy-a17-5g-8gb-128gb-hang-chinh-hang-p278540683.html?spid=278540689', 'https://salt.tikicdn.com/cache/280x280/ts/product/b8/ff/3a/ecc8bfaa011733ca31a94ca581ba1fa0.jpg', NULL, 5359000, 6190000, NULL, 0.0, 0, 1, '2025-11-21 04:13:41', NULL, '2025-11-21 04:13:41'),
(129, 2, NULL, 'Điện Thoại Realme C71 4GB/128GB - Hàng Chính Hãng', '-i-n-tho-i-realme-c71-4gb-128gb-h-ng-ch-nh-h-ng', 'https://tiki.vn/dien-thoai-realme-c71-4gb-128gb-hang-chinh-hang-p278500947.html?spid=278500951', 'https://salt.tikicdn.com/cache/280x280/ts/product/9c/14/c8/0cacab9650b80433bbb159d5940cfb08.jpg', NULL, 3059000, 3990000, 2, 5.0, 1, 1, '2025-11-21 04:13:41', NULL, '2025-11-21 04:13:41'),
(130, 2, NULL, 'Điện thoại ZTE Family 4GB/128GB, Màn OLED Full HD+, Dimensity 700, Kháng nước IP67, Sạc 22,5W - Mới nguyên seal - Hàng nhập khẩu nhật', '-i-n-tho-i-zte-family-4gb-128gb-m-n-oled-full-hd-dimensity-700-kh-ng-n-c-ip67-s-c-22-5w-m-i-nguy-n-seal-h-ng-nh-p-kh-u-nh-t', 'https://tiki.vn/dien-thoai-zte-family-4gb-128gb-man-oled-full-hd-dimensity-700-khang-nuoc-ip67-sac-22-5w-moi-nguyen-seal-hang-nhap-khau-nhat-p278469345.html?spid=278469350', 'https://salt.tikicdn.com/cache/280x280/ts/product/e3/64/3d/d69d0b7980f200ad09e16e3ae39f276b.jpg', NULL, 2599000, 2990000, NULL, 0.0, 0, 1, '2025-11-21 04:13:41', NULL, '2025-11-21 04:13:41'),
(131, 2, NULL, 'Điện thoại Masstel Izi 56 4G (LTE) Gọi HD Call ,Pin khủng ,loa lớn - Hàng Chính Hãng', '-i-n-tho-i-masstel-izi-56-4g-lte-g-i-hd-call-pin-kh-ng-loa-l-n-h-ng-ch-nh-h-ng', 'https://tiki.vn/dien-thoai-masstel-izi-56-4g-lte-goi-hd-call-pin-khung-loa-lon-hang-chinh-hang-p278469304.html?spid=278469308', 'https://salt.tikicdn.com/cache/280x280/ts/product/19/2d/b2/107581da28d404ed216777182e2b9f8c.jpg', NULL, 499000, 699000, 1, 0.0, 0, 1, '2025-11-21 04:13:41', NULL, '2025-11-21 04:13:41'),
(132, 2, NULL, 'Điện thoại Realme Note 60 (6GB/128GB) Màn hình 6.74\" ,Kháng nước IP68 ,Rom tiếng việt - Hàng nhập khẩu Nhật', '-i-n-tho-i-realme-note-60-6gb-128gb-m-n-h-nh-6-74-kh-ng-n-c-ip68-rom-ti-ng-vi-t-h-ng-nh-p-kh-u-nh-t', 'https://tiki.vn/dien-thoai-realme-note-60-6gb-128gb-man-hinh-6-74-khang-nuoc-ip68-rom-tieng-viet-hang-nhap-khau-nhat-p278468539.html?spid=278468543', 'https://salt.tikicdn.com/cache/280x280/ts/product/fb/43/5d/a3d3cf2b9bdbabda115f0234165ea731.jpg', NULL, 3290000, 3290000, 1, 0.0, 0, 1, '2025-11-21 04:13:41', NULL, '2025-11-21 04:13:41'),
(133, 2, NULL, 'Điện thoại OPPO A3X 5G (6GB/128GB) Mediatek Dimensity 6300,màn hình 6.67\" 120Hz ,rom tiếng việt- Hàng nhập khẩu', '-i-n-tho-i-oppo-a3x-5g-6gb-128gb-mediatek-dimensity-6300-m-n-h-nh-6-67-120hz-rom-ti-ng-vi-t-h-ng-nh-p-kh-u', 'https://tiki.vn/dien-thoai-oppo-a3x-5g-6gb-128gb-mediatek-dimensity-6300-man-hinh-6-67-120hz-rom-tieng-viet-hang-nhap-khau-p278468370.html?spid=278468372', 'https://salt.tikicdn.com/cache/280x280/ts/product/bb/6c/40/bc7f48db57efe3537d3aa9fa0fca30be.jpg', NULL, 3990000, 3990000, 1, 0.0, 0, 1, '2025-11-21 04:13:41', NULL, '2025-11-21 04:13:41'),
(134, 2, NULL, 'Điện thoại Xiaomi Redmi 13x 6GB/128GB Chip:MediaTek Helio G91,Màn hình 6.79inch - Hàng chính hãng', '-i-n-tho-i-xiaomi-redmi-13x-6gb-128gb-chip-mediatek-helio-g91-m-n-h-nh-6-79inch-h-ng-ch-nh-h-ng', 'https://tiki.vn/dien-thoai-xiaomi-redmi-13x-6gb-128gb-chip-mediatek-helio-g91-man-hinh-6-79inch-hang-chinh-hang-p278468077.html?spid=278468083', 'https://salt.tikicdn.com/cache/280x280/ts/product/8b/ab/3b/e820d0ce15d5ffe972b188c907642ddb.jpg', NULL, 2859000, 4299000, NULL, 0.0, 0, 1, '2025-11-21 04:13:41', NULL, '2025-11-21 04:13:41'),
(135, 2, NULL, 'Điện Thoại Oppo A5i 4GB/64GB - Hàng Chính Hãng', '-i-n-tho-i-oppo-a5i-4gb-64gb-h-ng-ch-nh-h-ng', 'https://tiki.vn/dien-thoai-oppo-a5i-4gb-64gb-hang-chinh-hang-p278448116.html?spid=278448120', 'https://salt.tikicdn.com/cache/280x280/ts/product/f8/d7/af/1fbafd7440783fa9462c44da606cdfd9.jpg', NULL, 2799000, 3290000, NULL, 0.0, 0, 1, '2025-11-21 04:13:41', NULL, '2025-11-21 04:13:41'),
(136, 2, NULL, 'Điện Thoại Oppo A5i 4GB/128GB - Hàng Chính Hãng', '-i-n-tho-i-oppo-a5i-4gb-128gb-h-ng-ch-nh-h-ng', 'https://tiki.vn/dien-thoai-oppo-a5i-4gb-128gb-hang-chinh-hang-p278447816.html?spid=278447818', 'https://salt.tikicdn.com/cache/280x280/ts/product/e6/1b/56/bd56aaabf4e6c770778154190f1b2216.jpg', NULL, 3049000, 3690000, NULL, 0.0, 0, 1, '2025-11-21 04:13:41', NULL, '2025-11-21 04:13:41'),
(137, 2, NULL, 'Điện thoại Xiaomi Redmi A5 (4GB/128GB) - Hàng chính hãng', '-i-n-tho-i-xiaomi-redmi-a5-4gb-128gb-h-ng-ch-nh-h-ng', 'https://tiki.vn/dien-thoai-xiaomi-redmi-a5-4gb-128gb-hang-chinh-hang-p277878418.html?spid=277878422', 'https://salt.tikicdn.com/cache/280x280/ts/product/64/d9/29/74339f811aa82130fbde6d369d04d395.jpg', NULL, 2939000, 3290000, NULL, 0.0, 0, 1, '2025-11-21 04:13:41', NULL, '2025-11-21 04:13:41'),
(138, 2, NULL, 'Điện Thoại Oppo A3x 4GB/64GB - Hàng Chính Hãng', '-i-n-tho-i-oppo-a3x-4gb-64gb-h-ng-ch-nh-h-ng', 'https://tiki.vn/dien-thoai-oppo-a3x-4gb-64gb-hang-chinh-hang-p277175972.html?spid=277175974', 'https://salt.tikicdn.com/cache/280x280/ts/product/3e/31/36/b64c9b52f0e22d6d70d5f3c2155bb829.jpg', NULL, 3239000, 3490000, 1, 0.0, 0, 1, '2025-11-21 04:13:41', NULL, '2025-11-21 04:13:41'),
(139, 2, NULL, 'Điện thoại Masstel izi 16 4G(LTE) , Bàn phím nổi, FM không dây - Hàng chính hãng', '-i-n-tho-i-masstel-izi-16-4g-lte-b-n-ph-m-n-i-fm-kh-ng-d-y-h-ng-ch-nh-h-ng', 'https://tiki.vn/mo-ta-san-pham-dien-thoai-masstel-izi-16-4g-lte-ban-phim-noi-fm-khong-day-hang-chinh-hang-p274516951.html?spid=274516955', 'https://salt.tikicdn.com/cache/280x280/ts/product/c0/be/c1/1856d5ff1185a7c14d038704c01a4269.jpg', NULL, 469000, 569000, 12, 5.0, 1, 1, '2025-11-21 04:13:41', NULL, '2025-11-21 04:13:41'),
(140, 2, NULL, 'Điện thoại Masstel Izi S1 4G (LTE) Gọi HD Call - Hàng chính hãng', '-i-n-tho-i-masstel-izi-s1-4g-lte-g-i-hd-call-h-ng-ch-nh-h-ng', 'https://tiki.vn/dien-thoai-masstel-izi-s1-4g-lte-goi-hd-call-hang-chinh-hang-p274257669.html?spid=274257687', 'https://salt.tikicdn.com/cache/280x280/ts/product/6d/2b/d9/45f8299beaa91d4ce7b6f9db3af508be.jpg', NULL, 469000, 569000, 1, 5.0, 1, 1, '2025-11-21 04:13:41', NULL, '2025-11-21 04:13:41'),
(141, 2, NULL, 'Combo Máy đọc sách All New Kindle Paperwhite 6 - Hàng chính hãng', 'combo-m-y-c-s-ch-all-new-kindle-paperwhite-6-h-ng-ch-nh-h-ng', 'https://tiki.vn/combo-may-doc-sach-all-new-kindle-paperwhite-5-11th-kids-edittion-khong-quang-cao-va-bao-da-hang-chinh-hang-p271530789.html?spid=276464092', 'https://salt.tikicdn.com/cache/280x280/ts/product/cb/c4/eb/e9e5f4686f3fee8181c35226a297e016.jpg', NULL, 4790000, 4790000, 15, 4.0, 3, 1, '2025-11-21 04:13:41', NULL, '2025-11-21 04:13:41'),
(142, 2, NULL, 'Điện thoại Realme C51 (4GB/128GB) - Hàng chính hãng', '-i-n-tho-i-realme-c51-4gb-128gb-h-ng-ch-nh-h-ng', 'https://tiki.vn/dien-thoai-realme-c51-4gb-128gb-hang-chinh-hang-p271467653.html?spid=273467296', 'https://salt.tikicdn.com/cache/280x280/ts/product/70/96/c5/5fb7425e80800e58fa7508a412781c33.jpg', NULL, 3990000, 3990000, 3, 5.0, 1, 1, '2025-11-21 04:13:41', NULL, '2025-11-21 04:13:41'),
(143, 2, NULL, 'Điện Thoại Nokia 105 4G Pro - Hàng Chính Hãng', '-i-n-tho-i-nokia-105-4g-pro-h-ng-ch-nh-h-ng', 'https://tiki.vn/dien-thoai-nokia-105-4g-pro-hang-chinh-hang-p271234577.html?spid=271234579', 'https://salt.tikicdn.com/cache/280x280/ts/product/61/c1/bc/e622f228caee685ecadda0d275987c72.png', NULL, 849000, 849000, 16, 5.0, 2, 1, '2025-11-21 04:13:41', NULL, '2025-11-21 04:13:41'),
(144, 2, NULL, 'Điện thoại OPPO A77 4GB+4GB/128GB - Sạc siêu nhanh 33W - Hàng nhập khẩu nhật - Bản quốc tế', '-i-n-tho-i-oppo-a77-4gb-4gb-128gb-s-c-si-u-nhanh-33w-h-ng-nh-p-kh-u-nh-t-b-n-qu-c-t-', 'https://tiki.vn/dien-thoai-oppo-a77-4gb-4gb-128gb-sac-sieu-nhanh-33w-hang-nhap-khau-nhat-ban-quoc-te-p263675862.html?spid=263675866', 'https://salt.tikicdn.com/cache/280x280/ts/product/95/d0/47/e1ec6994726975843da0a160e56dd566.jpg', NULL, 4990000, 4990000, 9, 4.0, 4, 1, '2025-11-21 04:13:41', NULL, '2025-11-21 04:13:41'),
(145, 2, NULL, 'Điện thoại IP Grandstream GRP 2601 hàng chính hãng', '-i-n-tho-i-ip-grandstream-grp-2601-h-ng-ch-nh-h-ng', 'https://tiki.vn/dien-thoai-ip-grandstream-grp-2601-hang-chinh-hang-p198868735.html?spid=198868736', 'https://salt.tikicdn.com/cache/280x280/ts/product/79/12/a4/e2a12a711e482a8b6a6f8b77bd3190b0.jpg', NULL, 880000, 880000, 2, 0.0, 0, 1, '2025-11-21 04:13:41', NULL, '2025-11-21 04:13:41'),
(146, 2, NULL, 'Điện thoại bàn Panasonic KX-TS880 hàng chính hãng', '-i-n-tho-i-b-n-panasonic-kx-ts880-h-ng-ch-nh-h-ng', 'https://tiki.vn/dien-thoai-ban-panasonic-kx-ts880-hang-chinh-hang-p181977398.html?spid=181977400', 'https://salt.tikicdn.com/cache/280x280/ts/product/f8/c7/f6/e0e8a6f7589e1e80f0c88840c8c7408c.jpg', NULL, 1150000, 1150000, 49, 4.0, 11, 1, '2025-11-21 04:13:41', NULL, '2025-11-21 04:13:41'),
(147, 2, NULL, 'Điện thoại bàn Panasonic KX-TGC310 hàng chính hãng', '-i-n-tho-i-b-n-panasonic-kx-tgc310-h-ng-ch-nh-h-ng', 'https://tiki.vn/dien-thoai-ban-panasonic-kx-tgc310-hang-chinh-hang-p181928208.html?spid=181928209', 'https://salt.tikicdn.com/cache/280x280/ts/product/5b/a5/c1/2bf1ed55c8919a261bf18c9e9d4380d2.jpg', NULL, 1050000, 1050000, 56, 5.0, 7, 1, '2025-11-21 04:13:41', NULL, '2025-11-21 04:13:41'),
(148, 2, NULL, 'Điện thoại bàn Panasonic KX-TGC312 hàng chính hãng', '-i-n-tho-i-b-n-panasonic-kx-tgc312-h-ng-ch-nh-h-ng', 'https://tiki.vn/dien-thoai-ban-panasonic-kx-tgc312-hang-chinh-hang-p181928189.html?spid=181928190', 'https://salt.tikicdn.com/cache/280x280/ts/product/a3/7b/7b/ca779c901286b973e681d82bf4cddda1.jpg', NULL, 1550000, 1550000, 33, 5.0, 6, 1, '2025-11-21 04:13:41', NULL, '2025-11-21 04:13:41'),
(149, 2, NULL, 'Điện thoại bàn Panasonic KX-TGC313 hàng chính hãng', '-i-n-tho-i-b-n-panasonic-kx-tgc313-h-ng-ch-nh-h-ng', 'https://tiki.vn/dien-thoai-ban-panasonic-kx-tgc313-hang-chinh-hang-p181927718.html?spid=181927720', 'https://salt.tikicdn.com/cache/280x280/ts/product/d8/6e/83/7304bb1e45d885167c40492c585d25f5.png', NULL, 2150000, 2150000, 15, 5.0, 3, 1, '2025-11-21 04:13:41', NULL, '2025-11-21 04:13:41'),
(150, 2, NULL, 'Điện thoại bàn treo tường TC990', '-i-n-tho-i-b-n-treo-t-ng-tc990', 'https://tiki.vn/dien-thoai-ban-uniden-as-7101-hanh-chinh-hang-p173789184.html?spid=173789188', 'https://salt.tikicdn.com/cache/280x280/ts/product/ec/2b/36/b9bed2790bf57d8f1a52a13663263429.jpg', NULL, 250000, 250000, 51, 5.0, 7, 1, '2025-11-21 04:13:41', NULL, '2025-11-21 04:13:41'),
(151, 2, NULL, 'Điện thoại bàn Panasonic KX-TS580 hàng chính hãng', '-i-n-tho-i-b-n-panasonic-kx-ts580-h-ng-ch-nh-h-ng', 'https://tiki.vn/dien-thoai-ban-panasonic-kx-ts580-hang-chinh-hang-p170727305.html?spid=185711238', 'https://salt.tikicdn.com/cache/280x280/ts/product/a6/aa/60/e9f5321c338f36ad674bbcdb59c887e2.jpg', NULL, 1044000, 1059000, 1, 0.0, 0, 1, '2025-11-21 04:13:41', NULL, '2025-11-21 04:13:41'),
(152, 2, NULL, 'Điện thoại bàn Ktel 645 hàng chính hãng', '-i-n-tho-i-b-n-ktel-645-h-ng-ch-nh-h-ng', 'https://tiki.vn/dien-thoai-ban-ktel-645-hang-chinh-hang-p170165701.html?spid=170165705', 'https://salt.tikicdn.com/cache/280x280/ts/product/47/17/1e/17c74931d1cc7232c3b55e7cc76ab1d2.jpg', NULL, 450000, 450000, 68, 5.0, 12, 1, '2025-11-21 04:13:41', NULL, '2025-11-21 04:13:41'),
(153, 2, NULL, 'Điện thoại bàn Panasonic KX-TGF320 hàng chính hãng', '-i-n-tho-i-b-n-panasonic-kx-tgf320-h-ng-ch-nh-h-ng', 'https://tiki.vn/dien-thoai-ban-panasonic-kx-tgf320-hang-chinh-hang-p164318521.html?spid=164318522', 'https://salt.tikicdn.com/cache/280x280/ts/product/f3/02/1f/043beeafd1e3b195d7388e35f2327a5f.jpg', NULL, 2500000, 2500000, 24, 5.0, 6, 1, '2025-11-21 04:13:41', NULL, '2025-11-21 04:13:41'),
(154, 2, NULL, 'ĐIỆN THOẠI HỘI NGHỊ YEALINK CP960 -HÀNG CHÍNH HÃNG', '-i-n-tho-i-h-i-ngh-yealink-cp960-h-ng-ch-nh-h-ng', 'https://tiki.vn/dien-thoai-hoi-nghi-yealink-cp960-p117347869.html?spid=125595231', 'https://salt.tikicdn.com/cache/280x280/ts/product/b9/77/a7/bbdbf4268b53d0db9e5cea42e52272a2.jpg', NULL, 15230000, 15230000, NULL, 0.0, 0, 1, '2025-11-21 04:13:41', NULL, '2025-11-21 04:13:41'),
(155, 2, NULL, 'Điện thoại VoIP Yealink SIP-T30', '-i-n-tho-i-voip-yealink-sip-t30', 'https://tiki.vn/dien-thoai-voip-yealink-sip-t30-p94453667.html?spid=94453668', 'https://salt.tikicdn.com/cache/280x280/ts/product/22/22/42/f2e510e7d7949b4a3d0cc0e73ef8e952.jpg', NULL, 1050000, 1050000, NULL, 0.0, 0, 1, '2025-11-21 04:13:41', NULL, '2025-11-21 04:13:41'),
(156, 2, NULL, 'điện thoại  IP622C - hàng chính hãng', '-i-n-tho-i-ip622c-h-ng-ch-nh-h-ng', 'https://tiki.vn/dien-thoai-ip622c-hang-chinh-hang-p29440849.html?spid=29440850', 'https://salt.tikicdn.com/cache/280x280/ts/product/36/ae/47/11f587e464e6ff8ae28d4ea5cbb01723.jpg', NULL, 1650000, 1650000, NULL, 0.0, 0, 1, '2025-11-21 04:13:41', NULL, '2025-11-21 04:13:41'),
(157, 2, NULL, 'Điện thoại bàn không dây Panasonic KX-TGC313 - Hàng Chính Hãng', '-i-n-tho-i-b-n-kh-ng-d-y-panasonic-kx-tgc313-h-ng-ch-nh-h-ng', 'https://tiki.vn/dien-thoai-ban-khong-day-panasonic-kx-tgc313-hang-chinh-hang-p23142193.html?spid=49185625', 'https://salt.tikicdn.com/cache/280x280/ts/product/d4/7e/c9/72e19580d556fa02d030cc6e77d1c6fd.jpg', NULL, 2550000, 2550000, 6, 4.0, 3, 1, '2025-11-21 04:13:42', NULL, '2025-11-21 04:13:42'),
(158, 2, NULL, 'Điện thoại bàn không dây Panasonic KX-TGD310 - Hàng Chính Hãng', '-i-n-tho-i-b-n-kh-ng-d-y-panasonic-kx-tgd310-h-ng-ch-nh-h-ng', 'https://tiki.vn/dien-thoai-ban-khong-day-panasonic-kx-tgd310-hang-chinh-hang-p11251770.html?spid=49095332', 'https://salt.tikicdn.com/cache/280x280/ts/product/c7/a1/73/79e54ec11e29656703784d7ad6eeae22.jpg', NULL, 1430000, 1430000, 4, 0.0, 0, 1, '2025-11-21 04:13:42', NULL, '2025-11-21 04:13:42'),
(159, 2, NULL, 'Điện thoại bàn không dây Panasonic KX-TGD312 - Hàng Chính Hãng', '-i-n-tho-i-b-n-kh-ng-d-y-panasonic-kx-tgd312-h-ng-ch-nh-h-ng', 'https://tiki.vn/dien-thoai-ban-khong-day-panasonic-kx-tgd312-hang-chinh-hang-p11251711.html?spid=49185495', 'https://salt.tikicdn.com/cache/280x280/ts/product/89/54/f7/30ab541c229501e179bb3788eba97b3b.jpg', NULL, 2350000, 2350000, 12, 5.0, 2, 1, '2025-11-21 04:13:42', NULL, '2025-11-21 04:13:42'),
(160, 2, NULL, 'Điện Thoại Bàn Panasonic KX-TS500', '-i-n-tho-i-b-n-panasonic-kx-ts500', 'https://tiki.vn/dien-thoai-ban-panasonic-kx-ts500-hang-chinh-hang-p4048043.html?spid=26682357', 'https://salt.tikicdn.com/cache/280x280/ts/product/e3/71/9a/a23456e6289f71d29205541a8fb7c353.jpg', NULL, 334000, 369000, 315, 4.0, 25, 1, '2025-11-21 04:13:42', NULL, '2025-11-21 04:13:42'),
(161, 2, NULL, 'Điện Thoại Xiaomi Redmi 15 6GB/128GB - Hàng Chính Hãng', '-i-n-tho-i-xiaomi-redmi-15-6gb-128gb-h-ng-ch-nh-h-ng', 'https://tiki.vn/dien-thoai-xiaomi-redmi-15-6gb-128gb-hang-chinh-hang-p278843825.html?spid=278843829', 'https://salt.tikicdn.com/cache/280x280/ts/product/b2/37/7e/ea52500b4bf1f0617ccb5cf985a2da0a.jpg', NULL, 4119000, 4790000, NULL, 0.0, 0, 1, '2025-11-21 04:13:42', NULL, '2025-11-21 04:13:42'),
(162, 2, NULL, 'Điện Thoại Xiaomi Redmi Note 14 8GB/256GB - Hàng Chính Hãng', '-i-n-tho-i-xiaomi-redmi-note-14-8gb-256gb-h-ng-ch-nh-h-ng', 'https://tiki.vn/dien-thoai-xiaomi-redmi-note-14-8gb-256gb-hang-chinh-hang-p278834233.html?spid=278834237', 'https://salt.tikicdn.com/cache/280x280/ts/product/b1/a3/a9/64797be83c16f7e072c7ca45501afdfc.jpg', NULL, 5179000, 6190000, NULL, 0.0, 0, 1, '2025-11-21 04:13:42', NULL, '2025-11-21 04:13:42'),
(163, 2, NULL, 'Điện Thoại Samsung Galaxy A07 4GB/64GB - Hàng Chính Hãng', '-i-n-tho-i-samsung-galaxy-a07-4gb-64gb-h-ng-ch-nh-h-ng', 'https://tiki.vn/dien-thoai-samsung-galaxy-a07-4gb-64gb-hang-chinh-hang-p278833664.html?spid=278833671', 'https://salt.tikicdn.com/cache/280x280/ts/product/5d/cb/9e/166e4c533373b7a7b2c0d64e0230c0ca.jpg', NULL, 2669000, 3090000, NULL, 0.0, 0, 1, '2025-11-21 04:13:42', NULL, '2025-11-21 04:13:42'),
(164, 2, NULL, 'Máy tính bảng Xiaomi Pad 7 11.2\" Wifi (8GB/256GB) - Hàng chính hãng', 'm-y-t-nh-b-ng-xiaomi-pad-7-11-2-wifi-8gb-256gb-h-ng-ch-nh-h-ng', 'https://tiki.vn/may-tinh-bang-xiaomi-pad-7-11-2-wifi-8gb-256gb-hang-chinh-hang-p278831485.html?spid=278831487', 'https://salt.tikicdn.com/cache/280x280/ts/product/40/e6/26/14d808e7e503e4e9cf9a83a0780d9489.jpg', NULL, 11190000, 11290000, NULL, 0.0, 0, 1, '2025-11-21 04:13:42', NULL, '2025-11-21 04:13:42'),
(165, 2, NULL, 'Máy tính bảng Xiaomi Redmi Pad 2 11\" Wifi (6GB/128GB) - Hàng chính hãng', 'm-y-t-nh-b-ng-xiaomi-redmi-pad-2-11-wifi-6gb-128gb-h-ng-ch-nh-h-ng', 'https://tiki.vn/may-tinh-bang-xiaomi-redmi-pad-2-11-wifi-6gb-128gb-hang-chinh-hang-p278831443.html?spid=278831451', 'https://salt.tikicdn.com/cache/280x280/ts/product/8e/7c/c1/7bcf8449128bdecfa575b18170d7cd44.jpg', NULL, 5640000, 5690000, NULL, 0.0, 0, 1, '2025-11-21 04:13:42', NULL, '2025-11-21 04:13:42'),
(166, 2, NULL, 'Máy tính bảng Xiaomi Redmi Pad SE 11\" Wifi (6GB/128GB) - Hàng chính hãng', 'm-y-t-nh-b-ng-xiaomi-redmi-pad-se-11-wifi-6gb-128gb-h-ng-ch-nh-h-ng', 'https://tiki.vn/may-tinh-bang-xiaomi-redmi-pad-se-11-wifi-6gb-128gb-hang-chinh-hang-p278831396.html?spid=278831400', 'https://salt.tikicdn.com/cache/280x280/ts/product/f6/5a/6d/0d1fd229eca7729615cf28b215854124.jpg', NULL, 5440000, 5490000, NULL, 0.0, 0, 1, '2025-11-21 04:13:42', NULL, '2025-11-21 04:13:42'),
(167, 2, NULL, 'Máy Tính Bảng Galaxy Tab S11 Wifi (12GB/128GB) - Hàng Chính Hãng', 'm-y-t-nh-b-ng-galaxy-tab-s11-wifi-12gb-128gb-h-ng-ch-nh-h-ng', 'https://tiki.vn/may-tinh-bang-galaxy-tab-s11-wifi-12gb-128gb-hang-chinh-hang-p278825342.html?spid=278825346', 'https://salt.tikicdn.com/cache/280x280/ts/product/73/5f/d3/b34d66b7e431f37a94a2587a84f2a517.jpg', NULL, 15490000, 20990000, 4, 0.0, 0, 1, '2025-11-21 04:13:42', NULL, '2025-11-21 04:13:42'),
(168, 2, NULL, 'Điện Thoại Xiaomi 15T Pro 5G 12GB/512GB - Hàng Chính Hãng', '-i-n-tho-i-xiaomi-15t-pro-5g-12gb-512gb-h-ng-ch-nh-h-ng', 'https://tiki.vn/dien-thoai-xiaomi-15t-pro-5g-12gb-512gb-hang-chinh-hang-p278820676.html?spid=278820682', 'https://salt.tikicdn.com/cache/280x280/ts/product/bb/9e/78/99c9c4cb684745c9f01964b8548c4257.jpg', NULL, 16699000, 19490000, NULL, 0.0, 0, 1, '2025-11-21 04:13:42', NULL, '2025-11-21 04:13:42'),
(169, 2, NULL, 'Điện thoại Xiaomi Redmi 15C (4GB/128GB) - Hàng chính hãng', '-i-n-tho-i-xiaomi-redmi-15c-4gb-128gb-h-ng-ch-nh-h-ng', 'https://tiki.vn/dien-thoai-xiaomi-redmi-15c-4gb-128gb-hang-chinh-hang-p278814626.html?spid=278814628', 'https://salt.tikicdn.com/cache/280x280/ts/product/4f/56/cc/de63409be019c4b1835d0d5c5375d0f1.jpg', NULL, 3369000, 3690000, NULL, 0.0, 0, 1, '2025-11-21 04:13:42', NULL, '2025-11-21 04:13:42'),
(170, 2, NULL, 'Điện thoại Oppo A6 Pro (8GB/256GB) - Hàng chính hãng', '-i-n-tho-i-oppo-a6-pro-8gb-256gb-h-ng-ch-nh-h-ng', 'https://tiki.vn/dien-thoai-oppo-a6-pro-8gb-256gb-hang-chinh-hang-p278780989.html?spid=278780997', 'https://salt.tikicdn.com/cache/280x280/ts/product/f6/c1/73/38e2438bf79ce17d9e5c544addd3a73a.jpg', NULL, 8240000, 8290000, NULL, 0.0, 0, 1, '2025-11-21 04:13:42', NULL, '2025-11-21 04:13:42'),
(171, 2, NULL, 'Điện thoại Realme Note 70 (4GB/128GB) - Hàng chính hãng', '-i-n-tho-i-realme-note-70-4gb-128gb-h-ng-ch-nh-h-ng', 'https://tiki.vn/dien-thoai-realme-note-70-4gb-128gb-hang-chinh-hang-p278776793.html?spid=278776797', 'https://salt.tikicdn.com/cache/280x280/ts/product/07/89/d5/17b61edd8207e503878e7d331dde5f50.jpg', NULL, 3460000, 3490000, NULL, 0.0, 0, 1, '2025-11-21 04:13:42', NULL, '2025-11-21 04:13:42'),
(172, 2, NULL, 'Máy tính bảng Samsung Galaxy Tab A11 Wifi (4GB/64GB) - Hàng chính hãng', 'm-y-t-nh-b-ng-samsung-galaxy-tab-a11-wifi-4gb-64gb-h-ng-ch-nh-h-ng', 'https://tiki.vn/may-tinh-bang-samsung-galaxy-tab-a11-wifi-4gb-64gb-hang-chinh-hang-p278730376.html?spid=278730380', 'https://salt.tikicdn.com/cache/280x280/ts/product/62/45/d7/36e8a1e25d3f3e6e429b4f53c1537dce.jpg', NULL, 3749000, 3990000, NULL, 0.0, 0, 1, '2025-11-21 04:13:42', NULL, '2025-11-21 04:13:42'),
(173, 2, NULL, 'Điện thoại Samsung Galaxy A17 LTE (8GB/128GB) - Hàng chính hãng', '-i-n-tho-i-samsung-galaxy-a17-lte-8gb-128gb-h-ng-ch-nh-h-ng', 'https://tiki.vn/dien-thoai-samsung-galaxy-a17-lte-8gb-128gb-hang-chinh-hang-p278672823.html?spid=278672829', 'https://salt.tikicdn.com/cache/280x280/ts/product/6a/6e/3f/0ac3360cc02705b51b640b6e21f14153.jpg', NULL, 4819000, 5190000, NULL, 0.0, 0, 1, '2025-11-21 04:13:42', NULL, '2025-11-21 04:13:42'),
(174, 2, NULL, 'Điện thoại Xiaomi Poco C71 (4GB/128GB) - Hàng chính hãng', '-i-n-tho-i-xiaomi-poco-c71-4gb-128gb-h-ng-ch-nh-h-ng', 'https://tiki.vn/dien-thoai-xiaomi-poco-c71-4gb-128gb-hang-chinh-hang-p278635094.html?spid=278635096', 'https://salt.tikicdn.com/cache/280x280/ts/product/c9/8d/7a/c1d7c798ce1dabab732ec4749d0e00ff.jpg', NULL, 3120000, 3150000, NULL, 0.0, 0, 1, '2025-11-21 04:13:42', NULL, '2025-11-21 04:13:42'),
(175, 2, NULL, 'Điện thoại Xiaomi Redmi 13x (6GB/128GB) - Hàng chính hãng', '-i-n-tho-i-xiaomi-redmi-13x-6gb-128gb-h-ng-ch-nh-h-ng', 'https://tiki.vn/dien-thoai-xiaomi-redmi-13x-6gb-128gb-hang-chinh-hang-p278635074.html?spid=278635076', 'https://salt.tikicdn.com/cache/280x280/ts/product/66/db/8b/7dd11b58e0ada60fd8feb663b6bf84d0.jpg', NULL, 4260000, 4290000, NULL, 0.0, 0, 1, '2025-11-21 04:13:42', NULL, '2025-11-21 04:13:42'),
(176, 2, NULL, 'Apple iPhone 17 - Xanh lam khói - 256GB', 'apple-iphone-17-xanh-lam-kh-i-256gb', 'https://tiki.vn/apple-iphone-17-p278630241.html?spid=278630823', 'https://salt.tikicdn.com/cache/280x280/ts/product/15/e3/90/ebf16a42ce7e5a3ca5cce09f45f1cb60.jpg', NULL, 24990000, 24990000, 38, 5.0, 2, 1, '2025-11-21 04:13:42', NULL, '2025-11-21 04:13:42'),
(177, 2, NULL, 'Apple iPhone 17 Pro Max', 'apple-iphone-17-pro-max', 'https://tiki.vn/apple-iphone-17-pro-max-p278628866.html?spid=278630782', 'https://salt.tikicdn.com/cache/280x280/ts/product/85/50/d4/92da5535f827912efd1738af616cab42.jpg', NULL, 37990000, 37990000, 534, 5.0, 34, 1, '2025-11-21 04:13:42', NULL, '2025-11-21 04:13:42'),
(178, 2, NULL, 'Điện thoại POCO C71 (4GB/128GB) - Hàng Chính Hãng', '-i-n-tho-i-poco-c71-4gb-128gb-h-ng-ch-nh-h-ng', 'https://tiki.vn/dien-thoai-poco-c71-4gb-128gb-hang-chinh-hang-p278618790.html?spid=278618792', 'https://salt.tikicdn.com/cache/280x280/ts/product/b5/b1/92/46599ee26897df18dd01db672aa7ac74.png', NULL, 2050000, 3150000, 12, 0.0, 0, 1, '2025-11-21 04:13:42', NULL, '2025-11-21 04:13:42'),
(179, 2, NULL, 'Điện thoại Samsung Galaxy A07 LTE (4GB/128GB) - Hàng chính hãng', '-i-n-tho-i-samsung-galaxy-a07-lte-4gb-128gb-h-ng-ch-nh-h-ng', 'https://tiki.vn/dien-thoai-samsung-galaxy-a07-lte-4gb-128gb-hang-chinh-hang-p278591094.html?spid=278591100', 'https://salt.tikicdn.com/cache/280x280/ts/product/22/0e/67/135204b4e3d327bd7fb0489515206d84.jpg', NULL, 2969000, 3390000, NULL, 0.0, 0, 1, '2025-11-21 04:13:42', NULL, '2025-11-21 04:13:42'),
(180, 2, NULL, ' Điện Thoại Samsung Galaxy S24 FE (8GB/128GB) - Hàng Chính Hãng', '-i-n-tho-i-samsung-galaxy-s24-fe-8gb-128gb-h-ng-ch-nh-h-ng', 'https://tiki.vn/dien-thoai-samsung-galaxy-s24-fe-8gb-128gb-hang-chinh-hang-p278524463.html?spid=278524469', 'https://salt.tikicdn.com/cache/280x280/ts/product/67/8c/cb/090f7498b19adba55d7471d3c4e36d01.png', NULL, 9990000, 16690000, 151, 5.0, 2, 1, '2025-11-21 04:13:42', NULL, '2025-11-21 04:13:42'),
(181, 2, NULL, 'Điện Thoại Samsung Galaxy A17 5G (8/128GB), Camera 50MP & IOS, Kính Cường Lực Gorilla Victus, AI Gemini - Hàng Chính Hãng', '-i-n-tho-i-samsung-galaxy-a17-5g-8-128gb-camera-50mp-ios-k-nh-c-ng-l-c-gorilla-victus-ai-gemini-h-ng-ch-nh-h-ng', 'https://tiki.vn/dien-thoai-samsung-galaxy-a17-5g-8-128gb-camera-50mp-ios-kinh-cuong-luc-gorilla-victus-ai-gemini-hang-chinh-hang-p278505364.html?spid=278505368', 'https://salt.tikicdn.com/cache/280x280/ts/product/19/3e/fa/90a9fa77311c5a2026337b2b271186b5.jpg', NULL, 5690000, 6190000, 16, 0.0, 0, 1, '2025-11-21 04:13:42', NULL, '2025-11-21 04:13:42'),
(182, 2, NULL, 'Điện thoại Oppo A3 (8GB/128GB) - Hàng chính hãng', '-i-n-tho-i-oppo-a3-8gb-128gb-h-ng-ch-nh-h-ng', 'https://tiki.vn/dien-thoai-oppo-a3-8gb-128gb-hang-chinh-hang-p278490553.html?spid=278490555', 'https://salt.tikicdn.com/cache/280x280/ts/product/0b/43/7a/5391a3e87cbfb259e80da153964827fd.jpg', NULL, 4509000, 5290000, NULL, 0.0, 0, 1, '2025-11-21 04:13:42', NULL, '2025-11-21 04:13:42'),
(183, 2, NULL, 'Điện thoại Xiaomi REDMI 14C 5G (6GB/128GB) ,Chip Snapdragon 4 Gen 2 ,Màn hình 6.88inch - Hàng nhập khẩu', '-i-n-tho-i-xiaomi-redmi-14c-5g-6gb-128gb-chip-snapdragon-4-gen-2-m-n-h-nh-6-88inch-h-ng-nh-p-kh-u', 'https://tiki.vn/dien-thoai-xiaomi-redmi-14c-5g-6gb-128gb-chip-snapdragon-4-gen-2-man-hinh-6-88inch-hang-nhap-khau-p278469283.html?spid=278469287', 'https://salt.tikicdn.com/cache/280x280/ts/product/7d/3c/fc/5a4b6ad0c7679dda72c47f991d8fefe7.jpg', NULL, 2599000, 3590000, NULL, 5.0, 1, 1, '2025-11-21 04:13:42', NULL, '2025-11-21 04:13:42'),
(184, 2, NULL, 'Điện thoại Realme C61(6GB/128GB) Màn hình 6.74inch,pin 5000mAh - Hàng chính hãng', '-i-n-tho-i-realme-c61-6gb-128gb-m-n-h-nh-6-74inch-pin-5000mah-h-ng-ch-nh-h-ng', 'https://tiki.vn/dien-thoai-realme-c61-6gb-128gb-man-hinh-6-74inch-pin-5000mah-hang-chinh-hang-p278469242.html?spid=278469246', 'https://salt.tikicdn.com/cache/280x280/ts/product/2d/dd/8a/d46056fae353ea7db43b8389194a1af7.jpg', NULL, 2699000, 3290000, 2, 5.0, 1, 1, '2025-11-21 04:13:42', NULL, '2025-11-21 04:13:42'),
(185, 2, NULL, 'Điện Thoại Samsung Galaxy S24 FE 5G 8GB/128GB - Hàng Chính Hãng', '-i-n-tho-i-samsung-galaxy-s24-fe-5g-8gb-128gb-h-ng-ch-nh-h-ng', 'https://tiki.vn/dien-thoai-samsung-galaxy-s24-fe-5g-8gb-128gb-hang-chinh-hang-p278468344.html?spid=278468352', 'https://salt.tikicdn.com/cache/280x280/ts/product/7f/7b/30/b4128a1b71c687c1a82f873ff8f25395.jpg', NULL, 11099000, 16990000, NULL, 0.0, 0, 1, '2025-11-21 04:13:42', NULL, '2025-11-21 04:13:42'),
(186, 2, NULL, 'Điện thoại Xiaomi Redmi 13 (6GB/128GB) Màn hình 6.79inch ,Chipset:MediaTek Helio G91- Hàng chính hãng', '-i-n-tho-i-xiaomi-redmi-13-6gb-128gb-m-n-h-nh-6-79inch-chipset-mediatek-helio-g91-h-ng-ch-nh-h-ng', 'https://tiki.vn/dien-thoai-xiaomi-redmi-13-6gb-128gb-man-hinh-6-79inch-chipset-mediatek-helio-g91-hang-chinh-hang-p278467934.html?spid=278467938', 'https://salt.tikicdn.com/cache/280x280/ts/product/b8/9e/12/fbeb7e5e2b312f03979f9c2bf5ee050f.jpg', NULL, 2859000, 3990000, 2, 0.0, 0, 1, '2025-11-21 04:13:42', NULL, '2025-11-21 04:13:42'),
(187, 2, NULL, 'Điện Thoại Oppo A5i Pro 8GB/128GB - Hàng Chính Hãng', '-i-n-tho-i-oppo-a5i-pro-8gb-128gb-h-ng-ch-nh-h-ng', 'https://tiki.vn/dien-thoai-oppo-a5i-pro-8gb-128gb-hang-chinh-hang-p278447762.html?spid=278447764', 'https://salt.tikicdn.com/cache/280x280/ts/product/c0/89/20/8c99c1bfa4d926ccedd93c6cf6ce00bb.jpg', NULL, 4869000, 5490000, NULL, 0.0, 0, 1, '2025-11-21 04:13:42', NULL, '2025-11-21 04:13:42'),
(188, 2, NULL, 'Điện Thoại Oppo A3 8GB/128GB - Hàng Chính Hãng', '-i-n-tho-i-oppo-a3-8gb-128gb-h-ng-ch-nh-h-ng', 'https://tiki.vn/dien-thoai-oppo-a3-8gb-128gb-hang-chinh-hang-p278306669.html?spid=278306671', 'https://salt.tikicdn.com/cache/280x280/ts/product/9d/73/61/5783880f4f7365cdbda39662bb0688e7.jpg', NULL, 4269000, 5290000, NULL, 0.0, 0, 1, '2025-11-21 04:13:42', NULL, '2025-11-21 04:13:42'),
(189, 2, NULL, 'Điện thoại Xiaomi Redmi 13x - Hàng chính hãng', '-i-n-tho-i-xiaomi-redmi-13x-h-ng-ch-nh-h-ng', 'https://tiki.vn/dien-thoai-xiaomi-redmi-13x-hang-chinh-hang-p278278564.html?spid=278278572', 'https://salt.tikicdn.com/cache/280x280/ts/product/c3/47/f4/40d2c2d4fbc5f433dfb7ac686475e2ee.jpg', NULL, 2690000, 4220000, 302, 4.0, 6, 1, '2025-11-21 04:13:42', NULL, '2025-11-21 04:13:42'),
(190, 2, NULL, 'Điện thoại Samsung Galaxy Z Flip7, Điện thoại AI, Màn hình ngoài vô cực 4.1\", Camera selfie 50MP, Mỏng nhất - Hàng Chính Hãng', '-i-n-tho-i-samsung-galaxy-z-flip7-i-n-tho-i-ai-m-n-h-nh-ngo-i-v-c-c-4-1-camera-selfie-50mp-m-ng-nh-t-h-ng-ch-nh-h-ng', 'https://tiki.vn/dien-thoai-samsung-galaxy-b7-hang-chinh-hang-p278252203.html?spid=278252207', 'https://salt.tikicdn.com/cache/280x280/ts/product/54/db/ac/a7507266526060e632738baceed60ef4.JPG', NULL, 22690000, 28990000, 4, 5.0, 2, 1, '2025-11-21 04:13:42', NULL, '2025-11-21 04:13:42'),
(191, 2, NULL, 'Điện thoại Xiaomi Redmi A5 3GB/64GB - Hàng chính hãng', '-i-n-tho-i-xiaomi-redmi-a5-3gb-64gb-h-ng-ch-nh-h-ng', 'https://tiki.vn/dien-thoai-xiaomi-redmi-a5-3gb-64gb-hang-chinh-hang-p278250048.html?spid=278250052', 'https://salt.tikicdn.com/cache/280x280/ts/product/77/5d/0b/e862da07cb3a21166a9f961f5bac45e2.jpg', NULL, 1890000, 2740000, 17, 0.0, 0, 1, '2025-11-21 04:13:42', NULL, '2025-11-21 04:13:42'),
(192, 2, NULL, 'Điện thoại Realme C71 4GB/128GB - Hàng Chính Hãng', '-i-n-tho-i-realme-c71-4gb-128gb-h-ng-ch-nh-h-ng', 'https://tiki.vn/dien-thoai-realme-c71-4gb-128gb-hang-chinh-hang-p278040727.html?spid=278040737', 'https://salt.tikicdn.com/cache/280x280/ts/product/82/c0/b0/2fa5825af1a30b1baab281a07da878c6.jpg', NULL, 3290000, 4290000, 296, 5.0, 1, 1, '2025-11-21 04:13:42', NULL, '2025-11-21 04:13:42'),
(193, 2, NULL, 'Điện Thoại Xiaomi Redmi Note 14 Pro 5G 8GB/256GB - Hàng Chính Hãng', '-i-n-tho-i-xiaomi-redmi-note-14-pro-5g-8gb-256gb-h-ng-ch-nh-h-ng', 'https://tiki.vn/dien-thoai-xiaomi-redmi-note-14-pro-5g-8gb-256gb-hang-chinh-hang-p277944685.html?spid=277944687', 'https://salt.tikicdn.com/cache/280x280/ts/product/48/fc/5f/7dfba7bbb23468c965f95631124ea713.jpg', NULL, 7439000, 9490000, 2, 0.0, 0, 1, '2025-11-21 04:13:42', NULL, '2025-11-21 04:13:42'),
(194, 2, NULL, '[MỚI] Điện thoại vivo Y19s (8GB+128GB) - 1 Đổi 1 trong tháng đầu tiên - Bảo hành chính hãng 12 tháng - Hàng Chính Hãng', '-m-i-i-n-tho-i-vivo-y19s-8gb-128gb-1-i-1-trong-th-ng-u-ti-n-b-o-h-nh-ch-nh-h-ng-12-th-ng-h-ng-ch-nh-h-ng', 'https://tiki.vn/sap-ra-mat-dien-thoai-vivo-y19s-8gb-128gb-1-doi-1-trong-thang-dau-tien-bao-hanh-chinh-hang-12-thang-p276440892.html?spid=276492925', 'https://salt.tikicdn.com/cache/280x280/ts/product/43/d4/da/94f3770c196ece20550529d9856768ba.jpg', NULL, 4790000, 4790000, 1, 0.0, 0, 1, '2025-11-21 04:13:42', NULL, '2025-11-21 04:13:42'),
(195, 2, NULL, 'Máy đọc sách Kindle Paperwhite 5 (8GB) - Hàng chính hãng', 'm-y-c-s-ch-kindle-paperwhite-5-8gb-h-ng-ch-nh-h-ng', 'https://tiki.vn/may-doc-sach-kindle-paperwhite-5-8gb-hang-chinh-hang-p179547641.html?spid=217500662', 'https://salt.tikicdn.com/cache/280x280/ts/product/24/27/94/559eb9f73081fe23cc65044a10429024.jpg', NULL, 3990000, 3990000, 1, 0.0, 0, 1, '2025-11-21 04:13:42', NULL, '2025-11-21 04:13:42'),
(196, 2, NULL, '(Hàng chính hãng) Điện thoại bàn hữu tuyến H2P, hiệu Alcatel - Lucent', '-h-ng-ch-nh-h-ng-i-n-tho-i-b-n-h-u-tuy-n-h2p-hi-u-alcatel-lucent', 'https://tiki.vn/dien-thoai-ban-huu-tuyen-h2p-hieu-alcatel-lucent-p172537996.html?spid=172537997', 'https://salt.tikicdn.com/cache/280x280/ts/product/ab/f8/49/c91c79259e394681fc3e9650757e112f.png', NULL, 2220000, 2220000, NULL, 0.0, 0, 1, '2025-11-21 04:13:42', NULL, '2025-11-21 04:13:42'),
(197, 2, NULL, 'Điện thoại bàn Ktel 303 hàng chính hãng', '-i-n-tho-i-b-n-ktel-303-h-ng-ch-nh-h-ng', 'https://tiki.vn/dien-thoai-ban-ktel-303-hang-chinh-hang-p170165658.html?spid=170165664', 'https://salt.tikicdn.com/cache/280x280/ts/product/d3/f1/23/f15cd1b6d78c02d099adff5899800e66.jpg', NULL, 450000, 450000, 24, 5.0, 5, 1, '2025-11-21 04:13:42', NULL, '2025-11-21 04:13:42'),
(198, 2, NULL, 'Điện thoại VoIP Yealink SIP-T30 - Hàng Chính Hãng', '-i-n-tho-i-voip-yealink-sip-t30-h-ng-ch-nh-h-ng', 'https://tiki.vn/dien-thoai-voip-yealink-sip-t30-hang-chinh-hang-p102620086.html?spid=102620089', 'https://salt.tikicdn.com/cache/280x280/ts/product/3f/60/64/7d4ab01ed2b81a0f29838fc626ae7d12.jpg', NULL, 1200000, 1200000, NULL, 0.0, 0, 1, '2025-11-21 04:13:42', NULL, '2025-11-21 04:13:42'),
(199, 2, NULL, 'Điện Thoại Bàn Panasonic KX-TSC11', '-i-n-tho-i-b-n-panasonic-kx-tsc11', 'https://tiki.vn/dien-thoai-ban-panasonic-kx-tsc11-hang-chinh-hang-p4048581.html?spid=26684295', 'https://salt.tikicdn.com/cache/280x280/ts/product/e6/3e/7e/e6d6b4057bf84fa1cd78088a16fff962.jpg', NULL, 744000, 759000, 66, 4.0, 9, 1, '2025-11-21 04:13:42', NULL, '2025-11-21 04:13:42'),
(200, 2, NULL, 'Pin Sạc Dự Phòng Energizer 10.000mAh QC 3.0 UE10015CQ (Màu Ngẫu nhiên)', 'pin-s-c-d-ph-ng-energizer-10-000mah-qc-3-0-ue10015cq-m-u-ng-u-nhi-n-', 'https://tiki.vn/gift-ss-s9-pin-sac-du-phong-energizer-10-000mah-qc-3-0-ue10015cq-mau-ngau-nhien-p1537601.html?spid=1537843', 'https://salt.tikicdn.com/cache/280x280/ts/product/ca/1d/a8/32dabe3bec14fdce3c3facfe66f8fade.jpg', NULL, 50000, 50000, NULL, 0.0, 0, 1, '2025-11-21 04:13:42', NULL, '2025-11-21 04:13:42'),
(201, 2, NULL, 'Điện Thoại Xiaomi POCO M7 Pro 5G 12GB/256GB - Hàng Chính Hãng', '-i-n-tho-i-xiaomi-poco-m7-pro-5g-12gb-256gb-h-ng-ch-nh-h-ng', 'https://tiki.vn/dien-thoai-xiaomi-poco-m7-pro-5g-12gb-256gb-hang-chinh-hang-p278834433.html?spid=278834439', 'https://salt.tikicdn.com/cache/280x280/ts/product/0d/c7/a5/91a4de31e7eb54daf9f9254cb7e6bfb3.jpg', NULL, 6279000, 6990000, NULL, 0.0, 0, 1, '2025-11-21 04:13:42', NULL, '2025-11-21 04:13:42'),
(202, 2, NULL, 'Điện Thoại Xiaomi Redmi Note 14 8GB/128GB - Hàng Chính Hãng', '-i-n-tho-i-xiaomi-redmi-note-14-8gb-128gb-h-ng-ch-nh-h-ng', 'https://tiki.vn/dien-thoai-xiaomi-redmi-note-14-8gb-128gb-hang-chinh-hang-p278834052.html?spid=278834054', 'https://salt.tikicdn.com/cache/280x280/ts/product/c9/1c/b3/424cbae781cc1738e0e4f79e09a837a7.jpg', NULL, 4629000, 5490000, NULL, 0.0, 0, 1, '2025-11-21 04:13:42', NULL, '2025-11-21 04:13:42'),
(203, 2, NULL, 'Điện Thoại Samsung Galaxy A07 4GB/128GB - Hàng Chính Hãng', '-i-n-tho-i-samsung-galaxy-a07-4gb-128gb-h-ng-ch-nh-h-ng', 'https://tiki.vn/dien-thoai-samsung-galaxy-a07-4gb-128gb-hang-chinh-hang-p278833657.html?spid=278833659', 'https://salt.tikicdn.com/cache/280x280/ts/product/af/a6/6f/b03d9c9bb29e0043878fe894005db011.jpg', NULL, 3390000, 3390000, NULL, 0.0, 0, 1, '2025-11-21 04:13:42', NULL, '2025-11-21 04:13:42'),
(204, 2, NULL, 'Điện thoại Xiaomi Redmi 15 8GB/128GB - Hàng Chính Hãng', '-i-n-tho-i-xiaomi-redmi-15-8gb-128gb-h-ng-ch-nh-h-ng', 'https://tiki.vn/dien-thoai-xiaomi-redmi-15-8gb-128gb-hang-chinh-hang-p278796276.html?spid=278796282', 'https://salt.tikicdn.com/cache/280x280/ts/product/46/76/dc/eb5ce2deb798e686e7f653240c5951f8.jpg', NULL, 4050000, 5190000, 10, 0.0, 0, 1, '2025-11-21 04:13:42', NULL, '2025-11-21 04:13:42'),
(205, 2, NULL, 'Điện thoại Oppo A5i (6GB/128GB) - Hàng chính hãng', '-i-n-tho-i-oppo-a5i-6gb-128gb-h-ng-ch-nh-h-ng', 'https://tiki.vn/dien-thoai-oppo-a5i-6gb-128gb-hang-chinh-hang-p278777036.html?spid=278777038', 'https://salt.tikicdn.com/cache/280x280/ts/product/c9/e0/89/20e6a3167c2212e57261f2326ff24fe7.jpg', NULL, 4460000, 4490000, NULL, 0.0, 0, 1, '2025-11-21 04:13:42', NULL, '2025-11-21 04:13:42'),
(206, 2, NULL, 'Máy tính bảng Samsung Galaxy Tab A11 LTE (4GB/64GB) - Hàng chính hãng', 'm-y-t-nh-b-ng-samsung-galaxy-tab-a11-lte-4gb-64gb-h-ng-ch-nh-h-ng', 'https://tiki.vn/may-tinh-bang-samsung-galaxy-tab-a11-lte-4gb-64gb-hang-chinh-hang-p278729165.html?spid=278729167', 'https://salt.tikicdn.com/cache/280x280/ts/product/da/c2/ed/03ef236a5501fc9d348dd30caf2400df.jpg', NULL, 5299000, 5490000, NULL, 0.0, 0, 1, '2025-11-21 04:13:42', NULL, '2025-11-21 04:13:42'),
(207, 2, NULL, 'Điện thoại Xiaomi 15T 5G (12GB/512GB) - Hàng chính hãng', '-i-n-tho-i-xiaomi-15t-5g-12gb-512gb-h-ng-ch-nh-h-ng', 'https://tiki.vn/dien-thoai-xiaomi-15t-5g-12gb-512gb-hang-chinh-hang-p278726697.html?spid=278726699', 'https://salt.tikicdn.com/cache/280x280/ts/product/c4/3b/44/51f0a56fdc0937f37f0bc13703ccb718.jpg', NULL, 14890000, 14990000, NULL, 0.0, 0, 1, '2025-11-21 04:13:42', NULL, '2025-11-21 04:13:42'),
(208, 2, NULL, 'Điện Thoại Samsung Galaxy A07 - Đã Kích Hoạt Bảo Hành Điện Tử - Hàng Chính Hãng', '-i-n-tho-i-samsung-galaxy-a07-k-ch-ho-t-b-o-h-nh-i-n-t-h-ng-ch-nh-h-ng', 'https://tiki.vn/dien-thoai-samsung-galaxy-a07-da-kich-hoat-bao-hanh-dien-tu-hang-chinh-hang-p278711036.html?spid=278711040', 'https://salt.tikicdn.com/cache/280x280/ts/product/a7/b1/60/c4910d12acb48da7e8502946708238ea.jpg', NULL, 2990000, 3690000, 14, 4.0, 2, 1, '2025-11-21 04:13:42', NULL, '2025-11-21 04:13:42'),
(209, 2, NULL, 'Điện Thoại Xiaomi Redmi 15 8GB/128GB - Hàng Chính Hãng', '-i-n-tho-i-xiaomi-redmi-15-8gb-128gb-h-ng-ch-nh-h-ng', 'https://tiki.vn/dien-thoai-xiaomi-redmi-15-8gb-128gb-hang-chinh-hang-p278665998.html?spid=278666004', 'https://salt.tikicdn.com/cache/280x280/ts/product/19/61/5b/a6a896666e277d87fb7241d646b35589.jpg', NULL, 4569000, 5190000, NULL, 0.0, 0, 1, '2025-11-21 04:13:42', NULL, '2025-11-21 04:13:42'),
(210, 2, NULL, 'Apple iPhone 17 Pro', 'apple-iphone-17-pro', 'https://tiki.vn/apple-iphone-17-pro-p278628812.html?spid=278630769', 'https://salt.tikicdn.com/cache/280x280/ts/product/b5/c9/72/bba1712b77ad93643395eaf0a0470adc.jpg', NULL, 34990000, 34990000, 114, 5.0, 6, 1, '2025-11-21 04:13:42', NULL, '2025-11-21 04:13:42'),
(211, 2, NULL, 'Điện thoại Oppo A5i (4GB/64GB) - Hàng chính hãng', '-i-n-tho-i-oppo-a5i-4gb-64gb-h-ng-ch-nh-h-ng', 'https://tiki.vn/dien-thoai-oppo-a5i-4gb-64gb-hang-chinh-hang-p278607957.html?spid=278607961', 'https://salt.tikicdn.com/cache/280x280/ts/product/dc/3b/44/7bb5748970b5a611717dd009361d9b89.jpg', NULL, 3260000, 3290000, NULL, 0.0, 0, 1, '2025-11-21 04:13:42', NULL, '2025-11-21 04:13:42'),
(212, 2, NULL, 'Điện Thoại Samsung Galaxy S25 FE (8/128GB), Concert Camera 50MP, Pin bền bỉ, Trợ thủ AI thông minh - Hàng chính hãng', '-i-n-tho-i-samsung-galaxy-s25-fe-8-128gb-concert-camera-50mp-pin-b-n-b-tr-th-ai-th-ng-minh-h-ng-ch-nh-h-ng', 'https://tiki.vn/dien-thoai-samsung-galaxy-s25-fe-8-128gb-concert-camera-50mp-pin-ben-bi-tro-thu-ai-thong-minh-hang-chinh-hang-p278600678.html?spid=278600682', 'https://salt.tikicdn.com/cache/280x280/ts/product/3f/c0/aa/9bb18996968dea5e65e28bcfb330128c.jpg', NULL, 14290000, 16690000, 2, 0.0, 0, 1, '2025-11-21 04:13:42', NULL, '2025-11-21 04:13:42'),
(213, 2, NULL, 'Điện thoại Samsung Galaxy A07 LTE (4GB/64GB) - Hàng chính hãng', '-i-n-tho-i-samsung-galaxy-a07-lte-4gb-64gb-h-ng-ch-nh-h-ng', 'https://tiki.vn/dien-thoai-samsung-galaxy-a07-lte-4gb-64gb-hang-chinh-hang-p278592403.html?spid=278592409', 'https://salt.tikicdn.com/cache/280x280/ts/product/22/0e/67/f826df11d04c141585132264132384fd.jpg', NULL, 3060000, 3090000, NULL, 0.0, 0, 1, '2025-11-21 04:13:42', NULL, '2025-11-21 04:13:42'),
(214, 2, NULL, 'Điện thoại Samsung Galaxy A17 5G (8GB/128GB) - Hàng chính hãng', '-i-n-tho-i-samsung-galaxy-a17-5g-8gb-128gb-h-ng-ch-nh-h-ng', 'https://tiki.vn/dien-thoai-samsung-galaxy-a17-5g-8gb-128gb-hang-chinh-hang-p278591193.html?spid=278591196', 'https://salt.tikicdn.com/cache/280x280/ts/product/93/3f/52/65f793de74a6795090da5f7fc9517023.jpg', NULL, 5549000, 6190000, NULL, 0.0, 0, 1, '2025-11-21 04:13:42', NULL, '2025-11-21 04:13:42'),
(215, 2, NULL, 'Điện thoại Xiaomi Redmi 15 (8GB/128GB) - Hàng chính hãng', '-i-n-tho-i-xiaomi-redmi-15-8gb-128gb-h-ng-ch-nh-h-ng', 'https://tiki.vn/dien-thoai-xiaomi-redmi-15-8gb-128gb-hang-chinh-hang-p278580633.html?spid=278580639', 'https://salt.tikicdn.com/cache/280x280/ts/product/1d/ec/4c/c2b9dcc54692211bf89d643baaeeecf0.jpg', NULL, 4769000, 5190000, NULL, 0.0, 0, 1, '2025-11-21 04:13:42', NULL, '2025-11-21 04:13:42'),
(216, 2, NULL, 'Điện thoại Xiaomi Redmi 15 (6GB/128GB) - Hàng chính hãng', '-i-n-tho-i-xiaomi-redmi-15-6gb-128gb-h-ng-ch-nh-h-ng', 'https://tiki.vn/dien-thoai-xiaomi-redmi-15-6gb-128gb-hang-chinh-hang-p278580531.html?spid=278580537', 'https://salt.tikicdn.com/cache/280x280/ts/product/1d/ec/4c/390032402f5ff72b961f3edf59d90def.jpg', NULL, 4349000, 4790000, NULL, 0.0, 0, 1, '2025-11-21 04:13:42', NULL, '2025-11-21 04:13:42'),
(217, 2, NULL, 'Điện Thoại Samsung Galaxy A07 (4/128GB), Màn Hình Lớn 6.7\'\', Pin 5000mAh, IP54 Kháng Nước Kháng Bụi - Hàng Chính Hãng', '-i-n-tho-i-samsung-galaxy-a07-4-128gb-m-n-h-nh-l-n-6-7-pin-5000mah-ip54-kh-ng-n-c-kh-ng-b-i-h-ng-ch-nh-h-ng', 'https://tiki.vn/dien-thoai-samsung-galaxy-a07-4-128gb-man-hinh-lon-6-7-pin-5000mah-ip54-khang-nuoc-khang-bui-hang-chinh-hang-p278505416.html?spid=278505418', 'https://salt.tikicdn.com/cache/280x280/ts/product/a7/b1/60/8053b3d20c792fa5db420b0bca24bd02.jpg', NULL, 2990000, 3390000, 3, 0.0, 0, 1, '2025-11-21 04:13:42', NULL, '2025-11-21 04:13:42'),
(218, 2, NULL, 'Điện Thoại Samsung Galaxy A17 LTE (8/128GB), Kính Cường Lực Gorilla Victus, Camera 50MP & IOS, AI Gemini - Hàng Chính Hãng', '-i-n-tho-i-samsung-galaxy-a17-lte-8-128gb-k-nh-c-ng-l-c-gorilla-victus-camera-50mp-ios-ai-gemini-h-ng-ch-nh-h-ng', 'https://tiki.vn/dien-thoai-samsung-galaxy-a17-lte-8-128gb-kinh-cuong-luc-gorilla-victus-camera-50mp-ios-ai-gemini-hang-chinh-hang-p278505394.html?spid=278505409', 'https://salt.tikicdn.com/cache/280x280/ts/product/9d/6d/b7/ac0cf6627957a9807103864b3cc18e7e.jpg', NULL, 4790000, 5190000, 2, 0.0, 0, 1, '2025-11-21 04:13:42', NULL, '2025-11-21 04:13:42'),
(219, 2, NULL, 'Điện Thoại Oppo A3x 6GB/128GB - Hàng Chính Hãng', '-i-n-tho-i-oppo-a3x-6gb-128gb-h-ng-ch-nh-h-ng', 'https://tiki.vn/dien-thoai-oppo-a3x-6gb-128gb-hang-chinh-hang-p278500816.html?spid=278500820', 'https://salt.tikicdn.com/cache/280x280/ts/product/8b/c3/1f/b8c3fb7573934d384002a3a9ee6b4100.jpg', NULL, 3739000, 4690000, NULL, 0.0, 0, 1, '2025-11-21 04:13:42', NULL, '2025-11-21 04:13:42');
INSERT INTO `products` (`id`, `platform_id`, `category_id`, `title`, `normalized_key`, `product_url`, `image_url`, `shop_name`, `price_current`, `price_original`, `sold_quantity`, `rating_avg`, `rating_count`, `is_active`, `created_at`, `updated_at`, `last_scraped_at`) VALUES
(220, 2, NULL, 'Điện thoại Realme C71 (4GB/128GB) - Hàng chính hãng', '-i-n-tho-i-realme-c71-4gb-128gb-h-ng-ch-nh-h-ng', 'https://tiki.vn/dien-thoai-realme-c71-4gb-128gb-hang-chinh-hang-p278470574.html?spid=278470576', 'https://salt.tikicdn.com/cache/280x280/ts/product/55/a7/a6/e420b60cca5e52c6539149bd3e5ab7fd.jpg', NULL, 3460000, 3920000, NULL, 0.0, 0, 1, '2025-11-21 04:13:42', NULL, '2025-11-21 04:13:42'),
(221, 2, NULL, 'Điện thoại Realme C65 (6GB/128GB) Chipset:MediaTek Helio G85,Màn hình 6.67inch - Hàng chính hãng', '-i-n-tho-i-realme-c65-6gb-128gb-chipset-mediatek-helio-g85-m-n-h-nh-6-67inch-h-ng-ch-nh-h-ng', 'https://tiki.vn/dien-thoai-realme-c65-6gb-128gb-chipset-mediatek-helio-g85-man-hinh-6-67inch-hang-chinh-hang-p278469276.html?spid=278469280', 'https://salt.tikicdn.com/cache/280x280/ts/product/d2/33/9d/884cb4d6820067d83b2bf23e84b0513b.jpg', NULL, 2699000, 3290000, NULL, 0.0, 0, 1, '2025-11-21 04:13:42', NULL, '2025-11-21 04:13:42'),
(222, 2, NULL, 'Điện thoại Xiaomi Redmi Note 13 5G (8GB/128GB) Màn hình Amoled 6.67\" Chip Dimensity 6080 - Hàng nhập khẩu', '-i-n-tho-i-xiaomi-redmi-note-13-5g-8gb-128gb-m-n-h-nh-amoled-6-67-chip-dimensity-6080-h-ng-nh-p-kh-u', 'https://tiki.vn/dien-thoai-xiaomi-redmi-note-13-5g-6g-128gb-man-hinh-amoled-6-67-chip-dimensity-6080-hang-nhap-khau-p278468588.html?spid=278468590', 'https://salt.tikicdn.com/cache/280x280/ts/product/0e/41/82/1e3d44f61863bc4dc1f90f377b93ce25.jpg', NULL, 3569000, 4900000, NULL, 5.0, 1, 1, '2025-11-21 04:13:42', NULL, '2025-11-21 04:13:42'),
(223, 2, NULL, 'Điện thoại ZTE Nubia S 5G (4GB/128GB) Màn hình 6.7\",kháng nước IP68,pin 5000mAh - Hàng nhập khẩu Nhật', '-i-n-tho-i-zte-nubia-s-5g-4gb-128gb-m-n-h-nh-6-7-kh-ng-n-c-ip68-pin-5000mah-h-ng-nh-p-kh-u-nh-t', 'https://tiki.vn/dien-thoai-zte-nubia-s-5g-4gb-128gb-man-hinh-6-7-khang-nuoc-ip68-pin-5000mah-hang-nhap-khau-nhat-p278468431.html?spid=278468577', 'https://salt.tikicdn.com/cache/280x280/ts/product/2c/18/99/f65f0f1a88a56bfcce3220071d6a7d2d.jpg', NULL, 2649000, 3290000, NULL, 0.0, 0, 1, '2025-11-21 04:13:42', NULL, '2025-11-21 04:13:42'),
(224, 2, NULL, 'Điện thoại OPPO A3i 5G (6GB/128GB) Chip Dimensity 6300, Màn hình 120Hz,Rom tiếng việt - Hàng nhập khẩu', '-i-n-tho-i-oppo-a3i-5g-6gb-128gb-chip-dimensity-6300-m-n-h-nh-120hz-rom-ti-ng-vi-t-h-ng-nh-p-kh-u', 'https://tiki.vn/dien-thoai-oppo-a3i-5g-6gb-128gb-chip-dimensity-6300-man-hinh-120hz-rom-tieng-viet-hang-nhap-khau-p278468256.html?spid=278468260', 'https://salt.tikicdn.com/cache/280x280/ts/product/b2/e5/25/0512636432b8fe483f2d51aa6a84f4a5.jpg', NULL, 3199000, 3690000, NULL, 0.0, 0, 1, '2025-11-21 04:13:42', NULL, '2025-11-21 04:13:42'),
(225, 2, NULL, 'Điện thoại Vivo iQOO Z10x 5G (8GB/128GB) MediaTek Dimensity 7300, Pin 6500mAh  - Hàng nhập khẩu', '-i-n-tho-i-vivo-iqoo-z10x-5g-8gb-128gb-mediatek-dimensity-7300-pin-6500mah-h-ng-nh-p-kh-u', 'https://tiki.vn/dien-thoai-vivo-iqoo-z10x-5g-8gb-128gb-mediatek-dimensity-7300-pin-6500mah-hang-nhap-khau-p278465594.html?spid=278465600', 'https://salt.tikicdn.com/cache/280x280/ts/product/12/7b/55/968bde28b700e1f051d6135ca55289f9.jpg', NULL, 3999000, 4990000, 3, 0.0, 0, 1, '2025-11-21 04:13:42', NULL, '2025-11-21 04:13:42'),
(226, 2, NULL, 'Điện Thoại Samsung Galaxy A16 LTE (4GB/128GB) - Hàng Chính Hãng', '-i-n-tho-i-samsung-galaxy-a16-lte-4gb-128gb-h-ng-ch-nh-h-ng', 'https://tiki.vn/dien-thoai-samsung-galaxy-a16-lte-4gb-128gb-hang-chinh-hang-p278381795.html?spid=278381799', 'https://salt.tikicdn.com/cache/280x280/ts/product/6d/d7/50/be750ff5adb5166327d82e27455178c7.png', NULL, 3290000, 5000000, 129, 5.0, 2, 1, '2025-11-21 04:13:42', NULL, '2025-11-21 04:13:42'),
(227, 2, NULL, 'Ốp lưng Samsung Silicone Galaxy Z Fold7 - Hàng chính hãng', '-p-l-ng-samsung-silicone-galaxy-z-fold7-h-ng-ch-nh-h-ng', 'https://tiki.vn/op-lung-silicone-galaxy-z-fold7-hang-chinh-hang-p278294432.html?spid=278294433', 'https://salt.tikicdn.com/cache/280x280/ts/product/8c/65/70/f6aa185a1eed9b7900c41c5ef2cf67d1.png', NULL, 1250000, 1690000, 5, 0.0, 0, 1, '2025-11-21 04:13:42', NULL, '2025-11-21 04:13:42'),
(228, 2, NULL, 'Điện thoại Samsung Galaxy Z Fold7, Điện thoại AI, Camera 200MP, Màn hình 8.0\" tối ưu đa nhiệm, Mỏng nhẹ nhất - Hàng Chính Hãng', '-i-n-tho-i-samsung-galaxy-z-fold7-i-n-tho-i-ai-camera-200mp-m-n-h-nh-8-0-t-i-u-a-nhi-m-m-ng-nh-nh-t-h-ng-ch-nh-h-ng', 'https://tiki.vn/dien-thoai-samsung-galaxy-q7-hang-chinh-hang-p278277315.html?spid=278277319', 'https://salt.tikicdn.com/cache/280x280/ts/product/9a/52/1a/4e8e2c9db4ccdc13978345d0ef1487d7.JPG', NULL, 38990000, 46990000, 16, 0.0, 0, 1, '2025-11-21 04:13:42', NULL, '2025-11-21 04:13:42'),
(229, 2, NULL, 'Điện thoại Xiaomi Redmi Note 14 (8GB/128GB) - Hàng chính hãng', '-i-n-tho-i-xiaomi-redmi-note-14-8gb-128gb-h-ng-ch-nh-h-ng', 'https://tiki.vn/dien-thoai-xiaomi-redmi-note-14-8gb-128gb-hang-chinh-hang-p277558883.html?spid=277558889', 'https://salt.tikicdn.com/cache/280x280/ts/product/6a/52/85/60d45419e7d21a65fe8da912ef79b406.jpg', NULL, 4669000, 5490000, NULL, 0.0, 0, 1, '2025-11-21 04:13:42', NULL, '2025-11-21 04:13:42'),
(230, 2, NULL, 'Máy tính bảng Kindle Fire Max 11 inch - 13th - 2023 - Ram 4Gb - Hàng chính hãng', 'm-y-t-nh-b-ng-kindle-fire-max-11-inch-13th-2023-ram-4gb-h-ng-ch-nh-h-ng', 'https://tiki.vn/may-tinh-bang-kindle-fire-max-11-inch-13th-2023-ram-4gb-hang-nhap-khau-p273559306.html?spid=273559316', 'https://salt.tikicdn.com/cache/280x280/ts/product/30/08/69/61c8542cd839f345014eee0eb34ebdf4.jpg', NULL, 5590000, 5590000, 2, 0.0, 0, 1, '2025-11-21 04:13:42', NULL, '2025-11-21 04:13:42'),
(231, 2, NULL, 'Điện thoại IP Grandstream GRP 2601P hàng chính hãng', '-i-n-tho-i-ip-grandstream-grp-2601p-h-ng-ch-nh-h-ng', 'https://tiki.vn/dien-thoai-ip-grandstream-grp-2601p-hang-chinh-hang-p198868573.html?spid=198868574', 'https://salt.tikicdn.com/cache/280x280/ts/product/89/35/bd/fa848404160e8f3c027a2505ff06df82.jpg', NULL, 1050000, 1050000, 2, 0.0, 0, 1, '2025-11-21 04:13:42', NULL, '2025-11-21 04:13:42'),
(232, 2, NULL, 'Điện thoại Panasonic KX-TS520MX -Hàng chính hãng', '-i-n-tho-i-panasonic-kx-ts520mx-h-ng-ch-nh-h-ng', 'https://tiki.vn/dien-thoai-panasonic-kx-ts520mx-hang-chinh-hang-p156222386.html?spid=258669922', 'https://salt.tikicdn.com/cache/280x280/ts/product/15/10/be/76f84f9e5c2ba6ca436b2f767493b653.PNG', NULL, 474000, 489000, 1, 0.0, 0, 1, '2025-11-21 04:13:42', NULL, '2025-11-21 04:13:42'),
(233, 3, NULL, 'Combo Máy đo đường huyết - mỡ máu - gút BeneCheck & Máy đo huyết áp Wellmed FDBP-A4', 'combo-m-y-o-ng-huy-t-m-m-u-g-t-benecheck-m-y-o-huy-t-p-wellmed-fdbp-a4', 'https://sieuthiyte.com.vn/combo-may-do-duong-huyet-mo-mau-gut-benecheck-may-do-huyet-ap-wellmed-fdbp-a4-1105.html', 'https://sieuthiyte.com.vn/data/images/San-Pham/combo-may-do-duong-huyet-mo-mau-gut-benecheck-may-do-huyet-ap-wellmed-fdbp-a4-avt-08022023.jpg', NULL, 899000, 2090000, NULL, NULL, NULL, 1, '2025-11-21 04:14:00', NULL, '2025-11-21 04:14:00'),
(234, 3, NULL, 'Combo Bàn chải điện ROAMAN T3S & Máy tăm nước cầm tay ROAMAN Mini 1', 'combo-b-n-ch-i-i-n-roaman-t3s-m-y-t-m-n-c-c-m-tay-roaman-mini-1', 'https://sieuthiyte.com.vn/combo-ban-chai-dien-roaman-t3s-may-tam-nuoc-roaman-mini-1-1351.html', 'https://sieuthiyte.com.vn/data/images/San-Pham/combo-ban-chai-dien-roaman-t3s-may-tam-nuoc-roaman-mini-1-av1.jpg', NULL, 899000, 1850000, NULL, NULL, NULL, 1, '2025-11-21 04:14:00', NULL, '2025-11-21 04:14:00'),
(235, 3, NULL, 'Combo Máy đo huyết áp Scian LD-521 & Máy đo đường huyết 3in1 BeneCheck', 'combo-m-y-o-huy-t-p-scian-ld-521-m-y-o-ng-huy-t-3in1-benecheck', 'https://sieuthiyte.com.vn/combo-may-do-huyet-ap-scian-ld-521-may-do-duong-huyet-3in1-benecheck-1256.html', 'https://sieuthiyte.com.vn/data/images/San-Pham/combo-may-do-huyet-ap-scian-ld-521-may-do-duong-huyet-3in1-benecheck-avt-08022023-1.jpg', NULL, 960000, 1920000, NULL, NULL, NULL, 1, '2025-11-21 04:14:00', NULL, '2025-11-21 04:14:00'),
(236, 3, NULL, 'Combo Máy đo đường huyết Sapphire Plus & Máy đo huyết áp Wellmed FDBP-A4', 'combo-m-y-o-ng-huy-t-sapphire-plus-m-y-o-huy-t-p-wellmed-fdbp-a4', 'https://sieuthiyte.com.vn/combo-may-do-duong-huyet-sapphire-plus-may-do-huyet-ap-wellmed-fdbp-a4-1104.html', 'https://sieuthiyte.com.vn/data/images/San-Pham/combo-may-do-duong-huyet-sapphire-plus-may-do-huyet-ap-wellmed-fdbp-a4-avtnew.jpg', NULL, 760000, 1850000, NULL, NULL, NULL, 1, '2025-11-21 04:14:00', NULL, '2025-11-21 04:14:00'),
(237, 3, NULL, 'Combo Máy đo đường huyết Sapphire - Máy đo huyết áp Boso Medicus X', 'combo-m-y-o-ng-huy-t-sapphire-m-y-o-huy-t-p-boso-medicus-x', 'https://sieuthiyte.com.vn/combo-may-do-duong-huyet-sapphire-may-do-huyet-ap-boso-medicus-x-874.html', 'https://sieuthiyte.com.vn/data/product/202008/sapphire-bosox-min1597719579.nv.png', NULL, 1299000, 2540000, NULL, NULL, NULL, 1, '2025-11-21 04:14:00', NULL, '2025-11-21 04:14:00'),
(238, 3, NULL, 'Combo Máy đo đường huyết Sapphire Plus - Máy đo huyết áp Medistar+', 'combo-m-y-o-ng-huy-t-sapphire-plus-m-y-o-huy-t-p-medistar-', 'https://sieuthiyte.com.vn/combo-mua-may-do-duong-huyet-sapphire-plus-tang-may-do-huyet-ap-medistar-806.html', 'https://sieuthiyte.com.vn/data/product/201912/sapphire-medistar15445972081576115629.nv.png', NULL, 1090000, 2090000, NULL, NULL, NULL, 1, '2025-11-21 04:14:00', NULL, '2025-11-21 04:14:00'),
(239, 3, NULL, 'Combo Máy đo đường huyết Benecheck 3in1 - Máy đo huyết áp cổ tay Medistar +', 'combo-m-y-o-ng-huy-t-benecheck-3in1-m-y-o-huy-t-p-c-tay-medistar-', 'https://sieuthiyte.com.vn/combo-may-do-duong-huyet-benecheck-3-in-1-may-do-huyet-ap-co-tay-medistar-plus-899.html', 'https://sieuthiyte.com.vn/data/product/202008/benecheck-medistarplus1597652523.nv.png', NULL, 1199000, 2340000, NULL, NULL, NULL, 1, '2025-11-21 04:14:00', NULL, '2025-11-21 04:14:00'),
(240, 3, NULL, 'Combo Máy đo đường huyết Benecheck 3in1 - Máy đo huyết áp bắp tay Boso Medicus X', 'combo-m-y-o-ng-huy-t-benecheck-3in1-m-y-o-huy-t-p-b-p-tay-boso-medicus-x', 'https://sieuthiyte.com.vn/combo-may-do-duong-huyet-benecheck-3-in-1-may-do-huyet-ap-bap-tay-boso-medicus-x-900.html', 'https://sieuthiyte.com.vn/data/product/202008/benecheck-bosox1597652677.nv.png', NULL, 1599000, 3040000, NULL, NULL, NULL, 1, '2025-11-21 04:14:00', NULL, '2025-11-21 04:14:00'),
(241, 3, NULL, 'Combo Cây lăn massage mặt và body Kakusan KB-213 & Máy rửa mặt Bimix BM606', 'combo-c-y-l-n-massage-m-t-v-body-kakusan-kb-213-m-y-r-a-m-t-bimix-bm606', 'https://sieuthiyte.com.vn/combo-cay-lan-massage-kakusan-kb213-may-rua-mat-bimix-bm606-1302.html', 'https://sieuthiyte.com.vn/data/images/San-Pham/combo-cay-lan-massage-kakusan-kb213-may-rua-mat-bimix-bm606-avt-new2.jpg', NULL, 999000, 1950000, NULL, NULL, NULL, 1, '2025-11-21 04:14:00', NULL, '2025-11-21 04:14:00'),
(242, 3, NULL, 'Combo Máy massage mặt nóng lạnh Bimix BM10 & Máy rửa mặt Sonic Bimix BM606', 'combo-m-y-massage-m-t-n-ng-l-nh-bimix-bm10-m-y-r-a-m-t-sonic-bimix-bm606', 'https://sieuthiyte.com.vn/combo-may-massage-mat-nong-lanh-bimix-bm10-may-rua-mat-bimix-bm606-1301.html', 'https://sieuthiyte.com.vn/data/images/San-Pham/combo-may-massage-mat-nong-lanh-bimix-bm10-may-rua-mat-bimix-bm606-avt-18022023.jpg', NULL, 1780000, 3200000, NULL, NULL, NULL, 1, '2025-11-21 04:14:00', NULL, '2025-11-21 04:14:00'),
(243, 3, NULL, 'Combo Máy xông hơi mặt Reiwa WT-300 & Máy hút mụn đầu đen 2in1 Reiwa', 'combo-m-y-x-ng-h-i-m-t-reiwa-wt-300-m-y-h-t-m-n-u-en-2in1-reiwa', 'https://sieuthiyte.com.vn/combo-may-xong-hoi-mat-reiwa-wt300-may-hut-mun-dau-den-2in1-reiwa-1298.html', 'https://sieuthiyte.com.vn/data/images/San-Pham/combo-may-xong-hoi-mat-reiwa-wt300-may-hut-mun-dau-den-2in1-reiwa-avt-18022023.jpg', NULL, 1100000, 2000000, NULL, NULL, NULL, 1, '2025-11-21 04:14:00', NULL, '2025-11-21 04:14:00'),
(244, 3, NULL, 'Combo Máy xông hơi mặt Reiwa WT-300 & Máy rửa mặt 3in1 Reiwa WT-222-2', 'combo-m-y-x-ng-h-i-m-t-reiwa-wt-300-m-y-r-a-m-t-3in1-reiwa-wt-222-2', 'https://sieuthiyte.com.vn/combo-may-xong-hoi-mat-reiwa-wt300-may-rua-mat-3in1-reiwa-wt-222-2-1297.html', 'https://sieuthiyte.com.vn/data/images/San-Pham/combo-reiwa-may-xong-hoi-mat-may-rua-mat-avt1.jpg', NULL, 899000, 1800000, NULL, NULL, NULL, 1, '2025-11-21 04:14:00', NULL, '2025-11-21 04:14:00'),
(245, 3, NULL, 'Combo Máy massage cổ cao cấp KASJ A1 & Súng massage cầm tay mini KASJ A3', 'combo-m-y-massage-c-cao-c-p-kasj-a1-s-ng-massage-c-m-tay-mini-kasj-a3', 'https://sieuthiyte.com.vn/combo-may-massage-co-cao-cap-kasj-a1-sung-massage-cam-tay-mini-kasj-a3-1271.html', 'https://sieuthiyte.com.vn/data/images/San-Pham/combo-may-massage-co-cao-cap-kasj-a1-sung-massage-cam-tay-mini-kasj-a3-avt-08022023-1.jpg', NULL, 1900000, 3300000, NULL, NULL, NULL, 1, '2025-11-21 04:14:00', NULL, '2025-11-21 04:14:00'),
(246, 3, NULL, 'Combo Quần Gen Bụng Art 601 – Đai Nịt Bụng Art 605', 'combo-qu-n-gen-b-ng-art-601-ai-n-t-b-ng-art-605', 'https://sieuthiyte.com.vn/combo-quan-gen-bung-art-601-dai-nit-bung-art-605-728.html', 'https://sieuthiyte.com.vn/data/images/San-Pham/combo-quan-gen-bung-art-601-dai-nit-bung-art-605-avt-08022023-1.jpg', NULL, 500000, 760000, NULL, NULL, NULL, 1, '2025-11-21 04:14:00', NULL, '2025-11-21 04:14:00');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `product_snapshots`
--

CREATE TABLE `product_snapshots` (
  `id` bigint(20) NOT NULL,
  `product_id` bigint(20) NOT NULL,
  `price_current` bigint(20) DEFAULT NULL,
  `price_original` bigint(20) DEFAULT NULL,
  `sold_quantity` int(11) DEFAULT NULL,
  `rating_avg` decimal(2,1) DEFAULT NULL,
  `rating_count` int(11) DEFAULT NULL,
  `scraped_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `product_snapshots`
--

INSERT INTO `product_snapshots` (`id`, `product_id`, `price_current`, `price_original`, `sold_quantity`, `rating_avg`, `rating_count`, `scraped_at`) VALUES
(1, 1, 899000, 2090000, NULL, NULL, NULL, '2025-11-21 02:52:52'),
(3, 4, 960000, 1920000, NULL, NULL, NULL, '2025-11-21 02:52:52'),
(4, 5, 760000, 1850000, NULL, NULL, NULL, '2025-11-21 02:52:52'),
(5, 6, 1299000, 2540000, NULL, NULL, NULL, '2025-11-21 02:52:52'),
(6, 7, 1090000, 2090000, NULL, NULL, NULL, '2025-11-21 02:52:52'),
(7, 8, 1199000, 2340000, NULL, NULL, NULL, '2025-11-21 02:52:52'),
(8, 9, 1599000, 3040000, NULL, NULL, NULL, '2025-11-21 02:52:52'),
(9, 10, 999000, 1950000, NULL, NULL, NULL, '2025-11-21 02:52:52'),
(10, 11, 1780000, 3200000, NULL, NULL, NULL, '2025-11-21 02:52:52'),
(11, 12, 1100000, 2000000, NULL, NULL, NULL, '2025-11-21 02:52:52'),
(12, 13, 899000, 1800000, NULL, NULL, NULL, '2025-11-21 02:52:52'),
(13, 14, 1900000, 3300000, NULL, NULL, NULL, '2025-11-21 02:52:52'),
(14, 15, 500000, 760000, NULL, NULL, NULL, '2025-11-21 02:52:52'),
(15, 1, 899000, 2090000, NULL, NULL, NULL, '2025-11-21 03:02:41'),
(17, 4, 960000, 1920000, NULL, NULL, NULL, '2025-11-21 03:02:41'),
(18, 5, 760000, 1850000, NULL, NULL, NULL, '2025-11-21 03:02:41'),
(19, 6, 1299000, 2540000, NULL, NULL, NULL, '2025-11-21 03:02:41'),
(20, 7, 1090000, 2090000, NULL, NULL, NULL, '2025-11-21 03:02:41'),
(21, 8, 1199000, 2340000, NULL, NULL, NULL, '2025-11-21 03:02:41'),
(22, 9, 1599000, 3040000, NULL, NULL, NULL, '2025-11-21 03:02:41'),
(23, 10, 999000, 1950000, NULL, NULL, NULL, '2025-11-21 03:02:41'),
(24, 11, 1780000, 3200000, NULL, NULL, NULL, '2025-11-21 03:02:41'),
(25, 12, 1100000, 2000000, NULL, NULL, NULL, '2025-11-21 03:02:41'),
(26, 13, 899000, 1800000, NULL, NULL, NULL, '2025-11-21 03:02:41'),
(27, 14, 1900000, 3300000, NULL, NULL, NULL, '2025-11-21 03:02:41'),
(28, 15, 500000, 760000, NULL, NULL, NULL, '2025-11-21 03:02:41'),
(29, 30, 899000, 2090000, NULL, NULL, NULL, '2025-11-21 03:59:50'),
(30, 31, 899000, 1850000, NULL, NULL, NULL, '2025-11-21 03:59:50'),
(31, 32, 960000, 1920000, NULL, NULL, NULL, '2025-11-21 03:59:50'),
(32, 33, 760000, 1850000, NULL, NULL, NULL, '2025-11-21 03:59:50'),
(33, 34, 1299000, 2540000, NULL, NULL, NULL, '2025-11-21 03:59:50'),
(34, 35, 1090000, 2090000, NULL, NULL, NULL, '2025-11-21 03:59:50'),
(35, 36, 1199000, 2340000, NULL, NULL, NULL, '2025-11-21 03:59:50'),
(36, 37, 1599000, 3040000, NULL, NULL, NULL, '2025-11-21 03:59:50'),
(37, 38, 999000, 1950000, NULL, NULL, NULL, '2025-11-21 03:59:50'),
(38, 39, 1780000, 3200000, NULL, NULL, NULL, '2025-11-21 03:59:50'),
(39, 40, 1100000, 2000000, NULL, NULL, NULL, '2025-11-21 03:59:50'),
(40, 41, 899000, 1800000, NULL, NULL, NULL, '2025-11-21 03:59:50'),
(41, 42, 1900000, 3300000, NULL, NULL, NULL, '2025-11-21 03:59:50'),
(42, 43, 500000, 760000, NULL, NULL, NULL, '2025-11-21 03:59:50'),
(43, 30, 899000, 2090000, NULL, NULL, NULL, '2025-11-21 03:59:55'),
(44, 31, 899000, 1850000, NULL, NULL, NULL, '2025-11-21 03:59:55'),
(45, 32, 960000, 1920000, NULL, NULL, NULL, '2025-11-21 03:59:55'),
(46, 33, 760000, 1850000, NULL, NULL, NULL, '2025-11-21 03:59:55'),
(47, 34, 1299000, 2540000, NULL, NULL, NULL, '2025-11-21 03:59:55'),
(48, 35, 1090000, 2090000, NULL, NULL, NULL, '2025-11-21 03:59:55'),
(49, 36, 1199000, 2340000, NULL, NULL, NULL, '2025-11-21 03:59:55'),
(50, 37, 1599000, 3040000, NULL, NULL, NULL, '2025-11-21 03:59:55'),
(51, 38, 999000, 1950000, NULL, NULL, NULL, '2025-11-21 03:59:55'),
(52, 39, 1780000, 3200000, NULL, NULL, NULL, '2025-11-21 03:59:55'),
(53, 40, 1100000, 2000000, NULL, NULL, NULL, '2025-11-21 03:59:55'),
(54, 41, 899000, 1800000, NULL, NULL, NULL, '2025-11-21 03:59:55'),
(55, 42, 1900000, 3300000, NULL, NULL, NULL, '2025-11-21 03:59:55'),
(56, 43, 500000, 760000, NULL, NULL, NULL, '2025-11-21 03:59:55'),
(57, 58, 2190000, 2190000, 72, 4.7, 3, '2025-11-21 04:11:49'),
(58, 59, 8490000, 11990000, 9, 5.0, 1, '2025-11-21 04:11:49'),
(59, 60, 6029000, 7290000, 1, 0.0, 0, '2025-11-21 04:11:49'),
(60, 61, 5290000, 6990000, 2759, 5.0, 18, '2025-11-21 04:11:49'),
(61, 62, 2639000, 4490000, 17, 4.8, 6, '2025-11-21 04:11:49'),
(62, 63, 8490000, 9990000, 336, 5.0, 49, '2025-11-21 04:11:49'),
(63, 64, 8290000, 8290000, 9, 5.0, 3, '2025-11-21 04:11:49'),
(64, 65, 3229000, 4690000, 12, 5.0, 1, '2025-11-21 04:11:49'),
(65, 66, 645000, 645000, 7, 3.0, 2, '2025-11-21 04:11:49'),
(66, 67, 2689000, 3690000, 16, 5.0, 1, '2025-11-21 04:11:49'),
(67, 68, 4159000, 4990000, 13, 4.5, 8, '2025-11-21 04:11:49'),
(68, 69, 17590000, 22990000, 18, 5.0, 5, '2025-11-21 04:11:49'),
(69, 70, 1699000, 2190000, 7, 5.0, 2, '2025-11-21 04:11:49'),
(70, 71, 3830000, 4990000, 6480, 5.0, 64, '2025-11-21 04:11:49'),
(71, 72, 2189000, 3190000, 15, 4.8, 4, '2025-11-21 04:11:49'),
(72, 73, 3590000, 3990000, 8, 5.0, 1, '2025-11-21 04:11:49'),
(73, 74, 2799000, 3999000, 6, 5.0, 2, '2025-11-21 04:11:49'),
(74, 75, 609000, 629000, 3, 5.0, 2, '2025-11-21 04:11:49'),
(75, 76, 2529000, 3490000, 14, 5.0, 4, '2025-11-21 04:11:49'),
(76, 77, 24990000, 28990000, 242, 5.0, 42, '2025-11-21 04:11:49'),
(77, 78, 3989000, 4990000, 1, 0.0, 0, '2025-11-21 04:11:49'),
(78, 79, 299000, 299000, 28, 4.7, 3, '2025-11-21 04:11:49'),
(79, 80, 999000, 1190000, 15, 5.0, 3, '2025-11-21 04:11:49'),
(80, 81, 3099000, 3590000, 28, 5.0, 9, '2025-11-21 04:11:49'),
(81, 82, 2269000, 2990000, 13, 4.8, 4, '2025-11-21 04:11:49'),
(82, 83, 3550000, 5990000, 446, 4.8, 104, '2025-11-21 04:11:49'),
(83, 84, 3890000, 4990000, 29503, 5.0, 148, '2025-11-21 04:11:49'),
(84, 85, 3590000, 3590000, 139, 5.0, 106, '2025-11-21 04:11:49'),
(85, 86, 2429000, 3990000, 167, 4.7, 62, '2025-11-21 04:11:49'),
(86, 87, 620000, 620000, 292, 5.0, 51, '2025-11-21 04:11:49'),
(87, 88, 3590000, 3590000, 576, 5.0, 116, '2025-11-21 04:11:49'),
(88, 89, 17990000, 17990000, 706, 5.0, 166, '2025-11-21 04:11:49'),
(89, 90, 1190000, 1190000, 31, 4.8, 8, '2025-11-21 04:11:49'),
(90, 91, 1850000, 1850000, 28, 5.0, 6, '2025-11-21 04:11:49'),
(91, 92, 619000, 790000, 155, 4.2, 31, '2025-11-21 04:11:49'),
(92, 93, 688000, 688000, 53, 5.0, 14, '2025-11-21 04:11:49'),
(93, 94, 2350000, 2350000, 38, 5.0, 6, '2025-11-21 04:11:49'),
(94, 95, 320000, 320000, 988, 5.0, 139, '2025-11-21 04:11:49'),
(95, 96, 3990000, 3990000, 1583, 5.0, 409, '2025-11-21 04:11:49'),
(96, 97, 950000, 950000, 17, 5.0, 1, '2025-11-21 04:11:49'),
(97, 98, 4090000, 5290000, 3975, 4.6, 7, '2025-11-21 04:11:49'),
(98, 99, 8250000, 11990000, 11, 5.0, 1, '2025-11-21 04:11:49'),
(99, 100, 3929000, 4690000, 1, 0.0, 0, '2025-11-21 04:11:49'),
(100, 101, 2369000, 3490000, NULL, 5.0, 1, '2025-11-21 04:11:49'),
(101, 102, 3879000, 5490000, 4, 5.0, 1, '2025-11-21 04:11:49'),
(102, 103, 2939000, 4290000, 7, 5.0, 3, '2025-11-21 04:11:49'),
(103, 104, 5649000, 6990000, NULL, 0.0, 0, '2025-11-21 04:11:49'),
(104, 105, 5487000, 6990000, 2, 0.0, 0, '2025-11-21 04:11:49'),
(105, 106, 3460000, 3490000, NULL, 5.0, 1, '2025-11-21 04:11:49'),
(106, 107, 3050000, 3050000, NULL, 0.0, 0, '2025-11-21 04:11:49'),
(107, 108, 8249000, 9990000, 1, 2.0, 1, '2025-11-21 04:11:49'),
(108, 109, 33790000, 33990000, NULL, 0.0, 0, '2025-11-21 04:11:49'),
(109, 110, 4960000, 4990000, NULL, 0.0, 0, '2025-11-21 04:11:49'),
(110, 111, 10890000, 10990000, NULL, 0.0, 0, '2025-11-21 04:11:49'),
(111, 112, 2099000, 2690000, NULL, 0.0, 0, '2025-11-21 04:11:49'),
(112, 113, 1849000, 2490000, 6, 0.0, 0, '2025-11-21 04:11:49'),
(113, 114, 8979000, 10990000, NULL, 5.0, 1, '2025-11-21 04:11:49'),
(114, 115, 14739000, 17990000, 2, 0.0, 0, '2025-11-21 04:11:49'),
(115, 116, 1999000, 2690000, 4, 5.0, 1, '2025-11-21 04:11:49'),
(116, 117, 5040000, 5090000, 2, 5.0, 1, '2025-11-21 04:11:49'),
(117, 118, 12190000, 12990000, 1, 0.0, 0, '2025-11-21 04:11:49'),
(118, 119, 11449000, 16990000, NULL, 0.0, 0, '2025-11-21 04:11:49'),
(119, 120, 4850000, 4890000, 4, 0.0, 0, '2025-11-21 04:11:49'),
(120, 121, 4850000, 4890000, 22, 5.0, 3, '2025-11-21 04:11:49'),
(121, 122, 3260000, 3290000, 1, 0.0, 0, '2025-11-21 04:11:49'),
(122, 123, 3169000, 3999000, 10, 3.7, 3, '2025-11-21 04:11:49'),
(123, 124, 2499000, 3290000, 2, 0.0, 0, '2025-11-21 04:11:49'),
(124, 125, 5990000, 7500000, 7, 4.0, 2, '2025-11-21 04:11:49'),
(125, 126, 1599000, 1790000, 4, 5.0, 2, '2025-11-21 04:11:49'),
(126, 127, 3690000, 3690000, 14, 4.7, 3, '2025-11-21 04:11:49'),
(127, 128, 4699000, 5690000, 66, 4.5, 25, '2025-11-21 04:11:49'),
(128, 129, 3590000, 3590000, 24, 5.0, 6, '2025-11-21 04:11:49'),
(129, 130, 7900000, 7900000, NULL, 0.0, 0, '2025-11-21 04:11:49'),
(130, 131, 3969000, 5290000, 7, 4.0, 3, '2025-11-21 04:11:49'),
(131, 132, 3679000, 4890000, 18, 4.8, 6, '2025-11-21 04:11:49'),
(132, 133, 2590000, 2590000, 1, 5.0, 1, '2025-11-21 04:11:49'),
(133, 134, 3590000, 3590000, 9, 5.0, 2, '2025-11-21 04:11:49'),
(134, 135, 2890000, 2890000, NULL, 0.0, 0, '2025-11-21 04:11:49'),
(135, 136, 850000, 850000, 74, 5.0, 18, '2025-11-21 04:11:49'),
(136, 137, 8600000, 8600000, 209, 5.0, 56, '2025-11-21 04:11:49'),
(137, 138, 3560000, 3590000, NULL, 0.0, 0, '2025-11-21 04:11:49'),
(138, 139, 2880000, 2890000, NULL, 0.0, 0, '2025-11-21 04:11:49'),
(139, 140, 5790000, 5790000, NULL, 0.0, 0, '2025-11-21 04:11:49'),
(140, 141, 2329000, 2790000, NULL, 0.0, 0, '2025-11-21 04:11:49'),
(141, 142, 2489000, 2790000, NULL, 0.0, 0, '2025-11-21 04:11:49'),
(142, 143, 10990000, 10990000, NULL, 0.0, 0, '2025-11-21 04:11:49'),
(143, 144, 2990000, 2990000, NULL, 0.0, 0, '2025-11-21 04:11:49'),
(144, 145, 2069000, 2690000, NULL, 0.0, 0, '2025-11-21 04:11:49'),
(145, 146, 2429000, 2890000, 1, 0.0, 0, '2025-11-21 04:11:49'),
(146, 147, 2489000, 3390000, 1, 0.0, 0, '2025-11-21 04:11:49'),
(147, 148, 3360000, 3390000, NULL, 0.0, 0, '2025-11-21 04:11:49'),
(148, 149, 2369000, 4690000, NULL, 0.0, 0, '2025-11-21 04:11:49'),
(149, 150, 6679000, 7990000, 1, 0.0, 0, '2025-11-21 04:11:49'),
(150, 151, 7849000, 8990000, 2, 4.5, 2, '2025-11-21 04:11:49'),
(151, 152, 2659000, 3290000, NULL, 0.0, 0, '2025-11-21 04:11:49'),
(152, 153, 4990000, 4990000, NULL, 0.0, 0, '2025-11-21 04:11:49'),
(153, 154, 3590000, 3590000, NULL, 0.0, 0, '2025-11-21 04:11:49'),
(154, 155, 509000, 629000, 3, 0.0, 0, '2025-11-21 04:11:49'),
(155, 156, 5879000, 7490000, 1, 0.0, 0, '2025-11-21 04:11:49'),
(156, 157, 2990000, 2990000, 6, 5.0, 3, '2025-11-21 04:11:49'),
(157, 158, 559000, 559000, 9, 5.0, 3, '2025-11-21 04:11:49'),
(158, 159, 599000, 650000, 2, 0.0, 0, '2025-11-21 04:11:49'),
(159, 160, 689000, 699000, 3, 5.0, 1, '2025-11-21 04:11:49'),
(160, 161, 7240000, 7290000, NULL, 0.0, 0, '2025-11-21 04:11:49'),
(161, 162, 3990000, 3990000, NULL, 0.0, 0, '2025-11-21 04:11:49'),
(162, 163, 3129000, 4490000, NULL, 0.0, 0, '2025-11-21 04:11:49'),
(163, 164, 519000, 669000, 14, 4.5, 2, '2025-11-21 04:11:49'),
(164, 165, 2619000, 3690000, 6, 5.0, 4, '2025-11-21 04:11:49'),
(165, 166, 3290000, 3290000, 9, 0.0, 0, '2025-11-21 04:11:49'),
(166, 167, 3090000, 3090000, 7, 4.0, 2, '2025-11-21 04:11:49'),
(167, 168, 2990000, 2990000, 11, 5.0, 4, '2025-11-21 04:11:49'),
(168, 169, 3990000, 3990000, NULL, 0.0, 0, '2025-11-21 04:11:49'),
(169, 170, 4990000, 4990000, 3, 5.0, 2, '2025-11-21 04:11:49'),
(170, 171, 5500000, 5500000, 47, 5.0, 20, '2025-11-21 04:11:49'),
(171, 172, 2599000, 4190000, 78, 5.0, 30, '2025-11-21 04:11:49'),
(172, 173, 629000, 769000, 7, 4.7, 3, '2025-11-21 04:11:49'),
(173, 174, 40790000, 40990000, NULL, 0.0, 0, '2025-11-21 04:11:49'),
(174, 175, 15990000, 15990000, NULL, 0.0, 0, '2025-11-21 04:11:49'),
(175, 176, 950000, 950000, NULL, 0.0, 0, '2025-11-21 04:11:49'),
(176, 177, 2790000, 2790000, 7, 0.0, 0, '2025-11-21 04:11:49'),
(177, 178, 4249000, 5290000, NULL, 0.0, 0, '2025-11-21 04:11:49'),
(178, 179, 6779000, 7990000, NULL, 0.0, 0, '2025-11-21 04:11:49'),
(179, 180, 10200000, 10300000, NULL, 0.0, 0, '2025-11-21 04:11:49'),
(180, 181, 7110000, 7160000, NULL, 0.0, 0, '2025-11-21 04:11:49'),
(181, 182, 3499000, 3990000, NULL, 0.0, 0, '2025-11-21 04:11:49'),
(182, 183, 28990000, 31990000, 26, 5.0, 3, '2025-11-21 04:11:49'),
(183, 184, 3269000, 4490000, NULL, 0.0, 0, '2025-11-21 04:11:49'),
(184, 185, 5359000, 6190000, NULL, 0.0, 0, '2025-11-21 04:11:49'),
(185, 186, 3059000, 3990000, 2, 5.0, 1, '2025-11-21 04:11:49'),
(186, 187, 2599000, 2990000, NULL, 0.0, 0, '2025-11-21 04:11:49'),
(187, 188, 499000, 699000, 1, 0.0, 0, '2025-11-21 04:11:49'),
(188, 189, 3290000, 3290000, 1, 0.0, 0, '2025-11-21 04:11:49'),
(189, 190, 3990000, 3990000, 1, 0.0, 0, '2025-11-21 04:11:49'),
(190, 191, 2859000, 4299000, NULL, 0.0, 0, '2025-11-21 04:11:49'),
(191, 192, 2799000, 3290000, NULL, 0.0, 0, '2025-11-21 04:11:49'),
(192, 193, 3049000, 3690000, NULL, 0.0, 0, '2025-11-21 04:11:49'),
(193, 194, 2939000, 3290000, NULL, 0.0, 0, '2025-11-21 04:11:49'),
(194, 195, 3239000, 3490000, 1, 0.0, 0, '2025-11-21 04:11:49'),
(195, 196, 469000, 569000, 12, 5.0, 1, '2025-11-21 04:11:49'),
(196, 197, 469000, 569000, 1, 5.0, 1, '2025-11-21 04:11:49'),
(197, 198, 4790000, 4790000, 15, 4.7, 3, '2025-11-21 04:11:49'),
(198, 199, 3990000, 3990000, 3, 5.0, 1, '2025-11-21 04:11:49'),
(199, 200, 849000, 849000, 16, 5.0, 2, '2025-11-21 04:11:49'),
(200, 201, 4990000, 4990000, 9, 4.8, 4, '2025-11-21 04:11:49'),
(201, 202, 880000, 880000, 2, 0.0, 0, '2025-11-21 04:11:49'),
(202, 203, 1150000, 1150000, 49, 4.8, 11, '2025-11-21 04:11:49'),
(203, 204, 1050000, 1050000, 56, 5.0, 7, '2025-11-21 04:11:49'),
(204, 205, 1550000, 1550000, 33, 5.0, 6, '2025-11-21 04:11:49'),
(205, 206, 2150000, 2150000, 15, 5.0, 3, '2025-11-21 04:11:49'),
(206, 207, 250000, 250000, 51, 5.0, 7, '2025-11-21 04:11:49'),
(207, 208, 1044000, 1059000, 1, 0.0, 0, '2025-11-21 04:11:49'),
(208, 209, 450000, 450000, 68, 5.0, 12, '2025-11-21 04:11:49'),
(209, 210, 2500000, 2500000, 24, 5.0, 6, '2025-11-21 04:11:49'),
(210, 211, 15230000, 15230000, NULL, 0.0, 0, '2025-11-21 04:11:49'),
(211, 212, 1050000, 1050000, NULL, 0.0, 0, '2025-11-21 04:11:49'),
(212, 213, 1650000, 1650000, NULL, 0.0, 0, '2025-11-21 04:11:49'),
(213, 214, 2550000, 2550000, 6, 4.7, 3, '2025-11-21 04:11:49'),
(214, 215, 1430000, 1430000, 4, 0.0, 0, '2025-11-21 04:11:49'),
(215, 216, 2350000, 2350000, 12, 5.0, 2, '2025-11-21 04:11:49'),
(216, 217, 334000, 369000, 315, 4.5, 25, '2025-11-21 04:11:49'),
(217, 218, 4119000, 4790000, NULL, 0.0, 0, '2025-11-21 04:11:49'),
(218, 219, 5179000, 6190000, NULL, 0.0, 0, '2025-11-21 04:11:49'),
(219, 220, 2669000, 3090000, NULL, 0.0, 0, '2025-11-21 04:11:49'),
(220, 221, 11190000, 11290000, NULL, 0.0, 0, '2025-11-21 04:11:49'),
(221, 222, 5640000, 5690000, NULL, 0.0, 0, '2025-11-21 04:11:49'),
(222, 223, 5440000, 5490000, NULL, 0.0, 0, '2025-11-21 04:11:49'),
(223, 224, 15490000, 20990000, 4, 0.0, 0, '2025-11-21 04:11:49'),
(224, 225, 16699000, 19490000, NULL, 0.0, 0, '2025-11-21 04:11:49'),
(225, 226, 3369000, 3690000, NULL, 0.0, 0, '2025-11-21 04:11:49'),
(226, 227, 8240000, 8290000, NULL, 0.0, 0, '2025-11-21 04:11:49'),
(227, 228, 3460000, 3490000, NULL, 0.0, 0, '2025-11-21 04:11:49'),
(228, 229, 3749000, 3990000, NULL, 0.0, 0, '2025-11-21 04:11:49'),
(229, 230, 4819000, 5190000, NULL, 0.0, 0, '2025-11-21 04:11:49'),
(230, 231, 3120000, 3150000, NULL, 0.0, 0, '2025-11-21 04:11:49'),
(231, 232, 4260000, 4290000, NULL, 0.0, 0, '2025-11-21 04:11:49'),
(232, 233, 24990000, 24990000, 38, 5.0, 2, '2025-11-21 04:11:49'),
(233, 234, 37990000, 37990000, 534, 5.0, 34, '2025-11-21 04:11:49'),
(234, 235, 2050000, 3150000, 12, 0.0, 0, '2025-11-21 04:11:49'),
(235, 236, 2969000, 3390000, NULL, 0.0, 0, '2025-11-21 04:11:49'),
(236, 237, 9990000, 16690000, 151, 5.0, 2, '2025-11-21 04:11:49'),
(237, 238, 5690000, 6190000, 16, 0.0, 0, '2025-11-21 04:11:49'),
(238, 239, 4509000, 5290000, NULL, 0.0, 0, '2025-11-21 04:11:49'),
(239, 240, 2599000, 3590000, NULL, 5.0, 1, '2025-11-21 04:11:49'),
(240, 241, 2699000, 3290000, 2, 5.0, 1, '2025-11-21 04:11:49'),
(241, 242, 11099000, 16990000, NULL, 0.0, 0, '2025-11-21 04:11:49'),
(242, 243, 2859000, 3990000, 2, 0.0, 0, '2025-11-21 04:11:49'),
(243, 244, 4869000, 5490000, NULL, 0.0, 0, '2025-11-21 04:11:49'),
(244, 245, 4269000, 5290000, NULL, 0.0, 0, '2025-11-21 04:11:49'),
(245, 246, 2690000, 4220000, 302, 4.3, 6, '2025-11-21 04:11:49'),
(246, 247, 22690000, 28990000, 4, 5.0, 2, '2025-11-21 04:11:49'),
(247, 248, 1890000, 2740000, 17, 0.0, 0, '2025-11-21 04:11:49'),
(248, 249, 3290000, 4290000, 296, 5.0, 1, '2025-11-21 04:11:49'),
(249, 250, 7439000, 9490000, 2, 0.0, 0, '2025-11-21 04:11:49'),
(250, 251, 4790000, 4790000, 1, 0.0, 0, '2025-11-21 04:11:49'),
(251, 252, 3990000, 3990000, 1, 0.0, 0, '2025-11-21 04:11:49'),
(252, 253, 2220000, 2220000, NULL, 0.0, 0, '2025-11-21 04:11:49'),
(253, 254, 450000, 450000, 24, 5.0, 5, '2025-11-21 04:11:49'),
(254, 255, 1200000, 1200000, NULL, 0.0, 0, '2025-11-21 04:11:49'),
(255, 256, 744000, 759000, 66, 4.5, 9, '2025-11-21 04:11:49'),
(256, 257, 50000, 50000, NULL, 0.0, 0, '2025-11-21 04:11:49'),
(257, 258, 6279000, 6990000, NULL, 0.0, 0, '2025-11-21 04:11:49'),
(258, 259, 4629000, 5490000, NULL, 0.0, 0, '2025-11-21 04:11:49'),
(259, 260, 3390000, 3390000, NULL, 0.0, 0, '2025-11-21 04:11:49'),
(260, 261, 4050000, 5190000, 10, 0.0, 0, '2025-11-21 04:11:49'),
(261, 262, 4460000, 4490000, NULL, 0.0, 0, '2025-11-21 04:11:49'),
(262, 263, 5299000, 5490000, NULL, 0.0, 0, '2025-11-21 04:11:49'),
(263, 264, 14890000, 14990000, NULL, 0.0, 0, '2025-11-21 04:11:49'),
(264, 265, 2990000, 3690000, 14, 4.5, 2, '2025-11-21 04:11:49'),
(265, 266, 4569000, 5190000, NULL, 0.0, 0, '2025-11-21 04:11:49'),
(266, 267, 34990000, 34990000, 114, 5.0, 6, '2025-11-21 04:11:49'),
(267, 268, 3260000, 3290000, NULL, 0.0, 0, '2025-11-21 04:11:49'),
(268, 269, 14290000, 16690000, 2, 0.0, 0, '2025-11-21 04:11:49'),
(269, 270, 3060000, 3090000, NULL, 0.0, 0, '2025-11-21 04:11:49'),
(270, 271, 5549000, 6190000, NULL, 0.0, 0, '2025-11-21 04:11:49'),
(271, 272, 4769000, 5190000, NULL, 0.0, 0, '2025-11-21 04:11:49'),
(272, 273, 4349000, 4790000, NULL, 0.0, 0, '2025-11-21 04:11:49'),
(273, 274, 2990000, 3390000, 3, 0.0, 0, '2025-11-21 04:11:49'),
(274, 275, 4790000, 5190000, 2, 0.0, 0, '2025-11-21 04:11:49'),
(275, 276, 3739000, 4690000, NULL, 0.0, 0, '2025-11-21 04:11:49'),
(276, 277, 3460000, 3920000, NULL, 0.0, 0, '2025-11-21 04:11:49'),
(277, 278, 2699000, 3290000, NULL, 0.0, 0, '2025-11-21 04:11:49'),
(278, 279, 3569000, 4900000, NULL, 5.0, 1, '2025-11-21 04:11:49'),
(279, 280, 2649000, 3290000, NULL, 0.0, 0, '2025-11-21 04:11:49'),
(280, 281, 3199000, 3690000, NULL, 0.0, 0, '2025-11-21 04:11:49'),
(281, 282, 3999000, 4990000, 3, 0.0, 0, '2025-11-21 04:11:49'),
(282, 283, 3290000, 5000000, 129, 5.0, 2, '2025-11-21 04:11:49'),
(283, 284, 1250000, 1690000, 5, 0.0, 0, '2025-11-21 04:11:49'),
(284, 285, 38990000, 46990000, 16, 0.0, 0, '2025-11-21 04:11:49'),
(285, 286, 4669000, 5490000, NULL, 0.0, 0, '2025-11-21 04:11:49'),
(286, 287, 5590000, 5590000, 2, 0.0, 0, '2025-11-21 04:11:49'),
(287, 288, 1050000, 1050000, 2, 0.0, 0, '2025-11-21 04:11:49'),
(288, 289, 474000, 489000, 1, 0.0, 0, '2025-11-21 04:11:49'),
(289, 1, 2190000, 2190000, 72, 4.7, 3, '2025-11-21 04:13:41'),
(290, 2, 8490000, 11990000, 9, 5.0, 1, '2025-11-21 04:13:41'),
(291, 3, 6029000, 7290000, 1, 0.0, 0, '2025-11-21 04:13:41'),
(292, 4, 5290000, 6990000, 2759, 5.0, 18, '2025-11-21 04:13:41'),
(293, 5, 2639000, 4490000, 17, 4.8, 6, '2025-11-21 04:13:41'),
(294, 6, 8490000, 9990000, 336, 5.0, 49, '2025-11-21 04:13:41'),
(295, 7, 8290000, 8290000, 9, 5.0, 3, '2025-11-21 04:13:41'),
(296, 8, 3229000, 4690000, 12, 5.0, 1, '2025-11-21 04:13:41'),
(297, 9, 645000, 645000, 7, 3.0, 2, '2025-11-21 04:13:41'),
(298, 10, 2689000, 3690000, 16, 5.0, 1, '2025-11-21 04:13:41'),
(299, 11, 4159000, 4990000, 13, 4.5, 8, '2025-11-21 04:13:41'),
(300, 12, 17590000, 22990000, 18, 5.0, 5, '2025-11-21 04:13:41'),
(301, 13, 1699000, 2190000, 7, 5.0, 2, '2025-11-21 04:13:41'),
(302, 14, 3830000, 4990000, 6480, 5.0, 64, '2025-11-21 04:13:41'),
(303, 15, 2189000, 3190000, 15, 4.8, 4, '2025-11-21 04:13:41'),
(304, 16, 3590000, 3990000, 8, 5.0, 1, '2025-11-21 04:13:41'),
(305, 17, 2799000, 3999000, 6, 5.0, 2, '2025-11-21 04:13:41'),
(306, 18, 609000, 629000, 3, 5.0, 2, '2025-11-21 04:13:41'),
(307, 19, 2529000, 3490000, 14, 5.0, 4, '2025-11-21 04:13:41'),
(308, 20, 24990000, 28990000, 242, 5.0, 42, '2025-11-21 04:13:41'),
(309, 21, 3989000, 4990000, 1, 0.0, 0, '2025-11-21 04:13:41'),
(310, 22, 299000, 299000, 28, 4.7, 3, '2025-11-21 04:13:41'),
(311, 23, 999000, 1190000, 15, 5.0, 3, '2025-11-21 04:13:41'),
(312, 24, 3099000, 3590000, 28, 5.0, 9, '2025-11-21 04:13:41'),
(313, 25, 2269000, 2990000, 13, 4.8, 4, '2025-11-21 04:13:41'),
(314, 26, 3550000, 5990000, 446, 4.8, 104, '2025-11-21 04:13:41'),
(315, 27, 3890000, 4990000, 29503, 5.0, 148, '2025-11-21 04:13:41'),
(316, 28, 3590000, 3590000, 139, 5.0, 106, '2025-11-21 04:13:41'),
(317, 29, 2429000, 3990000, 167, 4.7, 62, '2025-11-21 04:13:41'),
(318, 30, 620000, 620000, 292, 5.0, 51, '2025-11-21 04:13:41'),
(319, 31, 3590000, 3590000, 576, 5.0, 116, '2025-11-21 04:13:41'),
(320, 32, 17990000, 17990000, 706, 5.0, 166, '2025-11-21 04:13:41'),
(321, 33, 1190000, 1190000, 31, 4.8, 8, '2025-11-21 04:13:41'),
(322, 34, 1850000, 1850000, 28, 5.0, 6, '2025-11-21 04:13:41'),
(323, 35, 619000, 790000, 155, 4.2, 31, '2025-11-21 04:13:41'),
(324, 36, 688000, 688000, 53, 5.0, 14, '2025-11-21 04:13:41'),
(325, 37, 2350000, 2350000, 38, 5.0, 6, '2025-11-21 04:13:41'),
(326, 38, 320000, 320000, 988, 5.0, 139, '2025-11-21 04:13:41'),
(327, 39, 3990000, 3990000, 1583, 5.0, 409, '2025-11-21 04:13:41'),
(328, 40, 950000, 950000, 17, 5.0, 1, '2025-11-21 04:13:41'),
(329, 41, 4090000, 5290000, 3975, 4.6, 7, '2025-11-21 04:13:41'),
(330, 42, 8250000, 11990000, 11, 5.0, 1, '2025-11-21 04:13:41'),
(331, 43, 3929000, 4690000, 1, 0.0, 0, '2025-11-21 04:13:41'),
(332, 44, 2369000, 3490000, NULL, 5.0, 1, '2025-11-21 04:13:41'),
(333, 45, 3879000, 5490000, 4, 5.0, 1, '2025-11-21 04:13:41'),
(334, 46, 2939000, 4290000, 7, 5.0, 3, '2025-11-21 04:13:41'),
(335, 47, 5649000, 6990000, NULL, 0.0, 0, '2025-11-21 04:13:41'),
(336, 48, 5487000, 6990000, 2, 0.0, 0, '2025-11-21 04:13:41'),
(337, 49, 3460000, 3490000, NULL, 5.0, 1, '2025-11-21 04:13:41'),
(338, 50, 3050000, 3050000, NULL, 0.0, 0, '2025-11-21 04:13:41'),
(339, 51, 8249000, 9990000, 1, 2.0, 1, '2025-11-21 04:13:41'),
(340, 52, 33790000, 33990000, NULL, 0.0, 0, '2025-11-21 04:13:41'),
(341, 53, 4960000, 4990000, NULL, 0.0, 0, '2025-11-21 04:13:41'),
(342, 54, 10890000, 10990000, NULL, 0.0, 0, '2025-11-21 04:13:41'),
(343, 55, 2099000, 2690000, NULL, 0.0, 0, '2025-11-21 04:13:41'),
(344, 56, 1849000, 2490000, 6, 0.0, 0, '2025-11-21 04:13:41'),
(345, 57, 8979000, 10990000, NULL, 5.0, 1, '2025-11-21 04:13:41'),
(346, 58, 14739000, 17990000, 2, 0.0, 0, '2025-11-21 04:13:41'),
(347, 59, 1999000, 2690000, 4, 5.0, 1, '2025-11-21 04:13:41'),
(348, 60, 5040000, 5090000, 2, 5.0, 1, '2025-11-21 04:13:41'),
(349, 61, 12190000, 12990000, 1, 0.0, 0, '2025-11-21 04:13:41'),
(350, 62, 11449000, 16990000, NULL, 0.0, 0, '2025-11-21 04:13:41'),
(351, 63, 4850000, 4890000, 4, 0.0, 0, '2025-11-21 04:13:41'),
(352, 64, 4850000, 4890000, 22, 5.0, 3, '2025-11-21 04:13:41'),
(353, 65, 3260000, 3290000, 1, 0.0, 0, '2025-11-21 04:13:41'),
(354, 66, 3169000, 3999000, 10, 3.7, 3, '2025-11-21 04:13:41'),
(355, 67, 2499000, 3290000, 2, 0.0, 0, '2025-11-21 04:13:41'),
(356, 68, 5990000, 7500000, 7, 4.0, 2, '2025-11-21 04:13:41'),
(357, 69, 1599000, 1790000, 4, 5.0, 2, '2025-11-21 04:13:41'),
(358, 70, 3690000, 3690000, 14, 4.7, 3, '2025-11-21 04:13:41'),
(359, 71, 4699000, 5690000, 66, 4.5, 25, '2025-11-21 04:13:41'),
(360, 72, 3590000, 3590000, 24, 5.0, 6, '2025-11-21 04:13:41'),
(361, 73, 7900000, 7900000, NULL, 0.0, 0, '2025-11-21 04:13:41'),
(362, 74, 3969000, 5290000, 7, 4.0, 3, '2025-11-21 04:13:41'),
(363, 75, 3679000, 4890000, 18, 4.8, 6, '2025-11-21 04:13:41'),
(364, 76, 2590000, 2590000, 1, 5.0, 1, '2025-11-21 04:13:41'),
(365, 77, 3590000, 3590000, 9, 5.0, 2, '2025-11-21 04:13:41'),
(366, 78, 2890000, 2890000, NULL, 0.0, 0, '2025-11-21 04:13:41'),
(367, 79, 850000, 850000, 74, 5.0, 18, '2025-11-21 04:13:41'),
(368, 80, 8600000, 8600000, 209, 5.0, 56, '2025-11-21 04:13:41'),
(369, 81, 3560000, 3590000, NULL, 0.0, 0, '2025-11-21 04:13:41'),
(370, 82, 2880000, 2890000, NULL, 0.0, 0, '2025-11-21 04:13:41'),
(371, 83, 5790000, 5790000, NULL, 0.0, 0, '2025-11-21 04:13:41'),
(372, 84, 2329000, 2790000, NULL, 0.0, 0, '2025-11-21 04:13:41'),
(373, 85, 2489000, 2790000, NULL, 0.0, 0, '2025-11-21 04:13:41'),
(374, 86, 10990000, 10990000, NULL, 0.0, 0, '2025-11-21 04:13:41'),
(375, 87, 2990000, 2990000, NULL, 0.0, 0, '2025-11-21 04:13:41'),
(376, 88, 2069000, 2690000, NULL, 0.0, 0, '2025-11-21 04:13:41'),
(377, 89, 2429000, 2890000, 1, 0.0, 0, '2025-11-21 04:13:41'),
(378, 90, 2489000, 3390000, 1, 0.0, 0, '2025-11-21 04:13:41'),
(379, 91, 3360000, 3390000, NULL, 0.0, 0, '2025-11-21 04:13:41'),
(380, 92, 2369000, 4690000, NULL, 0.0, 0, '2025-11-21 04:13:41'),
(381, 93, 6679000, 7990000, 1, 0.0, 0, '2025-11-21 04:13:41'),
(382, 94, 7849000, 8990000, 2, 4.5, 2, '2025-11-21 04:13:41'),
(383, 95, 2659000, 3290000, NULL, 0.0, 0, '2025-11-21 04:13:41'),
(384, 96, 4990000, 4990000, NULL, 0.0, 0, '2025-11-21 04:13:41'),
(385, 97, 3590000, 3590000, NULL, 0.0, 0, '2025-11-21 04:13:41'),
(386, 98, 509000, 629000, 3, 0.0, 0, '2025-11-21 04:13:41'),
(387, 99, 5879000, 7490000, 1, 0.0, 0, '2025-11-21 04:13:41'),
(388, 100, 2990000, 2990000, 6, 5.0, 3, '2025-11-21 04:13:41'),
(389, 101, 559000, 559000, 9, 5.0, 3, '2025-11-21 04:13:41'),
(390, 102, 599000, 650000, 2, 0.0, 0, '2025-11-21 04:13:41'),
(391, 103, 689000, 699000, 3, 5.0, 1, '2025-11-21 04:13:41'),
(392, 104, 7240000, 7290000, NULL, 0.0, 0, '2025-11-21 04:13:41'),
(393, 105, 3990000, 3990000, NULL, 0.0, 0, '2025-11-21 04:13:41'),
(394, 106, 3129000, 4490000, NULL, 0.0, 0, '2025-11-21 04:13:41'),
(395, 107, 519000, 669000, 14, 4.5, 2, '2025-11-21 04:13:41'),
(396, 108, 2619000, 3690000, 6, 5.0, 4, '2025-11-21 04:13:41'),
(397, 109, 3290000, 3290000, 9, 0.0, 0, '2025-11-21 04:13:41'),
(398, 110, 3090000, 3090000, 7, 4.0, 2, '2025-11-21 04:13:41'),
(399, 111, 2990000, 2990000, 11, 5.0, 4, '2025-11-21 04:13:41'),
(400, 112, 3990000, 3990000, NULL, 0.0, 0, '2025-11-21 04:13:41'),
(401, 113, 4990000, 4990000, 3, 5.0, 2, '2025-11-21 04:13:41'),
(402, 114, 5500000, 5500000, 47, 5.0, 20, '2025-11-21 04:13:41'),
(403, 115, 2599000, 4190000, 78, 5.0, 30, '2025-11-21 04:13:41'),
(404, 116, 629000, 769000, 7, 4.7, 3, '2025-11-21 04:13:41'),
(405, 117, 40790000, 40990000, NULL, 0.0, 0, '2025-11-21 04:13:41'),
(406, 118, 15990000, 15990000, NULL, 0.0, 0, '2025-11-21 04:13:41'),
(407, 119, 950000, 950000, NULL, 0.0, 0, '2025-11-21 04:13:41'),
(408, 120, 2790000, 2790000, 7, 0.0, 0, '2025-11-21 04:13:41'),
(409, 121, 4249000, 5290000, NULL, 0.0, 0, '2025-11-21 04:13:41'),
(410, 122, 6779000, 7990000, NULL, 0.0, 0, '2025-11-21 04:13:41'),
(411, 123, 10200000, 10300000, NULL, 0.0, 0, '2025-11-21 04:13:41'),
(412, 124, 7110000, 7160000, NULL, 0.0, 0, '2025-11-21 04:13:41'),
(413, 125, 3499000, 3990000, NULL, 0.0, 0, '2025-11-21 04:13:41'),
(414, 126, 28990000, 31990000, 26, 5.0, 3, '2025-11-21 04:13:41'),
(415, 127, 3269000, 4490000, NULL, 0.0, 0, '2025-11-21 04:13:41'),
(416, 128, 5359000, 6190000, NULL, 0.0, 0, '2025-11-21 04:13:41'),
(417, 129, 3059000, 3990000, 2, 5.0, 1, '2025-11-21 04:13:41'),
(418, 130, 2599000, 2990000, NULL, 0.0, 0, '2025-11-21 04:13:41'),
(419, 131, 499000, 699000, 1, 0.0, 0, '2025-11-21 04:13:41'),
(420, 132, 3290000, 3290000, 1, 0.0, 0, '2025-11-21 04:13:41'),
(421, 133, 3990000, 3990000, 1, 0.0, 0, '2025-11-21 04:13:41'),
(422, 134, 2859000, 4299000, NULL, 0.0, 0, '2025-11-21 04:13:41'),
(423, 135, 2799000, 3290000, NULL, 0.0, 0, '2025-11-21 04:13:41'),
(424, 136, 3049000, 3690000, NULL, 0.0, 0, '2025-11-21 04:13:41'),
(425, 137, 2939000, 3290000, NULL, 0.0, 0, '2025-11-21 04:13:41'),
(426, 138, 3239000, 3490000, 1, 0.0, 0, '2025-11-21 04:13:41'),
(427, 139, 469000, 569000, 12, 5.0, 1, '2025-11-21 04:13:41'),
(428, 140, 469000, 569000, 1, 5.0, 1, '2025-11-21 04:13:41'),
(429, 141, 4790000, 4790000, 15, 4.7, 3, '2025-11-21 04:13:41'),
(430, 142, 3990000, 3990000, 3, 5.0, 1, '2025-11-21 04:13:41'),
(431, 143, 849000, 849000, 16, 5.0, 2, '2025-11-21 04:13:41'),
(432, 144, 4990000, 4990000, 9, 4.8, 4, '2025-11-21 04:13:41'),
(433, 145, 880000, 880000, 2, 0.0, 0, '2025-11-21 04:13:41'),
(434, 146, 1150000, 1150000, 49, 4.8, 11, '2025-11-21 04:13:41'),
(435, 147, 1050000, 1050000, 56, 5.0, 7, '2025-11-21 04:13:41'),
(436, 148, 1550000, 1550000, 33, 5.0, 6, '2025-11-21 04:13:41'),
(437, 149, 2150000, 2150000, 15, 5.0, 3, '2025-11-21 04:13:41'),
(438, 150, 250000, 250000, 51, 5.0, 7, '2025-11-21 04:13:41'),
(439, 151, 1044000, 1059000, 1, 0.0, 0, '2025-11-21 04:13:41'),
(440, 152, 450000, 450000, 68, 5.0, 12, '2025-11-21 04:13:41'),
(441, 153, 2500000, 2500000, 24, 5.0, 6, '2025-11-21 04:13:41'),
(442, 154, 15230000, 15230000, NULL, 0.0, 0, '2025-11-21 04:13:41'),
(443, 155, 1050000, 1050000, NULL, 0.0, 0, '2025-11-21 04:13:41'),
(444, 156, 1650000, 1650000, NULL, 0.0, 0, '2025-11-21 04:13:42'),
(445, 157, 2550000, 2550000, 6, 4.7, 3, '2025-11-21 04:13:42'),
(446, 158, 1430000, 1430000, 4, 0.0, 0, '2025-11-21 04:13:42'),
(447, 159, 2350000, 2350000, 12, 5.0, 2, '2025-11-21 04:13:42'),
(448, 160, 334000, 369000, 315, 4.5, 25, '2025-11-21 04:13:42'),
(449, 161, 4119000, 4790000, NULL, 0.0, 0, '2025-11-21 04:13:42'),
(450, 162, 5179000, 6190000, NULL, 0.0, 0, '2025-11-21 04:13:42'),
(451, 163, 2669000, 3090000, NULL, 0.0, 0, '2025-11-21 04:13:42'),
(452, 164, 11190000, 11290000, NULL, 0.0, 0, '2025-11-21 04:13:42'),
(453, 165, 5640000, 5690000, NULL, 0.0, 0, '2025-11-21 04:13:42'),
(454, 166, 5440000, 5490000, NULL, 0.0, 0, '2025-11-21 04:13:42'),
(455, 167, 15490000, 20990000, 4, 0.0, 0, '2025-11-21 04:13:42'),
(456, 168, 16699000, 19490000, NULL, 0.0, 0, '2025-11-21 04:13:42'),
(457, 169, 3369000, 3690000, NULL, 0.0, 0, '2025-11-21 04:13:42'),
(458, 170, 8240000, 8290000, NULL, 0.0, 0, '2025-11-21 04:13:42'),
(459, 171, 3460000, 3490000, NULL, 0.0, 0, '2025-11-21 04:13:42'),
(460, 172, 3749000, 3990000, NULL, 0.0, 0, '2025-11-21 04:13:42'),
(461, 173, 4819000, 5190000, NULL, 0.0, 0, '2025-11-21 04:13:42'),
(462, 174, 3120000, 3150000, NULL, 0.0, 0, '2025-11-21 04:13:42'),
(463, 175, 4260000, 4290000, NULL, 0.0, 0, '2025-11-21 04:13:42'),
(464, 176, 24990000, 24990000, 38, 5.0, 2, '2025-11-21 04:13:42'),
(465, 177, 37990000, 37990000, 534, 5.0, 34, '2025-11-21 04:13:42'),
(466, 178, 2050000, 3150000, 12, 0.0, 0, '2025-11-21 04:13:42'),
(467, 179, 2969000, 3390000, NULL, 0.0, 0, '2025-11-21 04:13:42'),
(468, 180, 9990000, 16690000, 151, 5.0, 2, '2025-11-21 04:13:42'),
(469, 181, 5690000, 6190000, 16, 0.0, 0, '2025-11-21 04:13:42'),
(470, 182, 4509000, 5290000, NULL, 0.0, 0, '2025-11-21 04:13:42'),
(471, 183, 2599000, 3590000, NULL, 5.0, 1, '2025-11-21 04:13:42'),
(472, 184, 2699000, 3290000, 2, 5.0, 1, '2025-11-21 04:13:42'),
(473, 185, 11099000, 16990000, NULL, 0.0, 0, '2025-11-21 04:13:42'),
(474, 186, 2859000, 3990000, 2, 0.0, 0, '2025-11-21 04:13:42'),
(475, 187, 4869000, 5490000, NULL, 0.0, 0, '2025-11-21 04:13:42'),
(476, 188, 4269000, 5290000, NULL, 0.0, 0, '2025-11-21 04:13:42'),
(477, 189, 2690000, 4220000, 302, 4.3, 6, '2025-11-21 04:13:42'),
(478, 190, 22690000, 28990000, 4, 5.0, 2, '2025-11-21 04:13:42'),
(479, 191, 1890000, 2740000, 17, 0.0, 0, '2025-11-21 04:13:42'),
(480, 192, 3290000, 4290000, 296, 5.0, 1, '2025-11-21 04:13:42'),
(481, 193, 7439000, 9490000, 2, 0.0, 0, '2025-11-21 04:13:42'),
(482, 194, 4790000, 4790000, 1, 0.0, 0, '2025-11-21 04:13:42'),
(483, 195, 3990000, 3990000, 1, 0.0, 0, '2025-11-21 04:13:42'),
(484, 196, 2220000, 2220000, NULL, 0.0, 0, '2025-11-21 04:13:42'),
(485, 197, 450000, 450000, 24, 5.0, 5, '2025-11-21 04:13:42'),
(486, 198, 1200000, 1200000, NULL, 0.0, 0, '2025-11-21 04:13:42'),
(487, 199, 744000, 759000, 66, 4.5, 9, '2025-11-21 04:13:42'),
(488, 200, 50000, 50000, NULL, 0.0, 0, '2025-11-21 04:13:42'),
(489, 201, 6279000, 6990000, NULL, 0.0, 0, '2025-11-21 04:13:42'),
(490, 202, 4629000, 5490000, NULL, 0.0, 0, '2025-11-21 04:13:42'),
(491, 203, 3390000, 3390000, NULL, 0.0, 0, '2025-11-21 04:13:42'),
(492, 204, 4050000, 5190000, 10, 0.0, 0, '2025-11-21 04:13:42'),
(493, 205, 4460000, 4490000, NULL, 0.0, 0, '2025-11-21 04:13:42'),
(494, 206, 5299000, 5490000, NULL, 0.0, 0, '2025-11-21 04:13:42'),
(495, 207, 14890000, 14990000, NULL, 0.0, 0, '2025-11-21 04:13:42'),
(496, 208, 2990000, 3690000, 14, 4.5, 2, '2025-11-21 04:13:42'),
(497, 209, 4569000, 5190000, NULL, 0.0, 0, '2025-11-21 04:13:42'),
(498, 210, 34990000, 34990000, 114, 5.0, 6, '2025-11-21 04:13:42'),
(499, 211, 3260000, 3290000, NULL, 0.0, 0, '2025-11-21 04:13:42'),
(500, 212, 14290000, 16690000, 2, 0.0, 0, '2025-11-21 04:13:42'),
(501, 213, 3060000, 3090000, NULL, 0.0, 0, '2025-11-21 04:13:42'),
(502, 214, 5549000, 6190000, NULL, 0.0, 0, '2025-11-21 04:13:42'),
(503, 215, 4769000, 5190000, NULL, 0.0, 0, '2025-11-21 04:13:42'),
(504, 216, 4349000, 4790000, NULL, 0.0, 0, '2025-11-21 04:13:42'),
(505, 217, 2990000, 3390000, 3, 0.0, 0, '2025-11-21 04:13:42'),
(506, 218, 4790000, 5190000, 2, 0.0, 0, '2025-11-21 04:13:42'),
(507, 219, 3739000, 4690000, NULL, 0.0, 0, '2025-11-21 04:13:42'),
(508, 220, 3460000, 3920000, NULL, 0.0, 0, '2025-11-21 04:13:42'),
(509, 221, 2699000, 3290000, NULL, 0.0, 0, '2025-11-21 04:13:42'),
(510, 222, 3569000, 4900000, NULL, 5.0, 1, '2025-11-21 04:13:42'),
(511, 223, 2649000, 3290000, NULL, 0.0, 0, '2025-11-21 04:13:42'),
(512, 224, 3199000, 3690000, NULL, 0.0, 0, '2025-11-21 04:13:42'),
(513, 225, 3999000, 4990000, 3, 0.0, 0, '2025-11-21 04:13:42'),
(514, 226, 3290000, 5000000, 129, 5.0, 2, '2025-11-21 04:13:42'),
(515, 227, 1250000, 1690000, 5, 0.0, 0, '2025-11-21 04:13:42'),
(516, 228, 38990000, 46990000, 16, 0.0, 0, '2025-11-21 04:13:42'),
(517, 229, 4669000, 5490000, NULL, 0.0, 0, '2025-11-21 04:13:42'),
(518, 230, 5590000, 5590000, 2, 0.0, 0, '2025-11-21 04:13:42'),
(519, 231, 1050000, 1050000, 2, 0.0, 0, '2025-11-21 04:13:42'),
(520, 232, 474000, 489000, 1, 0.0, 0, '2025-11-21 04:13:42'),
(521, 233, 899000, 2090000, NULL, NULL, NULL, '2025-11-21 04:14:00'),
(522, 234, 899000, 1850000, NULL, NULL, NULL, '2025-11-21 04:14:00'),
(523, 235, 960000, 1920000, NULL, NULL, NULL, '2025-11-21 04:14:00'),
(524, 236, 760000, 1850000, NULL, NULL, NULL, '2025-11-21 04:14:00'),
(525, 237, 1299000, 2540000, NULL, NULL, NULL, '2025-11-21 04:14:00'),
(526, 238, 1090000, 2090000, NULL, NULL, NULL, '2025-11-21 04:14:00'),
(527, 239, 1199000, 2340000, NULL, NULL, NULL, '2025-11-21 04:14:00'),
(528, 240, 1599000, 3040000, NULL, NULL, NULL, '2025-11-21 04:14:00'),
(529, 241, 999000, 1950000, NULL, NULL, NULL, '2025-11-21 04:14:00'),
(530, 242, 1780000, 3200000, NULL, NULL, NULL, '2025-11-21 04:14:00'),
(531, 243, 1100000, 2000000, NULL, NULL, NULL, '2025-11-21 04:14:00'),
(532, 244, 899000, 1800000, NULL, NULL, NULL, '2025-11-21 04:14:00'),
(533, 245, 1900000, 3300000, NULL, NULL, NULL, '2025-11-21 04:14:00'),
(534, 246, 500000, 760000, NULL, NULL, NULL, '2025-11-21 04:14:00');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `username` varchar(50) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Chỉ mục cho các bảng đã đổ
--

--
-- Chỉ mục cho bảng `admins`
--
ALTER TABLE `admins`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`);

--
-- Chỉ mục cho bảng `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`),
  ADD KEY `parent_id` (`parent_id`);

--
-- Chỉ mục cho bảng `platforms`
--
ALTER TABLE `platforms`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `uq_platform_code` (`code`);

--
-- Chỉ mục cho bảng `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `uq_product_unique` (`platform_id`,`product_url`(200)),
  ADD KEY `category_id` (`category_id`);

--
-- Chỉ mục cho bảng `product_snapshots`
--
ALTER TABLE `product_snapshots`
  ADD PRIMARY KEY (`id`),
  ADD KEY `product_id` (`product_id`);

--
-- Chỉ mục cho bảng `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`);

--
-- AUTO_INCREMENT cho các bảng đã đổ
--

--
-- AUTO_INCREMENT cho bảng `admins`
--
ALTER TABLE `admins`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT cho bảng `categories`
--
ALTER TABLE `categories`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `platforms`
--
ALTER TABLE `platforms`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT cho bảng `products`
--
ALTER TABLE `products`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=247;

--
-- AUTO_INCREMENT cho bảng `product_snapshots`
--
ALTER TABLE `product_snapshots`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=535;

--
-- AUTO_INCREMENT cho bảng `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- Các ràng buộc cho các bảng đã đổ
--

--
-- Các ràng buộc cho bảng `categories`
--
ALTER TABLE `categories`
  ADD CONSTRAINT `categories_ibfk_1` FOREIGN KEY (`parent_id`) REFERENCES `categories` (`id`) ON DELETE SET NULL;

--
-- Các ràng buộc cho bảng `products`
--
ALTER TABLE `products`
  ADD CONSTRAINT `products_ibfk_1` FOREIGN KEY (`platform_id`) REFERENCES `platforms` (`id`),
  ADD CONSTRAINT `products_ibfk_2` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`);

--
-- Các ràng buộc cho bảng `product_snapshots`
--
ALTER TABLE `product_snapshots`
  ADD CONSTRAINT `product_snapshots_ibfk_1` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
