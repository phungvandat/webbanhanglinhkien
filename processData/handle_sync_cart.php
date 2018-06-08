<?php
session_start();
	include_once($_SERVER['DOCUMENT_ROOT'].'/WebBanLinhKien/model/database.php');
	$dbQuanLyBanLinhKien = new database("localhost", "root", "", "dbQuanLyBanLinhKien");
	if(isset($_SESSION['userName']) && isset($_SESSION['pass']) && isset($_POST['sync'])){
		if($_POST['sync'] == 1){
			$donHang = $_COOKIE['donHang'];
			$tenDangNhap  = $_SESSION['userName'];
			$matKhau = $_SESSION['pass'];
			
			$query_maNguoiDung = "select ma_nguoi_dung from user where ten_dang_nhap = '".$tenDangNhap."' and mat_khau = '".$matKhau."'";
			$row_maNguoiDung = mysqli_fetch_array($dbQuanLyBanLinhKien->query($query_maNguoiDung));
			$maNguoiDung = $row_maNguoiDung['ma_nguoi_dung'];
			
			$query_soHoaDon = "select so_hoa_don from billUser where ma_user =".$maNguoiDung." and trang_thai = 0";
			$tbSoHoaDon = $dbQuanLyBanLinhKien->query($query_soHoaDon);
			$row_soHoaDon = mysqli_fetch_array($tbSoHoaDon);
			
			//Thêm infobilluser
			$token = strtok($donHang,'-');
			$arrayMaSanPham = array();
			while($token !== false){
				array_push($arrayMaSanPham, $token);
				$token = strtok('-');	
			}
			$stt = 0;
			//Kiểm tra có hóa đơn người dùng hay không
			$checkBillUser = mysqli_num_rows($tbSoHoaDon);
			if($checkBillUser > 0){
				$soHoaDon = $row_soHoaDon['so_hoa_don'];
				$query_tbSPHoaDon = "select * from infobilluser where so_hoa_don ='".$soHoaDon."'";
				$tbSPHoaDon = $dbQuanLyBanLinhKien->query($query_tbSPHoaDon);
				//Kiểm tra hóa đơn người dùng có sản phẩm hay không
				$checkInfoBillUser = mysqli_num_rows($tbSPHoaDon);
				$arrMaSPTonTai = array();
				if($checkInfoBillUser > 0){
					$arrMaSanPham = array();
					//Thêm đơn hàng từ database vào cookie
					while($row = mysqli_fetch_array($tbSPHoaDon)){
						array_push($arrMaSanPham,$row['ma_san_pham']);
						//Kiểm tra có tồn tại sản phẩm này đã mua hay chưa. Nếu có update thêm số lượng + 1 vào cookie
						if(isset($_COOKIE[$row['ma_san_pham']])){
							$value_cookie = $_COOKIE[$row['ma_san_pham']]+$row['so_luong'];
							setcookie($row['ma_san_pham'],$value_cookie,0,'/');
							array_push($arrMaSPTonTai,$row['ma_san_pham']);
							//cập nhật lại số lượng trong infobilluser đã tồn tại
							$query_soLuong = 'select so_luong from infoBillUser where ma_san_pham ="'.$row['ma_san_pham'].'" and so_hoa_don = "'.$soHoaDon.'"';
							$soLuongUpdate = mysqli_fetch_array($dbQuanLyBanLinhKien->query($query_soLuong));
							$soLuongud = $soLuongUpdate['so_luong']+1;
							$query_updateInfoBill = 'update infoBillUser set so_luong = '.$soLuongud.' where ma_san_pham = "'.$row['ma_san_pham'].'" and so_hoa_don = "'.$soHoaDon.'"';
							$dbQuanLyBanLinhKien->query($query_updateInfoBill);
						}
						//Không có đơn hàng tạo mới cookie đơn hàng và update giá trị cookie['donHang']
						else{
							setcookie($row['ma_san_pham'],$row['so_luong'],0,'/');
							if($_COOKIE['donHang'] == '')
								$donHang = $row['ma_san_pham'];
							else
								$donHang = $donHang.'-'.$row['ma_san_pham'];
						}	
					}
					setcookie('donHang',$donHang,0,'/');
					//Thêm những đơn hàng chưa tồn tại trong infobilluser
					foreach($arrayMaSanPham as $maSanPham){
						if(in_array($maSanPham,$arrMaSPTonTai)){}
						else{
							$query_dongia = 'select don_gia from product where ma_san_pham ='.$maSanPham;
							$arrdonGia = mysqli_fetch_array($dbQuanLyBanLinhKien->query($query_dongia));
							$donGia = $arrdonGia['don_gia'];
							$query_insertInfoBill = "INSERT INTO  infoBillUser(so_hoa_don,ma_san_pham,so_luong, don_gia) VALUES('".$soHoaDon."', '".$maSanPham."',".$_COOKIE[$maSanPham].",".$donGia.")";
							$dbQuanLyBanLinhKien->query($query_insertInfoBill);
						}
					}
				}
			}
			// kết thúc kiểm tra bill tồn tại hay không
			else{
				$query_numBillUser = 'select * from billuser';
				$numBillUser = mysqli_num_rows($dbQuanLyBanLinhKien->query($query_numBillUser))+1;
				$ngay_hd = date("Y-m-d H:i:s");
				$query_insertBillUser = "INSERT INTO `billuser` (`so_hoa_don`, `ngay_hd`, `ma_user`, `tri_gia`, `trang_thai`) VALUES (".$numBillUser.", '".$ngay_hd."', ".$maNguoiDung.", 0,0)";
				$dbQuanLyBanLinhKien->query($query_insertBillUser);
				foreach($arrayMaSanPham as $maSanPham){
					$query_dongia = 'select don_gia from product where ma_san_pham ='.$maSanPham;
					$arrdonGia = mysqli_fetch_array($dbQuanLyBanLinhKien->query($query_dongia));
					$donGia = $arrdonGia['don_gia'];
					$query_insertInfoBill = "INSERT INTO  infoBillUser(so_hoa_don,ma_san_pham,so_luong, don_gia) VALUES('".$numBillUser."', '".$maSanPham."',".$_COOKIE[$maSanPham].",".$donGia.")";
					$dbQuanLyBanLinhKien->query($query_insertInfoBill);
				}
			}	
		}
		else{
			include_once('syncCart.php');	
		}
	}
	else{
		include_once('syncCart.php');	
	}
		


?>