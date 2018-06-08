<?php
session_start();
include_once($_SERVER['DOCUMENT_ROOT'].'/WebBanLinhKien/model/database.php');
$dbQuanLyBanLinhKien = new database("localhost", "root", "", "dbQuanLyBanLinhKien");

if(!empty($_REQUEST["ma_sp_capnhat"]))
{
	$numBill = 0;
	$so_luong_cap_nhat = $_REQUEST["soluong"];
	$ma_sp_cap_nhat = $_REQUEST["ma_sp_capnhat"];
	if(isset($_SESSION['userName']) && isset($_SESSION['pass'])){
		$tenDangNhap  = $_SESSION['userName'];
		$matKhau = $_SESSION['pass'];
		//Lấy mã người dùng
		$query_maNguoiDung = "select ma_nguoi_dung from user where ten_dang_nhap = '".$tenDangNhap."' and mat_khau = '".$matKhau."'";
		$row_maNguoiDung = mysqli_fetch_array($dbQuanLyBanLinhKien->query($query_maNguoiDung));
		$maNguoiDung = $row_maNguoiDung['ma_nguoi_dung'];
		
		//Lấy số hóa đơn người dùng
		$query_soHoaDon = "select so_hoa_don from billUser where ma_user =".$maNguoiDung." and trang_thai = 0";
		$tbSoHoaDon = $dbQuanLyBanLinhKien->query($query_soHoaDon);
		$row_soHoaDon = mysqli_fetch_array($tbSoHoaDon);
		$soHoaDon = $row_soHoaDon['so_hoa_don'];
		
		if($so_luong_cap_nhat == 0){
			$query_delete = 'delete from infoBillUser where ma_san_pham = "'.$ma_sp_cap_nhat.'" and so_hoa_don = "'.$soHoaDon.'"';
			$dbQuanLyBanLinhKien->query($query_delete);	
			
		}
		else{
			$query_update = 'update infoBillUser set so_luong ='.$so_luong_cap_nhat.' where ma_san_pham = "'.$ma_sp_cap_nhat.'" and so_hoa_don = "'.$soHoaDon.'"';
			$dbQuanLyBanLinhKien->query($query_update);	
		}
	}
	//xử lý cookie
	
	if($so_luong_cap_nhat == 0){
		$donHang = $_COOKIE['donHang'];
		$token = strtok($donHang,'-');
		$arrayMaSanPham = array();
		while($token !== false){
			array_push($arrayMaSanPham, $token);
			$numBill++;
			$token = strtok('-');	
		}
		$vt_sp = 0;
		foreach($arrayMaSanPham as $sp){
			if($sp == $ma_sp_cap_nhat)
				break;
			$vt_sp++;
		}
		if($vt_sp != count($arrayMaSanPham))
			$donHang = str_replace($ma_sp_cap_nhat.'-','',$donHang);
		else
			$donHang = str_replace('-'.$ma_sp_cap_nhat,'',$donHang);
		setcookie('donHang',$donHang,0,'/');
			
	}
	else{
		setcookie($ma_sp_cap_nhat, $so_luong_cap_nhat,0,'/');	
	}
	//xử lý cookie
	
}
?>