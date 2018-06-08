<?php
session_start();
include_once($_SERVER['DOCUMENT_ROOT'].'/WebBanLinhKien/model/database.php');
$dbQuanLyBanLinhKien = new database("localhost", "root", "", "dbQuanLyBanLinhKien");
$total = 0;
$arrayMaSanPham = array();
if(isset($_COOKIE['donHang'])){
		$donHang = $_COOKIE['donHang'];
		$token = strtok($donHang,'-');
		while($token !== false){
			array_push($arrayMaSanPham, $token);
			$token = strtok('-');	
		}
		foreach($arrayMaSanPham as $maSanPham){
				$query_product = "SELECT * FROM product where ma_san_pham = ".$maSanPham;
				$hinh = $dbQuanLyBanLinhKien->query($query_product); 
				$row2= mysqli_fetch_array($hinh);
				$total = $total + $_COOKIE[$maSanPham]*$row2['don_gia'];
		}
}
if(isset($_SESSION['userName']) && isset($_SESSION['pass'])){
	echo 'hay song di';
	if(isset($_REQUEST['session'])){
		$tenDangNhap  = $_SESSION['userName'];
		$matKhau = $_SESSION['pass'];
		$query_mnd = "select ma_nguoi_dung from user where ten_dang_nhap = '".$tenDangNhap."' and mat_khau = '".$matKhau."'";
		$tbMnd = mysqli_fetch_array($dbQuanLyBanLinhKien->query($query_mnd));
		$mnd = $tbMnd['ma_nguoi_dung'];
		$diaChi = $_REQUEST['diaChi'];
		$query_dat_hang = "UPDATE billuser SET trang_thai = 1, dia_chi = '".$diaChi."', tri_gia = ".$total." WHERE ma_user = $mnd and trang_thai = 0";
		$dbQuanLyBanLinhKien->query($query_dat_hang);	
	}
}
else{
	$tenKH = $_REQUEST['hoTen'];
	$phai = $_REQUEST['gioiTinh'];
	$ngaySinh = $_REQUEST['ngaySinh'];
	$diaChi = $_REQUEST['diaChi'];
	$SDT = $_REQUEST['sdt'];
	$email = $_REQUEST['email'];
	$query_newUser = "INSERT INTO  customer(ten_khach_hang,phai,ngay_sinh, dia_chi, dien_thoai, email) 
				VALUES('$tenKH', '$phai','$ngaySinh','$diaChi','$SDT','$email')";
	$newUser = $dbQuanLyBanLinhKien->query($query_newUser);
	
	//Them hoa don
	$TongTien=$total;
	$ma_KH=mysqli_insert_id($dbQuanLyBanLinhKien->getlink());
	$ngayHd =date("Y-m-d");
	//Lấy số hóa đơn
	$query_shd = 'select * from bill';
	$shd = mysqli_num_rows($dbQuanLyBanLinhKien->query($query_shd)) + 1;
	
	$query_newBill = "INSERT INTO  bill(so_hoa_don,ngay_hd,ma_khach_hang,tri_gia) 
				VALUES('$shd','$ngayHd' ,'$ma_KH','$TongTien')";
	$dbQuanLyBanLinhKien->query($query_newBill);
	
	foreach($arrayMaSanPham as $maSanPham){
			$query_product = "SELECT * FROM product where ma_san_pham = ".$maSanPham;
			$hinh = $dbQuanLyBanLinhKien->query($query_product); 
			$row2= mysqli_fetch_array($hinh);
			$query_infoBill = "INSERT INTO `infobill` (`so_hoa_don`, `ma_san_pham`, `so_luong`, `don_gia`) VALUES ('$shd', '$maSanPham', ".$_COOKIE[$maSanPham].", ".$row2['don_gia'].")";
			$dbQuanLyBanLinhKien->query($query_infoBill);
	}
}
        
		// xóa tất cả cookie
		foreach($arrayMaSanPham as $maSanPham){
			setcookie($maSanPham,'',0,'/');	
		}
		setcookie('donHang','',0,'/');
		
 ?>