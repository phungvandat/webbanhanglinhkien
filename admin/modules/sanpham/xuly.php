<?php
	include('../../conn.php');

	@$id=$_GET['id'];
	if(isset($_POST['them'])){
		//them
	$tensp=$_POST['tensp'];
	$gia=$_POST['gia'];
	$mota=$_POST['mota'];
	$loai=$_POST['loaisp'];
	$ex = pathInfo($_FILES['hinhanh']['name'], PATHINFO_EXTENSION);
	$name_file = time().'.'.$ex;
	$hinhanh=$_FILES['hinhanh']['name'];
	$hinhanh_tmp=$_FILES['hinhanh']['tmp_name'];
	$path= dirname(__FILE__)."/upload/".$name_file;
	move_uploaded_file($hinhanh_tmp,$path);
	
	$today = date("d.m.y");  
	 	$sql="insert into san_pham(ma_loai,ten_san_pham,don_gia,hinh,mo_ta_tom_tat,ngay_tao) values('$loai','$tensp','$gia','$name_file','$mota','$today')";
		$stmt = $db->prepare($sql);
		$stmt->setFetchMode(PDO::FETCH_ASSOC);
		$stmt->execute();
		header('location:../../index.php?quanly=sanpham&event=them');
	}elseif(isset($_POST['sua'])){
		//sua
		$tensp=$_POST['tensp'];
	$gia=$_POST['gia'];
	$mota=$_POST['mota'];
	$loai=$_POST['loaisp'];
	$ex = pathInfo($_FILES['hinhanh']['name'], PATHINFO_EXTENSION);
	$name_file = time().'.'.$ex;
	$hinhanh=$_FILES['hinhanh']['name'];
	$hinhanh_tmp=$_FILES['hinhanh']['tmp_name'];
	$path= dirname(__FILE__)."/upload/".$name_file;
	move_uploaded_file($hinhanh_tmp,$path);
		if($hinhanh!=''){
		$sql="update san_pham set ma_loai='$loai',ten_san_pham='$tensp',don_gia='$gia',mo_ta_tom_tat='$mota',hinh='$name_file' where ma_san_pham='$id'";
		}else{
		$sql="update san_pham set ma_loai='$loai',ten_san_pham='$tensp',don_gia='$gia',mo_ta_tom_tat='$mota' where ma_san_pham='$id'";
		}
		$stmt = $db->prepare($sql);
		$stmt->setFetchMode(PDO::FETCH_ASSOC);
		$stmt->execute();
		header('location:../../index.php?quanly=sanpham&event=sua&id='.$id);
	}else{
		//xoa
		$sql="delete from san_pham where ma_san_pham='$id'";
		$stmt = $db->prepare($sql);
		$stmt->setFetchMode(PDO::FETCH_ASSOC);
		$stmt->execute();
		header('location:../../index.php?quanly=sanpham&event=them');
	}
?>