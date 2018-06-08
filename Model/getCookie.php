<?php
//// sử dụng cookie đơn hàng
		$donHang ='';
		if(isset($_COOKIE['donHang']))
			$donHang = $_COOKIE['donHang'];
		$token = strtok($donHang,'-');
		$arrayMaSanPham = array();
		while($token !== false){
			array_push($arrayMaSanPham, $token);
			$numBill++;
			$token = strtok('-');	
		}
		foreach($arrayMaSanPham as $maSanPham){
				$query_product = "SELECT * FROM product where ma_san_pham = ".$maSanPham;
				$hinh = $dbQuanLyBanLinhKien->query($query_product); 
				$row2= mysqli_fetch_array($hinh);
				$total = $total + $_COOKIE[$maSanPham]*$row2['don_gia'];
		}
		if($numBill > 0){
			foreach($arrayMaSanPham as $maSanPham){
				$query_product = "SELECT * FROM product where ma_san_pham = ".$maSanPham;
				$tbsanPham = $dbQuanLyBanLinhKien->query($query_product); 
				$row2= mysqli_fetch_array($tbsanPham);
				$tenSanPham = substr($row2['ten_san_pham'],0,10).'...';
				$arrInfoProduct[(string)$row2['ma_san_pham']] = array($row2['hinh'], $row2['ten_san_pham'], $row2['don_gia'], $_COOKIE[$maSanPham]);
			}
		}
 ?>