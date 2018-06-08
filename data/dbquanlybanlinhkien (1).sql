-- phpMyAdmin SQL Dump
-- version 4.7.4
-- https://www.phpmyadmin.net/
--
-- Máy chủ: 127.0.0.1
-- Thời gian đã tạo: Th6 02, 2018 lúc 11:07 PM
-- Phiên bản máy phục vụ: 10.1.28-MariaDB
-- Phiên bản PHP: 7.1.11

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Cơ sở dữ liệu: `dbquanlybanlinhkien`
--

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `bill`
--

CREATE TABLE `bill` (
  `so_hoa_don` int(11) NOT NULL,
  `ngay_hd` date NOT NULL,
  `ma_khach_hang` varchar(5) COLLATE utf8_unicode_ci NOT NULL,
  `tri_gia` double NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `bill`
--

INSERT INTO `bill` (`so_hoa_don`, `ngay_hd`, `ma_khach_hang`, `tri_gia`) VALUES
(1, '2018-06-02', '35', 6850000);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `billuser`
--

CREATE TABLE `billuser` (
  `so_hoa_don` int(11) NOT NULL,
  `ngay_hd` date NOT NULL,
  `ma_user` int(11) NOT NULL,
  `tri_gia` double NOT NULL,
  `trang_thai` int(2) NOT NULL,
  `dia_chi` text CHARACTER SET utf8 COLLATE utf8_vietnamese_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Đang đổ dữ liệu cho bảng `billuser`
--

INSERT INTO `billuser` (`so_hoa_don`, `ngay_hd`, `ma_user`, `tri_gia`, `trang_thai`, `dia_chi`) VALUES
(1, '2018-06-02', 27, 5575000, 1, 'Cát Hưng - Phù Cát - Bình Định - Việt Nam');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `customer`
--

CREATE TABLE `customer` (
  `ma_khach_hang` int(11) NOT NULL,
  `ten_khach_hang` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `phai` tinyint(1) NOT NULL,
  `ngay_sinh` date NOT NULL,
  `dia_chi` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  `dien_thoai` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(100) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `customer`
--

INSERT INTO `customer` (`ma_khach_hang`, `ten_khach_hang`, `phai`, `ngay_sinh`, `dia_chi`, `dien_thoai`, `email`) VALUES
(35, 'Phùng Văn Đạt', 1, '2018-06-21', 'Đại Học Công Nghệ THông Tin', '094509450', 'phungvandat97@gmail.com');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `infobill`
--

CREATE TABLE `infobill` (
  `so_hoa_don` varchar(5) COLLATE utf8_unicode_ci NOT NULL,
  `ma_san_pham` varchar(6) COLLATE utf8_unicode_ci NOT NULL,
  `so_luong` int(11) NOT NULL,
  `don_gia` int(11) NOT NULL,
  `stt` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `infobill`
--

INSERT INTO `infobill` (`so_hoa_don`, `ma_san_pham`, `so_luong`, `don_gia`, `stt`) VALUES
('1', '37', 1, 175000, 4567),
('1', '36', 5, 1335000, 4566);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `infobilluser`
--

CREATE TABLE `infobilluser` (
  `so_hoa_don` varchar(5) NOT NULL,
  `ma_san_pham` varchar(6) NOT NULL,
  `so_luong` int(11) NOT NULL,
  `don_gia` int(11) NOT NULL,
  `stt` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Đang đổ dữ liệu cho bảng `infobilluser`
--

INSERT INTO `infobilluser` (`so_hoa_don`, `ma_san_pham`, `so_luong`, `don_gia`, `stt`) VALUES
('1', '37', 9, 175000, 52),
('1', '209', 2, 2000000, 53);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `post`
--

CREATE TABLE `post` (
  `ma_bai_viet` int(11) NOT NULL,
  `ma_loai_bai_viet` int(11) DEFAULT NULL,
  `ma_nguoi_dung` int(11) NOT NULL,
  `tieu_de` varchar(200) CHARACTER SET utf8 NOT NULL,
  `noi_dung_tom_tat` text CHARACTER SET utf8 NOT NULL,
  `noi_dung_chi_tiet` text CHARACTER SET utf8 NOT NULL,
  `ngay_gui_bai` datetime NOT NULL,
  `ngay_xuat_ban` datetime DEFAULT NULL,
  `ngay_het_han` datetime DEFAULT NULL,
  `so_lan_xem` int(11) NOT NULL,
  `xuat_ban` tinyint(1) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `post`
--

INSERT INTO `post` (`ma_bai_viet`, `ma_loai_bai_viet`, `ma_nguoi_dung`, `tieu_de`, `noi_dung_tom_tat`, `noi_dung_chi_tiet`, `ngay_gui_bai`, `ngay_xuat_ban`, `ngay_het_han`, `so_lan_xem`, `xuat_ban`) VALUES
(1, 0, 1, 'Giới thiệu về công ty', '', '<p>\r\n	<strong>C&ocirc;ng ty </strong><strong>Cổ Phần Thương Mại Dịch Vụ</strong><strong> </strong><span style=\"font-weight: bold;\">Alphatek Computer </span>l&agrave; C&ocirc;ng ty hoạt động trong nhiều lĩnh vực trong đ&oacute; m&aacute;y vi t&iacute;nh v&agrave; thiết bị văn ph&ograve;ng l&agrave; ng&agrave;nh chủ lực. <span style=\"font-weight: bold;\">Alphatek Computer</span>c&oacute; một đội ngũ nh&acirc;n vi&ecirc;n c&oacute; tr&igrave;nh độ chuy&ecirc;n m&ocirc;n cao, đủ khả năng để c&oacute; thể đ&aacute;p ứng mọi y&ecirc;u cầu khắt khe nhất của qu&iacute; kh&aacute;ch h&agrave;ng.<br />\r\n	Kh&ocirc;ng những thế, đội ngũ nh&acirc;n vi&ecirc;n của <span style=\"font-weight: bold;\">Alphatek Computer</span>c&ograve;n l&agrave; những người đầy l&ograve;ng nhiệt t&igrave;nh v&agrave; c&oacute; th&aacute;i độ rất niềm nở trong cung c&aacute;ch phục vụ kh&aacute;ch h&agrave;ng.</p>\r\n<p>\r\n	<strong>C&ocirc;ng ty Cổ Phần Thương Mại Dịch Vụ </strong><strong>Alphatek Computer</strong> tọa lạc ngay khu vực trung t&acirc;m th&agrave;nh phố, tại số 357 L&ecirc; Hồng Phong, Quận 10, TP Hồ Ch&iacute; Minh.</p>\r\n<p>\r\n	Được th&agrave;nh lập từ th&aacute;ng 04 năm 1997, Phong Vũ lu&ocirc;n l&agrave; nh&agrave; ph&acirc;n phối c&aacute;c sản phẩm v&agrave; linh kiện m&aacute;y t&iacute;nh, thiết bị văn ph&ograve;ng, th&ocirc;ng tin li&ecirc;n lạc v&agrave; giải tr&iacute; do c&aacute;c h&atilde;ng điện tử h&agrave;ng đầu tr&ecirc;n thế giới sản xuất. Mức gi&aacute; sản phẩm do Phong Vũ cung cấp lu&ocirc;n ph&ugrave; hợp trong m&ocirc;i trường cạnh tranh, chất lượng sản phẩm lu&ocirc;n được Phong Vũ đảm bảo.</p>\r\n<p>\r\n	<strong>Alphatek Computer</strong> c&ograve;n l&agrave; địa chỉ tin cậy đối với kh&aacute;ch h&agrave;ng c&oacute; nhu cầu bảo h&agrave;nh v&agrave; bảo tr&igrave; cho c&aacute;c loại m&aacute;y t&iacute;nh để b&agrave;n, m&aacute;y t&iacute;nh x&aacute;ch tay, m&aacute;y in, UPS (thiết bị điện), v&agrave; c&aacute;c thiết bị ngoại vi. Với c&aacute;c loại h&igrave;nh dịch vụ bảo h&agrave;nh v&agrave; bảo tr&igrave; tận nơi, bảy ng&agrave;y trong tuần, ch&uacute;ng t&ocirc;i bảo đảm tối ưu h&oacute;a năng lực c&aacute;c m&aacute;y m&oacute;c, thiết bị của kh&aacute;ch h&agrave;ng.</p>\r\n<p>\r\n	<span style=\"font-weight: bold;\">Alphatek Computer</span> đ&atilde; v&agrave; đang cung cấp giải ph&aacute;p mạng cho c&aacute;c tổ chức, doanh nghiệp hoặc c&aacute; nh&acirc;n kinh doanh internet. Ch&uacute;ng t&ocirc;i hiện c&oacute; trong tay c&aacute;c phương tiện hiện đại nhất, c&oacute; thể lắp đặt phần cứng v&agrave; c&agrave;i đặt phần mềm quản l&yacute;, duy tr&igrave; t&iacute;nh ổn định, k&eacute;o d&agrave;i tối đa tuổi thọ của to&agrave;n bộ hệ thống.</p>\r\n<p>\r\n	Đội ngũ nh&acirc;n vi&ecirc;n v&agrave; quản l&yacute; của <strong>Alphatek Computer</strong> lu&ocirc;n được lựa chọn kỹ c&agrave;ng trước khi trải qua qu&aacute; tr&igrave;nh huấn luyện v&agrave; cập nhật thường xuy&ecirc;n những th&agrave;nh tựu mới nhất về dịch vụ kh&aacute;ch h&agrave;ng, dịch vụ kỹ thuật v&agrave; sản phẩm.</p>\r\n<p>\r\n	<strong>&quot;Lấy sự H&agrave;i l&ograve;ng của kh&aacute;ch h&agrave;ng l&agrave;m niềm Hạnh ph&uacute;c của ch&uacute;ng ta&quot; l&agrave; những g&igrave; m&agrave; to&agrave;n thể nh&acirc;n vi&ecirc;n c&ocirc;ng ty Alphatek Computer đang ng&agrave;y đ&ecirc;m phấn đấu !&quot;</strong></p>\r\n', '2011-03-10 00:00:00', '2011-03-10 00:00:00', '0000-00-00 00:00:00', 0, 1),
(2, 0, 1, 'Chính sách bảo hành', '', '<p>\r\n	<strong>I- Cam kết bảo h&agrave;nh của Alphatek Computer:</strong></p>\r\n<p>\r\n	1.1- Đối với những thiết bị được bảo h&agrave;nh từ 24 th&aacute;ng trở l&ecirc;n b&aacute;n ra trong v&ograve;ng 01&gt;06 th&aacute;ng nếu c&oacute; vấn đề g&igrave; trục trặc:</p>\r\n<p>\r\n	* Ch&uacute;ng t&ocirc;i sẽ đổi ngay cho c&aacute;c bạn một sản phẩm mới 100% ngay lập tức</p>\r\n<p>\r\n	1.2- Đối với những thiết bị b&aacute;n ra trong v&ograve;ng từ&nbsp; 06 &gt; 12 th&aacute;ng nếu c&oacute; vấn đề g&igrave; trục trặc:</p>\r\n<p>\r\n	* Ch&uacute;ng t&ocirc;i cam kết trả h&agrave;ng bảo h&agrave;nh cho c&aacute;c bạn tối đa trong v&ograve;ng 40h l&agrave;m việc.</p>\r\n<p>\r\n	* Trong thời gian đ&oacute; bạn sẽ được Ch&uacute;ng t&ocirc;i cho mượn thiết bị kh&aacute;c để sử dụng tạm thời.</p>\r\n<p>\r\n	1.3- Đối với những thiết bị b&aacute;n ra trong v&ograve;ng từ 12 th&aacute;ng trở l&ecirc;n nếu c&oacute; vấn đề g&igrave; trục trặc:</p>\r\n<p>\r\n	* Alphatek cam kết trả h&agrave;ng bảo h&agrave;nh cho c&aacute;c bạn tối đa trong v&ograve;ng 72h l&agrave;m việc.</p>\r\n<p>\r\n	* Trong thời gian đ&oacute; bạn sẽ được Ch&uacute;ng t&ocirc;i cho mượn thiết bị kh&aacute;c để sử dụng tạm thời.</p>\r\n<p>\r\n	1.4- Đối với c&aacute;c kh&aacute;ch h&agrave;ng c&oacute; đăng k&yacute; dịch vụ bảo h&agrave;nh tại nơi sử dụng:</p>\r\n<p>\r\n	* Khi c&oacute; bất cứ trục trặc g&igrave; về m&aacute;y t&iacute;nh, trong v&ograve;ng 2h kể từ khi nhận được th&ocirc;ng b&aacute;o ch&uacute;ng t&ocirc;i sẽ c&oacute; mặt để khắc phục sự cố. Trong trường hợp ngo&agrave;i thời gian l&agrave;m việc, ch&uacute;ng t&ocirc;i sẽ khắc phục ngay v&agrave;o đầu giờ của buổi l&agrave;m việc tiếp theo.</p>\r\n<p>\r\n	* Tất cả c&aacute;c thiết bị sẽ được khắc phục ngay tại chỗ, trường hợp kh&ocirc;ng thể sửa chữa được, ch&uacute;ng t&ocirc;i sẽ c&oacute; ngay thiết bị kh&aacute;c để qu&iacute; kh&aacute;ch sử dụng tạm thời.</p>\r\n<p>\r\n	<strong>II. Một v&agrave;i lưu &yacute; về c&aacute;c cam kết n&agrave;y :</strong></p>\r\n<p>\r\n	2.1 Điều kiện được đổi ngay: Sản phẩm bị lỗi c&ograve;n nguy&ecirc;n hiện trạng ban đầu (kh&ocirc;ng bị trầy xước, biến dạng v&agrave; c&ograve;n đầy đủ c&aacute;c phụ kiện k&egrave;m theo như vỏ hộp, s&aacute;ch hướng dẫn, đĩa c&agrave;i, &hellip;)</p>\r\n<p>\r\n	-&nbsp;&nbsp;&nbsp; Mục n&agrave;y chỉ &aacute;p dụng với đối tượng kh&aacute;ch h&agrave;ng l&agrave; người ti&ecirc;u d&ugrave;ng cuối c&ugrave;ng, kh&ocirc;ng &aacute;p dụng đối với c&aacute;c sản phẩm l&agrave; m&aacute;y t&iacute;nh x&aacute;ch tay, m&aacute;y chiếu, m&aacute;y fax, m&aacute;y in, m&aacute;y photocopy, m&aacute;y huỷ t&agrave;i liệu.</p>\r\n<p>\r\n	-&nbsp;&nbsp;&nbsp; Chỉ &aacute;p dụng với c&aacute;c sản phẩm bị lỗi do nh&agrave; Sản xuất.</p>\r\n<p>\r\n	<strong><em>2.2. Bảo h&agrave;nh trong cả trường hợp ch&aacute;y nổ IC, phồng tụ.</em></strong></p>\r\n<p>\r\n	Mặc d&ugrave; như c&aacute;c bạn đ&atilde; biết (theo qui chế bảo h&agrave;nh ở Việt Nam &amp; tr&ecirc;n Thế giới) l&agrave; trong trường hợp n&agrave;y c&ocirc;ng ty Alphatek sẽ kh&ocirc;ng được c&aacute;c nh&agrave; cung cấp &amp; c&aacute;c h&atilde;ng chấp nhận bảo h&agrave;nh. Thế nhưng c&ocirc;ng ty&nbsp; vẫn hỗ trợ c&aacute;c kh&aacute;ch h&agrave;ng của m&igrave;nh một c&aacute;ch tối đa c&oacute; thể nhằm khẳng định sự vượt trội về Chất lượng dịch vụ của Alphatek</p>\r\n<p>\r\n	Đối với những sản phẩm vi phạm điều kiện bảo h&agrave;nh của h&atilde;ng như: ch&aacute;y nổ IC, phồng tụ, ch&uacute;ng t&ocirc;i sẵn s&agrave;ng hỗ trợ bảo h&agrave;nh cho kh&aacute;ch h&agrave;ng (<em>chỉ &aacute;p dụng đối với kh&aacute;ch h&agrave;ng l&agrave; người ti&ecirc;u d&ugrave;ng cuối c&ugrave;ng</em>).</p>\r\n<p>\r\n	<strong><em>2.3. Cho kh&aacute;ch h&agrave;ng mượn sản phẩm để sử dụng trong thời gian gửi bảo h&agrave;nh.</em></strong></p>\r\n<p>\r\n	Để c&ocirc;ng việc của Qu&yacute; kh&aacute;ch h&agrave;ng kh&ocirc;ng bị gi&aacute;n đoạn, trong thời gian sản phẩm của Qu&yacute; kh&aacute;ch đang được bảo h&agrave;nh, ch&uacute;ng t&ocirc;i tạm thời cho Qu&yacute; kh&aacute;ch mượn 01 sản phẩm c&oacute; t&iacute;nh năng tương tự để sử dụng, việc n&agrave;y ho&agrave;n to&agrave;n miễn ph&iacute;.</p>\r\n<p>\r\n	<strong><em>24. Trường hợp kh&aacute;ch h&agrave;ng muốn n&acirc;ng cấp sản phẩm.</em></strong></p>\r\n<p>\r\n	Trong một số trường hợp, khi kh&aacute;ch h&agrave;ng muốn n&acirc;ng cấp, thay đổi sản phẩm, C&ocirc;ng ty sẽ nhập lại sản phẩm cũ với gi&aacute; thoả thuận.</p>\r\n<p>\r\n	<strong><em>2.5. Hỗ trợ kh&aacute;ch h&agrave;ng trong việc t&igrave;m lại th&ocirc;ng tin bảo h&agrave;nh.</em></strong></p>\r\n<p>\r\n	Đối với c&aacute;c sản phẩm được mua tại C&ocirc;ng ty Alphatek nhưng vi phạm điều kiện về thủ tục bảo h&agrave;nh như: phiếu bảo h&agrave;nh bị mất, r&aacute;ch, nh&agrave;u n&aacute;t. Ch&uacute;ng t&ocirc;i sẽ hỗ trợ kh&aacute;ch h&agrave;ng trong việc t&igrave;m lại th&ocirc;ng tin về sản phẩm (trong khả năng c&oacute; thể) để sản phẩm của Qu&yacute; kh&aacute;ch được bảo h&agrave;nh theo quy định.</p>\r\n<p>\r\n	<strong><em>2.6. Nhận sửa chữa dịch vụ với ph&iacute; ưu đ&atilde;i.</em></strong></p>\r\n<p>\r\n	Đối với c&aacute;c sản phẩm vi phạm điều kiện bảo h&agrave;nh của C&ocirc;ng ty dẫn tới việc sản phẩm kh&ocirc;ng được hưởng dịch vụ bảo h&agrave;nh, C&ocirc;ng ty ch&uacute;ng t&ocirc;i c&oacute; ch&iacute;nh s&aacute;ch nhận sửa chữa dịch vụ với ph&iacute; ưu đ&atilde;i. Căn cứ v&agrave;o kết quả kiểm tra t&igrave;nh trạng của sản phẩm, ch&uacute;ng t&ocirc;i sẽ đề xuất hướng giải quyết tốt nhất cho kh&aacute;ch h&agrave;ng v&agrave; thực hiện b&aacute;o gi&aacute; chi ph&iacute; sửa chữa trong thời gian 2 ng&agrave;y để Qu&yacute; kh&aacute;ch h&agrave;ng xem x&eacute;t.</p>\r\n<p>\r\n	<strong><em>2.7. Ưu đ&atilde;i đặc biệt d&agrave;nh cho bất kỳ kh&aacute;ch h&agrave;ng n&agrave;o đến với Alphatek.</em></strong></p>\r\n<p>\r\n	Trong bất kể thời gian l&agrave;m việc n&agrave;o của Trung t&acirc;m bảo h&agrave;nh Alphatek , Trung t&acirc;m tổ chức bảo tr&igrave;, bảo dưỡng, c&agrave;i đặt phần mềm miễn ph&iacute; cho tất cả c&aacute;c kh&aacute;ch h&agrave;ng đến với Trung t&acirc;m. Trung t&acirc;m cung cấp dịch vụ miễn ph&iacute; cả với những sản phẩm kh&ocirc;ng phải do C&ocirc;ng ty cung cấp. Ngo&agrave;i ra, trong qu&aacute; tr&igrave;nh sử dụng c&aacute;c sản phẩm Tin học của m&igrave;nh, nếu gặp bất kỳ vướng mắc, trở ngại n&agrave;o Qu&yacute; kh&aacute;ch vui l&ograve;ng li&ecirc;n hệ với Trung t&acirc;m bảo h&agrave;nh Alphatek để được giải đ&aacute;p ho&agrave;n to&agrave;n miễn ph&iacute;.</p>\r\n<p>\r\n	<strong>III. Thời hạn bảo h&agrave;nh.</strong></p>\r\n<p>\r\n	Qu&yacute; kh&aacute;ch h&agrave;ng vui l&ograve;ng xem th&ocirc;ng tin về thời hạn bảo h&agrave;nh của c&aacute;c sản phẩm tr&ecirc;n phiếu bảo h&agrave;nh, b&aacute;o gi&aacute; in, b&aacute;o gi&aacute; tr&ecirc;n hệ thống Website của C&ocirc;ng ty.</p>\r\n<p>\r\n	<strong>IV. Điều kiện bảo h&agrave;nh.</strong></p>\r\n<p>\r\n	4.1. C&aacute;c điều kiện bảo h&agrave;nh của sản phẩm được tu&acirc;n thủ theo quy định của nh&agrave; ph&acirc;n phối hoặc của h&atilde;ng sản xuất.</p>\r\n<p>\r\n	4.2. C&aacute;c trường hợp bị coi l&agrave; vi phạm điều kiện bảo h&agrave;nh, bao gồm:</p>\r\n<p>\r\n	- Sản phẩm hết thời hạn bảo h&agrave;nh;</p>\r\n<p>\r\n	- Kh&ocirc;ng c&oacute; Phiếu bảo h&agrave;nh;</p>\r\n<p>\r\n	- Phiếu bảo h&agrave;nh bị nh&agrave;u n&aacute;t kh&ocirc;ng đọc được;</p>\r\n<p>\r\n	- Phiếu v&agrave; tem bảo h&agrave;nh tr&ecirc;n sản phẩm kh&ocirc;ng đồng nhất;</p>\r\n<p>\r\n	- Th&ocirc;ng tin tr&ecirc;n Phiếu bảo h&agrave;nh bị sửa đổi, tẩy xo&aacute;;</p>\r\n<p>\r\n	- R&aacute;ch tem hoặc kh&ocirc;ng c&oacute; tem của C&ocirc;ng ty, của nh&agrave; ph&acirc;n phối, h&atilde;ng sản xuất;</p>\r\n<p>\r\n	- Số seri, m&atilde; vạch, th&ocirc;ng số kỹ thuật tr&ecirc;n sản phẩm bị mờ kh&ocirc;ng đọc được, bị cạo, bị sửa hoặc r&aacute;ch;</p>\r\n<p>\r\n	- Hỏng do thi&ecirc;n tai, hoả hoạn, nguồn điện kh&ocirc;ng b&igrave;nh thường;</p>\r\n<p>\r\n	- Sản phẩm bị rơi, bị va đập. Sản phẩm bị lỗi do Qu&yacute; kh&aacute;ch vận chuyển hoặc lắp đặt sai quy c&aacute;ch;</p>\r\n<p>\r\n	- Sản phẩm kh&ocirc;ng c&ograve;n nguy&ecirc;n trạng th&aacute;i vật l&yacute; ban đầu;</p>\r\n<p>\r\n	- Sản phẩm c&oacute; dấu hiệu đ&atilde; bị c&ocirc;n tr&ugrave;ng x&acirc;m nhập;</p>\r\n<p>\r\n	- C&aacute;c phụ kiện ti&ecirc;u hao trong qu&aacute; tr&igrave;nh sử dụng như hộp mực, băng mực, đầu kim, băng xo&aacute;, quạt, c&aacute;c loại c&aacute;p&hellip;</p>\r\n<p>\r\n	Sản phẩm bị lỗi do kh&aacute;ch h&agrave;ng tự &yacute; sửa chữa trước khi đem đi bảo h&agrave;nh</p>\r\n<p>\r\n	- Đối với những thiết bị của qu&iacute; kh&aacute;ch mua qu&aacute; thời gian 01 th&aacute;ng th&igrave; c&aacute;c thiết bị trả h&agrave;ng bảo h&agrave;nh của c&ocirc;ng ty Alphatek&nbsp; c&oacute; thể l&agrave; mới 100% hoặc c&oacute; thể kh&ocirc;ng mới 100% nhưng tất cả đều trong trạng th&aacute;i hoạt động tốt.</p>\r\n<p>\r\n	- Ch&iacute;nh s&aacute;ch bảo h&agrave;nh &quot;1 đổi 1&quot; kh&ocirc;ng được &aacute;p dụng cho một số thiết bị đặc biệt như: Notebook, Server, Projector, Photocopy... &amp; c&aacute;c thiết bị m&agrave; qu&iacute; kh&aacute;ch h&agrave;ng đ&atilde; chọn phương thức tự mang đến TT bảo h&agrave;nh của h&atilde;ng.</p>\r\n<p align=\"justify\">\r\n	- Những thiết bị mang đến bảo h&agrave;nh phải c&oacute; đầy đủ điều kiện để được bảo h&agrave;nh theo qui chế bảo h&agrave;nh của Alphatek<br />\r\n	<br />\r\n	- Trong trường hợp thiết bị hỏng của qu&iacute; kh&aacute;ch kh&ocirc;ng thể sửa chữa được m&agrave; kh&ocirc;ng c&ograve;n mua được tr&ecirc;n thị trường th&igrave; ch&uacute;ng t&ocirc;i sẽ đổi cho qu&iacute; kh&aacute;ch thiết bị kh&aacute;c ho&agrave;n to&agrave;n tương đương với thiết bị hỏng nhưng ở t&igrave;nh trạng hoạt động tốt. Trường hợp qu&iacute; kh&aacute;ch chưa ưng &yacute; với thiết bị thay thế tương đương th&igrave; ch&uacute;ng t&ocirc;i sẽ nhập lại theo gi&aacute; thoả thuận giữa hai b&ecirc;n</p>\r\n', '2011-03-10 00:00:00', '2011-03-10 00:00:00', '0000-00-00 00:00:00', 0, 1),
(3, 0, 1, 'Hỗ trợ trực tuyến', '', '<div style=\"padding-left: 30px;\">\r\n	<p>\r\n		<b>Ph&ograve;ng kỹ thuật</b></p>\r\n	<p style=\"padding-left: 30px;\">\r\n		<a href=\"ymsgr:sendIM?quoccuong\"><img border=\"0\" src=\"http://opi.yahoo.com/online?u=quoccuong&amp;m=g&amp;t=2\" vspace=\"3\" /></a></p>\r\n	<p>\r\n		<b>Ph&ograve;ng kinh doanh</b></p>\r\n	<p style=\"padding-left: 30px;\">\r\n		<a href=\"ymsgr:sendIM?quoccuong\"><img border=\"0\" src=\"http://opi.yahoo.com/online?u=quoccuong&amp;m=g&amp;t=2\" vspace=\"3\" /></a><br />\r\n		<a href=\"ymsgr:sendIM?quoccuong\"><img border=\"0\" src=\"http://opi.yahoo.com/online?u=quoccuong&amp;m=g&amp;t=2\" vspace=\"3\" /></a></p>\r\n</div>\r\n', '2011-03-20 00:00:00', '2011-03-20 00:00:00', '0000-00-00 00:00:00', 0, 1),
(4, 195, 1, 'MacBook Pro 15 inch dùng chip Intel Core i5 và Core i7', '<table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"100%\">\r\n	<tbody>\r\n		<tr>\r\n			<td>\r\n				<table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"100%\">\r\n					<tbody>\r\n						<tr valign=\"top\">\r\n							<td width=\"100\">\r\n								<a href=\"http://vitinhphongvu.com/index.php?ava=show&amp;ArtID=637\"><img src=\"http://vitinhphongvu.com/multidata/news/13933166MT1.jpg\" style=\"width: 100px; height: 90px; border-width: 0px; border-style: solid; margin: 2px 5px; float: left;\" /></a></td>\r\n							<td width=\"5\">\r\n								&nbsp;</td>\r\n							<td>\r\n								<table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"100%\">\r\n									<tbody>\r\n										<tr>\r\n											<td>\r\n												&nbsp;</td>\r\n										</tr>\r\n										<tr>\r\n											<td style=\"text-align: justify;\">\r\n												Một điểm nổi bật kh&aacute;c của d&ograve;ng sản phẩm n&agrave;y l&agrave; ứng dụng c&ocirc;ng nghệ chuyển đổi đồ họa mới giữa card NVIDIA GeForce GT330M v&agrave; Intel HD Graphic.</td>\r\n										</tr>\r\n									</tbody>\r\n								</table>\r\n							</td>\r\n						</tr>\r\n					</tbody>\r\n				</table>\r\n			</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n<p>\r\n	&nbsp;</p>\r\n', '<div align=\"justify\">\r\n	<strong><font color=\"#5f5f5f\"><font size=\"3\"><font face=\"Times\">Một điểm nổi bật kh&aacute;c của d&ograve;ng sản phẩm n&agrave;y l&agrave; ứng dụng c&ocirc;ng nghệ chuyển đổi đồ họa mới giữa card NVIDIA GeForce GT330M v&agrave; Intel HD Graphic. </font></font></font></strong>\r\n	<p class=\"normal\">\r\n		<font size=\"3\"><font face=\"Times\">Cả hai bộ vi xử l&yacute; Core i7 v&agrave; Core i5 đều ứng dụng c&ocirc;ng nghệ tăng tốc Turbo Boost, gi&uacute;p tăng hiệu suất m&aacute;y t&iacute;nh th&ecirc;m 20%. Nhờ đ&oacute;, hệ thống hoạt động nhanh hơn, đồng thời k&eacute;o d&agrave;i thời lượng pin bằng c&aacute;ch tự điều chỉnh xung nhịp của từng nh&acirc;n độc lập cho ph&ugrave; hợp nhu cầu xử l&yacute;. B&ecirc;n cạnh đ&oacute;, mạch điều khiển bộ nhớ t&iacute;ch hợp (integrated memory controller) cũng được Intel ứng dụng v&agrave;o chip, gi&uacute;p tốc độ trao đổi dữ liệu giữa nh&acirc;n v&agrave; bộ nhớ nhanh hơn hẳn khi c&aacute;c th&agrave;nh tố nằm t&aacute;ch biệt tr&ecirc;n bảng mạch.</font></font></p>\r\n	<p class=\"normal\">\r\n		<font size=\"3\"><font face=\"Times\">Đặc biệt, chip Core i5 v&agrave; Core i7 c&ograve;n được ứng dụng c&ocirc;ng nghệ si&ecirc;u ph&acirc;n luồng (Hyper-Threading), cung cấp 2 luồng (thread) tr&ecirc;n mỗi nh&acirc;n, tức l&agrave; tăng gấp đ&ocirc;i số t&aacute;c vụ m&agrave; một bộ vi xử l&yacute; c&oacute; thể thực thi. N&oacute;i một c&aacute;ch đơn giản, chip 4 nh&acirc;n Core i7 c&oacute; thể chạy c&ugrave;ng một l&uacute;c 8 luồng (nhờ c&ocirc;ng nghệ Si&ecirc;u ph&acirc;n luồng) v&agrave; tăng hiệu suất l&ecirc;n th&ecirc;m 20% (nhờ c&ocirc;ng nghệ Turbo Boost). Chip 2 nh&acirc;n Core i5 cũng tương tự. Bởi vậy, bạn c&oacute; thể thoải m&aacute;i chơi game &ldquo;nặng&rdquo;, xem phim HD hay thậm ch&iacute; chạy 3Ds Max. </font></font></p>\r\n	<p class=\"normal\">\r\n		<font size=\"3\"><font face=\"Times\"><img alt=\"align=baseline\" border=\"0\" hspace=\"0\" src=\"http://vnexpress.net/Files/Subject/3B/A2/00/82/09mbp17aperture.jpg\" /></font></font></p>\r\n	<div align=\"center\">\r\n		<p align=\"left\" class=\"Normal\">\r\n			Với m&aacute;y t&iacute;nh t&iacute;ch hợp chip Core i5, bạn c&oacute; thể chuyển đổi định dạng ba đoạn phim c&oacute; độ d&agrave;i 10 ph&uacute;t để đăng tải l&ecirc;n YouTube trong v&ograve;ng 79 gi&acirc;y &ndash; nhanh gấp 3 lần so với chip Pentium Dual Core (gần 4 ph&uacute;t). Core i5 cũng c&oacute; thể chỉnh sửa ảnh nhanh gấp gần 2 lần so với Pentium Dual Core; chuyển đổi hơn 10 b&agrave;i h&aacute;t chỉ trong 5 ph&uacute;t v&agrave; ti&ecirc;u thụ &iacute;t điện năng hơn đ&aacute;ng kể so với những d&ograve;ng vi xử l&yacute; trước đ&oacute;. Ri&ecirc;ng Core i7 thậm ch&iacute; nhanh hơn gấp 4 lần Pentium Dual Core khi chạy thử nghiệm một số tr&ograve; chơi điện tử.</p>\r\n		<p align=\"left\" class=\"Normal\">\r\n			Nhờ ứng dụng c&ocirc;ng nghệ mới về xử l&yacute; đồ họa, sản phẩm cho chất lượng h&igrave;nh ảnh đẹp, đồng thời vẫn k&eacute;o d&agrave;i thời gian sử dụng pin. MacBook Pro 15&rdquo; c&ograve;n được t&iacute;ch hợp 2 chip đồ họa: NVIDIA GeForce GT 330M mới cho những xử l&yacute; đồ họa cao, Intel HD Graphics cho những xử l&yacute; thấp hơn v&agrave; được ứng dụng c&ocirc;ng nghệ tự động chuyển đổi đồ họa. C&ocirc;ng nghệ n&agrave;y của Apple sẽ x&aacute;c định y&ecirc;u cầu về h&igrave;nh ảnh của ứng dụng bạn đang mở, từ đ&oacute; thay đổi bộ vi xử l&yacute; h&igrave;nh ảnh nhằm mang lại hiệu suất cao đồng thời vẫn tiết kiệm năng lượng.</p>\r\n		<p align=\"left\" class=\"Normal\">\r\n			D&ograve;ng MacBook Pro 15&rdquo; kế thừa những t&iacute;nh năng độc đ&aacute;o truyền thống của sản phẩm m&aacute;y t&iacute;nh Apple. Thiết kế vỏ nh&ocirc;m unibody đem lại cho MacBook Pro sự chắc chắn nhưng cũng kh&ocirc;ng k&eacute;m phần thời trang. B&agrave;n di chuột đa chạm được chế tạo từ thủy tinh hỗ trợ di chuyển một c&aacute;ch trực quan hơn, gi&uacute;p bạn dễ d&agrave;ng duyệt văn bản hay trang web d&agrave;i v&agrave; truy cập c&aacute;c thư viện h&igrave;nh ảnh lớn. Hệ thống đ&egrave;n LED-backlist m&agrave;n h&igrave;nh s&aacute;ng, g&oacute;c hiển thị rộng v&agrave; dải m&agrave;u phong ph&uacute;. Một ưu điểm nữa của MacBook Pro l&agrave; sản phẩm rất &ldquo;green&rdquo; v&igrave; được sản xuất với c&aacute;c loại vật liệu c&oacute; thể t&aacute;i chế v&agrave; kh&ocirc;ng chứa c&aacute;c chất độc hại đối với m&ocirc;i trường.</p>\r\n		<p align=\"left\" class=\"Normal\">\r\n			C&ocirc;ng ty Ph&acirc;n Phối FPT sẽ tặng phiếu mua phụ kiện m&aacute;y t&iacute;nh trị gi&aacute; 960.000 đồng cho c&aacute;c bạn sinh vi&ecirc;n khi mua c&aacute;c sản phẩm m&aacute;y t&iacute;nh Apple ch&iacute;nh h&atilde;ng tại c&aacute;c đại l&yacute; ủy quyền của C&ocirc;ng ty từ 4 đến 19/9.</p>\r\n		<p align=\"left\" class=\"Normal\">\r\n			Để biết th&ecirc;m th&ocirc;ng tin chi tiết, vui l&ograve;ng truy cập website: <a class=\"Normal\" href=\"http://istore.vn/\">http://istore.vn/</a></p>\r\n		<p align=\"right\" class=\"Normal\">\r\n			(Nguồn: <em>C&ocirc;ng ty TNHH Ph&acirc;n Phối FPT</em>)</p>\r\n	</div>\r\n</div>\r\n', '2011-03-20 00:00:00', '2011-03-20 00:00:00', '0000-00-00 00:00:00', 0, 1),
(5, 196, 1, 'Compaq Presario CQ42AX tiết kiệm năng lượng', '<table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"100%\">\r\n	<tbody>\r\n		<tr>\r\n			<td>\r\n				<table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"100%\">\r\n					<tbody>\r\n						<tr valign=\"top\">\r\n							<td width=\"100\">\r\n								<a href=\"http://vitinhphongvu.com/index.php?ava=show&amp;ArtID=669\"><img src=\"http://vitinhphongvu.com/multidata/news/1368594compact5.jpg\" style=\"width: 100px; height: 100px; border-width: 0px; border-style: solid; margin: 2px 5px; float: left;\" /></a></td>\r\n							<td width=\"5\">\r\n								&nbsp;</td>\r\n							<td>\r\n								<table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"100%\">\r\n									<tbody>\r\n										<tr>\r\n											<td>\r\n												&nbsp;</td>\r\n										</tr>\r\n										<tr>\r\n											<td style=\"text-align: justify;\">\r\n												Laptop n&agrave;y sử dụng chip AMD Phenom thế hệ 2 c&oacute; thể hoạt động mạnh mẽ với 3 hoặc 4 l&otilde;i ho&agrave;n chỉnh (4 l&otilde;i Intel chỉ c&oacute; ở i7-7xxM) nhưng mức ti&ecirc;u thụ năng lượng chỉ bằng Core i3 (35 Watts).</td>\r\n										</tr>\r\n									</tbody>\r\n								</table>\r\n							</td>\r\n						</tr>\r\n					</tbody>\r\n				</table>\r\n			</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n<p>\r\n	&nbsp;</p>\r\n', '<p>\r\n	<b>Laptop n&agrave;y sử dụng chip AMD Phenom thế hệ 2 c&oacute; thể hoạt động mạnh mẽ với 3 hoặc 4 l&otilde;i ho&agrave;n chỉnh (4 l&otilde;i Intel chỉ c&oacute; ở i7-7xxM) nhưng mức ti&ecirc;u thụ năng lượng chỉ bằng Core i3 (35 Watts).</b></p>\r\n<p class=\"Normal\">\r\n	Compaq Presario CQ42-223AX t&iacute;ch hợp c&ocirc;ng nghệ Vision Ultimate của AMD cho trải nghiệm giải tr&iacute; HD mượt m&agrave; với Card ATI Mobility Radeon HD 545v. M&aacute;y c&oacute; ổ cứng tốc độ cao (7.200 v&ograve;ng mỗi ph&uacute;t) v&agrave; dung lượng 320 GB gi&uacute;p người d&ugrave;ng c&oacute; thể giải tr&iacute; chất lượng si&ecirc;u tốc độ cũng như chia sẻ v&agrave; lưu trữ nhiều dữ liệu.</p>\r\n<p align=\"center\">\r\n	<img alt=\"align=baseline\" border=\"0\" hspace=\"0\" src=\"http://vnexpress.net/Files/Subject/3b/a2/74/c4/compact5.jpg\" /></p>\r\n<h1 align=\"center\" class=\"Title\">\r\n	<strong><font size=\"3\">Cấu h&igrave;nh Compaq Presario CQ42-223AX </font></strong></h1>\r\n<p align=\"center\" class=\"Normal\">\r\n	<font color=\"#000000\" size=\"2\">Vi xử l&yacute;: AMD Phenom II X4 N930 Mobile processor (2,0 GHz, 2MB L2 Cache).</font></p>\r\n<p align=\"center\" class=\"Normal\">\r\n	<font color=\"#000000\" size=\"2\">Cấu h&igrave;nh: 2 GB DDR3, 320GB HDD 7200rpm, DVD&plusmn;RW Double Layer.</font></p>\r\n<p align=\"center\" class=\"Normal\">\r\n	<font color=\"#000000\" size=\"2\">M&agrave;n h&igrave;nh 14 inch HD LED BrightView. </font></p>\r\n<p align=\"center\" class=\"Normal\">\r\n	<font color=\"#000000\" size=\"2\">Đồ hoạ 512MB DDR3 ATI Mobility Radeon HD 545v graphics (Dedicated).</font></p>\r\n<p align=\"center\" class=\"Normal\">\r\n	<font color=\"#000000\" size=\"2\">Kết nối: Wireless 802.11b/g.</font></p>\r\n', '2011-03-20 00:00:00', '2011-03-20 00:00:00', '0000-00-00 00:00:00', 0, 1),
(6, 196, 1, 'LCD Razor LED mỏng 12,9 mm', '<table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"100%\">\r\n	<tbody>\r\n		<tr>\r\n			<td>\r\n				<table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"100%\">\r\n					<tbody>\r\n						<tr valign=\"top\">\r\n							<td width=\"100\">\r\n								<a href=\"http://vitinhphongvu.com/index.php?ava=show&amp;ArtID=653\"><img src=\"http://vitinhphongvu.com/multidata/news/14018614E943FW.jpg\" style=\"width: 100px; height: 100px; border-width: 0px; border-style: solid; margin: 2px 5px; float: left;\" /></a></td>\r\n							<td width=\"5\">\r\n								&nbsp;</td>\r\n							<td>\r\n								<table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"100%\">\r\n									<tbody>\r\n										<tr>\r\n											<td>\r\n												&nbsp;</td>\r\n										</tr>\r\n										<tr>\r\n											<td style=\"text-align: justify;\">\r\n												Kh&ocirc;ng chỉ si&ecirc;u mỏng, AOC Razor LED c&ograve;n c&oacute; thể v&agrave;o gắn tường v&agrave; điều chỉnh độ nghi&ecirc;ng ph&ugrave; hợp với mọi g&oacute;c nh&igrave;n. Sản phẩm c&oacute; độ tương phản động l&ecirc;n tới 50.000.000:1.</td>\r\n										</tr>\r\n									</tbody>\r\n								</table>\r\n							</td>\r\n						</tr>\r\n					</tbody>\r\n				</table>\r\n			</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n<p>\r\n	&nbsp;</p>\r\n', '<p>\r\n	<b>Kh&ocirc;ng chỉ si&ecirc;u mỏng, AOC Razor LED c&ograve;n c&oacute; thể v&agrave;o gắn tường v&agrave; điều chỉnh độ nghi&ecirc;ng ph&ugrave; hợp với mọi g&oacute;c nh&igrave;n. Sản phẩm c&oacute; độ tương phản động l&ecirc;n tới 50.000.000:1.</b></p>\r\n<p align=\"left\" class=\"Normal\">\r\n	AOC cho ra mắt m&agrave;n h&igrave;nh Razor LED 43ID mỏng nhất từ trước đến nay, với bề d&agrave;y chỉ 12,9 mm. Kh&ocirc;ng chỉ mạnh về thiết kế si&ecirc;u mỏng, ch&acirc;n đế của AOC Razor LED c&ograve;n c&oacute; khả năng gắn tường v&agrave; điều chỉnh độ nghi&ecirc;ng ph&ugrave; hợp với mọi g&oacute;c nh&igrave;n của bạn. Kiểu d&aacute;ng thanh mảnh, thời trang, AOC Razor LED gi&uacute;p kh&ocirc;ng gian l&agrave;m việc của bạn trở n&ecirc;n gọn g&agrave;ng v&agrave; ấn tượng hơn. AOC Razor LED ứng dụng tối đa hiệu quả của c&ocirc;ng nghệ LED mới nhất cho độ tương phản động l&ecirc;n đến 50.000.000:1.</p>\r\n<table align=\"center\" border=\"0\" cellpadding=\"3\" cellspacing=\"0\" width=\"1\">\r\n	<tbody>\r\n		<tr>\r\n			<td>\r\n				<img border=\"1\" height=\"310\" src=\"http://vnexpress.net/Files/Subject/3B/A2/3B/40/Hinh_1_400x310.jpg\" width=\"400\" /></td>\r\n		</tr>\r\n		<tr>\r\n			<td class=\"Image\">\r\n				Razor LED e943Fw v&agrave; e2043F &ndash; Rực rỡ hơn với độ tương phản l&ecirc;n đến 50.000.000:1</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n<p class=\"Normal\">\r\n	Hai model mới nhất của Razor l&agrave; e943Fw (18,5 inch) v&agrave; e2043F (20 inch) c&oacute; thiết kế giống nhau. C&aacute;c ph&iacute;m điều khiển cảm ứng c&ugrave;ng với c&aacute;c biểu tượng đồ họa OSD l&agrave;m cho menu điều chỉnh dễ sử dụng ngay cả trong điều kiện ph&ograve;ng thiếu &aacute;nh s&aacute;ng. Đ&egrave;n nền LED kh&ocirc;ng chứa chất thủy ng&acirc;n tiết kiệm đến 50% năng lượng so với m&agrave;n h&igrave;nh CCFL truyền thống. Năng lượng ti&ecirc;u thụ tiếp tục giảm nhờ c&ocirc;ng nghệ e-Saver. Thử nghiệm cho thấy mức ti&ecirc;u thụ của E943Fw v&agrave; E2043F chỉ khoảng 21W cho điều kiện s&aacute;ng tối đa, điều n&agrave;y g&oacute;p phần tăng cao tuổi thọ m&agrave;n h&igrave;nh. M&agrave;n h&igrave;nh kh&aacute; mỏng nhưng AOC Razor 43ID được trang bị c&ocirc;ng nghệ mới n&ecirc;n rất m&aacute;t khi sử dụng. Sau khi sử dụng 2 giờ li&ecirc;n tục, nhiệt độ mặt sau của m&agrave;n h&igrave;nh chỉ khoảng 28 độ C.</p>\r\n<table align=\"center\" border=\"0\" cellpadding=\"3\" cellspacing=\"0\" width=\"1\">\r\n	<tbody>\r\n		<tr>\r\n			<td>\r\n				<img border=\"1\" height=\"290\" src=\"http://vnexpress.net/Files/Subject/3B/A2/3B/40/Hinh-2_400x290.jpg\" width=\"400\" /></td>\r\n		</tr>\r\n		<tr>\r\n			<td class=\"Image\">\r\n				M&agrave;n h&igrave;nh AOC Razor LED &ndash; Ấn tượng với độ mỏng chỉ 12.9mm.</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n<p class=\"Normal\">\r\n	B&ecirc;n cạnh d&ograve;ng Razor LED, AOC c&ograve;n cho ra mắt m&agrave;n h&igrave;nh Luvia e2237Fwh (21,5 inch) sử dụng bộ cảm biến i-Care được d&ugrave;ng để tự động điều chỉnh độ s&aacute;ng của m&agrave;n h&igrave;nh t&ugrave;y theo &aacute;nh s&aacute;ng m&ocirc;i trường xung quanh. Đơn giản l&agrave; khi ngồi l&agrave;m việc m&agrave;n h&igrave;nh sẽ cảm ứng với &aacute;nh s&aacute;ng m&ocirc;i trường v&agrave; cho ph&eacute;p người d&ugrave;ng sử dụng với độ s&aacute;ng tốt nhất. Khi bạn rời b&agrave;n l&agrave;m việc, m&agrave;n h&igrave;nh sẽ tự động tối đi gi&uacute;p tiết kiệm tối đa điện năng ti&ecirc;u thụ.</p>\r\n<table align=\"center\" border=\"0\" cellpadding=\"3\" cellspacing=\"0\" width=\"1\">\r\n	<tbody>\r\n		<tr>\r\n			<td>\r\n				<img border=\"1\" height=\"293\" src=\"http://vnexpress.net/Files/Subject/3B/A2/3B/40/Hinh_3_400x293.jpg\" width=\"400\" /></td>\r\n		</tr>\r\n		<tr>\r\n			<td class=\"Image\">\r\n				Luvia e2237Fwh với chức năng cảm biến cảm biến &aacute;nh s&aacute;ng i-Care độc đ&aacute;o.</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n<p class=\"Normal\">\r\n	Bộ ba AOC tương t&aacute;c tốt th&ocirc;ng qua chế độ hỗ trợ 14 ng&ocirc;n ngữ v&agrave; được trang bị đầy đủ cổng kết nối cho c&aacute;c thiết bị ngoại vi. Tần số qu&eacute;t nằm ở mức 60 Hz sản phẩm hiển thị độ ph&acirc;n giải cụ thể: e943Fw l&agrave; 1366x768, e2043F l&agrave; 1600x900 v&agrave; e2237Fwh l&agrave; 1920x1080.</p>\r\n<p align=\"right\" class=\"Normal\">\r\n	(Nguồn<em>: H&atilde;ng AOC Việt Nam)</em></p>\r\n', '2011-03-20 00:00:00', '2011-03-20 00:00:00', '0000-00-00 00:00:00', 0, 1),
(7, 196, 1, 'Dell làm mới dòng Vostro V13 với nhiều cải tiến', '<table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"100%\">\r\n	<tbody>\r\n		<tr>\r\n			<td>\r\n				<table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"100%\">\r\n					<tbody>\r\n						<tr valign=\"top\">\r\n							<td width=\"100\">\r\n								<a href=\"http://vitinhphongvu.com/index.php?ava=show&amp;ArtID=651\"><img src=\"http://vitinhphongvu.com/multidata/news/11914143464cf51a1c9970d_vostro-v130-overview1.jpg\" style=\"border-width: 0px; border-style: solid; margin: 2px 5px; float: left; width: 100px; height: 70px;\" /></a></td>\r\n							<td width=\"5\">\r\n								&nbsp;</td>\r\n							<td>\r\n								<table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"100%\">\r\n									<tbody>\r\n										<tr>\r\n											<td>\r\n												&nbsp;</td>\r\n										</tr>\r\n										<tr>\r\n											<td style=\"text-align: justify;\">\r\n												Dell vừa qua đ&atilde; ch&iacute;nh thức giới thiệu d&ograve;ng laptop si&ecirc;u mỏng, gi&aacute; rẻ mới nhất của m&igrave;nh với t&ecirc;n gọi Vostro V130 thay thế cho V13 đ&atilde; ra mắt được 1 năm nay. Đ&acirc;y cũng ch&iacute;nh l&agrave; ch&uacute; laptop đầu ti&ecirc;n sử dụng c&ocirc;ng nghệ l&agrave;m m&aacute;t mới của Intel &quot;Hyperbaric Cooling&quot;. M&aacute;y sử dụng một quạt với nhiệm vụ l&agrave; h&uacute;t kh&ocirc;ng kh&iacute; từ b&ecirc;n ngo&agrave;i v&agrave;o để l&agrave;m m&aacute;t hệ thống, đặc biệt l&agrave; CPU. C&ocirc;ng nghệ mới n&agrave;y cho ph&eacute;p quạt chạy ở tốc độ thấp nhằm giảm thiệu tiếng ồn v&agrave; gi&uacute;p m&aacute;y chạy &ecirc;m hơn.</td>\r\n										</tr>\r\n									</tbody>\r\n								</table>\r\n							</td>\r\n						</tr>\r\n					</tbody>\r\n				</table>\r\n			</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n<p>\r\n	&nbsp;</p>\r\n', '<p>\r\n	<b>Dell vừa qua đ&atilde; ch&iacute;nh thức giới thiệu d&ograve;ng laptop si&ecirc;u mỏng, gi&aacute; rẻ mới nhất của m&igrave;nh với t&ecirc;n gọi Vostro V130 thay thế cho V13 đ&atilde; ra mắt được 1 năm nay. Đ&acirc;y cũng ch&iacute;nh l&agrave; ch&uacute; laptop đầu ti&ecirc;n sử dụng c&ocirc;ng nghệ l&agrave;m m&aacute;t mới của Intel &quot;Hyperbaric Cooling&quot;. M&aacute;y sử dụng một quạt với nhiệm vụ l&agrave; h&uacute;t kh&ocirc;ng kh&iacute; từ b&ecirc;n ngo&agrave;i v&agrave;o để l&agrave;m m&aacute;t hệ thống, đặc biệt l&agrave; CPU. C&ocirc;ng nghệ mới n&agrave;y cho ph&eacute;p quạt chạy ở tốc độ thấp nhằm giảm thiệu tiếng ồn v&agrave; gi&uacute;p m&aacute;y chạy &ecirc;m hơn. </b></p>\r\n<div align=\"center\">\r\n	<img alt=\"align=baseline\" border=\"0\" hspace=\"0\" src=\"http://photo.tinhte.vn/attach/public_image/btv/46/464cf51a1c9970d_vostro-v130-overview1.jpg\" /></div>\r\n<p>\r\n	<font color=\"#000000\">Với thiết kế gần giống đ&agrave;n anh V13, vỏ m&aacute;y Vostro V130 được cấu tạo từ hợp kim magie v&agrave; khung nh&ocirc;m chắc chắn. Kiểu d&aacute;ng si&ecirc;u mỏng với điểm mỏng nhất l&agrave; 16.5 mm v&agrave; dầy nhất l&agrave; 19.8mm. Với pin 6 cell gắn liền th&acirc;n, khối lượng tổng l&agrave; 1,59kg.</font> Vostro V130 vẫn sử dụng m&agrave;n h&igrave;nh 13.3 nhưng xử dụng BXL mới Core i3 hay Core i5 tiết kiệm điện năng (CULV) của Intel. M&aacute;y c&oacute; ram 4GB v&agrave; ổ đĩa cứng 640GB, ngo&agrave;i ra c&ograve;n được bổ xung th&ecirc;m cổng kết nối HDMI, hai USB, eSATA v&agrave; cổng ra VGA.<br />\r\n	<br />\r\n	<font color=\"#000000\">Dell Vostro V130&nbsp;cấu h&igrave;nh ti&ecirc;u chuẩn:</font></p>\r\n<br />\r\n<ul>\r\n	<li>\r\n		<font color=\"#000000\">OS: Ubuntu 10.04</font></li>\r\n	<li>\r\n		<font color=\"#000000\">BXL: Intel&reg; Celeron&trade; Processor ULV U3400 (2M Cache, 1.06GHz, 800 MHz FSB)</font></li>\r\n	<li>\r\n		<font color=\"#000000\">RAM: 2.0GB, DDR3-1333MHz, 1 thanh</font></li>\r\n	<li>\r\n		<font color=\"#000000\">HDD: 250GB 5400RPM</font></li>\r\n	<li>\r\n		<font color=\"#000000\">M&agrave;n h&igrave;nh: 13.3 inch WLED (1366x768), Anti-Glare Mobile Intel&reg; Graphics Media Accelerator HD</font></li>\r\n	<li>\r\n		<font color=\"#000000\">Kết nối: wifi 802.11n, bluetooth 3.0</font></li>\r\n	<li>\r\n		<font color=\"#000000\">Webcame: 2.0MP k&egrave;m mic</font></li>\r\n	<li>\r\n		<font color=\"#000000\">Pin gắn trong 6-cell 30WHr</font></li>\r\n</ul>\r\n<div align=\"center\">\r\n	<img alt=\"align=baseline\" border=\"0\" hspace=\"0\" src=\"http://photo.tinhte.vn/attach/public_image/btv/46/464cf51a249533f_vostrov130081000031500f00rd.jpg\" /></div>\r\n<div align=\"center\">\r\n	<img alt=\"align=baseline\" border=\"0\" hspace=\"0\" src=\"http://photo.tinhte.vn/attach/public_image/btv/46/464cf51a2917e9a_vostrov1300810000300180b90rd.jpg\" /></div>\r\n<div align=\"center\">\r\n	<img alt=\"align=baseline\" border=\"0\" hspace=\"0\" src=\"http://photo.tinhte.vn/attach/public_image/btv/46/464cf51a2102085_vostrov130081000030090l90rd.jpg\" /><br />\r\n	<br />\r\n	&nbsp;</div>\r\n<p>\r\n	<font color=\"#000000\"><i><b>Nguồn: <a href=\"http://www.engadget.com/2010/11/30/dell-vostro-v130-updated-with-more-ports-fancy-hyperbaric-coo/\" rel=\"nofollow\" target=\"_blank\"><font color=\"#00528b\">engadget</font></a></b></i></font></p>\r\n', '2011-03-20 00:00:00', '2011-03-20 00:00:00', '0000-00-00 00:00:00', 0, 1),
(8, 0, 1, 'Công ty cổ phần thương mại dịch vụ Alphatek Computer', '', '<div style=\"padding-left: 30px;\">\r\n	<div>\r\n		Địa chỉ: 357 L&ecirc; Hồng Ph&ograve;ng, P2, Q10</div>\r\n	<div>\r\n		ĐT: 38337980 - Fax: 38337982</div>\r\n<div>\r\n		Email: alphatek@hcmuns.edu.vn</div>\r\n</div>\r\n<h3>\r\n	Bản đồ đường đi</h3>\r\n<p>\r\n	<img alt=\"ban do\" src=\"images/tin_tuc/dia_chi_cua_hang.png\" /></p>\r\n', '2011-03-23 00:00:00', '2011-03-23 00:00:00', '0000-00-00 00:00:00', 0, 1);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `product`
--

CREATE TABLE `product` (
  `ma_san_pham` int(11) NOT NULL,
  `ten_san_pham` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `ma_loai` varchar(3) COLLATE utf8_unicode_ci NOT NULL,
  `mo_ta_tom_tat` text COLLATE utf8_unicode_ci,
  `mo_ta_chi_tiet` text COLLATE utf8_unicode_ci,
  `don_gia` int(11) NOT NULL DEFAULT '0',
  `hinh` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL,
  `san_pham_moi` tinyint(4) NOT NULL DEFAULT '0',
  `so_lan_xem` int(11) NOT NULL,
  `ngay_tao` date NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `product`
--

INSERT INTO `product` (`ma_san_pham`, `ten_san_pham`, `ma_loai`, `mo_ta_tom_tat`, `mo_ta_chi_tiet`, `don_gia`, `hinh`, `san_pham_moi`, `so_lan_xem`, `ngay_tao`) VALUES
(31, 'LG LCD Monitor 18.5” Wide TFT (W1941S)', '14', 'LG LCD Monitor 18.5” Wide TFT (W1941S) - 5 ms; 1440 x 900', '<div class=\"product_content clearfix\">\r\n<p>LG LCD Monitor 18.5” Wide TFT (W1941S) - 5 ms; 1440 x 900</p>\r\n<p>BH: 24 tháng </p></div>', 2120000, '_LG_LCD_Monitor__4ace01a23dc26.jpg', 0, 34, '2011-03-11'),
(36, 'Intel Pentium E5300 - 2.6 GHz', '11', 'Pentium E5300 - 2.6 GHz - 2MB - 64 bit - Dual Core - bus 800 - SK 775 - Box', '<p>Pentium E5300 - 2.6 GHz - 2MB - 64 bit - Dual Core - bus 800 - SK 775 - Box</p>\r\n<p>BH: 36 tháng</p>', 1335000, 'Intel_Pentium_E5_4ad2a13e870b7.jpg', 0, 273, '2011-03-11'),
(37, 'Mitsumi Keyboard PS/2 - Black', '24', 'Mitsumi Keyboard PS/2 - Black', '<p>Mitsumi Keyboard PS/2 - Black</p>\r\n<p>BH: 06 tháng</p>', 175000, 'Mitsumi_Keyboard_4ad2a17db8b12.jpg', 1, 261, '2011-03-11'),
(34, 'Kingston DDR2 1.0GB bus 800', '12', 'Kingston DDR2 1.0GB bus 800', '<p>Kingston DDR2 1.0GB bus 800</p>\r\n<p>BH: 36 tháng</p>', 530000, 'Kingston_DDR2_1._4ad29cf7df199.jpg', 1, 485, '2011-03-11'),
(33, 'DELL Inspiron 1440 (S560602 - Black )', '36', 'Pentium Dual-Core T4200 (2x2.0GHz, FSB800MHz, 45nm) / 1MB Cache / 2GB DDR2-800 / VGA Intel GMA X4500MHD upto 512MB HDD 320GB SATA / DVD-RW / 14 LED Backlight wide 16:9 LCD / Pin 6 Cell / Wireless / Card Reader / Webcam / Bluetooth Weight 2.4Kg / Made in', '<div class=\"product_content clearfix\">\r\n<h2><span style=\"font-size: x-small;\">Pentium Dual-Core T4200 (2x2.0GHz, FSB800MHz, 45nm) / 1MB Cache / 2GB DDR2-800 / VGA Intel GMA X4500MHD upto 512MB HDD 320GB SATA / DVD-RW / 14 LED Backlight wide 16:9 LCD / Pin 6 Cell /  Wireless /  Card Reader / Webcam / Bluetooth Weight 2.4Kg  / Made in China - Phong cách trẻ trung ấn tương - LCD đèn nền LED siêu sáng, tiết kiệm pin - HDD dung lượng lớn</span></h2>\r\n<p>BH: 12 tháng</p>\r\n</div>\r\n<p> </p>', 10000000, 'DELL_Inspiron_14_4acea9b125b7f.jpg', 0, 141, '2011-03-11'),
(28, 'FOXCONN G31MV', '10', 'FOXCONN G31MV - Intel G31 chipset (Core 2 Duo & Core 2 Quad ) - 2 x Dual DDR2 667/800 ; VGA & Sound 6 Channel & NIC onboard; 1xPCI Express; 1xPCI; 2xSerial ATA; 800/ 1066/1333 FSB', '<p>FOXCONN G31MV - Intel G31 chipset (Core 2 Duo & Core 2 Quad ) - 2 x Dual DDR2 667/800 ; VGA & Sound 6 Channel & NIC onboard; 1xPCI Express; 1xPCI; 2xSerial ATA; 800/ 1066/1333 FSB</p>\r\n<p>BH: 36 tháng</p>', 865000, 'FOXCONN_G31MV_4ace00a24a98a.jpg', 0, 250, '2011-03-11'),
(29, 'FOXCONN G31MXP-K', '10', 'FOXCONN G31MXP-K - Intel G31 chipset (Core 2 Duo & Core 2 Quad Newest CPU) - 2 x Dual DDR2 667/800 ; VGA & Sound 6 Channel & Gigabit NIC (Realtek� RTL8111B) onboard; 1xPCI Express 16x; 1xPCI Express1x; 2xPCI; 4xSerial ATA; 800/ 1066/1333/1600 (OC) FSB', '<p>FOXCONN G31MXP-K - Intel G31 chipset (Core 2 Duo & Core 2 Quad Newest CPU) - 2 x Dual DDR2 667/800 ; VGA & Sound 6 Channel & Gigabit NIC (Realtek� RTL8111B) onboard; 1xPCI Express 16x; 1xPCI Express1x; 2xPCI; 4xSerial ATA; 800/ 1066/1333/1600 (OC) FSB</p><p>BH: 36 tháng </p>', 940000, 'FOXCONN_G31MXP_K_4ace00f8eba0d.jpg', 0, 328, '2011-03-11'),
(30, 'LG LCD Monitor 17 inches wide TFT (177WSB )', '14', 'LG LCD Monitor 17\" wide TFT (177WSB ) - 8 ms; 1440 x 900', '<div class=\"product_contentclearfix\">\r\n<h1>LG LCD Monitor 17\" wide TFT (177WSB ) - 8 ms; 1440 x 900</h1>\r\n<p>BH: 24 tháng</p>\r\n</div>', 2300000, '_LG_LCD_Monitor__4ace014ba5cf2.jpg', 0, 389, '2011-03-11'),
(35, 'SamSung Laser Printer ML-1640', '37', 'SamSung Laser Printer ML-1640 (A4, 600dpi, 16ppm, 8MB) - China - Màu đen', '<p> </p>\r\n<h1><span style=\"font-size: small;\">SamSung Laser Printer ML-1640 (A4, 600dpi, 16ppm, 8MB) - China - Màu đen</span></h1>\r\n<p>Bảo hành: 12 tháng</p>\r\n<p> </p>', 1850000, 'SamSung_Laser_Pr_4ad2a073cca36.jpg', 0, 462, '2011-03-11'),
(209, 'ADATA™ 4.0GB (2 x 2GB) DDR2 bus 800MHz', '12', 'ADATA™ 4.0GB (2 x 2GB) DDR2 bus 800MHz - VITESTA G series', '', 2000000, 'ADATA____4.0GB___4bad64fd00b94.jpg', 1, 141, '2011-03-11'),
(38, 'Bộ vi xử lý Celeron E1500 - 2.2 GHz', '11', 'Celeron E1500 - 2.2 GHz - 512K - Dual Core bus 800 - 64 bit - SK 775 - Box', '<div>\r\n<p><span style=\"font-size: small;\">Celeron E1500 - 2.2 GHz - 512K - Dual Core bus 800 - 64 bit - SK 775 - Box</span></p>\r\nBảo hành: 36 tháng</div>', 920000, '_B____vi_x____l__4aeaab1879238.jpg', 0, 320, '2011-03-11'),
(39, 'Celeron E3200 - 2.4 GHz', '11', 'Celeron E3200 - 2.4 GHz - 1MB - Dual Core bus 800 - 64 bit - SK 775 - Box', '<div>\r\n<p><span style=\"font-size: small;\">Celeron E3200 - 2.4 GHz - 1MB - Dual Core bus 800 - 64 bit - SK 775 - Box</span></p>\r\nBảo hành: 36 tháng</div>', 970000, 'Celeron_E3200____4aed5c7083cdd.jpg', 1, 174, '2011-03-11'),
(40, 'Canon Laser Printer LBP 3100B', '37', 'Canon Laser Printer LBP 3100B (A4, 600dpi, 16ppm, 2MB , kết nối USB ) - Viet nam', '<div>\r\n<p><span style=\"font-size: small;\">Canon Laser Printer LBP 3100B (A4, 600dpi, 16ppm, 2MB , kết nối USB ) - Viet nam</span></p>\r\nBảo hành: 12 tháng</div>', 2500000, '_Canon_Laser_Pri_4aed5d57b9fd6.jpg', 0, 412, '2011-03-11'),
(43, 'Gigabyte G31 ES2C', '10', 'GIGABYTE G31M-ES2L - Intel G31 chipset (Core 2 Quad) - 2xDual upto DDR2 800/1066MHz (O.C) (Max 4GB); X3100 w/384MB GDDR RAM & SOUND 8-CHANNEL High Definition audio & NIC Gigabit onboard; 4xSATA2 3Gb/s; 1xIDE ATA ; 8xUSB 2.0; 2xPCI; 1x PCI-E 16X (full supp', '', 1255000, 'Gigabyte_G31_S2C_4af11c984443b.jpg', 1, 36, '2011-03-11'),
(165, 'DELL Inspiron 1440 (S560807 - Blue ) Linux', '36', 'Pentium Dual-Core T4300 (2x2.1GHz, FSB800MHz, 45nm) / 1MB Cache / 2GB DDR2-800 / VGA Intel GMA X4500MHD upto 512MB HDD 320GB SATA / DVD-RW / 14\" LED Backlight wide 16:9 LCD / Pin 6 Cell / Wireless / Card Reader / Webcam/ Bluetooth Weight 2.4Kg / Made in C', '<div>Pentium Dual-Core T4300 (2x2.1GHz, FSB800MHz, 45nm) / 1MB Cache / 2GB DDR2-800 / VGA Intel GMA X4500MHD upto 512MB HDD 320GB SATA / DVD-RW / 14\" LED Backlight wide 16:9 LCD / Pin 6 Cell /  Wireless /  Card Reader / Webcam/ Bluetooth Weight 2.4Kg  / Made in China  - Phong cách trẻ trung ấn tương - LCD đèn nền LED siêu sáng, tiết kiệm pin - HDD dung lượng lớn<br />BH: 12 tháng</div>', 11400000, 'DELL_Inspiron_14_4af2caa81fa6f.jpg', 0, 444, '2011-03-11'),
(44, 'INTEL DG31PR', '10', 'INTEL DG31PR - Chipset G31 (Core 2 Duo & C2Q) - SK 775. 2x DDR2 667/800 (Max 4GB Ram) VGA, Sound 6 channel & Nic Gigabit onboard. 2x PCI- 1x PCI 16x , 4x SATA ; 1333/1066/800 FSB', '', 1190000, 'INTEL_DG31PR_4af11d21903e8.jpg', 1, 111, '2011-03-11'),
(45, 'INTEL BLKDG41TY', '10', 'INTEL BLKDG41TY - Intel G41 Chipset (Core 2 Duo & Core 2 Quad ) - dual-channel 2 x DDR2 800/667/533 MHz up to 8 GB, VGA ( Intel� GMA X4500 w/ Intel Clear Video Technology, VGA+DVI-D ) & Sound 6 Channel & NIC gigabit onboard ; 01 PCI Express 16x ; 6+4 USB ', '', 1400000, 'INTEL_BLKDG41TY_4af11d7ed6baa.jpg', 0, 221, '2011-03-11'),
(46, 'INTEL DG41RQ', '10', 'INTEL DG41RQ - Intel� G41 Express Chipset (Core 2 Duo / Core 2 Quad) 2XDual DDR2 667/ 800 (Max 4GB Ram) ;Intel� Graphics Media Accelerator X4500, 6-channel (5.1) audio subsystem using the Realtek* ALC888VC audio codec & NIC Gigabit onboard; 1xPCI Express;', '', 1400000, 'INTEL_DG41RQ__4af11dcc84c45.jpg', 0, 274, '2011-03-11'),
(47, 'GIGABYTE™ GA G41M-ES2L', '10', 'GIGABYTE™ GA G41M-ES2L - Intel G41 / ICH7 Express chipset - CPU BUS upto 1333MHz và 1600MHz (O.C) support 45nm Intel Multi-Core™ - tích hợp VGA Intel® GMA X4500 upto 1GB RAM + SOUND 8-CHANNEL & LAN Gigabit 1000Mbps với Ultra Speed. 2*DIMM upto DDR2 800MHz', '', 1350000, 'GIGABYTE____GA_G_4af11e3983872.jpg', 1, 205, '2011-03-11'),
(48, 'Bộ vi xử lý Pentium E5400 - 2.7 GHz', '11', 'Pentium E5400 - 2.7 GHz - 2MB - 64 bit - Dual Core - bus 800 - SK 775 - Box', '', 1430000, 'B____vi_x____l___4af11e938ddbf.jpg', 1, 202, '2011-03-11'),
(49, 'Bộ vi xử lý Pentium E6300 - 2.8 GHz', '11', 'Pentium E6300 - 2.8 GHz - 2MB - 64 bit - Dual Core - bus 1066MHz - SK 775 - Box', '', 1550000, 'B____vi_x____l___4af11ee44e898.jpg', 0, 396, '2011-03-11'),
(50, 'Bộ vi xử lý Core 2 Duo E7500 - 2.93GHz', '11', 'Core 2 Duo E7500 - 2.93GHz - 3MB - 64 bit - bus 1066MHz - SK 775 - Box', '', 2400000, 'B____vi_x____l___4af11f497eecf.jpg', 0, 372, '2011-03-11'),
(51, 'Bộ vi xử lý Core 2 Duo E7600 - 3.06GHz', '11', 'Core 2 Duo E7600 - 3.06GHz - 3MB - 64 bit - bus 1066MHz - SK 775 - Box', '', 2830000, 'B____vi_x____l___4af11f7e30316.jpg', 0, 172, '2011-03-11'),
(52, 'Bộ vi xử lý Core 2 Quad Q8400 - 2.66 GHz', '11', 'Bộ vi xử lý Core 2 Quad Q8400 - 2.66 GHz', '', 3630000, 'B____vi_x____l___4af11fd63bf08.jpg', 0, 245, '2011-03-11'),
(53, 'KingMax DDR2 1.0GB bus 800 (PC2-6400)', '12', 'DDR2 1.0GB bus 800 (PC2-6400) KingMax', '', 565000, 'KingMax_DDR2_1.0_4af1205906a8c.jpg', 0, 208, '2011-03-11'),
(54, 'V-Data DDR2 1.0GB bus 800 (PC2-6400)', '12', 'V-Data DDR2 1.0GB bus 800 (PC2-6400)', '', 434000, 'V_Data_DDR2_1.0G_4af120be9bd04.jpg', 1, 304, '2011-03-11'),
(55, 'Kingston DDR2 2.0GB bus 800 (PC2-6400)', '12', 'Kingston DDR2 2.0GB bus 800 (PC2-6400)', '', 1100000, 'Kingston_DDR2_2._4af121416f076.jpg', 0, 396, '2011-03-11'),
(56, 'KingMax DDR2 2.0GB bus 800 (PC2-6400)', '12', 'KingMax DDR2 2.0GB bus 800 (PC2-6400)', '', 1050000, 'KingMax_DDR2_2.0_4af1217969822.jpg', 0, 69, '2011-03-11'),
(57, 'V-Data DDR2 2.0GB bus 800 (PC2-6400)', '12', 'V-Data DDR2 2.0GB bus 800 (PC2-6400)', '', 770000, 'V_Data_DDR2_2.0G_4af121b9e1e28.jpg', 0, 155, '2011-03-11'),
(58, 'ADATA™ DDR2 2.0GB Bus 800Mhz (PC6400)', '12', 'ADATA™ DDR2 2.0GB Bus 800Mhz (PC6400)', '', 930000, 'ADATA____DDR2_2._4af122079eb02.jpg', 0, 69, '2011-03-11'),
(59, 'Ổ cứng SamSung 160 GB Serial ATA II', '13', 'SamSung 160 GB Serial ATA II (3 Gb/s); 7200 rpm; 8MB Cache', '', 850000, '____c___ng_SamSu_4af1227aa1464.jpg', 0, 379, '2011-03-11'),
(204, 'Ổ cứng SamSung 1.0 TB Serial ATA II', '13', 'SamSung 1.0 TB Serial ATA II (3 Gb/s); 7200 rpm; 16MB Cache', '', 1980000, '____c___ng_SamSu_4b45503e40255.jpg', 1, 186, '2011-03-11'),
(61, 'Ổ cứng SamSung 320 GB Serial ATA II', '13', 'SamSung 320 GB Serial ATA II (3 Gb/s); 7200 rpm; 16MB Cache', '', 995000, '____c___ng_SamSu_4af122e5e3d80.jpg', 0, 295, '2011-03-11'),
(62, 'Ổ cứng Seagate Barracuda 160 GB Serial ATA II', '13', 'Seagate Barracuda 160 GB Serial ATA II (3 Gb/s); 7200 rpm; 8MB Cache', '', 855000, '____c___ng_Seaga_4af12330706ad.jpg', 0, 415, '2011-03-11'),
(63, 'Ổ cứng Seagate Barracuda 250 GB Serial ATA II (3 Gb/s); 7200 rpm', '13', 'Seagate Barracuda 250 GB Serial ATA II (3 Gb/s); 7200 rpm; 8MB Cache', '', 900000, '____c___ng_Seaga_4af1235f8de19.jpg', 1, 190, '2011-03-11'),
(64, 'Ổ cứng Western Digital 160 GB Serial ATA II', '13', 'Western Digital 160 GB Serial ATA II (3 Gb/s); 7200 rpm; 8MB Cache', '', 830000, '____c___ng_Weste_4af123b22cf2c.jpg', 0, 205, '2011-03-11'),
(65, 'SamSung LCD Monitor 18.5 inches Wide TFT (943SNX)', '14', 'SamSung LCD Monitor 18.5\" Wide TFT (943SNX) - 5 ms; 1360 x 768 ; 15000:1 (Bảo Hành tại Hãng)', '', 2380000, 'SamSung_LCD_Moni_4af12437efca1.jpg', 0, 454, '2011-03-11'),
(66, 'SamSung LCD Monitor 18.5\" Wide TFT (933SN)', '14', 'SamSung LCD Monitor 18.5\" Wide TFT (933SN) - 5 ms; 1360x768 ; 15000:1', '', 2380000, 'SamSung_LCD_Moni_4af124902e8fd.jpg', 0, 154, '2011-03-11'),
(67, 'SamSung LCD Monitor 20\" Wide TFT (2033SN)', '14', 'SamSung LCD Monitor 20\" Wide TFT (2033SN) - 5 ms; 1600 x 900 ; 170˚ ; độ sáng 300cd', '', 2800000, 'SamSung_LCD_Moni_4af124d7bd716.jpg', 0, 410, '2011-03-11'),
(68, 'Acer LCD Monitor 18.5 \" Wide TFT ( V193HQbd )', '14', 'Acer LCD Monitor 18.5 \" Wide TFT ( V193HQbd ) /w DVI - Black : 5ms, 10000:1; 1366 x 768', '', 2575000, 'Acer_LCD_Monitor_4af125c7e7f04.jpg', 1, 85, '2011-03-11'),
(69, 'Acer LCD Monitor 19\" Wide TFT ( X193Wbd )', '14', 'Acer LCD Monitor 19\" Wide TFT ( X193Wbd ) - 5ms, 10000:1; 1366 x 768', '', 2580000, 'Acer_LCD_Monitor_4af127653bfdd.jpg', 0, 197, '2011-03-11'),
(70, 'Acer LCD Monitor 20 inches Wide TFT (X203H)', '0', 'Acer LCD Monitor 20\" Wide TFT (X203H) DVI - 5 ms; 1600 x 900 ; 10000:1', '', 2200000, 'Acer_LCD_Monitor_4af1263f5337b.jpg', 0, 229, '2011-03-11'),
(71, 'HP-Compaq LCD Monitor 17 inches TFT ( L1710 )', '0', 'HP-Compaq LCD Monitor 17\" TFT ( L1710 ) - 6 ms; 1280 x 1024 Black', '', 2570000, 'HP_Compaq_LCD_Mo_4af12695174e1.jpg', 0, 54, '2011-03-11'),
(72, 'HP-Compaq LCD Monitor 18.5\" Wide TFT ( V185W )', '14', 'HP-Compaq LCD Monitor 18.5\" Wide TFT ( V185W ) - 5 ms; 1366 x 768 ; 1000 : 1', '', 2519000, 'HP_Compaq_LCD_Mo_4af126d8687d7.jpg', 0, 83, '2011-03-11'),
(73, 'DELL LCD Monitor 17 inches Wide TFT (E1709W)', '14', 'DELL LCD Monitor 17\" Wide TFT (S1709W) - 8 ms; 1440 x 900', '<div>DELL LCD Monitor 17\" Wide TFT (S1709W) - 8 ms; 1440 x 900<br />Bảo hành: 24 tháng</div>', 2650000, 'DELL_LCD_Monitor_4af217aad04cb.jpg', 1, 251, '2011-03-11'),
(74, 'DELL LCD Monitor 17 inches TFT ( E170S )', '14', 'DELL LCD Monitor 17\" TFT ( E170S ) - 5 ms; 1280 x 1024 Black', '<div>DELL LCD Monitor 17\" TFT ( E170S ) - 5 ms; 1280 x 1024 Black<br />Bảo hành: 24 tháng</div>', 2660000, 'DELL_LCD_Monitor_4af217f28f9c2.jpg', 1, 4, '2011-03-11'),
(75, 'DELL LCD Monitor 19 inches Wide TFT (E1909W)', '0', 'DELL LCD Monitor 19\" Wide TFT (E1909W) /w DVI - 5 ms; 1440 x 900', '<div>DELL LCD Monitor 19\" Wide TFT (E1909W) /w DVI - 5 ms; 1440 x 900<br />Bảo hành: 24 tháng</div>', 2290000, 'DELL_LCD_Monitor_4af21823b14ab.jpg', 0, 268, '2011-03-11'),
(76, 'BENQ LCD Monitor 17 inches TFT (G702AD)', '21', 'BENQ LCD Monitor 17\" TFT (G702AD) Black Silver - 5ms ; 1280x1024 - 700:1 (DC 2000:1) 300cd/m2 D-Sub', '<div>BENQ LCD Monitor  17\" TFT (G702AD) Black  Silver - 5ms ; 1280x1024 - 700:1 (DC 2000:1) 300cd/m2 D-Sub<br />Bảo hành: 24 tháng</div>', 2326000, 'BENQ_LCD_Monitor_4af21865c4b4e.jpg', 0, 329, '2011-03-11'),
(77, 'BENQ LCD Monitor 18.5 inches TFT (G922HD)', '14', 'BENQ LCD Monitor 18.5\" TFT (G922HD) Black - 5ms;1366x768 ; 1000:1 (DC 40000:1);Giao tiếp DVI-D và D-Sub', '<div>BENQ LCD Monitor 18.5\" TFT (G922HD) Black - 5ms;1366x768 ; 1000:1 (DC 40000:1);Giao tiếp DVI-D và D-Sub<br />Bảo hành: 24 tháng</div>', 2389000, 'BENQ_LCD_Monitor_4af2189f3841a.jpg', 0, 338, '2011-03-11'),
(78, 'ASUS 256MB DDR2 ATi Radeon HD3450 HTP', '21', 'ASUS 256MB DDR2 ATi Radeon HD3450 (EAH3450/HTP) HDCP READY - 64 bit', '<div>ASUS 256MB DDR2 ATi Radeon HD3450 (EAH3450/HTP) HDCP READY - 64 bit<br />Bảo hành: 36 tháng</div>', 620000, 'ASUS_256MB_DDR2__4af218e6d69fa.jpg', 1, 202, '2011-03-11'),
(79, 'ASUS 512MB DDR2 ATi Radeon HD4350', '21', 'ASUS 512MB DDR2 ATi Radeon HD4350 (EAH4350 SILENT/DI) DVI/TVO/HDMI - 64 bit', '<div>ASUS 512MB DDR2 ATi Radeon HD4350 (EAH4350 SILENT/DI) DVI/TVO/HDMI - 64 bit<br />Bảo hành: 36 tháng</div>', 828000, 'ASUS_512MB_DDR2__4af2191978c58.jpg', 1, 498, '2011-03-11'),
(80, 'ASUS 512MB DDR3 ATi Radeon HD4670', '21', 'ASUS 512MB DDR3 ATi Radeon HD4670 (EAH4670/HTP/512MD3) DVI/TVO/HDCP - 128 bit', '<div>ASUS 512MB DDR3 ATi Radeon HD4670 (EAH4670/HTP/512MD3) DVI/TVO/HDCP - 128 bit<br />Bảo hành: 36 tháng</div>', 1596000, 'ASUS_512MB_DDR3__4af2195254637.jpg', 0, 383, '2011-03-11'),
(81, 'ASUS 1GB DDR2 ATi Radeon HD4650 (EAH4650/DI/1GD2) DVI/TVO/HDMI -', '21', 'ASUS 1GB DDR2 ATi Radeon HD4650 (EAH4650/DI/1GD2) DVI/TVO/HDMI - 128 bit', '<div>ASUS 1GB DDR2 ATi Radeon HD4650 (EAH4650/DI/1GD2) DVI/TVO/HDMI - 128 bit<br />Bảo hành: 36 tháng</div>', 1455000, '_ASUS_1GB_DDR2_A_4af21986a1c97.jpg', 1, 422, '2011-03-11'),
(82, 'Gigabyte 512MB DDR2 ATi Radeon HD4350', '21', 'Gigabyte 512MB DDR2 ATi Radeon HD4350 (GV R435OC 512I) HDCP/ Dual DVI-I / D-Sub / HDMI - 64 bit', '<div>Gigabyte 512MB DDR2 ATi Radeon HD4350 (GV R435OC 512I) HDCP/ Dual DVI-I / D-Sub / HDMI - 64 bit<br />Bảo hành: 36 tháng</div>', 828000, 'Gigabyte_512MB_D_4af219ec2091c.jpg', 0, 460, '2011-03-11'),
(83, 'Gigabyte 512GB DDR2 ATi Radeon HD4650', '21', 'Gigabyte 512GB DDR2 ATi Radeon HD4650 (R465 512H) HDCP/ Dual DVI-I/HDMI /HDTV/ D-Sub - 128 bit', '<div>Gigabyte 512GB DDR2 ATi Radeon HD4650 (R465 512H) HDCP/ Dual DVI-I/HDMI /HDTV/ D-Sub - 128 bit<br />Bảo hành: 36 tháng</div>', 1320000, 'Gigabyte_512GB_D_4af21a3464446.jpg', 0, 32, '2011-03-11'),
(84, 'Gigabyte 512GB DDR3 ATi Radeon HD4550', '21', 'Gigabyte 512GB DDR3 ATi Radeon HD4550 (R455D3-512I) Dual-Link DVI/Dual DVI-I/HDCP/HDMI - 64 bit', '<div>Gigabyte 512GB DDR3 ATi Radeon HD4550 (R455D3-512I) Dual-Link DVI/Dual DVI-I/HDCP/HDMI - 64 bit<br />Bảo hành: 36 tháng</div>', 1020000, 'Gigabyte_512GB_D_4af21a6c6e671.jpg', 1, 282, '2011-03-11'),
(85, 'Gigabyte 1GB DDR2 ATi Radeon HD4650', '21', 'Gigabyte 1GB DDR2 ATi Radeon HD4650 (R465OC 1GI) HDCP/Dual DVI-I/HDMI/D-Sub, Ultra Durable 2 - 128 bit', '<div>Gigabyte 1GB DDR2 ATi Radeon HD4650 (R465OC 1GI) HDCP/Dual DVI-I/HDMI/D-Sub, Ultra Durable 2 - 128 bit<br />Bảo hành: 36 tháng</div>', 1450000, 'Gigabyte_1GB_DDR_4af21abe389d9.jpg', 0, 313, '2011-03-11'),
(86, 'Mitsumi Keyboard PS/2 - White', '24', 'Mitsumi Keyboard PS/2 - White', '<div>Mitsumi Keyboard PS/2 - White<br />Bảo hành: 12 tháng</div>', 140000, 'Mitsumi_Keyboard_4af21b27c88ce.jpg', 1, 220, '2011-03-11'),
(87, 'Genius Keyboard (KB110) PS/2', '24', 'Genius Keyboard (KB110) PS/2', '<div>Genius Keyboard (KB110) PS/2<br />Bảo hành: 12 tháng</div>', 115000, 'Genius_Keyboard__4af21beb47e90.jpg', 0, 159, '2011-03-11'),
(88, 'Logitech Keyboard classic Plus PS/2 - FE', '24', 'Logitech Keyboard classic Plus PS/2 - FE', '<p>Logitech Keyboard classic Plus PS/2 - FE<br />Bảo hành: 06 tháng</p>', 155000, 'Logitech_Keyboar_4af21cbc86170.jpg', 0, 136, '2011-03-11'),
(89, 'SamSung DVD Rom 16X w/48X CDRom (Black)', '22', 'SamSung DVD Rom 16X w/48X CDRom (Black)', '<div>SamSung DVD Rom 16X w/48X CDRom (Black)<br />Bảo hành: 12 tháng</div>', 390000, 'SamSung_DVD_Rom__4af21d1b69e53.jpg', 0, 204, '2011-03-11'),
(90, 'SamSung DVD-RW 22x6x16x(+)�12x4x12x(-) DVD / 40x32x48x CDRW - ID', '22', 'SamSung DVD-RW 22x6x16x(+)12x4x12x(-) DVD / 40x32x48x CDRW - I', '<p>SamSung DVD-RW 22x6x16x(+)12x4x12x(-) DVD / 40x32x48x CDRW - I<br />Bảo hành: 12 tháng</p>', 635000, '_SamSung_DVD_RW__4af21d8a4067e.jpg', 1, 108, '2011-03-11'),
(91, 'Mitsumi Scroll Mouse PS/2 - White', '23', 'Mitsumi Scroll Mouse PS/2 - White', '<div>Mitsumi Scroll Mouse PS/2 - White<br />Bảo hành: 06 tháng</div>', 80000, 'Mitsumi_Scroll_M_4af21dc378c80.jpg', 0, 428, '2011-03-11'),
(92, 'Mitsumi Scroll Mouse PS/2 - Black ( loại to )', '23', 'Mitsumi Scroll Mouse PS/2 - Black ( loại to )', '<p>Mitsumi Scroll Mouse PS/2 - Black ( loại to )<br />Bảo hành: 06 tháng</p>', 90000, 'Mitsumi_Scroll_M_4af21e0a4415a.jpg', 0, 318, '2011-03-11'),
(93, 'Mitsumi Optical Scroll Mouse (Chuột quang) PS2', '23', 'Mitsumi Optical Scroll Mouse (Chuột quang) PS2', '<div>Mitsumi Optical Scroll Mouse (Chuột quang) PS2<br />Bảo hành: 06 tháng</div>', 140000, 'Mitsumi_Optical__4af21e4d561ea.jpg', 1, 304, '2011-03-11'),
(94, 'Mitsumi Optical Scroll Mouse (Chuột quang) USB ( loại to )', '23', 'Mitsumi Optical Scroll Mouse (Chuột quang) USB ( loại to )', '<div>Mitsumi Optical Scroll Mouse (Chuột quang) USB ( loại to )<br />Bảo hành: 06 tháng</div>', 165000, 'Mitsumi_Optical__4af21e9a80aa3.jpg', 1, 63, '2011-03-11'),
(95, 'Genius Optical Scroll Mouse 120 (Chuột quang) PS/2', '23', 'Genius Optical Scroll Mouse 120 (Chuột quang) PS/2', '<div>Genius Optical Scroll Mouse 120 (Chuột quang) PS/2<br />Bảo hành: 06 tháng</div>', 90000, 'Genius_Optical_S_4af21ef20e3d6.jpg', 0, 406, '2011-03-11'),
(96, 'VỎ GOLDEN FIELD 1286B', '25', 'VỎ GOLDEN FIELD 1286B', '<h3><a href=\"http://www.bachkhoapc.vn/index.php?page=shop.product_details&flypage=flypage.tpl&product_id=183&category_id=25&option=com_virtuemart&Itemid=53\" title=\"VỎ GOLDEN FIELD 1286B\">VỎ GOLDEN FIELD 1286B</a></h3>', 220000, 'V____GOLDEN_FIEL_4af2466bc2c68.jpg', 0, 340, '2011-03-11'),
(97, 'JETEK X303/305', '25', 'Case Jetek X303/305: thiết kế chắc chắc, hình thức đẹp, tản nhịêt tốt giúp máy tính của bạn luôn thoáng mát.', '<p>Case Jetek X303/305: thiết kế chắc chắc, hình thức đẹp, tản nhịêt tốt giúp máy tính của bạn luôn thoáng mát.              <a href=\"http://www.bachkhoapc.vn/index.php?page=shop.product_details&flypage=flypage.tpl&product_id=100&category_id=25&option=com_virtuemart&Itemid=53\" title=\"Xem chi tiết\"><br /></a></p>', 200000, 'JETEK_X303_305_4af246d34cfe8.jpg', 0, 482, '2011-03-11'),
(98, 'JETEK X302BR/BG', '25', 'JETEK X302BR/BG Vỏ máy tinh JETEK X302 kiểu dáng đẹp, tản nhiệt tốt, có nhiều mẫu mã để lựa chọn.', '<p>JETEK X302BR/BG  Vỏ máy tinh JETEK X302 kiểu dáng đẹp, tản nhiệt tốt, có nhiều mẫu mã để lựa chọn.              <a href=\"http://www.bachkhoapc.vn/index.php?page=shop.product_details&flypage=flypage.tpl&product_id=98&category_id=25&option=com_virtuemart&Itemid=53\" title=\"Xem chi tiết\"><br /></a></p>', 200000, 'JETEK_X302BR_BG_4af24734f0b76.jpg', 0, 390, '2011-03-11'),
(99, 'JETEK V1211/1202/1205/1206', '25', 'Vỏ máy tinh JETEK V1211/1202/1205/1206 kiểu dáng đẹp, tản nhiệt tốt, có nhiều mẫu mã để lựa chọn.', '<p>Vỏ máy tinh JETEK V1211/1202/1205/1206 kiểu dáng đẹp, tản nhiệt tốt, có nhiều mẫu mã để lựa chọn.              <a href=\"http://www.bachkhoapc.vn/index.php?page=shop.product_details&flypage=flypage.tpl&product_id=99&category_id=25&option=com_virtuemart&Itemid=53\" title=\"Xem chi tiết\"><br /></a></p>', 200000, 'JETEK_V1211_1202_4af2475c79972.jpg', 1, 4, '2011-03-11'),
(100, 'Golden Star 7115', '25', 'Golden Star 7115', '<p>Golden Star 7115</p>', 200000, 'Golden_Star_7115_4af247980b539.jpg', 0, 349, '2011-03-11'),
(101, 'Golden Star 7113O', '25', 'Golden Star 7113O', '<h3><a href=\"http://www.bachkhoapc.vn/index.php?page=shop.product_details&flypage=flypage.tpl&product_id=180&category_id=25&option=com_virtuemart&Itemid=53\" title=\"Golden Star 7113O\">Golden Star 7113O</a></h3>', 200000, 'Golden_Star_7113_4af247de4a391.jpg', 0, 230, '2011-03-11'),
(102, 'Golden Star 7112BL', '25', 'Golden Star 7112BL', '<p>Golden Star 7112BL              <a href=\"http://www.bachkhoapc.vn/index.php?page=shop.product_details&flypage=flypage.tpl&product_id=179&category_id=25&option=com_virtuemart&Itemid=53\" title=\"Xem chi tiết\"><br /></a></p>', 200000, 'Golden_Star_7112_4af2480c18ee0.jpg', 1, 105, '2011-03-11'),
(103, 'Golden Star 7111B', '25', 'Golden Star 7111B', '<p>Golden Star 7111B              <a href=\"http://www.bachkhoapc.vn/index.php?page=shop.product_details&flypage=flypage.tpl&product_id=181&category_id=25&option=com_virtuemart&Itemid=53\" title=\"Xem chi tiết\"><br /></a></p>', 200000, 'Golden_Star_7111_4af248697c1d2.jpg', 0, 333, '2011-03-11'),
(104, 'GOLDEN FIELD 8197B/8198B', '25', 'GOLDEN FIELD 8197B/8198B - kiểu dáng đẹp, case chắc chắn, tản nhiệt nhanh. Vỏ màu đen, có nhiều mẫu mã để lựa chọn.', '<p>GOLDEN FIELD 8197B/8198B - kiểu dáng đẹp, case chắc chắn, tản nhiệt nhanh. Vỏ màu đen, có nhiều mẫu mã để lựa chọn.              <a href=\"http://www.bachkhoapc.vn/index.php?page=shop.product_details&flypage=flypage.tpl&product_id=103&category_id=25&option=com_virtuemart&Itemid=53\" title=\"Xem chi tiết\"><br /></a></p>', 220000, 'GOLDEN_FIELD_819_4af248a446441.jpg', 0, 351, '2011-03-11'),
(105, 'GOLDEN FIELD 2719', '25', 'GOLDEN FIELD 2719 Vỏ case được thiết kế với kiểu dáng đẹp, rất chắc chắn, tản nhiệt nhanh. Màu đen.', '<p>GOLDEN FIELD 2719  Vỏ case được thiết kế với kiểu dáng đẹp, rất chắc chắn, tản nhiệt nhanh. Màu đen.              <a href=\"http://www.bachkhoapc.vn/index.php?page=shop.product_details&flypage=flypage.tpl&product_id=101&category_id=25&option=com_virtuemart&Itemid=53\" title=\"Xem chi tiết\"><br /></a></p>', 220000, 'GOLDEN_FIELD_271_4af248e024cd0.jpg', 1, 253, '2011-03-11'),
(106, 'GOLDEN FIELD 2185B/ 1201B/ 1205B/ 1203B/ 1288B/ 1290/ 1291', '25', 'GOLDEN FIELD 1201B/ 1205B/ 1203B/ 1288B/ 1290/ 1291 - kiểu dáng đẹp, case chắc chắn, tản nhiệt nhanh. Hai màu đen/ trắng bạc.', '<p>GOLDEN FIELD 1201B/ 1205B/ 1203B/ 1288B/ 1290/ 1291 - kiểu dáng đẹp, case chắc chắn, tản nhiệt nhanh. Hai màu đen/ trắng bạc.              <a href=\"http://www.bachkhoapc.vn/index.php?page=shop.product_details&flypage=flypage.tpl&product_id=102&category_id=25&option=com_virtuemart&Itemid=53\" title=\"Xem chi tiết\"><br /></a></p>', 220000, 'GOLDEN_FIELD_218_4af24919a258e.jpg', 1, 213, '2011-03-11'),
(107, 'Case Jeteck 8105BG', '25', 'Case Jeteck 8105BG', '<p>Case Jeteck 8105BG              <a href=\"http://www.bachkhoapc.vn/index.php?page=shop.product_details&flypage=flypage.tpl&product_id=172&category_id=25&option=com_virtuemart&Itemid=53\" title=\"Xem chi tiết\"><br /></a></p>', 255000, 'Case_Jeteck_8105_4af2496ee6abc.jpg', 1, 305, '2011-03-11'),
(108, 'Case Jeteck 8102BR', '25', 'Case Jeteck 8102BR', '<p>Case Jeteck 8102BR</p>', 255000, 'Case_Jeteck_8102_4af2499ae73cc.jpg', 0, 385, '2011-03-11'),
(109, 'Godenfield 480W', '26', 'ATX/ công suất 480W/ 24 chân, kích thước quạt gió lớn.', '<p>ATX/ công suất 480W/ 24 chân, kích thước quạt gió lớn.</p>\r\n<p>Bảo hành: 12 tháng</p>', 220000, 'Godenfield_480W_4af249e348200.jpg', 0, 11, '2011-03-11'),
(110, 'JETEK L480/480W', '26', 'JETEK L480/480W Jetek - ATX/ Công suất 480W/ 24 chân', '<p>JETEK L480/480W  Jetek - ATX/ Công suất 480W/ 24 chân</p>\r\n<p>Bảo hành: 12 tháng<a href=\"http://www.bachkhoapc.vn/index.php?page=shop.product_details&flypage=flypage.tpl&product_id=104&category_id=26&option=com_virtuemart&Itemid=53\" title=\"Xem chi tiết\"><br /></a></p>', 220000, 'JETEK_L480_480W_4af24a3f892b6.jpg', 1, 397, '2011-03-11'),
(111, 'TP-Link Switching 10/100 - 5 Port (TL-SF1005D)', '45', 'TP-Link Switching 10/100 - 5 Port (TL-SF1005D)', '<p>TP-Link  Switching 10/100 - 5 Port (TL-SF1005D)<br />Bảo hành: 12 tháng</p>', 165000, 'TP_Link_Switchin_4af26dd499766.jpg', 0, 453, '2011-03-11'),
(112, 'TP-Link Switching 10/100 - 8 Port (TL-SF1008D)', '45', 'TP-Link Switching 10/100 - 8 Port (TL-SF1008D)', '<p>TP-Link Switching 10/100 - 8 Port (TL-SF1008D)<br />Bảo hành: 12 tháng</p>', 200000, 'TP_Link_Switchin_4af26e141a804.jpg', 0, 73, '2011-03-11'),
(113, 'D-Link Switching 10/100 - 8 Port (DES-1008D/E)', '45', 'D-Link Switching 10/100 - 8 Port (DES-1008D/E)', '<p>D-Link Switching 10/100 - 8 Port (DES-1008D/E)<br />Bảo hành: 12 tháng</p>', 290000, 'D_Link_Switching_4af26e5f6124b.jpg', 0, 4, '2011-03-11'),
(114, 'TP-Link Switching 10/100 - 16 Port (TL-SF1016D)', '45', 'TP-Link Switching 10/100 - 16 Port (TL-SF1016D)', '<p>TP-Link Switching 10/100 - 16 Port (TL-SF1016D)<br />Bảo hành: 12 tháng</p>', 550000, 'TP_Link_Switchin_4af26e9d5e0a1.jpg', 0, 300, '2011-03-11'),
(115, 'Linksys ADSL2 4 Port Ethernet/ Router/ Gateway/ Firewall (AG241)', '46', 'Linksys ADSL2 4 Port Ethernet/ Router/ Gateway/ Firewall (AG241)', '<div style=\"width: 100%;\">\r\n<h1><strong style=\"font-size: 14px;\">Linksys ADSL2  4 Port Ethernet/ Router/ Gateway/ Firewall   (AG241)</strong></h1>\r\n</div>\r\n<p>Bảo hành: 12 tháng</p>', 1120000, '_Linksys_ADSL2_4_4af26fa3538de.jpg', 1, 491, '2011-03-11'),
(116, 'D-Link 54Mbits Wireless LAN Card', '46', 'D-Link 54Mbits Wireless LAN Card (PCI) for PC (DWA-510 )', '<div>D-Link 54Mbits Wireless LAN Card (PCI) for PC (DWA-510 )<br />Bảo hành: 36 tháng</div>', 450000, 'D_Link_54Mbits_W_4af2702ef3a83.jpg', 0, 52, '2011-03-11'),
(117, 'D-Link 108Mbits Wireless LAN Card (PCI) for PC (DWA-520 )', '46', 'D-Link 108Mbits Wireless LAN Card (PCI) for PC (DWA-520 )', '<div>D-Link 108Mbits Wireless LAN Card (PCI) for PC (DWA-520 )<br />bảo hành: 36 tháng</div>', 540000, 'D_Link_108Mbits__4af2706875ea8.jpg', 0, 287, '2011-03-11'),
(118, 'D-Link Draft 802.11n Wireless LAN Card', '46', 'D-Link Draft 802.11n Wireless LAN Card', '<div style=\"width: 100%;\">\r\n<h1><strong style=\"font-size: 14px;\">D-Link Draft 802.11n Wireless LAN Card</strong></h1>\r\nbảo hành: 36 tháng</div>', 1020000, '_D_Link_Draft_80_4af270c5853bb.jpg', 0, 278, '2011-03-11'),
(119, 'TP-Link 54Mbits Wireless LAN Card G', '46', 'TP-Link 54Mbits Wireless LAN Card (PCI) for PC (TL-WN353G)', '<div>TP-Link 54Mbits Wireless LAN Card (PCI) for PC (TL-WN353G)<br />bảo hành: 24 tháng</div>', 260000, '_TP_Link_54Mbits_4af27206e6b27.jpg', 0, 28, '2011-03-11'),
(120, 'TP-Link 54M Wireless mini PCI Adapter', '46', 'TP-Link 54M Wireless mini PCI Adapter, with 2 Ultra-Mini SMT-GSC Antenna connectors. Card wireless dùng cho máy Laptop, gắn trong qua khe Mini-PCI trên Mainboard của Laptop (TL-WN560G)', '<div>TP-Link 54M Wireless mini PCI Adapter, with 2 Ultra-Mini SMT-GSC Antenna connectors. Card wireless dùng cho máy Laptop, gắn trong qua khe Mini-PCI trên Mainboard của Laptop (TL-WN560G)<br />Bảo hành: 24 tháng</div>', 250000, 'TP_Link_54M_Wire_4af2727ca4f1c.jpg', 1, 308, '2011-03-11'),
(121, 'D-Link 54Mbits Wireless USB Adapter', '46', 'D-Link 54Mbits Wireless USB Adapter - PC & Notebook (DWA-110 )', '<div>D-Link 54Mbits Wireless USB Adapter - PC & Notebook (DWA-110 )<br />Bảo hành: 24 tháng</div>', 445000, 'D_Link_54Mbits_W_4af272cf5bcb5.jpg', 0, 452, '2011-03-11'),
(122, 'D-Link NIC PCI 10/100 BaseT (DFE-528TX/ DFE-530T)', '44', 'D-Link NIC PCI 10/100 BaseT (DFE-528TX/ DFE-530T)', '<div>D-Link NIC PCI 10/100 BaseT (DFE-528TX/ DFE-530T)<br />Bảo hành: 12 tháng</div>', 98000, 'D_Link_NIC_PCI_1_4af27386dbabb.jpg', 1, 339, '2011-03-11'),
(123, 'D-Link NIC Gigabit 100/1000 PCI 32 Bit (DGE-530T)', '44', 'D-Link NIC Gigabit 100/1000 PCI 32 Bit (DGE-530T)', '<p>D-Link NIC Gigabit 100/1000 PCI 32 Bit (DGE-530T)<br />bảo hành: 24 tháng</p>', 295000, 'D_Link_NIC_Gigab_4af273c1bf238.jpg', 1, 337, '2011-03-11'),
(124, '3-Com NIC Card PCMCIA for Notebook', '0', '3-Com NIC Card PCMCIA for Notebook', '<p>3-Com NIC Card PCMCIA for Notebook</p>\r\n<p>bảo hành: 12 tháng</p>', 100000, '3_Com_NIC_Card_P_4af2741a521d3.jpg', 0, 168, '2011-03-11'),
(125, 'TP-Link NIC Card PCMCIA for Notebook (TF-5239)', '44', 'TP-Link NIC Card PCMCIA for Notebook (TF-5239)', '<p>TP-Link NIC Card PCMCIA for Notebook (TF-5239)<br />Bảo  hành: 12 tháng</p>', 225000, 'TP_Link_NIC_Card_4af274554eae4.jpg', 1, 327, '2011-03-11'),
(126, 'Canon Laser Printer LBP 2900', '37', 'Canon Laser Printer LBP 2900 (A4, 600dpi, 12ppm, 2MB) - China - BH tại Hãng', '<div>Canon Laser Printer LBP 2900 (A4, 600dpi, 12ppm, 2MB) - China - BH tại Hãng<br />bảo hành: 12 tháng</div>', 2970000, 'Canon_Laser_Prin_4af274d0148c4.jpg', 0, 131, '2011-03-11'),
(127, 'Canon Laser Printer LBP 3300', '37', 'Canon Laser Printer LBP 3300 (A4, 600dpi, 21ppm, 8MB , kết nối USB ) Đảo mặt tự động - China - BH tại Hãng', '<div>Canon Laser Printer LBP 3300 (A4, 600dpi, 21ppm, 8MB , kết nối USB ) Đảo mặt tự động - China - BH tại Hãng<br />Bảo hành: 12 tháng</div>', 3540000, '_Canon_Laser_Pri_4af2750b0fa10.jpg', 0, 175, '2011-03-11'),
(128, 'Canon Laser Printer LBP 3500', '37', 'Canon Laser Printer LBP 3500 (A3, 1200dpi, 16ppm, 8MB) - China', '<div>Canon Laser Printer LBP 3500 (A3, 1200dpi, 16ppm, 8MB) - China<br />Bảo hành: 12 tháng</div>', 13000, 'Canon_Laser_Prin_4af27540152b2.jpg', 0, 480, '2011-03-11'),
(129, 'Canon LaserJet Printer MF-4320D', '37', 'Canon LaserJet Printer MF-4320D (A4; Printer : 22ppm ; Scanner; Copy ; 32MB; in đảo mặt )', '<div>Canon LaserJet Printer MF-4320D (A4; Printer : 22ppm ; Scanner; Copy ; 32MB; in đảo mặt )<br />bảo hành : 12 tháng</div>', 4950000, 'Canon_LaserJet_P_4af2759f5c5bb.jpg', 0, 375, '2011-03-11'),
(130, 'Canon Pixma Printer MP-198', '37', 'Canon Pixma Printer MP-198 (A4; 4800 x 1200 dpi; Print: 19ppm black -15ppm color ;In ảnh 4x6\" 70s/bản ; Scan Flatbed : 600x1200dpi - Độ sâu màu quét: 48bit. Tốc độ 7s/1bản A4 black (300dpi) ; Copy ; Khe cắm thẻ nhớ ; 02 hộp mực )', '<p>Canon Pixma Printer MP-198 (A4; 4800 x 1200 dpi; Print: 19ppm black -15ppm color ;In ảnh 4x6\" 70s/bản ; Scan Flatbed : 600x1200dpi - Độ sâu màu quét: 48bit. Tốc độ 7s/1bản A4 black (300dpi) ; Copy ; Khe cắm thẻ nhớ ; 02 hộp mực )<br />Bảo hành: 12 tháng</p>', 1580000, 'Canon_Pixma_Prin_4af275de43bb1.jpg', 0, 436, '2011-03-11'),
(131, 'HP LaserJet Printer P1005', '37', 'HP LaserJet Printer P1005 (A4; 15ppm; 600 dpi; 2MB) - China - BH tại Cty', '<div>HP LaserJet Printer P1005 (A4; 15ppm; 600 dpi; 2MB) - China - BH tại Cty<br />Bảo hành: 12 tháng</div>', 2530000, 'HP_LaserJet_Prin_4af27619a19b3.jpg', 0, 54, '2011-03-11'),
(132, 'HP LaserJet Printer P1006', '37', 'HP LaserJet Printer P1006(A4; 17ppm; 600 dpi; 8MB) - China - BH tại hãng', '<div>HP LaserJet Printer P1006(A4; 17ppm; 600 dpi; 8MB) - China - BH tại hãng<br />Bảo hành: 12 tháng</div>', 2950000, 'HP_LaserJet_Prin_4af2764f7ddc4.jpg', 0, 462, '2011-03-11'),
(133, 'HP LaserJet Printer 5200L', '37', 'HP LaserJet Printer 5200L (A3:12ppm ; A4 : 25ppm;1200 dpi ; 32MB) - China', '<div>HP LaserJet Printer 5200L (A3:12ppm ; A4 : 25ppm;1200 dpi ; 32MB) - China<br />Bảo hành: 36 tháng</div>', 17900000, 'HP_LaserJet_Prin_4af276a55013f.jpg', 0, 145, '2011-03-11'),
(134, 'Santak UPS offline 500 VA', '41', 'Santak UPS offline 500 VA', '<p>Santak UPS offline 500 VA<br />Bảo hành: 36 tháng</p>', 720000, 'Santak_UPS_offli_4af27754b050d.jpg', 0, 341, '2011-03-11'),
(135, 'Santak UPS offline 600 VA', '0', 'Santak UPS offline 600 VA / 360W ( Blazer 600-E ) - công nghệ Line Interactive ; không cổng có RS 232', '<div>Santak UPS offline 600 VA / 360W  ( Blazer  600-E ) - công nghệ Line Interactive ; không cổng có RS 232<br />Bảo hành: 36 tháng</div>', 1170000, 'Santak_UPS_offli_4af2778a4cca9.jpg', 1, 270, '2011-03-11'),
(136, 'Santak UPS offline 1000 VA (TG 1000)', '41', 'Santak UPS offline 1000 VA ( TG 1000 )', '<div>Santak UPS offline 1000 VA ( TG 1000 )<br />bảo hành: 36 tháng</div>', 1720000, 'Santak_UPS_offli_4af277ce4e079.jpg', 0, 327, '2011-03-11'),
(137, 'Santak UPS offline 1400 VA', '41', 'Santak UPS offline 1400 VA / 840W (Blazer 1400-EH ) - công nghệ Line Interactive ; không có cổng RS 232', '<div>Santak UPS offline 1400 VA / 840W  (Blazer 1400-EH ) - công nghệ Line Interactive ; không có cổng RS 232<br />Bảo hành: 36 tháng</div>', 2630000, 'Santak_UPS_offli_4af278106305b.jpg', 1, 322, '2011-03-11'),
(138, 'Panasonic KX-FT983CX', '39', 'Máy fax giấy nhiệt, Khay nạp giấy tự động 10 tờ ; Cắt giấy tự động ; Hiển thị số gọi đến (số, tên, ngày và thời gian của cuộc gọi) ; Màn hình LCD 2 dòng hiển thị tên và số điện thoại ; 10 phím Station Key giúp bạn thực hiện cuộc gọi và gửi Fax chỉ bằng mộ', '<p>Máy fax giấy nhiệt, Khay nạp giấy tự động 10 tờ ; Cắt giấy tự động ; Hiển thị số gọi đến (số, tên, ngày và thời gian của cuộc gọi) ; Màn hình LCD 2 dòng hiển thị tên và số điện thoại ; 10 phím Station Key giúp bạn thực hiện cuộc gọi và gửi Fax chỉ bằng một phím bấm ; Monitor 1 chiều ; Bộ nhớ 28 trang văn bản khi hết giấy ; Phím định vị 5 chiều tiện lợi khi sử dụng ; Chức năng cấm nhận Fax không cần thiết</p>\r\n<p>Bảo hành: 12 tháng</p>', 1980000, 'Panasonic_KX_FT9_4af2787958611.jpg', 0, 130, '2011-03-11'),
(139, 'Panasonic KX-FT937CX', '39', 'Panasonic KX-FT937CX: Máy fax giấy nhiệt, cắt giấy tự động, tự động chuyển Tel/ Fax, hệ thống ghi âm trả lời kỹ thuật số (20 phút ghi âm), ghi âm 2 chiều, nhớ được 20 trang khi hết giấy, 64 mức xám, số nhớ quay nhanh 100 số, điều chỉnh âm lượng bằng điện ', '<p>Panasonic KX-FT937CX: Máy fax giấy nhiệt, cắt giấy tự động, tự động chuyển Tel/ Fax, hệ thống ghi âm trả lời kỹ thuật số (20 phút ghi âm), ghi âm 2 chiều, nhớ được 20 trang khi hết giấy, 64 mức xám, số nhớ quay nhanh 100 số, điều chỉnh âm lượng bằng điện tử, chức năng đổ chuông phân biệt<br />Bảo hành: 12 tháng</p>', 2200000, 'Panasonic_KX_FT9_4af278b414c27.jpg', 1, 183, '2011-03-11'),
(140, 'Panasonic KX-FP701', '39', 'Máy fax giấy thường, khay chứa được 50 trang A4, điều chỉnh độ sáng tối khi Fax và Copy, Scan nhanh vào bộ nhớ, truyền Fax với tốc độ 9.6kbps, chức năng sửa lỗi đường truyền ECM, nhận Fax từ xa, fax liên tục 10 bản, nhớ được 100 tên và số - 10 số gọi nhan', '<p>Máy fax giấy thường, khay chứa được 50 trang A4, điều chỉnh độ sáng tối khi Fax và Copy, Scan nhanh vào bộ nhớ, truyền Fax với tốc độ 9.6kbps, chức năng sửa lỗi đường truyền ECM, nhận Fax từ xa, fax liên tục 10 bản, nhớ được 100 tên và số - 10 số gọi nhanh - nhớ được 28 trang khi hết giấy - gửi Fax theo giờ<br />bảo hành: 12 tháng</p>', 1800000, 'Panasonic_KX_FP7_4af2790d34c62.jpg', 0, 23, '2011-03-11'),
(141, 'Canon Scanner Lide 100', '42', 'Canon Scanner Lide 100 (A4; 2400x4800 dpi; 48bit; Scan & Copy & Email;Tốc độ quét 32 mSEC/dòng với 1200 dpi )', '<div>Canon Scanner Lide 100 (A4; 2400x4800 dpi; 48bit; Scan & Copy & Email;Tốc độ quét 32 mSEC/dòng với 1200 dpi )<br />Bảo hành: 12 tháng</div>', 1200000, 'Canon_Scanner_Li_4af27967a1175.jpg', 1, 69, '2011-03-11'),
(142, 'Canon Scanner Lide 90', '42', 'Canon Scanner Lide 90 (A4; 2400x4800dpi; 48bit; Scan & Copy & Email; Tốc độ quét 19 msec/dòng )', '<div>Canon Scanner Lide 90 (A4; 2400x4800dpi; 48bit; Scan & Copy & Email; Tốc độ quét 19 msec/dòng )<br />bảo hành: 12 tháng</div>', 1600000, 'Canon_Scanner_Li_4af27999ca04f.jpg', 0, 273, '2011-03-11'),
(143, 'Canon Scanner Lide 4400F', '42', 'Canon Scanner Lide 4400F (A4; 4800x9600 dpi; 48bit; Tốc độ quét 15 msec/dòng, Scan film 7-8 msec/dòng )', '<div>Canon Scanner Lide 4400F (A4; 4800x9600 dpi; 48bit; Tốc độ quét 15 msec/dòng, Scan film 7-8 msec/dòng )<br />Bảo hành: 12 tháng</div>', 2550000, '_Canon_Scanner_L_4af279da77ba0.jpg', 0, 156, '2011-03-11'),
(144, 'Máy chiếu Panasonic PT - LB51EA', '38', 'Độ phân giải: XGA (1024x768) - LCD; Cường độ sáng: 2000 Ansi lumen/ Độ tương phản : 400:1; Hình chiếu: 33~300 inch ; Input: D-sub HD 15 pin , S-Video; Trọng lượng: 1.8kg; Bảo hành: 12 ThÃ¡ng cho thân máy, 500 giờ hoặc 3 ThÃ¡ng với bóng đèn tuỳ điều kiện n', '<p>Độ phân giải: XGA (1024x768) - LCD; Cường độ sáng: 2000 Ansi lumen/ Độ tương phản : 400:1; Hình chiếu: 33~300 inch ; Input: D-sub HD 15 pin , S-Video; Trọng lượng: 1.8kg; Bảo hành: 12 ThÃ¡ng cho thân máy, 500 giờ hoặc 3 ThÃ¡ng với bóng đèn tuỳ điều kiện nào đến trước.<br />Bảo hành: 12 tháng</p>', 14200000, 'M__y_chi___u_Pan_4af27a4036bb6.jpg', 1, 463, '2011-03-11'),
(145, 'Máy chiếu Panasonic PT-LB75EA', '38', 'Độ phân giải: XGA (1024x768) - LCD; Cường độ sáng: 2600 Ansi lumen/ Độ tương phản : 500:1; Hình chiếu: 33~300 inch ; Input: D-sub HD 15 pin , S-Video; Kích thước 368x88x233mm ;Trọng lượng: 2.96kg - Bàn phím điểu khiển bằng cảm ứng ; Chức năng tự động khóa', '<p>Độ phân giải: XGA (1024x768) - LCD; Cường độ sáng: 2600 Ansi lumen/ Độ tương phản : 500:1; Hình chiếu: 33~300 inch ; Input: D-sub HD 15 pin , S-Video; Kích thước 368x88x233mm ;Trọng lượng: 2.96kg - Bàn phím điểu khiển bằng cảm ứng ; Chức năng tự động khóa máy; Bảo hành: 12 ThÃ¡ng cho thân máy, 500 giờ hoặc 3 ThÃ¡ng với bóng đèn tuỳ điều kiện nào đến trước.<br />Bảo hành: 12tháng</p>', 18950000, 'M__y_chi___u_Pan_4af27a805d38d.jpg', 0, 345, '2011-03-11'),
(146, 'Máy chiếu Panasonic PT - LB60EA', '38', 'Độ phân giải: XGA (1024x768) - LCD; Cường độ sáng: 3200 Ansi lumen/ Độ tương phản : 400:1; Hình chiếu (inch): 33~300 ; Input: D-sub HD 15 pin , S-Video; Kích thước: 327 x 75 x 233 mm/ Trọng lượng: 2.4Kg; Bảo hành: 12 ThÃ¡ng với thân máy. 500 giờ 3 ThÃ¡ng ', '<div>Độ phân giải: XGA (1024x768) - LCD; Cường độ sáng: 3200 Ansi lumen/ Độ tương phản : 400:1; Hình chiếu (inch): 33~300 ; Input: D-sub HD 15 pin , S-Video; Kích thước: 327 x 75 x 233 mm/ Trọng lượng: 2.4Kg; Bảo hành: 12 ThÃ¡ng với thân máy. 500 giờ 3 ThÃ¡ng với bóng đèn chiếu tuỳ trường hợp nào đến trước.<br />Bảo hành: 12 tháng</div>', 25900000, 'M__y_chi___u_Pan_4af27ab4b98ef.jpg', 0, 337, '2011-03-11'),
(147, 'Acer Aspire 4736Z-431G25Mn.020( Linux )', '32', 'Pentium Dual-Core T4300 (2*2.1GHz, 800MHz FSB)/ 1MB cache/ 1GB Ram/ 250GB HDD/ Intel® GMA 4500M DVDRW/ 14\" WXGA LED TFT-LCD/ Sound 5.1-channel/ Cardreader/ 3*USB 2.0/ VGA port/ HDMI/ Bluetooth/ Camera/ FingerPrint Pin 6 Cells/ Weight 2.3 Kg/ Wifi a/b/g/n ', '<div>Pentium Dual-Core T4300 (2*2.1GHz, 800MHz FSB)/ 1MB cache/ 1GB Ram/ 250GB HDD/ Intel® GMA 4500M DVDRW/ 14\" WXGA LED TFT-LCD/ Sound  5.1-channel/ Cardreader/ 3*USB 2.0/ VGA port/ HDMI/ Bluetooth/ Camera/ FingerPrint Pin 6 Cells/ Weight 2.3 Kg/ Wifi a/b/g/n - Made in China <br />BH: 12 tháng</div>\r\n<div><a href=\"http://www.trananh.vn/?tra=cart&sub=add&id=5351\"><img src=\"http://www.trananh.vn/images/clear.gif\" border=\"0\" alt=\"Dat mua\" width=\"80\" height=\"24\" align=\"left\" /> </a></div>\r\n<div><a href=\"http://www.trananh.vn/?tra=mobile&sub=compare&brand_id=152&compare_product_list=5351&cid=2\"><img src=\"http://www.trananh.vn/images/clear.gif\" border=\"0\" alt=\"So sanh\" width=\"80\" height=\"24\" align=\"left\" /></a></div>', 9480000, 'Acer_Aspire_4736_4af2c53b1d2b1.jpg', 0, 148, '2011-03-11'),
(148, 'Acer Aspire 4736Z-432G32Mn.030 ( Linux )', '32', 'Pentium Dual-Core T4300 (2*2.1GHz, 800MHz FSB)/ 1MB cache/ 2GB DDR2/ 320GB HDD/ Intel® GMA 4500M 512MB shared DVDRW/ 14.1\" WXGA LED TFT-LCD/ Sound 5.1-channel/ Cardreader/ 3*USB 2.0/ VGA port/ HDMI/ Bluetooth/ Camera rạp hát di động độ nét cao ! Công nghệ', '<p>Pentium Dual-Core T4300 (2*2.1GHz, 800MHz FSB)/ 1MB cache/ 2GB DDR2/ 320GB HDD/ Intel® GMA 4500M 512MB shared DVDRW/ 14.1\" WXGA LED TFT-LCD/ Sound  5.1-channel/ Cardreader/ 3*USB 2.0/ VGA port/ HDMI/ Bluetooth/ Camera rạp hát di động độ nét cao ! Công nghệ hình ảnh ngoạn mục - LCD wide 16:9 Full HD1080 màu sắc sống động</p>\r\n<p>BH: 12 tháng</p>', 9300000, 'Acer_Aspire_4736_4af2c5704fef4.jpg', 0, 231, '2011-03-11'),
(149, 'Acer Aspire 4736ZG-432G25Mn.003( Linux )', '32', 'Pentium Dual-Core T4300 (2*2.1GHz, 800MHz FSB)/ 1MB cache/ 2GB DDR2/ 320GB HDD/ 512MB DDR2 NVIDIA® GeForce® G105M /DVDRW/ 14.1\" WXGA LED TFT-LCD/ Sound 5.1-channel/ Cardreader/ 3*USB 2.0/ VGA port/ HDMI/ Bluetooth/ Camera rạp hát di động độ nét cao ! Công', '<p>Pentium Dual-Core T4300 (2*2.1GHz, 800MHz FSB)/ 1MB cache/ 2GB DDR2/ 320GB HDD/ 512MB DDR2 NVIDIA® GeForce® G105M /DVDRW/ 14.1\" WXGA LED TFT-LCD/ Sound 5.1-channel/ Cardreader/ 3*USB 2.0/ VGA port/ HDMI/ Bluetooth/ Camera rạp hát di động độ nét cao ! Công nghệ hình ảnh ngoạn mục - LCD wide 16:9 Full HD1080 màu sắc sống động</p>\r\n<p>BH: 12 tháng</p>', 11190000, '_Acer_Aspire_473_4af2c5b926925.jpg', 1, 210, '2011-03-11'),
(150, 'Acer Aspire 4736G-742G32Mn.058 ( Linux )', '32', 'Core™2 Duo P7450 (2*2.13GHz,1066MHz FSB)/ 3MB cache/ 2GB DDR2/ 320GB HDD/ Nvidia Geforce G105(512MB of Delicate DDR2) DVDRW/ 14\" WXGA LED Backlight 16:9 CineCrystal™/ FingerPrint/ HDMI/ Bluetooth/Wireless/ Camera/ Card Reader Pin 6 Cells/ Weight 2.3 Kg/ W', '<p>Core™2 Duo P7450 (2*2.13GHz,1066MHz FSB)/ 3MB cache/ 2GB DDR2/ 320GB HDD/ Nvidia Geforce G105(512MB of Delicate DDR2) DVDRW/ 14\" WXGA LED Backlight 16:9 CineCrystal™/ FingerPrint/ HDMI/  Bluetooth/Wireless/ Camera/ Card Reader Pin 6 Cells/ Weight 2.3 Kg/ Wifi a/b/g/n - Made in China</p>\r\n<p>BH: 12 tháng</p>', 13980000, 'Acer_Aspire_4736_4af2c5fbdf92d.jpg', 0, 354, '2011-03-11'),
(151, 'HP Pavilion DV4-1504TU - VV020PA (Windows 7 Basic)', '33', 'Pentium Dual-Core T4400(2*2.2Ghz,FSB800Mhz, 45nm) /1MB Cache/ 2GB DDRAM3/ HDD 320GB / VGA Intel GMA X4500 HD upto 512MB Shared DVD-RW + LightScrible / 14.1\" WXGA HD HP LED Brightview Widescreen Display/ Modem 56Kbps/Bluetooth/Secure Digital (SD) slot Touc', '<div>Pentium Dual-Core T4400(2*2.2Ghz,FSB800Mhz, 45nm) /1MB Cache/ 2GB DDRAM3/ HDD 320GB / VGA Intel GMA X4500 HD upto 512MB Shared   DVD-RW + LightScrible / 14.1\" WXGA HD  HP LED Brightview Widescreen Display/ Modem 56Kbps/Bluetooth/Secure Digital (SD) slot  Touchpad Mouse / Webcam /eSATA/ 1 HDMI/ Weight 2.17Kg /  Wireless / Pin 6 cells - Made in China<br />BH: 12 tháng</div>\r\n<div><a href=\"http://www.trananh.vn/?tra=cart&sub=add&id=9086\"><img src=\"http://www.trananh.vn/images/clear.gif\" border=\"0\" alt=\"Dat mua\" width=\"80\" height=\"24\" align=\"left\" /> </a></div>\r\n<div><a href=\"http://www.trananh.vn/?tra=mobile&sub=compare&brand_id=149&compare_product_list=9086&cid=2\"><img src=\"http://www.trananh.vn/images/clear.gif\" border=\"0\" alt=\"So sanh\" width=\"80\" height=\"24\" align=\"left\" /></a></div>', 15490000, 'HP_Pavilion_DV4__4af2c6565b0c4.jpg', 1, 141, '2011-03-11'),
(152, 'Compaq Presario CQ40-429TU ( NJ015PA ) - PC Dos', '33', 'Intel Celeron Dual-Core T1600 ( 2*1.66GHz ) /1MB Cache/ 1GB Ram / 160GB HDD / VGA intel GMA 128MB shared DVDRW DL / Fax + NIC / 14.1\" TFT WXGA Bright View Display / Camera / Weight 2.2Kg / Wireless 802.11b.g - Made in China', '<p>Intel Celeron Dual-Core T1600 ( 2*1.66GHz ) /1MB Cache/ 1GB Ram / 160GB HDD /  VGA intel GMA 128MB shared DVDRW DL  /  Fax + NIC / 14.1\" TFT WXGA Bright View Display / Camera /  Weight 2.2Kg / Wireless 802.11b.g - Made in China</p>\r\n<p>BH: 12 tháng</p>', 8400000, '_Compaq_Presario_4af2c6b68a6c7.jpg', 1, 143, '2011-03-11'),
(153, 'Compaq Presario CQ40-502TX - VB693PA - PC Dos', '33', 'Intel Core 2 Duo T6500 (2*2.1GHz) / 2MB Cache/ 2GB Ram/ 250GB HDD/ eSATA/ ExpressCard/ Modem VGA nVidia GeForce G103M 256MB/ DVD-RW / 14.1\" WXGA Bright View + HDMI / Card Reader / Bluetooth / Webcam/ LAN / Loa Altec Lansing/ Wireless / Pin 6 cell/ Weight ', '<p>Intel Core 2 Duo T6500 (2*2.1GHz)  / 2MB Cache/ 2GB Ram/ 250GB HDD/ eSATA/ ExpressCard/ Modem VGA nVidia GeForce G103M 256MB/ DVD-RW / 14.1\" WXGA Bright View + HDMI / Card Reader / Bluetooth / Webcam/ LAN / Loa Altec Lansing/ Wireless / Pin 6 cell/ Weight 2,35kg - China</p>\r\n<p>BH: 12 tháng</p>', 14655000, 'Compaq_Presario__4af2c6eac7c77.jpg', 0, 293, '2011-03-11'),
(154, 'HP ProBook 4410s-VF902PA (PC Dos)', '33', 'Pentium Dual-Core T4300 (2x2.1GHz, FSB 800MHz) / 1MB L2 Cache/ 1GB DDR2-800 / 160GB HDD / VGA Intel GMA X4500 upto 512MB Shared/ DVDRW LightScribe / Express Card / 14\" wide 16:9 LED backlight LCD / BlueTooth / Webcam Giga LAN/ Card Reader / Wireless 802.1', '<div>Pentium Dual-Core T4300 (2x2.1GHz, FSB 800MHz) / 1MB L2 Cache/ 1GB DDR2-800 / 160GB HDD / VGA Intel GMA X4500   upto 512MB Shared/ DVDRW LightScribe / Express Card / 14\" wide 16:9 LED backlight  LCD / BlueTooth / Webcam Giga LAN/ Card Reader / Wireless 802.11b.g.n/ Weight 2.2Kg / Pin 6 cell - Made in China<br />BH: 12 tháng</div>', 11490000, 'HP_ProBook_4410s_4af2c722b03a3.jpg', 0, 32, '2011-03-11'),
(155, 'HP Probook 4410s-VE868PA (PC Dos) Màu đỏ', '33', 'Core 2 Duo T6570 (2x2.1GHz, FSB 800MHz) / 2MB L2 Cache/ 1GB RAM / 250GB HDD / VGA Intel GMA X4500 upto 512MB Shared/ DVDRW LightScribe / Express Card / 14\" wide 16:9 LED backlight LCD / BlueTooth / Webcam Giga LAN/ Card Reader / Wireless 802.11b.g.n/ Weig', '<div>Core 2 Duo T6570 (2x2.1GHz, FSB 800MHz) / 2MB L2 Cache/ 1GB RAM / 250GB HDD / VGA Intel GMA X4500   upto 512MB Shared/ DVDRW LightScribe / Express Card / 14\" wide 16:9 LED backlight  LCD / BlueTooth / Webcam Giga LAN/ Card Reader / Wireless 802.11b.g.n/ Weight 2.2Kg / Pin 6 cell - Made in China<br />BH: 12 tháng</div>', 14245000, 'HP_Probook_4410s_4af2c7869c905.jpg', 0, 282, '2011-03-11'),
(156, 'Lenovo G450 (5902-3847) - PC Dos', '34', 'Celeron Dual-Core T3100 (2*1.9GHz, FSB800MHz) /1MB Cache / 1GB DDR3 / 250GB HDD / 14.1\" LED Backlight LCD wide 16:9 VGA Intel GMA X4500 upto 512MB Shared / DVD-ReWrite / Touchpad Mouse / Camera Weight 2.2Kg / Wireless 802.11g - Made in China', '<div>Celeron Dual-Core T3100 (2*1.9GHz, FSB800MHz) /1MB Cache /  1GB DDR3 / 250GB HDD / 14.1\" LED Backlight LCD wide 16:9 VGA Intel GMA X4500 upto 512MB  Shared / DVD-ReWrite /  Touchpad Mouse / Camera   Weight  2.2Kg /  Wireless 802.11g - Made in China<br />BH: 12 tháng</div>', 8190000, 'Lenovo_G450__590_4af2c7e39f1ea.jpg', 1, 316, '2011-03-11'),
(157, 'Lenovo G450 (5902-3666) - PC Dos', '34', 'Pentium Dual-Core T4300 (2*2.1GHz FSB800MHz) /1MB Cache / 1GB DDR3 / 250GB HDD / 14.1\" LED Backlight LCD wide 16:9 VGA Intel GMA X4500 upto 512MB Shared / DVD-ReWrite / Touchpad Mouse / Camera Weight 2.2Kg / Wireless 802.11g - Made in China', '<div>Pentium Dual-Core T4300 (2*2.1GHz FSB800MHz) /1MB Cache /  1GB DDR3 / 250GB HDD / 14.1\" LED Backlight LCD wide 16:9 VGA Intel GMA X4500 upto 512MB  Shared / DVD-ReWrite /  Touchpad Mouse /  Camera   Weight  2.2Kg /  Wireless 802.11g - Made in China<br />BH: 12 tháng</div>', 9990000, 'Lenovo_G450__590_4af2c826ef0ba.jpg', 0, 230, '2011-03-11'),
(158, 'Lenovo G230 (5901-9598) - PC Dos', '34', 'Pentium Dual-Core T4200 (2*2.0GHz FSB800MHz) /1MB Cache / 2GB DDR2 / 320GB HDD /12.1\" LED Backlight LCD VGA Intel GMA X4500 upto 512MB Shared / DVD-ReWrite / Modem 56Kbps / Touchpad Mouse / 5 in 1 Card Reader / Camera BlueTooth/ Weight 1.8Kg / Wireless 80', '<div>Pentium Dual-Core T4200 (2*2.0GHz FSB800MHz) /1MB Cache / 2GB DDR2 / 320GB HDD /12.1\" LED Backlight LCD VGA Intel GMA X4500 upto 512MB Shared / DVD-ReWrite / Modem 56Kbps / Touchpad Mouse / 5 in 1 Card Reader / Camera BlueTooth/ Weight 1.8Kg / Wireless 802.11g/n - Made in China - Siêu nhỏ gọn - HDD dung lượng lớn - LCD có đèn nền LED siêu sáng, tiết kiệm điện - WiFi chuẩn N tốc độ cao !!!<br />BH: 12 tháng</div>', 10695000, 'Lenovo_G230__590_4af2c85a1f041.jpg', 0, 203, '2011-03-11'),
(159, 'Lenovo IdeaPad Y450 - Black Keyboard (5902-2879)-Dos', '34', 'Core 2 Duo T6600 (2x2.2GHz )/ 2MB Cache / 2GB DDR3 / 320GB HDD / 14.1\" LED Backlight LCD/ HDMI/ VGA  Intel GMA X4500MHD up to 512MB shared/ DVD-RW  DL / NIC /  Touchpad Mouse /  Camera/ eSATA/Bluetooth / 6 in 1 Card Reader/  Weight 2.2Kg / Wireless 802.11', '<div>Core 2 Duo T6600 (2x2.2GHz )/ 2MB Cache / 2GB DDR3 / 320GB HDD / 14.1\" LED Backlight LCD/ HDMI/ VGA  Intel GMA X4500MHD up to 512MB shared/ DVD-RW  DL / NIC /  Touchpad Mouse /  Camera/ eSATA/Bluetooth / 6 in 1 Card Reader/  Weight 2.2Kg / Wireless 802.11b/g/n -  Made in China - Thiết kế trẻ trung thời trang - bàn phím đen tuyền sang trọng - dãy phím cảm ứng đa chức năng sành điệu - LCD đèn nền LED<br />BH: 12 tháng</div>', 13795000, 'Lenovo_IdeaPad_Y_4af2c8907e1c1.jpg', 0, 326, '2011-03-11');
INSERT INTO `product` (`ma_san_pham`, `ten_san_pham`, `ma_loai`, `mo_ta_tom_tat`, `mo_ta_chi_tiet`, `don_gia`, `hinh`, `san_pham_moi`, `so_lan_xem`, `ngay_tao`) VALUES
(160, 'Toshiba Satellite L510-P406 (PSLF8L-00C001) PC-DOS', '35', 'Pentium Dual-Core T4300 (2*2.1GHz, FSB 800MHz, 45nm)/ 1MB Cache / 1GB DDR2-800 / 250GB HDD / DVD-RW DL VGA Intel X4500MHD up to 512MB / Modem 56Kbps / LAN / 14\" LED Backlight LCD wide 16:9/ eSATA/ Card reader / Webcam Bluetooth/ Weight 2.3Kg/ Wireless 802', '<div>Pentium Dual-Core T4300 (2*2.1GHz, FSB 800MHz, 45nm)/ 1MB Cache / 1GB DDR2-800 / 250GB HDD / DVD-RW DL VGA Intel X4500MHD up to 512MB / Modem 56Kbps / LAN / 14\" LED Backlight LCD wide 16:9/ eSATA/ Card reader / Webcam Bluetooth/ Weight 2.3Kg/ Wireless 802.11a/b/g/n - Made in China - Vỏ phủ sơn bóng, khắc vân chìm 3D IMR \"làn gió nhẹ\" + phím Multimedia rời + LCD công nghệ LED<br />BH: 12 tháng</div>', 929000, 'Toshiba_Satellit_4af2c8e7d81aa.jpg', 0, 21, '2011-03-11'),
(161, 'Toshiba Satellite L510-S405 (PSLFLL-004002) PC-DOS', '35', 'Core 2 Duo T6500 (2*2.1GHz, FSB 800MHz, 45nm)/ 2MB Cache / 2GB Ram / 250GB HDD/ Card reader / Webcam VGA ATI Radeon HD4530 256MB GDDR2/ 14\" LED Backlight LCD/ HDMI / eSATA/ DVD-RW DL /Bluetooth Modem 56Kbps / LAN /Weight 2.3Kg/ Wireless 802.11a/b/g/n - Ma', '<div>Core 2 Duo T6500 (2*2.1GHz, FSB 800MHz, 45nm)/ 2MB Cache / 2GB Ram / 250GB HDD/ Card reader / Webcam VGA ATI Radeon HD4530 256MB GDDR2/ 14\" LED Backlight LCD/ HDMI / eSATA/ DVD-RW DL /Bluetooth Modem 56Kbps / LAN /Weight 2.3Kg/ Wireless 802.11a/b/g/n - Made in China - Laptop thế hệ mới nhất, vỏ phủ sơn bóng, khắc vân chìm 3D IMR \"làn gió nhẹ\" + VGA card rời + LCD công nghệ LED<br />BH: 12 tháng</div>', 15700000, 'Toshiba_Satellit_4af2c9470f39c.jpg', 0, 125, '2011-03-11'),
(162, 'Toshiba Satellite L300-P503 (PSLBGL-02500L) PC-DOS', '35', 'Pentium Dual-Core T4300 (2*2.1GHz, FSB 800MHz, 45nm)/ 1MB Cache / 1GB DDR2 / 250GB HDD VGA Intel GMA X4500MHD up to 512MB/ 15.4\" LCD WXGA / DVD-RW DL / Card reader / Webcam Modem 56Kbps / LAN /Weight 2.57Kg/ Wireless 802.11b/g / Pin 6 cell - Made in China', '<div>Pentium Dual-Core T4300 (2*2.1GHz, FSB 800MHz, 45nm)/ 1MB Cache / 1GB DDR2 / 250GB HDD VGA Intel GMA X4500MHD up to 512MB/ 15.4\" LCD WXGA / DVD-RW DL / Card reader / Webcam Modem 56Kbps / LAN /Weight 2.57Kg/ Wireless 802.11b/g / Pin 6 cell - Made in China - Vỏ phủ sơn đen bóng, khắc vân chìm 3D IMR \"làn gió nhẹ\" - HDD chống sốc - thích hợp cho sử dụng CAD, đồ họa<br />BH: 12 tháng</div>', 9900000, 'Toshiba_Satellit_4af2c97fea571.jpg', 0, 60, '2011-03-11'),
(163, 'DELL Inspiron 1545 (S560605 - Blue ) Linux', '36', 'Core 2 Duo T6600 (2x2.2GHz, FSB800MHz, 45nm) / 2MB Cache / 2GB DDR2-800 / VGA Intel GMA X4500MHD upto 512MB HDD 320GB SATA / DVD-RW / 15.6\" LED Backlight wide 16:9 LCD / Pin 6 Cell / Wireless / Card Reader / Webcam/ Bluetooth Weight 2.4Kg / Made in China ', '<div>Core 2 Duo T6600 (2x2.2GHz, FSB800MHz, 45nm) / 2MB Cache / 2GB DDR2-800 / VGA Intel GMA X4500MHD upto 512MB HDD 320GB SATA / DVD-RW / 15.6\" LED Backlight wide 16:9 LCD / Pin 6 Cell /  Wireless /  Card Reader / Webcam/ Bluetooth Weight 2.4Kg  / Made in China - Phong cách trẻ trung ấn tương - LCD đèn nền LED siêu sáng, tiết kiệm pin - HDD dung lượng lớn<br />BH: 12 tháng</div>', 13450000, 'DELL_Inspiron_15_4af2c9da4abc0.jpg', 0, 426, '2011-03-11'),
(164, 'DELL Vostro A860 R520004 (Linux)', '36', 'Intel Celeron Dual-Core T1400 (2*1.73GHz, FSB533MHz) / 512KB Cache / 1GB DDRam/ HDD 120GB SATA / VGA GMA X3100 128MB shared DVD-RW / 15.6\" wide 16:9 HD720p - WXGA TrueLife / Pin 6 Cell / Bluetooth / Wireless / Weight 2.55Kg - Made in China', '<div>Intel Celeron Dual-Core T1400 (2*1.73GHz, FSB533MHz) / 512KB Cache / 1GB DDRam/ HDD 120GB SATA / VGA GMA X3100 128MB shared DVD-RW / 15.6\" wide 16:9 HD720p - WXGA TrueLife / Pin 6 Cell / Bluetooth / Wireless /  Weight 2.55Kg  - Made in China<br />BH: 12 tháng</div>', 8200000, 'DELL_Vostro_A860_4af2ca2d3fd83.jpg', 0, 448, '2011-03-11'),
(166, 'HP Pavilion P6117L ( PC Dos )', '31', '\"Core 2 Duo E7500(2.93GHz/3 MB/1066MHz)/G33 Chipset/2GB-DDR2 /Sound 5.1/HDD 320GB/DVD-RW LightScrible (ghi nhãn đĩa) GeForce 7100 UMA Intergrated, PCI E 16X / Gigabit NIC / wifi 802.11 b/g / Media Card Reader 15-in-1 / multimedia key + mouse.\"', '<div>\"Core 2 Duo E7500(2.93GHz/3 MB/1066MHz)/G33 Chipset/2GB-DDR2 /Sound 5.1/HDD 320GB/DVD-RW LightScrible (ghi nhãn đĩa) GeForce 7100 UMA Intergrated, PCI E 16X / Gigabit NIC / wifi 802.11 b/g  / Media Card Reader 15-in-1 / multimedia key + mouse.\"<br />BH: 12 tháng</div>', 9000000, 'HP_Pavilion_P611_4af2cb3e92bac.jpg', 0, 463, '2011-03-11'),
(167, 'HP Pavilion P6118L (PC Dos)', '28', 'Core 2 Quad Q8300(2.33Hz/1066z/8MB) / G33 Chipset / 2GB-DDR3 / Sound 7.1 / HDD 320GB / DVD-RW LightScrible (ghi nhãn đĩa) GeForce G210 512MB/ PCI E 16X/Gigabit NIC / wifi 802.11 b/g / Media Card Reader 15-in-1 / Wireless keyboard + Wireless mouse .', '<div>Core 2 Quad Q8300(2.33Hz/1066z/8MB) / G33 Chipset / 2GB-DDR3 / Sound 7.1 / HDD 320GB / DVD-RW LightScrible (ghi nhãn đĩa)  GeForce G210 512MB/ PCI E 16X/Gigabit NIC / wifi 802.11 b/g / Media Card Reader 15-in-1 / Wireless keyboard + Wireless mouse .<br />BH: 12 tháng</div>', 11300000, 'HP_Pavilion_P611_4af2cb7656a26.jpg', 0, 471, '2011-03-11'),
(168, 'HP Compaq Presario CQ3016L ( PC Dos )', '28', 'Pentium Dual Core E5200(2.5GHz/800M/2MB) / Intel G31 Express Chipset / 1GB-DDR2 / Sound 5.1 / HDD 250GB / DVD Intel Graphics Intergrated / PCI E 16X/10-100Mbps NIC / Modem / Free-DOS/', '<div>Pentium Dual Core E5200(2.5GHz/800M/2MB) / Intel G31 Express Chipset / 1GB-DDR2 / Sound 5.1 / HDD 250GB / DVD Intel Graphics Intergrated / PCI E 16X/10-100Mbps NIC / Modem  / Free-DOS/<br />BH: 12 tháng</div>', 5000000, 'HP_Compaq_Presar_4af2cbd08af76.jpg', 0, 466, '2011-03-11'),
(169, 'DELL VOSTRO-220MT (PC-Dos)', '31', 'Pentium Dual Core E5300 (2.6 GHz/ 800MHz FSB/ 2MB Cache L2)/ 2GB PC26400- 800/160G HDD SATA/DVDRW/keyboard/ Mouse/PC Dos', '<div>Pentium Dual Core E5300 (2.6 GHz/ 800MHz FSB/ 2MB Cache L2)/ 2GB PC26400- 800/160G HDD SATA/DVDRW/keyboard/ Mouse/PC Dos<br />BH: 12 tháng</div>', 6630000, 'DELL_VOSTRO_220M_4af2cc1381e56.jpg', 1, 414, '2011-03-11'),
(170, 'CMS S118 – 01 ( Linux )', '29', 'Intel Pentium Dual Core E2200 (2.2GHz, 800MHz FSB, 1MB Cache L2), Intel G31 Express Chipset, 1GB DDR2 Memory, 250GB SATA HDD, DVD RW, Int Gfx, KB, Mouse', '<div>Intel Pentium Dual Core E2200 (2.2GHz, 800MHz FSB, 1MB Cache L2), Intel G31 Express Chipset, 1GB DDR2 Memory, 250GB SATA HDD, DVD RW, Int Gfx, KB, Mouse<br />BH: 12 tháng</div>', 4700000, 'CMS_S118_____01__4af2cc96eb290.jpg', 0, 172, '2011-03-11'),
(171, 'CMS S129-11 ( Linux )', '29', 'Intel Pentium Dual Core E5300 (2.6GHz, 800MHz FSB, 2MB Cache L2), Intel G31 Express Chipset, 1GB DDR2 Memory, 320GB SATA HDD , DVD RW, Int Gfx, KB, Mouse, Linux', '<div>Intel Pentium Dual Core E5300 (2.6GHz, 800MHz FSB, 2MB Cache L2), Intel G31 Express Chipset, 1GB DDR2 Memory, 320GB SATA HDD , DVD RW, Int Gfx, KB, Mouse, Linux<br />BH: 12 tháng</div>', 5190000, '_CMS_S129_11___L_4af2ccdc49f33.jpg', 0, 119, '2011-03-11'),
(172, 'CMS Scorpion S175-31 ( Linux )', '29', 'Intel® Core 2 Duo E7500 (2.93GHz, 1066MHz FSB, 3MB Cache L2), Intel G31 Express Chipset, 2GB DDR2 Memory, 320GB SATA HDD, DVD-RW, Nvidia GF 8400GS 512MB VGA, KB, Mouse.', '<div>Intel® Core 2 Duo E7500 (2.93GHz, 1066MHz FSB, 3MB Cache L2), Intel G31 Express Chipset, 2GB DDR2 Memory, 320GB SATA HDD, DVD-RW, Nvidia GF 8400GS 512MB VGA, KB, Mouse.<br />BH: 24 tháng</div>', 7890000, 'CMS_Scorpion_S17_4af2cd12bc9c2.jpg', 0, 77, '2011-03-11'),
(173, 'Elead M515 -e42373-E5300 (PC DOS)', '30', 'Intel Pentium DualCore E5300 2.6GHz / 1.0MB Cache / Chipset G31 / 1GB DDR2 / 320GB SATA2 HDD DVDROM / VGA 128Mb Shared onboard/ Sound & NIC onboard / Keyboard + Mouse.', '<div>Intel Pentium DualCore E5300 2.6GHz / 1.0MB Cache / Chipset G31 / 1GB DDR2 / 320GB SATA2 HDD DVDROM / VGA 128Mb Shared onboard/ Sound & NIC onboard / Keyboard + Mouse.<br />BH: 24 tháng</div>', 5000000, 'Elead_M515__e423_4af2cd6cae99c.jpg', 0, 27, '2011-03-11'),
(174, 'Elead G675 -e42373-E5300 (PC DOS)', '30', 'Intel Pentium DualCore E5300 2.6GHz / 2.0MB Cache / Chipset G31 / 1GB DDR2 / 320GB SATA2 HDD DVDROM / NVIDIA Geforce 7series GPU share max to 256MB/ Keyboard + Mouse / Reader .', '<div>Intel Pentium DualCore E5300 2.6GHz / 2.0MB Cache / Chipset G31 / 1GB DDR2 / 320GB SATA2 HDD DVDROM / NVIDIA Geforce 7series GPU share max to 256MB/ Keyboard + Mouse / Reader .<br />BH: 24 tháng</div>', 6040000, 'Elead_G675__e423_4af2cdc688432.jpg', 1, 402, '2011-03-11'),
(175, 'Homesound MS 301 - 2.1', '48', 'Homesound MS 301 - 2.1', '<p>Homesound MS 301 - 2.1</p>\r\n<p>BH: 12 tháng</p>', 290000, 'Homesound_MS_301_4af3a3ebb9f61.jpg', 0, 432, '2011-03-11'),
(176, 'Homesound MS 305 - 2.1', '48', '', '', 545000, 'Homesound_MS_305_4af3a4742d670.jpg', 0, 452, '2011-03-11'),
(177, 'Homesound MS 306A - 2.1', '48', 'Homesound MS 306A - 2.1', '<p>Homesound MS 306A - 2.1</p>\r\n<p>BH: 12 tháng</p>', 270000, 'Homesound_MS_306_4af3a4aec66c6.jpg', 1, 464, '2011-03-11'),
(178, 'Homesound MS 315 - 2.1', '48', 'Homesound MS 315 - 2.1', '<p>Homesound MS 315 - 2.1</p>', 250000, 'Homesound_MS_315_4af3a4e34f4c8.jpg', 0, 462, '2011-03-11'),
(179, 'Homesound MS 508 - 4.1', '48', 'Homesound MS 508 - 4.1', '<p>Homesound MS 508 - 4.1              <br />BH: 12 tháng<a href=\"http://www.bachkhoapc.vn/index.php?page=shop.product_details&flypage=flypage.tpl&product_id=156&category_id=50&option=com_virtuemart&Itemid=53\" title=\"Xem chi tiết\"><br /></a></p>', 550000, 'Homesound_MS_508_4af3a51a6dd92.jpg', 0, 418, '2011-03-11'),
(180, 'Flash USB 4Gb Kingston', '51', 'Flash USB 4Gb Kingston', '<p>Flash USB 4Gb Kingston              <a href=\"http://www.bachkhoapc.vn/index.php?page=shop.product_details&flypage=flypage.tpl&product_id=163&category_id=51&option=com_virtuemart&Itemid=53\" title=\"Xem chi tiết\"><br /></a></p>', 180000, 'Flash_USB_4Gb_Ki_4af3a55d6da82.jpg', 1, 205, '2011-03-11'),
(181, 'Kingston 8Gb USB Flash Disk USB 2.0', '51', 'Kingston 8Gb USB Flash Disk USB 2.0', '<p>Kingston 8Gb USB Flash Disk USB 2.0</p>', 350000, 'Kingston_8Gb_USB_4af3a5a12099a.jpg', 1, 268, '2011-03-11'),
(182, 'TRANSCEND 4GB', '51', 'TRANSCEND 4GB', '<h3>TRANSCEND 4GB<br />BH: 12 tháng<a href=\"http://www.bachkhoapc.vn/index.php?page=shop.product_details&flypage=flypage.tpl&product_id=161&category_id=51&option=com_virtuemart&Itemid=53\" title=\"TRANSCEND 4GB\"></a></h3>', 175000, 'TRANSCEND_4GB_4af3a5e437fb5.jpg', 0, 224, '2011-03-11'),
(183, 'Webcam Chữ A kẹp 2.0 tự nhận', '0', 'Tốc độ quay 2.0 Megapixel - Ko cần Driver, cắm vào máy là dùng ngay', '<p>Tốc độ quay 2.0 Megapixel  - Ko cần Driver, cắm vào máy là dùng ngay              <br />BH: 06 tháng<a href=\"http://www.bachkhoapc.vn/index.php?page=shop.product_details&flypage=flypage.tpl&product_id=193&category_id=52&option=com_virtuemart&Itemid=53\" title=\"Xem chi tiết\"><br /></a></p>', 90000, 'Webcam_Ch____A_k_4af3a633903e7.jpg', 1, 317, '2011-03-11'),
(184, 'Webcam tự nhận (Micphone)', '49', 'Webcam tự nhận siêu nét, có mic Foxdigi Webcam Hãng sản xuất: Foxdigi / Độ phân giải ảnh: 352x288 / Số điểm ảnh: 320 nghìn / Tốc độ khung : 18fps / Kết nối: USB, USB2.0, / Tính năng: Zoom số 2X, Zoom số 4X, / Trọng lượng(g): 200 /', '<p>Webcam tự nhận siêu nét, có mic Foxdigi Webcam Hãng sản xuất: Foxdigi / Độ phân giải ảnh: 352x288 / Số điểm ảnh: 320 nghìn / Tốc độ khung : 18fps / Kết nối: USB, USB2.0, / Tính năng: Zoom số 2X, Zoom số 4X, / Trọng lượng(g): 200 /  <br />BH: 06 tháng<a href=\"http://www.bachkhoapc.vn/index.php?page=shop.product_details&flypage=flypage.tpl&product_id=192&category_id=52&option=com_virtuemart&Itemid=53\" title=\"Xem chi tiết\"><br /></a></p>', 130000, 'Webcam_t____nh___4af3a66e2b6dd.jpg', 1, 411, '2011-03-11'),
(185, 'Webcam tự nhận Robot', '49', 'Webcam tự nhận siêu nét quay xa 20m Foxdigi Webcam Hãng sản xuất: Foxdigi / Độ phân giải ảnh: 352x288 / Số điểm ảnh: 320 nghìn / Tốc độ khung : 18fps / Kết nối: USB, USB2.0, / Tính năng: Zoom số 2X, Zoom số 4X, / Trọng lượng(g): 200 /', '<p>Webcam tự nhận siêu nét quay xa 20m Foxdigi Webcam Hãng sản xuất: Foxdigi / Độ phân giải ảnh: 352x288 / Số điểm ảnh: 320 nghìn / Tốc độ khung : 18fps / Kết nối: USB, USB2.0, / Tính năng: Zoom số 2X, Zoom số 4X, / Trọng lượng(g): 200 /  <br />BH: 06 tháng<a href=\"http://www.bachkhoapc.vn/index.php?page=shop.product_details&flypage=flypage.tpl&product_id=191&category_id=52&option=com_virtuemart&Itemid=53\" title=\"Xem chi tiết\"><br /></a></p>', 120000, 'Webcam_t____nh___4af3a6a2dfa8b.jpg', 0, 106, '2011-03-11'),
(186, 'TiviBox GADMEi 5821E', '52', 'TiviBox GADMEi 5821E - Extenal (dùng cho màn hình LCD)', '<p>TiviBox GADMEi 5821E - Extenal (dùng cho màn hình LCD)</p>\r\n<p>BH: 12 tháng</p>', 460000, 'TiviBox_GADMEi_5_4af3a6e35ed0d.jpg', 1, 297, '2011-03-11'),
(187, 'TV-box Gadmei 3820E', '52', 'TV-box Gadmei 3820E (dùng cho màn hình CRT)', '<p>TV-box Gadmei 3820E (dùng cho màn hình CRT)              <br />BH: 12 tháng<a href=\"http://www.bachkhoapc.vn/index.php?page=shop.product_details&flypage=flypage.tpl&product_id=194&category_id=53&option=com_virtuemart&Itemid=53\" title=\"Xem chi tiết\"><br /></a></p>', 295000, 'TV_box_Gadmei_38_4af3a7659008d.jpg', 0, 164, '2011-03-11'),
(188, 'Headphone Salar V41', '50', 'Headphone Salar V41', '<p>Headphone Salar V41</p>', 30000, 'Headphone_Salar__4af3a7e8d8c89.jpg', 1, 428, '2011-03-11'),
(189, 'Micphone Sony MDR-V700DJ', '50', 'Micphone Sony MDR-V700DJ', '<p>Micphone Sony MDR-V700DJ              <a href=\"http://www.bachkhoapc.vn/index.php?page=shop.product_details&flypage=flypage.tpl&product_id=171&category_id=54&option=com_virtuemart&Itemid=53\" title=\"Xem chi tiết\"><br /></a></p>', 90000, 'Micphone_Sony_MD_4af3a81744b8c.jpg', 0, 149, '2011-03-11'),
(190, 'HDD Box JVJ ATA', '53', 'Mô tả: Hộp đựng ổ cứng HDD notebook 2.5\' SATA Giao tiếp với máy tinh qua cổng USB 2.0 High speed (Bề mặt có phủ lớp chống trầy)', '<p>Mô tả: Hộp đựng ổ cứng HDD notebook 2.5\' SATA Giao tiếp với máy tinh qua cổng USB 2.0 High speed (Bề mặt có phủ lớp chống trầy)  <a href=\"http://www.bachkhoapc.vn/index.php?page=shop.product_details&flypage=flypage.tpl&product_id=197&category_id=56&option=com_virtuemart&Itemid=53\" title=\"Xem chi tiết\"><br /></a></p>', 140000, 'HDD_Box_JVJ_ATA_4af3a86752dab.jpg', 0, 459, '2011-03-11'),
(191, 'HDD BOX JVJ SATA', '53', 'Tổng quát: Hộp đựng ổ cứng HDD notebook 2.5\' SATA Giao tiếp với máy tinh qua cổng USB 2.0 High speed (Bề mặt có phủ lớp chống trầy)', '<p>Tổng quát:  Hộp đựng ổ cứng HDD notebook 2.5\' SATA Giao tiếp với máy tinh qua cổng USB 2.0 High speed (Bề mặt có phủ lớp chống trầy)              <a href=\"http://www.bachkhoapc.vn/index.php?page=shop.product_details&flypage=flypage.tpl&product_id=198&category_id=56&option=com_virtuemart&Itemid=53\" title=\"Xem chi tiết\"><br /></a></p>', 190000, 'HDD_BOX_JVJ_SATA_4af3a8992f7cb.jpg', 0, 346, '2011-03-11'),
(192, 'Tay game đôi USB', '53', 'Tay game đôi USB', '<p>Tay game đôi USB              <a href=\"http://www.bachkhoapc.vn/index.php?page=shop.product_details&flypage=flypage.tpl&product_id=200&category_id=57&option=com_virtuemart&Itemid=53\" title=\"Xem chi tiết\"><br /></a></p>', 110000, 'Tay_game_____i_U_4af3a8eb6502e.jpg', 1, 356, '2011-03-11'),
(193, 'Tay game đơn USB', '53', 'Tay game đơn USB - dual-shock joystick', '<p>Tay game đơn USB - dual-shock joystick              <a href=\"http://www.bachkhoapc.vn/index.php?page=shop.product_details&flypage=flypage.tpl&product_id=199&category_id=57&option=com_virtuemart&Itemid=53\" title=\"Xem chi tiết\"><br /></a></p>', 80000, 'Tay_game_____n_U_4af3a92351cd8.jpg', 0, 239, '2011-03-11'),
(194, 'Sony Vaio CW15FG', '71', 'Core 2 Duo T6600 (2*2.2GHz, FSB800MHz)/ 1MB Cache/3GB Ram/ 250GB HDD/ VGA Intel GMA X4500MHD upto 512MB DVDRW DL/ 14\" Wide (WXGA 1280 x 800) Clear Bright LCD/ IEEE 1394/ Webcam/ Card Reader/ NIC/ Card reader/ Bluetooth/HDMI Weight 2.6Kg / Wireless LAN IEE', '<h1><span style=\"font-size: small;\">Core 2 Duo T6600 (2*2.2GHz, FSB800MHz)/ 1MB Cache/3GB Ram/ 250GB HDD/ VGA Intel GMA X4500MHD upto 512MB DVDRW DL/ 14\" Wide (WXGA 1280 x 800) Clear Bright LCD/ IEEE 1394/ Webcam/  Card Reader/ NIC/ Card reader/ Bluetooth/HDMI Weight 2.6Kg / Wireless LAN IEEE 802.11a/b/g - Made in China - Bề mặt sáng bóng - Đường viền thanh thoát - Phím bấm tách biệt</span></h1>', 19990000, 'Sony_Vaio_CW15FG_4afe9e841c46c.jpg', 0, 129, '2011-03-11'),
(195, 'Sony Vaio CW16FG', '71', 'ore 2 Duo P8700 (2.53GHz, FSB 1066 MHz)/ 3MB Cache/ 4GB Ram/ 320GB HDD/ 512MB NVIDIA GeForce GT230M GPU DVDRW DL/ 14\" Wide (WXGA 1280 x 800) Clear Bright LCD/ IEEE 1394/ Webcam/ Card Reader/ NIC/ Card reader/ Bluetooth/HDMI Weight 2.6Kg / Wireless LAN IEE', '<h1><span style=\"font-size: small;\">Core 2 Duo P8700 (2.53GHz, FSB 1066 MHz)/ 3MB Cache/ 4GB Ram/ 320GB HDD/ 512MB NVIDIA GeForce GT230M GPU DVDRW DL/ 14\" Wide (WXGA 1280 x 800) Clear Bright LCD/ IEEE 1394/ Webcam/  Card Reader/ NIC/ Card reader/ Bluetooth/HDMI Weight 2.6Kg / Wireless LAN IEEE 802.11a/b/g - Made in China - Bề mặt sáng bóng - Đường viền thanh thoát - Phím bấm tách biệt</span></h1>\r\n<p><img src=\"images/stories/sony_vaio_cr_3.jpg\" border=\"0\" /></p>', 22990000, 'Sony_Vaio_CW16FG_4afeb00179f8d.jpg', 1, 427, '2011-03-11'),
(197, 'Máy in laser màu HP COLOUR LASERJET 2600N', '37', 'Tốc độ in: 8 ppm A4/Letter Black & Colour,\r\n\r\nBộ xử lý: 264 MHz processor,\r\n\r\nĐộ phân giải: 600x600dpi with Image Ret 2400,\r\n\r\nBộ nhớ: 16MB RAM with MEt (Memory Enhancement Technology), Host-based printing,\r\n\r\nKhay giấy: 250-sheet tray & single-sheet prio', '<p>Tốc độ in: 8 ppm A4/Letter Black & Colour,</p>\r\n<p>Bộ xử lý: 264 MHz processor,</p>\r\n<p>Độ phân giải: 600x600dpi with Image Ret 2400,</p>\r\n<p>Bộ nhớ: 16MB RAM with MEt (Memory Enhancement Technology), Host-based printing,</p>\r\n<p>Khay giấy: 250-sheet tray & single-sheet priority feed,</p>\r\n<p>Hiệu suất in : 35,000 pages per month.</p>\r\n<p>Cổng kết nối: Hi-speed USB 2.0 & built-in Fast Ethernet wired. 1-year warranty.</p>\r\n<p>Mực in:  Black (Q6000A), Cyan (Q6001A), Yellow (Q6002A), Magenta (Q6003A).</p>\r\n<p>Bảo hành 12 tháng<img src=\"images/stories/s7676_1.jpg\" border=\"0\" /></p>', 7712000, 'M__y_in_laser_m__4b0219605d598.jpg', 0, 245, '2011-03-11'),
(196, 'Toshiba Tecra (M8 S8011X)', '35', 'Bộ xử lý: Intel Core2 Duo T7100 1.8 GHz; Ổ cứng: 120GB; Bộ nhớ: 1024MB; DVDRW; Màn hình 13.3\" (1280*800); VGA Intel X3100; Webcam, Nhận dạng vân tay; Intel Wireless WIFI Link 4965/A/G/N', '<p><span style=\"font-weight: 400;\">Hãng sản xuất: </span>Toshiba</p>\r\n<p><span style=\"font-weight: 400;\">Manufacturer Part #: </span>PTM80U-06L00F</p>\r\n<p><span style=\"font-weight: 400;\">Kiểu thiết bị: </span>Notebook</p>\r\n<p><span style=\"font-weight: 400;\">Màu sắc: </span>Bạc Titanium</p>\r\n<p><span style=\"font-weight: 400;\">Bộ xử lý: </span>Intel Core 2 Duo T7100 1.8 GHz; 64-bit; FSB 800Mhz Cache 2 MB L2 cache Chipset Mobile Intel GM965 Express RAM 1 GB; DDR II SDRAM, 667 MHz Ổ cứng 120 GB, Serial ATA-150, 5400 rpm Ổ quang DVD±RW (±R DL) / DVD-RAM, Integrated; 24x (CD) / 8x (DVD); 24x (CD) / 8x (DVD±R) / 4x (DVD±R DL); 10x (CD) / 6x (DVD-RW) / 8x (DVD+RW) / 5x (DVD-RAM) Đọc thẻ Card Reader; SD Memory Card, Memory Stick, Memory Stick PRO, MultiMediaCard, xD-Picture Card, SDIO Màn hình 13.3\" TFT Active Matrix; 1280 x 800 ( WXGA ); 24-bit (16.7 million colors); Clear SuperView (CSV) Đồ họa Intel GMA X3100; 251 MB chia sẻ; Dynamic Video Memory Technology 4.0 Audio Audio Output: Sound Card; Audio Input: Microphone WebcamIntegrated</p>\r\n<p>Input Device(s) Keyboard, Touchpad</p>\r\n<p>Telecom56 Kbps Fax / Modem</p>\r\n<p>MạngIntel Wireless WiFi Link 4965AGN; LAN; Bluetooth 2.0</p>\r\n<p>Khe mở rộng2 ( 0 ) x memory ;</p>\r\n<p>1 ( 1 ) x PC Card - type II;</p>\r\n<p>1 x display / video - VGA - 15 pin HD D-Sub (HD-15) 1 x microphone - input - mini-phone 3.5 mm</p>\r\n<p>1 x headphones - output - mini-phone stereo 3.5 mm</p>\r\n<p>1 x IEEE 1394 (FireWire) - 4 pin FireWire</p>\r\n<p>3 x Hi-Speed USB - 4 pin USB Type A</p>\r\n<p>1 x modem - phone line - RJ-11</p>\r\n<p>1 x network - Ethernet 10Base-T/100Base-TX - RJ-45</p>\r\n<p>Nguồn điệnExternal; AC 120/230 V ( 50/60 Hz )</p>\r\n<p>PinLithium ion; 5200 mAh</p>\r\n<p>Hệ điều hành Microsoft Windows XP Professional; Drivers & Utilities</p>\r\n<p>Môi trường Nhiệt độ: 41 °F - 95 °F; độ ẩm: 20 - 80%</p>\r\n<p>Kích thước Ngang x Dọc x Dầy: 31cm x 22,6cm x 3,3cm</p>\r\n<p>Cân nặng 2.09kg</p>\r\n<p><img src=\"images/stories/toshiba_tr1.jpg\" border=\"0\" /></p>\r\n<p>Bảo hành 12 tháng</p>', 15500000, 'Toshiba_Tecra__M_4aff219bc81a2.jpg', 1, 445, '2011-03-11'),
(199, 'Trancend DDR2 1.0GB bus 800 (PC2-6400)', '12', 'DDR2 1.0GB bus 800 (PC2-6400) Trancend', '<div>\r\n<p><span style=\"font-size: small;\">DDR2 1.0GB bus 800 (PC2-6400) Trancend</span></p>\r\nbảo hành 36 tháng<img src=\"images/stories/transcend-ddr.jpg\" border=\"0\" /></div>', 410000, 'Trancend_DDR2_1._4b09163a080c6.jpg', 0, 489, '2011-03-11'),
(200, 'HP ProBook 4410s-VF903PA (PC Dos) Màu đỏ', '0', 'entium Dual-Core T4300 (2x2.1GHz, FSB 800MHz) / 1MB L2 Cache/ 1GB DDR2-800 / 160GB HDD / VGA Intel GMA X4500 upto 512MB Shared/ DVDRW LightScribe / Express Card / 14\" wide 16:9 LED backlight LCD / BlueTooth / Webcam Giga LAN/ Card Reader / Wireless 802.11', '<h1><span style=\"font-size: small;\">entium Dual-Core T4300 (2x2.1GHz, FSB 800MHz) / 1MB L2 Cache/ 1GB DDR2-800 / 160GB HDD / VGA Intel GMA X4500   upto 512MB Shared/ DVDRW LightScribe / Express Card / 14\" wide 16:9 LED backlight  LCD / BlueTooth / Webcam Giga LAN/ Card Reader / Wireless 802.11b.g.n/ Weight 2.2Kg / Pin 6 cell - Made in Ch<img src=\"images/stories/hp-probook-4410s-vf903pa-pc-dos-mau-do-small4193_1.jpg\" border=\"0\" />ina</span></h1>', 11500000, '_HP_ProBook_4410_4b13200c85557.jpg', 0, 108, '2011-03-11'),
(201, 'HP ProBook 4410s-VF903PA (PC Dos) Màu đỏ', '33', 'entium Dual-Core T4300 (2x2.1GHz, FSB 800MHz) / 1MB L2 Cache/ 1GB DDR2-800 / 160GB HDD / VGA Intel GMA X4500 upto 512MB Shared/ DVDRW LightScribe / Express Card / 14\" wide 16:9 LED backlight LCD / BlueTooth / Webcam Giga LAN/ Card Reader / Wireless 802.11', '<h1><span style=\"font-size: small;\">entium Dual-Core T4300 (2x2.1GHz, FSB 800MHz) / 1MB L2 Cache/ 1GB DDR2-800 / 160GB HDD / VGA Intel GMA X4500   upto 512MB Shared/ DVDRW LightScribe / Express Card / 14\" wide 16:9 LED backlight  LCD / BlueTooth / Webcam Giga LAN/ Card Reader / Wireless 802.11b.g.n/ Weight 2.2Kg / Pin 6 c<img src=\"images/stories/hp-probook-4410s-vf903pa-pc-dos-mau-do-small4193_1.jpg\" border=\"0\" />ell - Made in China</span></h1>', 11490000, '_HP_ProBook_4410_4b132175d8c2d.jpg', 1, 73, '2011-03-11'),
(202, 'DELL Vostro AVN-1320N (T718JP8600)', '36', 'Core 2 Duo P8600 2*2.4GHZ/3MB L2 cache, 1066MHz FSB/Ram 3GB/HDD 320GB /VGA Intel GMA X4500MHD upto 512MB 13.3\\ WXGA TrueLife LED Black-Light / Card reader 3in1 / RGB / NIC / Bluetooth/Pin 6 Cells / Wireless 802.11 b,g / Weight 2.02Kg - Made in China', '<p><span style=\"font-size: small;\">Core 2 Duo P8600 2*2.4GHZ/3MB L2 cache, 1066MHz FSB/Ram 3GB/HDD 320GB /VGA Intel GMA X4500MHD upto 512MB 13.3\\ WXGA TrueLife LED Black-Light  / Card reader 3in1 / RGB  / NIC / Bluetooth/Pin 6 Cells / Wireless  802.11 b,g / Weight 2.02Kg - Made in China</span></p>\r\n<p>Bao hanh: 12 thang</p>', 16750000, 'DELL_Vostro_AVN__4b4401cfa1231.jpg', 0, 40, '2011-03-11'),
(203, 'Ổ cứng SamSung 500 GB Serial ATA II', '13', 'SamSung 500 GB Serial ATA II (3 Gb/s); 7200 rpm; 16MB Cache', '<p><img class=\"caption\" src=\"images/stories/o-cung-samsung-500-gb-serial-ata-ii-large1477_1.jpg\" border=\"0\" /></p>', 1150000, '____c___ng_SamSu_4b454f81f070b.jpg', 0, 481, '2011-03-11'),
(206, 'LG DVD-Rom 16x w/48X CDRom SATA', '22', 'LG DVD-Rom 16x w/48X CDRom SATA', '', 420000, 'LG_DVD_Rom_16x_w_4b468acf03b52.jpg', 1, 283, '2011-03-11'),
(207, 'ASUS DVD Rom 18X w/48X CDRom (Black)', '22', 'ASUS DVD Rom 18X w/48X CDRom (Black)(Chính Hãng)', '', 445000, '_ASUS_DVD_Rom_18_4b46cca154ac1.jpg', 0, 474, '2011-03-11');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `typecustomer`
--

CREATE TABLE `typecustomer` (
  `ma_loai_nguoi_dung` tinyint(3) NOT NULL,
  `ten_loai_nguoi_dung` varchar(100) CHARACTER SET utf8 NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `typecustomer`
--

INSERT INTO `typecustomer` (`ma_loai_nguoi_dung`, `ten_loai_nguoi_dung`) VALUES
(1, 'Quản trị'),
(2, 'Khách hàng');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `typepost`
--

CREATE TABLE `typepost` (
  `ma_loai_bai_viet` int(11) NOT NULL,
  `ten_loai_bai_viet` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `mo_ta` text COLLATE utf8_unicode_ci,
  `ma_loai_cha` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `typepost`
--

INSERT INTO `typepost` (`ma_loai_bai_viet`, `ten_loai_bai_viet`, `mo_ta`, `ma_loai_cha`) VALUES
(194, 'Tin khuyến mãi', '', 0),
(195, 'Tin công nghệ', '', 194),
(196, 'Sản phẩm mới', '', 194);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `typeproduct`
--

CREATE TABLE `typeproduct` (
  `ma_loai` int(11) NOT NULL,
  `ten_loai` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `mo_ta` text COLLATE utf8_unicode_ci,
  `ma_loai_cha` int(11) NOT NULL,
  `hinh` varchar(200) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `typeproduct`
--

INSERT INTO `typeproduct` (`ma_loai`, `ten_loai`, `mo_ta`, `ma_loai_cha`, `hinh`) VALUES
(9, 'Linh kiện máy tính', NULL, 0, 'Linh_ki___n_m__y_4acdfac5c4b92.jpg'),
(10, 'Main - Bo mạch chủ', NULL, 9, ''),
(11, 'CPU - Bộ vi xử lý', NULL, 9, ''),
(12, 'RAM - Bộ nhớ trong', NULL, 9, ''),
(13, 'HDD - Ổ cứng', NULL, 9, ''),
(14, 'Monitor - Màn hình', NULL, 9, ''),
(15, 'Máy tính thương hiệu', NULL, 0, 'M__y_t__nh_th____4ad299f195042.jpg'),
(16, 'Máy tính xách tay', NULL, 0, 'M__y_t__nh_x__ch_4ad29a0024af2.jpg'),
(17, 'Máy văn phòng', NULL, 0, 'M__y_v__n_ph__ng_4ad29a151c745.jpg'),
(18, 'Thiết bị mạng', NULL, 0, 'Thi___t_b____m___4ad29a2815801.jpg'),
(19, 'Phụ kiện máy tính', NULL, 0, 'Ph____ki___n_m___4ad29ac9bc631.jpg'),
(20, 'Linh kiện máy in', NULL, 0, 'Linh_ki___n_m__y_4ad29b53ebd72.gif'),
(21, 'Card hình - VGA card', NULL, 9, ''),
(22, 'ODD - Ổ đĩa quang', NULL, 9, ''),
(23, 'Mouse - Chuột máy tính', NULL, 9, ''),
(24, 'Keyboard - Bàn phím', NULL, 9, ''),
(25, 'Case - Vỏ máy tính', NULL, 9, ''),
(26, 'Nguồn máy tính', NULL, 9, ''),
(28, 'HP - Compaq', NULL, 15, ''),
(29, 'CMS', NULL, 15, ''),
(30, 'FPT Elad', NULL, 15, ''),
(31, 'DELL', NULL, 15, ''),
(32, 'Acer', NULL, 16, ''),
(33, 'HP - Compaq', NULL, 16, ''),
(34, 'Lenovo', NULL, 16, ''),
(35, 'Toshiba', NULL, 16, ''),
(36, 'Dell', NULL, 16, ''),
(37, 'Máy in', NULL, 17, ''),
(38, 'Máy chiếu', NULL, 17, ''),
(39, 'Máy fax', NULL, 17, ''),
(40, 'Máy photocopy', NULL, 17, ''),
(41, 'Bộ lưu điện', NULL, 17, ''),
(42, 'Máy Scan', NULL, 17, ''),
(43, 'Modem ADSL', NULL, 18, ''),
(44, 'Card mạng', NULL, 18, ''),
(45, 'Switch', NULL, 18, ''),
(46, 'Thiết bị wifi', NULL, 18, ''),
(47, 'Phụ kiện TBM', NULL, 18, ''),
(48, 'Loa vi tính', NULL, 19, ''),
(49, 'Webcam', NULL, 19, ''),
(50, 'Tai nghe', NULL, 19, ''),
(51, 'USB Flash', NULL, 19, ''),
(52, 'TV Box', NULL, 19, ''),
(53, 'Phụ kiện khác', NULL, 19, ''),
(54, 'Trống', NULL, 20, ''),
(55, 'Gạt', NULL, 20, ''),
(56, 'Cartridge', NULL, 20, ''),
(57, 'Mực đổ', NULL, 20, ''),
(58, 'Trục xạc', NULL, 20, ''),
(71, 'Sony Vaio', NULL, 16, '');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `user`
--

CREATE TABLE `user` (
  `ma_nguoi_dung` int(11) NOT NULL,
  `ma_loai_nguoi_dung` tinyint(3) NOT NULL,
  `ho_ten` varchar(100) CHARACTER SET utf8 NOT NULL,
  `ten_dang_nhap` varchar(100) CHARACTER SET utf8 NOT NULL,
  `mat_khau` varchar(100) CHARACTER SET utf8 NOT NULL,
  `email` varchar(100) CHARACTER SET utf8 DEFAULT NULL,
  `ngay_dang_ky` date DEFAULT NULL,
  `ngay_dang_nhap_cuoi` date DEFAULT NULL,
  `active` tinyint(4) NOT NULL,
  `dia_chi` text COLLATE utf8_unicode_ci NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `user`
--

INSERT INTO `user` (`ma_nguoi_dung`, `ma_loai_nguoi_dung`, `ho_ten`, `ten_dang_nhap`, `mat_khau`, `email`, `ngay_dang_ky`, `ngay_dang_nhap_cuoi`, `active`, `dia_chi`) VALUES
(27, 0, 'Phùng Văn Đạt', 'phungvandat', '1234', 'phungvandat97@gmail.com', '2018-06-02', NULL, 0, 'Cát Hưng - Phù Cát - Bình Định');

--
-- Chỉ mục cho các bảng đã đổ
--

--
-- Chỉ mục cho bảng `bill`
--
ALTER TABLE `bill`
  ADD PRIMARY KEY (`so_hoa_don`);

--
-- Chỉ mục cho bảng `billuser`
--
ALTER TABLE `billuser`
  ADD PRIMARY KEY (`so_hoa_don`);

--
-- Chỉ mục cho bảng `customer`
--
ALTER TABLE `customer`
  ADD PRIMARY KEY (`ma_khach_hang`);

--
-- Chỉ mục cho bảng `infobill`
--
ALTER TABLE `infobill`
  ADD PRIMARY KEY (`stt`);

--
-- Chỉ mục cho bảng `infobilluser`
--
ALTER TABLE `infobilluser`
  ADD PRIMARY KEY (`stt`);

--
-- Chỉ mục cho bảng `post`
--
ALTER TABLE `post`
  ADD PRIMARY KEY (`ma_bai_viet`),
  ADD KEY `ma_the_loai` (`ma_loai_bai_viet`),
  ADD KEY `ma_tac_gia` (`ma_nguoi_dung`),
  ADD KEY `ma_the_loai_2` (`ma_loai_bai_viet`),
  ADD KEY `ma_tac_gia_2` (`ma_nguoi_dung`);

--
-- Chỉ mục cho bảng `product`
--
ALTER TABLE `product`
  ADD PRIMARY KEY (`ma_san_pham`);

--
-- Chỉ mục cho bảng `typecustomer`
--
ALTER TABLE `typecustomer`
  ADD PRIMARY KEY (`ma_loai_nguoi_dung`);

--
-- Chỉ mục cho bảng `typepost`
--
ALTER TABLE `typepost`
  ADD PRIMARY KEY (`ma_loai_bai_viet`);

--
-- Chỉ mục cho bảng `typeproduct`
--
ALTER TABLE `typeproduct`
  ADD PRIMARY KEY (`ma_loai`);

--
-- Chỉ mục cho bảng `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`ma_nguoi_dung`),
  ADD KEY `ma_loai_nguoi_dung` (`ma_loai_nguoi_dung`);

--
-- AUTO_INCREMENT cho các bảng đã đổ
--

--
-- AUTO_INCREMENT cho bảng `bill`
--
ALTER TABLE `bill`
  MODIFY `so_hoa_don` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT cho bảng `billuser`
--
ALTER TABLE `billuser`
  MODIFY `so_hoa_don` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT cho bảng `customer`
--
ALTER TABLE `customer`
  MODIFY `ma_khach_hang` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=36;

--
-- AUTO_INCREMENT cho bảng `infobill`
--
ALTER TABLE `infobill`
  MODIFY `stt` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4568;

--
-- AUTO_INCREMENT cho bảng `infobilluser`
--
ALTER TABLE `infobilluser`
  MODIFY `stt` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=54;

--
-- AUTO_INCREMENT cho bảng `post`
--
ALTER TABLE `post`
  MODIFY `ma_bai_viet` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT cho bảng `product`
--
ALTER TABLE `product`
  MODIFY `ma_san_pham` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=210;

--
-- AUTO_INCREMENT cho bảng `typecustomer`
--
ALTER TABLE `typecustomer`
  MODIFY `ma_loai_nguoi_dung` tinyint(3) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT cho bảng `typepost`
--
ALTER TABLE `typepost`
  MODIFY `ma_loai_bai_viet` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=197;

--
-- AUTO_INCREMENT cho bảng `typeproduct`
--
ALTER TABLE `typeproduct`
  MODIFY `ma_loai` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=194;

--
-- AUTO_INCREMENT cho bảng `user`
--
ALTER TABLE `user`
  MODIFY `ma_nguoi_dung` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
