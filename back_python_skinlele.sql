-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Máy chủ: 127.0.0.1
-- Thời gian đã tạo: Th12 20, 2023 lúc 01:42 PM
-- Phiên bản máy phục vụ: 10.4.28-MariaDB
-- Phiên bản PHP: 8.0.28

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Cơ sở dữ liệu: `back_python_skinlele`
--

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `brands`
--

CREATE TABLE `brands` (
  `id` int(11) NOT NULL,
  `name` varchar(250) DEFAULT NULL,
  `createdAt` datetime DEFAULT NULL,
  `updatedAt` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `brands`
--

INSERT INTO `brands` (`id`, `name`, `createdAt`, `updatedAt`) VALUES
(1, 'Maybelline', '2023-12-20 10:50:14', '2023-12-20 10:50:14'),
(2, 'Innisfree', '2023-12-20 10:50:14', '2023-12-20 10:50:14'),
(3, 'Lylybyred', '2023-12-20 10:50:41', '2023-12-20 10:50:41'),
(4, 'Merzy', '2023-12-20 10:50:41', '2023-12-20 10:50:41'),
(5, 'Romand', '2023-12-20 10:51:08', '2023-12-20 10:51:08'),
(6, 'Simple', '2023-12-20 10:51:08', '2023-12-20 10:51:08'),
(7, 'Cosrx', '2023-12-20 10:51:36', '2023-12-20 10:51:36'),
(8, 'La Roche Posay', '2023-12-20 10:51:36', '2023-12-20 10:51:36'),
(9, 'Bioderma', '2023-12-20 10:51:56', '2023-12-20 10:51:56'),
(10, 'Cetaphil', '2023-12-20 10:51:56', '2023-12-20 10:51:56'),
(11, 'L\'oreal', '2023-12-20 10:52:21', '2023-12-20 10:52:21');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `categories`
--

CREATE TABLE `categories` (
  `id` int(11) NOT NULL,
  `name` varchar(250) DEFAULT NULL,
  `category_parent_id` int(11) DEFAULT NULL,
  `createdAt` datetime DEFAULT NULL,
  `updatedAt` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `categories`
--

INSERT INTO `categories` (`id`, `name`, `category_parent_id`, `createdAt`, `updatedAt`) VALUES
(1, 'Sữa Rửa Măt', 1, '2023-11-01 22:52:47', '2023-11-01 22:52:47'),
(2, 'Kem Chống Nắng', 1, '2023-11-01 22:52:47', '2023-11-01 22:52:47'),
(3, 'Serum', 1, '2023-11-01 22:53:24', '2023-11-01 22:53:24'),
(4, 'Kem Dưỡng', 1, '2023-11-01 22:53:24', '2023-11-01 22:53:24'),
(5, 'Tẩy Trang', 1, '2023-11-01 22:54:14', '2023-11-01 22:54:14'),
(6, 'Mắt', 2, '2023-11-01 22:54:41', '2023-11-01 22:54:41'),
(7, 'Mặt', 2, '2023-11-01 22:54:41', '2023-11-01 22:54:41'),
(8, 'Môi', 2, '2023-11-01 22:55:06', '2023-11-01 22:55:06');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `category_parents`
--

CREATE TABLE `category_parents` (
  `id` int(11) NOT NULL,
  `name` varchar(250) DEFAULT NULL,
  `createdAt` datetime DEFAULT NULL,
  `updatedAt` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `category_parents`
--

INSERT INTO `category_parents` (`id`, `name`, `createdAt`, `updatedAt`) VALUES
(1, 'Chăm Sóc Da', '2023-11-01 22:52:01', '2023-11-01 22:52:01'),
(2, 'Trang Điểm', '2023-11-01 22:52:01', '2023-11-01 22:52:01');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `orders`
--

CREATE TABLE `orders` (
  `id` int(11) NOT NULL,
  `payment` varchar(250) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `name` varchar(250) DEFAULT NULL,
  `address` varchar(250) DEFAULT NULL,
  `phone` varchar(250) DEFAULT NULL,
  `total` float DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `createdAt` datetime DEFAULT NULL,
  `updatedAt` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `order_products`
--

CREATE TABLE `order_products` (
  `id` int(11) NOT NULL,
  `order_id` int(11) DEFAULT NULL,
  `product_id` int(11) DEFAULT NULL,
  `quantity` int(11) DEFAULT NULL,
  `createdAt` datetime DEFAULT NULL,
  `updatedAt` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `products`
--

CREATE TABLE `products` (
  `id` int(11) NOT NULL,
  `name` varchar(250) DEFAULT NULL,
  `image` varchar(250) DEFAULT NULL,
  `price` float DEFAULT NULL,
  `description` varchar(250) DEFAULT NULL,
  `quantity` int(11) DEFAULT NULL,
  `sale` int(11) DEFAULT NULL,
  `manufacture` datetime DEFAULT NULL,
  `expiry` float DEFAULT NULL,
  `category_id` int(11) DEFAULT NULL,
  `brand_id` int(11) DEFAULT NULL,
  `createdAt` datetime DEFAULT NULL,
  `updatedAt` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `products`
--

INSERT INTO `products` (`id`, `name`, `image`, `price`, `description`, `quantity`, `sale`, `manufacture`, `expiry`, `category_id`, `brand_id`, `createdAt`, `updatedAt`) VALUES
(1, 'Sữa Rửa Mặt Dưỡng Ẩm Tối Ưu Hada Labo Advanced Nourish Hyaluronic Acid Cleanser 80g', '/images/products/srm1.png', 90000, 'Sữa Rửa Mặt Dưỡng Ẩm Tối Ưu Hada Labo Advanced Nourish Hyaluronic Acid Cleanser là sữa rửa mặt thuộc thương hiệu Hada Labo với lớp bọt mịn nhẹ nhàng rửa sạch lớp tế bào chết, bụi bẫn, bã nhờn ẩn sâu trong lỗ chân lông cùng với hệ dưỡng ẩm sâu HA, SHA', 10, 30, '2021-11-20 00:00:00', 3, 1, NULL, '2023-10-21 15:12:31', '2023-11-25 00:46:14'),
(2, 'Sữa Rửa Mặt Dịu Nhẹ, Dành Cho Da Nhạy Cảm Simple Kind To Skin Refreshing Facial Wash 150ml', '/images/products/srm2.png', 100000, 'Sữa Rửa Mặt Dịu Nhẹ, Dành Cho Da Nhạy Cảm Simple Kind To Skin Refreshing Facial Wash 150ml là sữa rửa mặt thuộc thương hiệu Simple với kết cấu gel 100% không chứa xà phòng nhẹ nhàng làm sạch da, lấy đi bụi bẩn cùng bã nhờn dư thừa mà không gây kích ứ', 10, 30, '2021-11-20 00:00:00', 3, 1, 6, '2023-10-21 15:14:02', '2023-11-24 15:32:39'),
(3, 'Gel Rửa Mặt Không Chứa Xà Phòng Kiềm Dầu, Ngừa Mụn Cho Da Nhạy Cảm Simple Purifying Gel Wash 150ml', '/images/products/srm3.png', 119000, 'Gel Rửa Mặt Không Chứa Xà Phòng Kiềm Dầu, Ngừa Mụn Cho Da Nhạy Cảm Simple Purifying Gel Wash 150ml là gel rửa mặt có công thức giải độc từ hỗn hộp cỏ xạ hương, kẽm và nước cây phỉ giúp làm sạch sâu bụi bẩn, dầu thừa và cặn trang điểm mà vẫn êm dịu, k', 10, 20, '2021-11-20 00:00:00', 3, 1, 6, '2023-10-21 15:14:42', '2023-10-21 15:14:42'),
(4, 'Sữa Rửa Mặt Lành Tính, Dịu Nhẹ Không Xà Phòng Cetaphil Gentle Skin Cleanser', '/images/products/srm4.png', 139000, 'Sữa Rửa Mặt Cetaphil Gentle Skin Cleanser là sữa rửa mặt với công thức lành tính giúp làm sạch bụi bẩn một cách nhẹ nhàng. Bên cạnh đó, Cetaphil Skin Cleanser còn không gây bít tắc lỗ chân lông, có khả năng duy trì độ ẩm tự nhiên và phù hợp với mọi l', 10, 20, '2021-11-20 00:00:00', 3, 1, 10, '2023-10-21 15:15:55', '2023-10-21 15:15:55'),
(5, 'Gel Rửa Mặt Dành Cho Da Khô, Viêm Da Cơ Địa Bioderma Atoderm Intensive Gel Moussant', '/images/products/srm5.png', 339000, 'Gel Rửa Mặt Bioderma Atoderm Intensive Gel Moussant là dòng sản phẩm làm sạch đến từ thương hiệu dược mỹ phẩm Bioderma, sản phẩm có chức năng nhẹ nhàng làm sạch da, xoa dịu cảm giác khó chịu và làm dịu cơn ngứa của da khô, da dị ứng, kích ứng. Với Vi', 10, 20, '2021-11-20 00:00:00', 3, 1, 9, '2023-10-21 15:16:36', '2023-10-21 15:16:36'),
(6, '[30ml - 95ml] Nước Tẩy Trang Làm Sạch Tươi Mát 3 In 1 Cho Da Dầu L\'Oreal Micellar Water Refreshing Even For Sensitive Skin', '/images/products/tt1.png', 339000, 'Nước Tẩy Trang Làm Sạch Tươi Mát 3 In 1 Cho Da Dầu L\'Oreal Micellar Water Refreshing Even For Sensitive Skin là  nước tẩy trang mang đến các bước tẩy trang, làm sạch, giữ ẩm và dưỡng mềm da đồng thời chỉ trong một sản phẩm. Sản phẩm giúp lấy đi sạch ', 10, 20, '2021-11-20 00:00:00', 3, 5, 11, '2023-10-21 15:17:41', '2023-10-21 15:17:41'),
(7, 'Nước Tẩy Trang Làm Sạch Cho Da Dầu L\'oreal Revitalift Crystal Purifying Micellar Water', '/images/products/tt2.png', 190000, 'Nước Tẩy Trang Làm Sạch Cho Da Dầu L\'oreal Revitalift Crystal Purifying Micellar Water là nước tẩy trang sản phẩm dành cho da dầu với công dụng hỗ trợ làm sạch sâu lỗ chân lông, nhẹ nhàng chăm sóc làn da, góp phần lấy đi các tạp chất nhỏ nhất, bã nhờ', 10, 20, '2021-11-20 00:00:00', 3, 5, 11, '2023-10-21 15:19:08', '2023-10-21 15:19:08'),
(8, 'Nước Tẩy Trang Than Hoạt Tính Cho Da Dầu Byphasse Solution Micellaire Charbon Actif 500ml', '/images/products/tt3.png', 109000, 'Nước Tẩy Trang Than Hoạt Tính Cho Da Dầu Byphasse Solution Micellaire Charbon Actif 500ml là nước tẩy trang dành cho da hỗn hợp và da dầu được điều chế dưới công nghệ Micellar kết hợp cùng than tre hoạt tính, giúp tăng cường khả năng làm sạch da tối ', 10, 20, '2021-11-20 00:00:00', 3, 5, NULL, '2023-10-21 15:19:43', '2023-10-21 15:19:43'),
(9, 'Nước Tẩy Trang Hoàn Hảo Sạch Nhờn Và Dưỡng Ẩm Bioré Make Up Remover Perfect Cleansing Water', '/images/products/tt4.png', 189000, 'Nước Tẩy Trang Bioré Sạch Nhờn, Dưỡng Ẩm là nước tẩy trang với công nghệ dưỡng sáng da Micellar giúp làm sạch, hút sạch lớp trang điểm và bã nhờn lỗ chân lông, nhẹ nhàng lấy đi tế bào chết và ngăn ngừa mụn hiệu quả thuộc thương hiệu Bioré đến từ tập ', 10, 0, NULL, 0, 5, 9, '2023-10-21 15:20:30', '2023-10-21 15:20:30'),
(10, 'Nước Tẩy Trang Dành Cho Da Nhạy Cảm La Roche-Posay Micellar Water Ultra Sensitive Skin', '/images/products/tt5.png', 396000, 'La Roche-Posay Micellar Water Ultra Sensitive Skin là nước tẩy trang thuộc thương hiệu dược mỹ phẩm La Roche-Posay với công nghệ cải tiến Glyco Micellar mang lại hiệu quả làm sạch sâu vượt trội, giúp lấy đi bụi bẩn, bã nhờn và lớp trang điểm', 10, 0, NULL, 0, 5, 8, '2023-10-21 15:21:15', '2023-10-21 15:21:15'),
(11, 'Serum L\'Oreal Tinh Chất Cấp Ẩm, Cải Thiện Nếp Nhăn L\'Oreal Revitalift 1.5% Hyaluronic Acid Serum', '/images/products/serum1.png', 359000, 'Serum L\'Oreal Tinh Chất Dưỡng L\'Oreal Cấp Ẩm, Cải Thiện Nếp Nhăn là tinh chất dưỡng thuộc thương hiệu L\'Oreal với hàm lượng 1.5% thành phần Hyaluronic Acid có tác dụng bổ sung độ ẩm ngay lập tức và giảm nếp nhăn rõ rệt trong 2 tuần cho làn da trông t', 10, 0, NULL, 0, 3, 11, '2023-10-31 13:07:37', '2023-10-31 13:07:37'),
(12, 'Serum Balance Active Formula Tinh Chất Dưỡng Trắng Da Trị Thâm Balance Active Formula Vitamin C Brightening Serum', '/images/products/serum2.png', 229000, 'Serum Balance Active Formula Tinh Chất Dưỡng Trắng Da Trị Thâm Balance Active Formula Vitamin C Brightening Serum là một loại tinh chất thuộc thương hiệu Balance Active Formula có chứa 6% Illumiscin và 3% Stay-C® 50, là hai dạng dẫn xuất từ Vitamin C', 10, 0, NULL, 0, 3, NULL, '2023-10-31 13:09:34', '2023-10-31 13:09:34'),
(13, 'Serum L\'oreal Tinh Chất Mờ Thâm Nám Sau 2 Tuần L\'oreal Glycolic-Bright Instant Glowing Serum 30ml', '/images/products/serum3.png', 319000, 'Serum L\'oreal Tinh Chất Mờ Thâm Nám Sau 2 Tuần L\'oreal Glycolic-Bright Instant Glowing Serum là tinh chất dưỡng ẩm với giải pháp đột phá, trắng sáng tức thì, mờ thâm nám tận gốc, đem lại làn da tươi trẻ đều màu từ sau 14 ngày. Sản phẩm nhẹ dịu không ', 10, 0, NULL, 0, 3, 11, '2023-10-31 13:10:29', '2023-10-31 13:10:29'),
(14, 'Serum Klairs Tinh Chất Vitamin C Giúp Mờ Thâm Nám, Trắng Sáng Dành Cho Da Dễ Kích Ứng Klairs Freshly Juiced Vitamin Drop 35ml', '/images/products/serum4.png', 296000, 'Serum Klairs Tinh Chất Vitamin C Giúp Mờ Thâm Nám, Trắng Sáng Dành Cho Da Dễ Kích Ứng Klairs Freshly Juiced Vitamin Drop là tinh chất dưỡng siêu phẩm chứa vitamin C tươi đậm đặc chiết xuất từ Cam, Chanh, Quýt cùng nhiều chiết xuất từ thực vật giúp tă', 10, 0, NULL, 0, 3, NULL, '2023-10-31 13:11:20', '2023-10-31 13:11:20'),
(15, 'Serum 9 Wishes Tinh Chất Dưỡng Ẩm, Cấp Nước, Căng Bóng Da 9 Wishes Hydra Glowing Deep Hydration Ampule Serum 25ml', '/images/products/serum5.png', 211000, 'Serum 9 Wishes Tinh Chất Dưỡng Ẩm, Cấp Nước, Căng Bóng Da 9 Wishes Hydra Glowing Deep Hydration Ampule Serum là tinh chất thuộc thương hiệu 9 Wishes với thành phần chính chứa 15000mg Hyaluronic Acid là thành phần quan trọng của màng giữ ẩm tự nhiên N', 10, 0, NULL, 0, 3, NULL, '2023-10-31 13:12:05', '2023-10-31 13:12:05'),
(16, 'Serum Balance Active Formula Tinh Chất Ngừa Mụn Mờ Thâm Balance Active Formula Niacinamide Blemish Recovery Serum 30ml', '/images/products/serum6.png', 129000, 'Serum Balance Active Formula Tinh Chất Ngừa Mụn Mờ Thâm Balance Active Formula Niacinamide Blemish Recovery Serum là tinh chất dưỡng thuộc thương hiệu Balance Active Formula là công thức dạng nước với 15% Niacinamide, một thành phần giúp làm mờ vết t', 10, 0, NULL, 0, 3, NULL, '2023-10-31 13:12:37', '2023-10-31 13:12:37'),
(17, '[Thần Dược Giữ Gìn Tuổi Thanh Xuân] Tinh Chất DNA Cá Hồi Phục Hồi Da, Giảm Mụn Sau 28 Ngày Suiskin Salmon DN Ampoule', '/images/products/serum7.png', 849000, 'Tinh Chất DNA Cá Hồi Phục Hồi Da, Giảm Mụn Sau 28 Ngày Suiskin Salmon DN Ampoule là tinh chất dưỡng da thuộc thương hiệu Suiskin chứa các thành phần hữu hiệu được chiết xuất từ tế bào gốc DNA của cá hồi, trứng cá hồi, tinh chất Creatine và khoáng chấ', 10, 0, NULL, 0, 3, NULL, '2023-10-31 13:13:12', '2023-10-31 13:13:12'),
(18, 'Serum 9 Wishes Tinh Chất Dưỡng Trắng Da 9 Wishes Whitening Discoloration Ampule Serum 25ml', '/images/products/serum8.png', 211000, 'Serum 9 Wishes Tinh Chất Dưỡng Trắng Da 9 Wishes Whitening Discoloration Ampule Serum là tinh chất đưỡng da thuộc thương hiệu 9 Wishes chứa 73% nước gạo cũng các thành phần dưỡng trắng nổi bật như Niacinamide, Glutathione có khả năng ức chế sự tổng h', 10, 0, NULL, 0, 3, NULL, '2023-10-31 13:13:50', '2023-10-31 13:13:50'),
(19, 'Serum Garnier Tinh Chất Dưỡng Sáng Da, Mờ Thâm Ban Đêm Garnier Skin Naturals Bright Complete Overnight Booster Serum 30ml', '/images/products/serum9.png', 279000, 'Serum Garnier Tinh Chất Dưỡng Sáng Da, Mờ Thâm Ban Đêm Garnier Skin Naturals Bright Complete Overnight Booster Serum là tinh chất dưỡng da thuộc thương hiệu Garnier chứa 10% Vitamin C nguyên chất từ thành phần thiên nhiên cùng Hyaluronic Acid giúp bổ', 10, 0, NULL, 0, 3, NULL, '2023-10-31 13:14:26', '2023-10-31 13:14:26'),
(20, 'Serum Skin1004 Tinh Chất Rau Má Giảm Mụn, Phục Hồi Cho Da Nhạy Cảm Skin1004 Madagascar Centella Asiatica 100 Ampoule', '/images/products/serum10.png', 397000, 'Serum Skin1004 Tinh Chất Rau Má Giảm Mụn, Phục Hồi Cho Da Nhạy Cảm Skin1004 Madagascar Centella Asiatica 100 Ampoule là tinh chất dưỡng với kết cấu cô đặc nhẹ nhàng nhưng mạnh mẽ này được làm từ chiết xuất rau má chứa 30% Asiaticoside, 30% Asiatic Ac', 10, 0, NULL, 0, 3, NULL, '2023-10-31 13:14:50', '2023-10-31 13:14:50'),
(21, 'Kem Dưỡng Ẩm, Làm Sáng Da Chiết Xuất Hạt Ý Dĩ Hatomugi Moisturizing & Conditioning The Milky Cream 300g', '/images/products/kd1.png', 116000, 'Kem Dưỡng Ẩm, Làm Sáng Da Chiết Xuất Hạt Ý Dĩ Hatomugi Moisturizing & Conditioning The Milky Cream là kem dưỡng thuộc thương hiệu Hatomugi với thành phần chính chiết xuất hạt ý dĩ, kết hợp với hyaluronic acid giúp tăng cường độ ẩm cho da mềm mại, mịn', 10, 0, NULL, 0, 4, NULL, '2023-11-01 14:34:44', '2023-11-01 14:34:44'),
(22, 'Sữa Dưỡng Ẩm, Làm Dịu, Phục Hồi Da Embryolisse Lait Creme Concentré', '/images/products/kd2.png', 379000, 'Sữa Dưỡng Ẩm, Làm Dịu, Phục Hồi Da Embryolisse Lait Creme Concentré là dòng kem dưỡng thuộc thương hiệu mỹ phẩm Embryolisse. Với công dụng trong việc dưỡng ẩm, nuôi dưỡng làn da, giữ ẩm và bảo vệ da khỏi các gốc tự do, giúp mang lại', 10, 0, NULL, 0, 4, NULL, '2023-11-01 14:35:18', '2023-11-01 14:35:18'),
(23, 'Kem Dưỡng Ẩm, Cấp Nước Neutrogena Hydro Boost Water Gel', '/images/products/kd3.png', 271000, 'Kem Dưỡng Ẩm, Cấp Nước Neutrogena Hydro Boost Water Gel là dòng kem dưỡng da thuộc thương hiệu dược mỹ phẩm Neutrogena đến từ Mỹ. Sở hữu công nghệ Hydro Boost độc quyền cùng các thành phần dưỡng chất thiết yếu giúp cấp nước và khóa ẩm suốt 72h, tăng ', 10, 0, NULL, 0, 4, NULL, '2023-11-01 14:35:49', '2023-11-01 14:35:49'),
(24, 'Kem Dưỡng Ban Ngày Mờ Thâm Nám Sau 2 Tuần L\'Oreal Glycolic Bright Glowing Cream Day', '/images/products/kd4.png', 269000, 'Kem Dưỡng Ban Ngày Mờ Thâm Nám Sau 2 Tuần L\'Oreal Glycolic Bright Glowing Cream Day là kem dưỡng ban ngày với giải pháp đột phá, trắng sáng tức thì, mờ thâm nám tận gốc, đem lại làn da tươi trẻ đều màu từ sau 14 ngày. Sản phẩm nhẹ dịu không kích ứng,', 10, 0, NULL, 0, 4, 11, '2023-11-01 14:36:19', '2023-11-01 14:36:19'),
(25, 'Kem Dưỡng Ẩm Chuyên Sâu, Làm Dịu Da Bioderma Atoderm Intensive Baume', '/images/products/kd5.png', 562000, 'Kem Dưỡng Ẩm Chuyên Sâu, Làm Dịu Da Bioderma Atoderm Intensive Baume là dòng kem dưỡng đến từ thương hiệu Bioderma, nhờ chứa công nghệ Lipigenium™ giúp khôi phục hàng rào bảo vệ da và sáng chế Skin barrier therapy™ có khả năng hạn chế sự bám dính của', 10, 0, NULL, 0, 4, 9, '2023-11-01 14:36:50', '2023-11-01 14:36:50'),
(26, 'Gel Dưỡng Ẩm Chiết Xuất Lô Hội Cấp Ẩm & Làm Dịu Da Nature Republic Soothing & Moisture Aloe Vera 92% Soothing Gel 300ml', '/images/products/kd6.png', 94000, 'Gel Dưỡng Ẩm Chiết Xuất Lô Hội Cấp Ẩm & Làm Dịu Da Nature Republic Soothing & Moisture Aloe Vera 92% Soothing Gel 300ml là gel dưỡng đa năng với 92% tinh chất lô hội hữu cơ giúp cung cấp độ ẩm nhẹ và làm dịu cho các vùng da trên cơ thể như mặt, tay, ', 10, 0, NULL, 0, 4, NULL, '2023-11-01 14:37:18', '2023-11-01 14:37:18'),
(27, 'Kem Dưỡng Da Làm Dịu, Phục Hồi Da Ban Đêm Klairs Midnight Blue Calming Cream', '/images/products/kd7.png', 389000, 'Kem Dưỡng Da Làm Dịu, Phục Hồi Da Ban Đêm Klairs Midnight Blue Calming Cream là kem dưỡng với thành phần chính là Guaiazulene có nguồn gốc từ hoa cúc  và chiết xuất rau má giúp phục hồi và làm dịu các vùng da đang dị ứng hoặc sưng đỏ, làm giảm vết sư', 10, 0, NULL, 0, 4, NULL, '2023-11-01 14:37:49', '2023-11-01 14:37:49'),
(28, 'Kem Dưỡng, Làm Dịu Da, Phục Hồi Da, Đa Công Dụng La Roche-Posay Laboratoire Dermatologique Cicaplast Baume B5+', '/images/products/kd8.png', 521000, 'Kem Dưỡng, Làm Dịu Da, Phục Hồi Da, Đa Công Dụng La Roche-Posay Laboratoire Dermatologique Cicaplast Baume B5+ là kem dưỡng phục hồi da B5 thuộc thương hiệu dược mỹ phẩm La Roche-Posay đến từ Pháp. Với các thành phần chính lành tính có khả năng chữa ', 10, 0, NULL, 0, 4, 8, '2023-11-01 14:38:13', '2023-11-01 14:38:13'),
(29, 'Gel Dưỡng Ẩm, Dưỡng Trắng Da Chiết Xuất Cây Hắc Mai Biển I\'m From Vitamin Tree Water Gel 75g', '/images/products/kd9.png', 348000, 'Gel Dưỡng Ẩm, Dưỡng Trắng Da Chiết Xuất Cây Hắc Mai Biển I\'m From Vitamin Tree Water Gel là dòng kem dưỡng dạng gel, với chiết xuất thành phần chính là lá Hắc Mai Biển, Niacinamide giúp dưỡng trắng da hiệu quả, dưỡng ẩm cho da luôn mềm mại, bảo vệ da', 10, 0, NULL, 0, 4, NULL, '2023-11-01 14:38:39', '2023-11-01 14:38:39'),
(30, 'Kem Dưỡng Làm Dịu, Phục Hồi Da Chiết Xuất Rau Má Skin1004 Madagascar Centella Soothing Cream 75ml', '/images/products/kd10.png', 273000, 'Kem Dưỡng Làm Dịu, Phục Hồi Da Chiết Xuất Rau Má Skin1004 Madagascar Centella Soothing Cream là kem dưỡng ẩm chứa 72% chiết xuất rau má cùng với 4 loại Ceramide có nguồn gốc từ thực vật giúp tăng cường hàng rào bảo vệ da, nuôi dưỡng làn da khỏe mạnh ', 10, 0, NULL, 0, 4, NULL, '2023-11-01 14:39:12', '2023-11-01 14:39:12'),
(31, 'Sữa Rửa Mặt Dạng Gel Dịu Nhẹ Cosrx Low pH Good Morning Gel Cleanser', '/images/products/srm6.png', 139000, 'Sữa Rửa Mặt Dạng Gel Cosrx Low PH Good Morning Gel Cleanser là dòng sữa rửa mặt dịu nhẹ, thuộc thương hiệu Cosrx. Có độ pH gần như là làn da tự nhiên có khả năng làm sạch mà không gây khô căng da, dễ dàng làm sạch bụi bẩn, bã nhờn và lớp trang điểm, ', 10, 0, NULL, 0, 1, 7, '2023-11-03 00:53:27', '2023-11-03 00:53:27'),
(32, 'Sữa Rửa Mặt Sạch Sâu Dành Cho Da Dầu Cerave Developed With Dermatologists Foaming Cleanser', '/images/products/srm7.png', 418000, 'Sữa Rửa Mặt Sạch Sâu Dành Cho Da Dầu Cerave Developed With Dermatologists Foaming Cleanser là sữa rửa mặt với công thức lành tính giúp làm sạch bụi bẩn, dầu thừa một cách nhẹ nhàng mà không gây bít tắc lỗ chân lông, duy trì độ ẩm cân bằng da và phù h', 10, 0, NULL, 0, 1, NULL, '2023-11-03 00:54:53', '2023-11-03 00:54:53'),
(33, 'Sữa Rửa Mặt Dạng Gel Không Chứa Xà Phòng Dành Cho Da Dầu SVR Sebiaclear Gel Moussant', '/images/products/srm8.png', 699000, 'Sữa Rửa Mặt Dạng Gel SVR Dành Cho Da Dầu Mụn là sữa rửa mặt với công thức dịu nhẹ không chứa thành phần xà phòng đặc biệt phù hợp với làn da dầu mụn và nhạy cảm, có tác dụng làm sạch, làm sạch tế bào da chết và dầu nhờn trong lỗ chân lông giúp ngăn n', 10, 0, NULL, 0, 1, NULL, '2023-11-03 00:56:39', '2023-11-03 00:56:39'),
(34, 'Sữa Rửa Mặt Dạng Gel Cho Da Dầu Mụn La Roche-Posay Effaclar Purifying Foaming Gel For Oily Sensitive Skin', '/images/products/srm9.png', 476000, 'Sữa Rửa Mặt La Roche-Posay Dạng Gel Cho Da Dầu Mụn là sữa rửa mặt giúp nhẹ nhàng làm sạch bụi bẩn và bã nhờn dư thừa - nguyên nhân chính gây nên mụn. Không làm khô da nhờ các thành phần làm sạch nhẹ nhàng được lựa chọn kỹ càng. Mang la', 10, 0, NULL, 0, 1, 8, '2023-11-03 00:57:25', '2023-11-03 00:57:25'),
(35, 'Sữa Rữa Mặt Tạo Bọt Làm Sạch Sâu, Dịu Nhẹ Chiết Xuất Rau Má Skin1004 Madagascar Centella Ampoule Foam 125ml', '/images/products/srm10.png', 244000, 'Sữa Rữa Mặt Tạo Bọt Làm Sạch Sâu, Dịu Nhẹ Chiết Xuất Rau Má Skin1004 Madagascar Centella Ampoule Foam 125ml là sữa rửa mặt với công thức chứa hàm lượng cao chiết xuất rau má - biểu tượng của sự tinh khiết của Madagascar và sử dụng chất hoạt động bề m', 10, 0, NULL, 0, 1, NULL, '2023-11-03 00:59:16', '2023-11-03 00:59:16'),
(36, 'Nước Tẩy Trang Làm Sạch Và Siêu Cấp Ẩm L\'oreal Revitalift Hyaluronic Acid Hydrating Micellar Water', '/images/products/tt6.png', 209000, 'Nước Tẩy Trang Làm Sạch Và Siêu Cấp Ẩm L\'oreal Revitalift Hyaluronic Acid Hydrating Micellar Water là dòng nước tẩy trang thuộc thương hiệu L\'oreal đến từ Pháp. Với công thức đặc biệt chứa các phân tử Hyaluronic Acid cùng Công nghệ Mi-Xen và tinh chấ', 10, 0, NULL, 0, 5, 11, '2023-11-03 01:20:50', '2023-11-03 01:20:50'),
(37, '[400ml] Nước Tẩy Trang Làm Sạch Sâu Lớp Trang Điểm Garnier Micellar Oil-Infused Cleansing Water For All Skin Types', '/images/products/tt8.png', 159000, 'Nước Tẩy Trang Làm Sạch Sâu Lớp Trang Điểm Garnier Micellar Oil-Infused Cleansing Water For All Skin Types là dòng sản phẩm tẩy trang nổi tiếng đến từ thương hiệu Garnier của Pháp. Tích hợp công nghệ Micellar và Biphase có khả năng làm sạch da hiệu q', 10, 0, NULL, 0, 5, NULL, '2023-11-03 01:21:42', '2023-11-13 02:54:28'),
(38, 'Nước Tẩy Trang Làm Sạch Cho Da Dầu L\'oreal Revitalift Crystal Purifying Micellar Water', '/images/products/tt7.png', 209000, 'Nước Tẩy Trang Làm Sạch Cho Da Dầu L\'oreal Revitalift Crystal Purifying Micellar Water là nước tẩy trang sản phẩm dành cho da dầu với công dụng hỗ trợ làm sạch sâu lỗ chân lông, nhẹ nhàng chăm sóc làn da, góp phần lấy đi các tạp chất nhỏ nhất, bã nhờ', 10, 0, NULL, 0, 5, 11, '2023-11-03 01:22:40', '2023-11-03 01:22:40'),
(39, 'Nước Tẩy Trang Dành Cho Mọi Loại Da Byphasse Solution Micellaire', '/images/products/tt9.png', 89000, 'Nước Tẩy Trang Làm Sạch Dịu Nhẹ Cho Da Byphasse Solution Micellaire là nước tẩy trang với công nghệ micellaire hỗ trợ loại bỏ nhẹ nhàng lớp trang điểm khỏi mặt, mắt và môi. Các mixen có trong công nghệ này giúp làm sạch hoàn hảo các bụi bẩn trên bề m', 10, 0, NULL, 0, 5, NULL, '2023-11-03 01:23:15', '2023-11-03 01:23:15'),
(40, 'Nước Tẩy Trang Dành Cho Mắt Môi Maybelline Eye & Lip Makeup Remover', '/images/products/tt10.png', 139000, 'Nước Tẩy Trang Mắt Và Môi Maybelline Eye & Lip Makeup Remover là nước tẩy trang mắt môi đến từ thương hiệu Maybelline, nước tẩy trang chuyên nghiệp dùng cho vùng da quanh mắt và môi, chứa tinh chát hoa hồng có tác dụng dưỡng da, làm mềm da và tránh t', 10, 0, NULL, 0, 5, 1, '2023-11-03 01:23:53', '2023-11-03 01:23:53'),
(41, 'Kem Chống Nắng Lành Tính Dành Cho Da Nhạy Cảm Skin1004 Madagascar Centella Air-Fit Suncream Plus SPF50+ PA++++ 50ml', '/images/products/kcn1.png', 276000, 'Kem Chống Nắng Lành Tính Dành Cho Da Nhạy Cảm Skin1004 Madagascar Centella Air-Fit Suncream Plus SPF50+ PA++++ 50ml là dòng kem chống nắng mới đến từ thương hiệu mỹ phẩm Skin1004, với công thức chứa thêm 20% chiết xuất rau má giúp phục hồi, làm dịu v', 10, 0, NULL, 0, 2, NULL, '2023-11-03 02:01:33', '2023-11-03 02:01:33'),
(42, 'Kem Chống Nắng Mịn Nhẹ, Bảo Vệ Da, Ngăn Ngừa Lão Hóa L\'Oreal UV Defender Serum Protector SPF 50+/PA++++', '/images/products/kcn2.png', 279000, 'Kem Chống Nắng Mịn Nhẹ, Bảo Vệ Da, Ngăn Lão Hóa L\'Oreal UV Defender Serum Protector 50ml là kem chống nắng với 2 lớp màng bảo vệ (Màng lọc Mexoryl SX và Mexorul XL) giúp bảo vệ da dưới tác động của tia UVA và UVB cả ngày dài. Kết hợp với thành phần N', 10, 0, NULL, 0, 2, 11, '2023-11-03 02:02:09', '2023-11-03 02:02:09'),
(43, '[50g] Kem Chống Nắng Giảm Dầu, Nâng Tone Da Sáng Hồng The Saem Pink Sun Cream SPF50+/PA++++', '/images/products/kcn3.png', 149000, 'Kem Chống Nắng Giảm Dầu, Giúp Da Sáng Hồng Tự Nhiên The Saem Pink Sun Cream SPF50+/PA++++ với công thức kem chống nắng dịu nhẹ cho làn da nhạy cảm, bảo vệ da thoải mái khỏi tia UV và làm dịu da bằng các tia UV vật lý 100% ngăn chặn công thức và bột l', 10, 0, NULL, 0, 2, NULL, '2023-11-03 02:02:42', '2023-11-03 02:02:42'),
(44, 'Kem Chống Nắng Nâng Tông, Cân Bằng Ẩm, Chiết Xuất Rau Má Làm Dịu Da The Saem Eco Earth Extra Cica Sun Cream SPF50+/PA++++ 50g', '/images/products/kcn4.png', 238000, 'Kem Chống Nắng Nâng Tone, Cân Bằng Độ Ẩm, Chiết Xuất Rau Má Làm Dịu Da The Saem Eco Earth Extra Cica Sun Cream SPF50+/PA++++ là kem chống nắng thuộc thương hiệu The Saem. Với chỉ số SPF50+/PA++++, tạo hàng rào bảo vệ hiệu quả cho làn da khỏi các tia ', 10, 0, NULL, 0, 2, NULL, '2023-11-03 02:03:17', '2023-11-03 02:03:17'),
(45, 'Kem Chống Nắng Dạng Tinh Chất Mỏng Nhẹ Senka Perfect UV Essence SPF 50+/PA +++ 50g', '/images/products/kcn5.png', 146000, 'Kem Chống Nắng Dạng Tinh Chất Mỏng Nhẹ Senka Perfect UV Essence SPF 50+/PA +++ là kem chống nắng thuộc thương hiệu Senka có dạng tinh chất kết cấu mỏng nhẹ, không nhờn rít, nâng tông  với phức hợp chiết xuất tơ tằm và thành phần Hyaluronic Acid giúp ', 10, 0, NULL, 0, 2, NULL, '2023-11-03 02:03:49', '2023-11-03 02:03:49'),
(46, 'Kem Chống Nắng Bí Đao Quang Phổ Rộng Dành Cho Da Dầu, Nhạy Cảm Cocoon Winter Melon Sunscreen 50ml', '/images/products/kcn6.png', 395000, 'Kem Chống Nắng Bí Đao Quang Phổ Rộng Dành Cho Da Dầu, Nhạy Cảm Cocoon Winter Melon Sunscreen là kem chống nắng thuộc thương hiệu mỹ phẩm thuần chay Cocoon đến từ Việt Nam. Sản phẩm nổi bật với công thức đột phá kết hợp các màng lọc thế hệ mới cùng ch', 10, 0, NULL, 0, 2, NULL, '2023-11-03 02:04:46', '2023-11-03 02:04:46'),
(47, 'Sữa Chống Nắng Dưỡng Da Trắng Mịn Sunplay Skin Aqua Clear White SPF50+/PA++++', '/images/products/kcn7.png', 176000, 'Sữa Chống Nắng Sunplay Skin Aqua Dưỡng Da Trắng Mịn là sản phẩm chống nắng hiệu quả với SPF50+/PA++++, kết hợp công nghệ Watery Capsule x Ceramide Boost giúp chống nắng và giữ ẩm đột phá, cùng với khả năng chịu nước và mồ hôi cao cho khả năng chống n', 10, 0, NULL, 0, 2, NULL, '2023-11-03 02:06:13', '2023-11-03 02:06:13'),
(48, 'Kem Chống Nắng Kiểm Soát Dầu La Roche-Posay Anthelios Dry Touch Finish Mattifying Effect 50ml', '/images/products/kcn8.png', 428000, 'Kem Chống Nắng Kiểm Soát Dầu La Roche-Posay Anthelios Dry Touch Finish Mattifying Effect là kem chống nắng dành cho da dầu giúp kiểm soát bóng nhờn và bảo vệ da trước tác hại từ ánh nắng & ô nhiễm, ngăn chặn các tác nhân gây lão hóa sớm. Sản phẩm có ', 10, 0, NULL, 0, 2, 8, '2023-11-03 02:06:54', '2023-11-03 02:06:54'),
(49, 'Kem Chống Nắng Dưỡng Thể Trắng Mịn Sunplay Skin Aqua UV Body Lotion SPF50+/PA++++ 150g', '/images/products/kcn9.png', 165000, 'Kem Chống Nắng Dưỡng Thể Trắng Mịn Sunplay Skin Aqua UV Body Lotion SPF50+/PA++++ là kem chống nắng thuộc thương hiệu Sunplay với công nghệ Moisture Coat giúp làn da được dưỡng ẩm chuyên sâu, nuôi dưỡng làn da mềm mại, mịn màng cùng chỉ số chống nắng', 10, 0, NULL, 0, 2, NULL, '2023-11-03 02:07:30', '2023-11-03 02:07:30'),
(50, 'Kem Chống Nắng Làm Sáng Da, Mịn Lì, Kiềm Dầu Garnier Light Complete Super UV Spot-Proof Sunscreen - Matte Finish SPF50/PA+++', '/images/products/kcn10.png', 143000, 'Kem Chống Nắng Làm Sáng Da, Mịn Lì, Kiềm Dầu Garnier Light Complete Super UV Spot-Proof Sunscreen - Matte Finish là dòng kem chống nắng thuộc thương hiệu Garnier, với chỉ số chống nắng SPF50 PA+++ giúp bảo vệ da tối ưu khỏi các tia UVA, UVB, ngăn da ', 10, 0, NULL, 0, 2, NULL, '2023-11-03 02:07:57', '2023-11-03 02:07:57'),
(51, 'Chì Kẻ Mày Hai Đầu Tiện Lợi Cho Lông Mày Hoàn Hảo Lemonade Want It Got It Dual Eyebrow', '/images/products/mat1.png', 159000, 'Chì Kẻ Mày Hai Đầu Tiện Lợi Cho Lông Mày Hoàn Hảo Lemonade Want It Got It Dual Eyebrow là chì kẻ mày đến từ thương hiệu Lemonade bao gồm đầu chì mềm mại cùng đầu mascara giúp lông mày thêm đều màu, cho hàng lông mày thêm vừa vặn và hoàn hảo, tạo ra n', 10, 0, NULL, 0, 6, NULL, '2023-11-03 02:28:16', '2023-11-03 02:28:16'),
(52, 'Chì Kẻ Mày Lâu Trôi, Dễ Kẻ, Lên Màu Chuẩn Maybelline Tattoo Brow Up To 36H Pigment Pencil 0.25g', '/images/products/mat2.png', 142000, 'Chì Kẻ Mày Maybelline Tattoo Brow Up To 36H Pigment Pencil 0.25g là chì kẻ mày đến từ thương hiệu Maybelline với đầu chì tam giác đa năng, giúp bạn dễ dàng định hình lông mày nhanh chóng, tạo sợi vô cùng dễ dàng và chân mày nhìn luôn mềm mượt và đều ', 10, 0, NULL, 0, 6, 1, '2023-11-03 02:28:53', '2023-11-03 02:28:53'),
(53, 'Chì Kẻ Mày Ngang Mảnh, Lâu Trôi Innisfree Auto Eyebrow Pencil 0.3g', '/images/products/mat3.png', 95000, 'Chì Kẻ Mày Ngang Mảnh, Lâu Trôi Innisfree Auto Eyebrow Pencil là chì kẻ mày đến từ thương hiệu Innisfree với thiết kế cải tiến cùng thành phần tự nhiên không gây kích ứng cho da, bảng màu đa dạng, dễ dùng tạo cho bạn đôi lông mày trông thật tự nhiên ', 10, 0, NULL, 0, 6, 2, '2023-11-03 02:29:25', '2023-11-03 02:29:25'),
(54, 'Chì Kẻ Chân Mày Siêu Mảnh Lilybyred Skinny Mes Brow Pencil 0.09g', '/images/products/mat4.png', 99000, 'Chì Kẻ Mày Siêu Mảnh Lilybyred Skinny Mes Brow Pencil là chì kẻ mày thuộc thương hiệu Lilybyred với đầu cọ siêu mảnh, giúp định hình và tạo dáng chân mày phù hợp với màu tóc, đường nét siêu mảnh và giữ màu lâu giúp bạn có một khuôn mày tinh tế, gương', 10, 0, NULL, 0, 6, 3, '2023-11-03 02:29:56', '2023-11-03 02:29:56'),
(55, 'Chì Kẻ Mày Ngang 2 Đầu The Saem Saemmul Artlook Eyebrow 0.2g', '/images/products/mat5.png', 85000, 'Chì Kẻ Mày Ngang 2 Đầu The Saem Saemmul Artlook Eyebrow là chì kẻ mày thuộc thương hiệu The Saem với thiết kế 2 đầu tiện lợi, 1 đầu chì dẹt dạng sáp giúp định hình và tô màu chân mày, đầu chải giúp chải gọn chân mày, giúp tán đều màu, mang lại đôi ch', 10, 0, NULL, 0, 6, NULL, '2023-11-03 02:30:38', '2023-11-03 02:30:38'),
(56, 'Chì Kẻ Mày Ngang Sắc Nét, Lâu Trôi Merzy The First Brow Pencil 0.3g', '/images/products/mat6.png', 119000, 'Chì Kẻ Mày Ngang Sắc Nét, Lâu Trôi Merzy The First Brow Pencil là chì kẻ mày của thương hiệu Merzy có kết cấu mềm mượt, có khả năng chống ẩm, lâu trôi cùng tông màu thời thượng hợp cả màu mắt lẫn màu tóc tạo cho bạn hàng lông mày sắc nét tự nhiên, lâ', 10, 0, NULL, 0, 6, 4, '2023-11-03 02:31:11', '2023-11-03 02:31:11'),
(57, 'Bút Kẻ Mắt Nước Siêu Lì, Sắc Nét, Lâu Trôi Silkygirl Perfect Sharp Matte Eyeliner 1.2ml #01 MATTE BLACK', '/images/products/mat7.png', 184000, 'Bút Kẻ Mắt Nước Siêu Lì, Sắc Nét, Lâu Trôi Silkygirl Perfect Sharp Matte Eyeliner là bút kẻ mắt nước đến từ thương hiệu Silkygirl với công thức nền nước nhanh khô, đầu bút dễ kẻ, tạo những nét vẽ với đường cong ấn tượng, sắc nét. Nét vẽ nhanh chóng k', 10, 0, NULL, 0, 6, NULL, '2023-11-03 02:32:45', '2023-11-03 02:32:45'),
(58, 'Chì Kẻ Mày Ngang Siêu Mảnh, Sắc Nét, Thuần Chay Lâu Trôi Merzy The Skinny Embo Brow Pencil 0.07g', '/images/products/mat8.png', 105000, 'Chì Kẻ Mày Ngang Thuần Chay Lâu Trôi Merzy The Skinny Embo Brow Pencil là chì kẻ mày đến từ thương hiệu Merzy với đầu chì có kết cấu mềm mại, nét siêu mảnh, thành phần thuần chay lành tính, tiện lợi dễ dàng thao tác mỗi khi vẽ, lên màu cực nét mà vẫn', 10, 0, NULL, 0, 6, 4, '2023-11-03 02:33:24', '2023-11-03 02:33:24'),
(59, 'Gel Trong Suốt Cố Định Lông Mày Tự Nhiên Romand Han All Brow Fixer - Han All Line 9g', '/images/products/mat9.png', 159000, 'Gel Trong Suốt Cố Định Lông Mày Tự Nhiên Romand Han All Brow Fixer là sản phẩm nằm trong bộ sưu tập Han All Line của thương hiệu Romand với chất gel matte trong suốt không bết giúp cố định và tạo dáng cho từng sợi lông mày theo ý bạn tạo hàng lông mà', 10, 0, NULL, 0, 6, 5, '2023-11-03 02:33:49', '2023-11-03 02:33:49'),
(60, 'Chì Kẻ Mày Tiện Dụng 3 Trong 1 Sắc Nét, Lâu Trôi B.O.M 3IN1 Triple Edge Eyebrow', '/images/products/mat10.png', 230000, 'Chì Kẻ Mày Tiện Dụng B.O.M 3IN1 Triple Edge Eyebrow là chì kẻ mày đến từ thương hiệu B.O.M với cấu tạo 3 trong 1 tiện lợi giúp tạo hình chân mày được chính xác và rõ ràng hơn, công thức mềm mịn giúp đôi chân mày được kẻ tự nhiên, mượt mà tạo hàng châ', 10, 0, NULL, 0, 6, NULL, '2023-11-03 02:34:25', '2023-11-03 02:34:25');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `rates`
--

CREATE TABLE `rates` (
  `id` int(11) NOT NULL,
  `product_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `order_id` int(11) DEFAULT NULL,
  `star` int(11) DEFAULT NULL,
  `comment` text DEFAULT NULL,
  `createdAt` datetime DEFAULT NULL,
  `updatedAt` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `roles`
--

CREATE TABLE `roles` (
  `id` int(11) NOT NULL,
  `name` varchar(250) DEFAULT NULL,
  `createdAt` datetime DEFAULT NULL,
  `updatedAt` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `roles`
--

INSERT INTO `roles` (`id`, `name`, `createdAt`, `updatedAt`) VALUES
(1, 'Guess', '2023-10-20 22:05:29', '2023-10-20 22:05:29'),
(2, 'Admin', '2023-10-20 22:05:29', '2023-10-20 22:05:29');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `name` varchar(250) DEFAULT NULL,
  `email` varchar(250) DEFAULT NULL,
  `username` varchar(250) DEFAULT NULL,
  `password` varchar(250) DEFAULT NULL,
  `address` varchar(250) DEFAULT NULL,
  `role_id` int(11) DEFAULT NULL,
  `createdAt` datetime DEFAULT NULL,
  `updatedAt` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `username`, `password`, `address`, `role_id`, `createdAt`, `updatedAt`) VALUES
(17, 'Phan Tien Huy', 'huyphan1232002@gmail.com', 'phantienhuy', '$2b$12$f6LQ7F4oK2VTtbQOaAyOyOj6GIE.lKv4ZN5bSHD.bjPKEQcds0mDq', 'Ha Noi', 1, '2023-10-21 13:38:39', '2023-10-21 13:38:39'),
(20, 'Admin', 'admin@gmail.com', 'admin', '$2b$12$1nxnqEoEh3B4rzRgje0R3ecxQ.yqcITx0mzTslz.XN0GTIuOpoF3S', 'Hà Nội', 2, '2023-11-13 03:18:37', '2023-11-13 03:18:37'),
(33, 'Phan Tiến Huy', 'phanhuy0220@gmail.com', 'phantienhuy2002', '$2b$12$hXKAoF26VSfYZK0emu91tucqMPha498AoIi0BHnFVDocDtDvY2HCO', 'Ha Noi', 1, '2023-12-16 01:42:55', '2023-12-16 01:42:55');

--
-- Chỉ mục cho các bảng đã đổ
--

--
-- Chỉ mục cho bảng `brands`
--
ALTER TABLE `brands`
  ADD PRIMARY KEY (`id`),
  ADD KEY `ix_brands_id` (`id`);

--
-- Chỉ mục cho bảng `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`),
  ADD KEY `category_parent_id` (`category_parent_id`),
  ADD KEY `ix_categories_id` (`id`);

--
-- Chỉ mục cho bảng `category_parents`
--
ALTER TABLE `category_parents`
  ADD PRIMARY KEY (`id`),
  ADD KEY `ix_category_parents_id` (`id`);

--
-- Chỉ mục cho bảng `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `ix_orders_id` (`id`);

--
-- Chỉ mục cho bảng `order_products`
--
ALTER TABLE `order_products`
  ADD PRIMARY KEY (`id`),
  ADD KEY `order_id` (`order_id`),
  ADD KEY `product_id` (`product_id`),
  ADD KEY `ix_order_products_id` (`id`);

--
-- Chỉ mục cho bảng `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`),
  ADD KEY `category_id` (`category_id`),
  ADD KEY `brand_id` (`brand_id`),
  ADD KEY `ix_products_id` (`id`);

--
-- Chỉ mục cho bảng `rates`
--
ALTER TABLE `rates`
  ADD PRIMARY KEY (`id`),
  ADD KEY `product_id` (`product_id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `order_id` (`order_id`),
  ADD KEY `ix_rates_id` (`id`);

--
-- Chỉ mục cho bảng `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`),
  ADD KEY `ix_roles_id` (`id`);

--
-- Chỉ mục cho bảng `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD KEY `role_id` (`role_id`),
  ADD KEY `ix_users_id` (`id`);

--
-- AUTO_INCREMENT cho các bảng đã đổ
--

--
-- AUTO_INCREMENT cho bảng `brands`
--
ALTER TABLE `brands`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT cho bảng `categories`
--
ALTER TABLE `categories`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT cho bảng `category_parents`
--
ALTER TABLE `category_parents`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT cho bảng `orders`
--
ALTER TABLE `orders`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `order_products`
--
ALTER TABLE `order_products`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `products`
--
ALTER TABLE `products`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=61;

--
-- AUTO_INCREMENT cho bảng `rates`
--
ALTER TABLE `rates`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `roles`
--
ALTER TABLE `roles`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT cho bảng `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=34;

--
-- Các ràng buộc cho các bảng đã đổ
--

--
-- Các ràng buộc cho bảng `categories`
--
ALTER TABLE `categories`
  ADD CONSTRAINT `categories_ibfk_1` FOREIGN KEY (`category_parent_id`) REFERENCES `category_parents` (`id`);

--
-- Các ràng buộc cho bảng `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Các ràng buộc cho bảng `order_products`
--
ALTER TABLE `order_products`
  ADD CONSTRAINT `order_products_ibfk_1` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`),
  ADD CONSTRAINT `order_products_ibfk_2` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`);

--
-- Các ràng buộc cho bảng `products`
--
ALTER TABLE `products`
  ADD CONSTRAINT `products_ibfk_1` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`),
  ADD CONSTRAINT `products_ibfk_2` FOREIGN KEY (`brand_id`) REFERENCES `brands` (`id`);

--
-- Các ràng buộc cho bảng `rates`
--
ALTER TABLE `rates`
  ADD CONSTRAINT `rates_ibfk_1` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`),
  ADD CONSTRAINT `rates_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `rates_ibfk_3` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`);

--
-- Các ràng buộc cho bảng `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `users_ibfk_1` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
