<?php 
if(isset($_SESSION['userName']) && isset($_SESSION['pass'])){
	//Xóa cookie  sản phẩm trước đó
	$arrayMaSanPham = array();
	if(isset($_COOKIE['donHang'])){
		$donHang = $_COOKIE['donHang'];
		$token = strtok($donHang,'-');
		while($token !== false){
			array_push($arrayMaSanPham, $token);
			$token = strtok('-');	
		}
	}
	foreach($arrayMaSanPham as $maSanPham){
		setcookie($maSanPham,'',0,'/');	
	}
	setcookie('donHang','',0,'/');
	//Xóa cookie  sản phẩm trước đó
			$tenDangNhap  = $_SESSION['userName'];
			$matKhau = $_SESSION['pass'];
			
			$query_maNguoiDung = "select ma_nguoi_dung from user where ten_dang_nhap = '".$tenDangNhap."' and mat_khau = '".$matKhau."'";
			$row_maNguoiDung = mysqli_fetch_array($dbQuanLyBanLinhKien->query($query_maNguoiDung));
			$maNguoiDung = $row_maNguoiDung['ma_nguoi_dung'];
			
			$query_soHoaDon = "select so_hoa_don from billUser where ma_user =".$maNguoiDung." and trang_thai = 0";
			$tbSoHoaDon = $dbQuanLyBanLinhKien->query($query_soHoaDon);
			$row_soHoaDon = mysqli_fetch_array($tbSoHoaDon);
	
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
					$check = 0;
					//Thêm đơn hàng từ database vào cookie
					$value_update_donHang = '';
					while($row = mysqli_fetch_array($tbSPHoaDon)){
						array_push($arrMaSanPham,$row['ma_san_pham']);
						//Kiểm tra có tồn tại sản phẩm này đã mua hay chưa. Nếu có update thêm số lượng + 1 vào cookie
						setcookie($row['ma_san_pham'],$row['so_luong'],0,'/');
						//Không có đơn hàng tạo mới cookie đơn hàng và update giá trị cookie['donHang']
						if($check == 0)
							$value_update_donHang = $row['ma_san_pham'];
						else
							$value_update_donHang = $value_update_donHang.'-'.$row['ma_san_pham'];
						$check++;	
					}
					setcookie('donHang',$value_update_donHang,0,'/');
				}
			}// kết thúc kiểm tra bill tồn tại hay không
}
?>