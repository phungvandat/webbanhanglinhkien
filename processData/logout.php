<?php 
	session_start();
	session_destroy();
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
?>