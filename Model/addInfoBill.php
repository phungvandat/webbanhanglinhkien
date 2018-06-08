<?php 
session_start();
include_once($_SERVER['DOCUMENT_ROOT'].'/WebBanLinhKien/model/database.php');
$dbQuanLyBanLinhKien = new database("localhost", "root", "", "dbQuanLyBanLinhKien");
if(isset($_REQUEST["ma_sp_mua"]) && isset($_REQUEST['so_luong']))
{ 

	$ma_sp_mua = $_REQUEST["ma_sp_mua"];
	$so_luong_sp = 	$_REQUEST['so_luong'];
	if(isset($_SESSION['userName']) && isset($_SESSION['pass'])){
		$tenDangNhap  = $_SESSION['userName'];
		$matKhau = $_SESSION['pass'];
		
		//Lấy mã người dùng
		$query_maNguoiDung = "select ma_nguoi_dung from user where ten_dang_nhap = '".$tenDangNhap."' and mat_khau = '".$matKhau."'";
		$row_maNguoiDung = mysqli_fetch_array($dbQuanLyBanLinhKien->query($query_maNguoiDung));
		$maNguoiDung = $row_maNguoiDung['ma_nguoi_dung'];
					
		$query_soHoaDon = "select so_hoa_don from billUser where ma_user =".$maNguoiDung." and trang_thai = 0";
		$tbSoHoaDon = $dbQuanLyBanLinhKien->query($query_soHoaDon);
		//Kiểm tra có hóa đơn người dùng hay không
		$checkBillUser = mysqli_num_rows($tbSoHoaDon);
		if($checkBillUser > 0){
			
			//Lấy số hóa đơn của người dùng
			$row_soHoaDon = mysqli_fetch_array($tbSoHoaDon);
			$soHoaDon = $row_soHoaDon['so_hoa_don'];
			
			$query_tbSPHoaDon = "select * from infobilluser where so_hoa_don ='".$soHoaDon."'";
			$tbSPHoaDon = $dbQuanLyBanLinhKien->query($query_tbSPHoaDon);
			//Kiểm tra hóa đơn người dùng có sản phẩm hay không
			$checkInfoBillUser = mysqli_num_rows($tbSPHoaDon);
			if($checkInfoBillUser > 0){
				$checkExist = 0;
				while($row = mysqli_fetch_array($tbSPHoaDon))
					if($row['ma_san_pham'] == $ma_sp_mua){
						$query_soLuong = 'select so_luong from infoBillUser where ma_san_pham ="'.$row['ma_san_pham'].'" and so_hoa_don = "'.$soHoaDon.'"';
						$soLuongUpdate = mysqli_fetch_array($dbQuanLyBanLinhKien->query($query_soLuong));
						$soLuongud = $soLuongUpdate['so_luong']+$so_luong_sp;
						$query_updateInfoBill = 'update infoBillUser set so_luong = '.$soLuongud.' where ma_san_pham = "'.$row['ma_san_pham'].'" and so_hoa_don = "'.$soHoaDon.'"';
						$dbQuanLyBanLinhKien->query($query_updateInfoBill);	
						$checkExist++;
					}
				if($checkExist == 0){
					$query_dongia = 'select don_gia from product where ma_san_pham ='.$ma_sp_mua;
					$arrdonGia = mysqli_fetch_array($dbQuanLyBanLinhKien->query($query_dongia));
					$donGia = $arrdonGia['don_gia'];
					$query_insertInfoBill = "INSERT INTO  infoBillUser(so_hoa_don,ma_san_pham,so_luong, don_gia) VALUES('".$soHoaDon."', '".$ma_sp_mua."',".$so_luong_sp.",".$donGia.")";
					$dbQuanLyBanLinhKien->query($query_insertInfoBill);	
				}
			}
			if($checkInfoBillUser == 0){
				$query_dongia = 'select don_gia from product where ma_san_pham ='.$ma_sp_mua;
				$arrdonGia = mysqli_fetch_array($dbQuanLyBanLinhKien->query($query_dongia));
				$donGia = $arrdonGia['don_gia'];
				$query_insertInfoBill = "INSERT INTO  infoBillUser(so_hoa_don,ma_san_pham,so_luong, don_gia) VALUES('".$soHoaDon."', '".$ma_sp_mua."',".$so_luong_sp.",".$donGia.")";
				$dbQuanLyBanLinhKien->query($query_insertInfoBill);		
			}
			
		}
		else{
			$query_numBillUser = 'select * from billuser';
			$numBillUser = mysqli_num_rows($dbQuanLyBanLinhKien->query($query_numBillUser))+1;
			$ngay_hd = date("Y-m-d H:i:s");
			$query_insertBillUser = "INSERT INTO `billuser` (`so_hoa_don`, `ngay_hd`, `ma_user`, `tri_gia`, `trang_thai`) VALUES (".$numBillUser.", '".$ngay_hd."', ".$maNguoiDung.", 0,0)";
			$dbQuanLyBanLinhKien->query($query_insertBillUser);
			$query_dongia = 'select don_gia from product where ma_san_pham ='.$ma_sp_mua;
			$arrdonGia = mysqli_fetch_array($dbQuanLyBanLinhKien->query($query_dongia));
			$donGia = $arrdonGia['don_gia'];
			$query_insertInfoBill = "INSERT INTO  infoBillUser(so_hoa_don,ma_san_pham,so_luong, don_gia) VALUES('".$numBillUser."', '".$ma_sp_mua."',".$so_luong_sp.",".$donGia.")";
			$dbQuanLyBanLinhKien->query($query_insertInfoBill);
		}
	}
	//xử lý thêm cookie
		if(isset($_COOKIE[$ma_sp_mua])){
			$value_cookie = $_COOKIE[$ma_sp_mua]+$so_luong_sp;
			echo $value_cookie;
			setcookie($ma_sp_mua,$value_cookie,0,'/');
		}
		else{
			setcookie($ma_sp_mua,$so_luong_sp,0,'/');
			$value_update_donHang;
			$value_update_numBill;
			if(!isset($_COOKIE['donHang']))
				$value_update_donHang = $ma_sp_mua;
			else
				$value_update_donHang = $_COOKIE['donHang'].'-'.$ma_sp_mua;
			setcookie('donHang',$value_update_donHang,0,'/');
		}
	
		
}
?>