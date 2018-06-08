<?php
	include('../../conn.php');

	@$id=$_GET['id'];
	if(isset($_POST['them'])){
		//them
	$tenloaisp=$_POST['tenloaisp'];
	$maloaicha=$_POST['maloaicha'];
	$mota=$_POST['mota'];
	
	$ex = pathInfo($_FILES['hinhanh']['name'], PATHINFO_EXTENSION);
	$name_file = time().'.'.$ex;
	$hinhanh=$_FILES['hinhanh']['name'];
	$hinhanh_tmp=$_FILES['hinhanh']['tmp_name'];
	$path= dirname(__FILE__)."/upload/".$name_file;
	move_uploaded_file($hinhanh_tmp,$path);
	
	$today = date("d.m.y");  
		$sql="INSERT INTO `loai_san_pham`(`ten_loai`, `mo_ta`, `ma_loai_cha`, `hinh_loaisp`) VALUES ('$tenloaisp','$mota','$maloaicha','$name_file')";
		$stmt = $db->prepare($sql);
		$stmt->setFetchMode(PDO::FETCH_ASSOC);
		$stmt->execute();
		header('location:../../index.php?quanly=loaisp&event=them');
	}elseif(isset($_POST['sua'])){
		//sua
	$tenloaisp=$_POST['tenloaisp'];
	$maloaicha=$_POST['maloaicha'];
	$mota=$_POST['mota'];
	$ex = pathInfo($_FILES['hinhanh']['name'], PATHINFO_EXTENSION);
	$name_file = time().'.'.$ex;
	$hinhanh=$_FILES['hinhanh']['name'];
	$hinhanh_tmp=$_FILES['hinhanh']['tmp_name'];
	$path= dirname(__FILE__)."/upload/".$name_file;
	move_uploaded_file($hinhanh_tmp,$path);
		if($hinhanh!=''){
		$sql="UPDATE `loai_san_pham` SET `ten_loai`='$tenloaisp',`mo_ta`='$mota',`ma_loai_cha`='$maloaicha',`hinh_loaisp`='$name_file' WHERE `ma_loai`='$id'"; 
		}else{
		$sql="UPDATE `loai_san_pham` SET `ten_loai`='$tenloaisp',`mo_ta`='$mota',`ma_loai_cha`='$maloaicha' WHERE `ma_loai`='$id'";
		}
		$stmt = $db->prepare($sql);
		$stmt->setFetchMode(PDO::FETCH_ASSOC);
		$stmt->execute();
		header('location:../../index.php?quanly=loaisp&event=sua&id='.$id);
	}else{
		//xoa
		$sql="delete from loai_san_pham where ma_loai='$id'";
		$stmt = $db->prepare($sql);
		$stmt->setFetchMode(PDO::FETCH_ASSOC);
		$stmt->execute();
		header('location:../../index.php?quanly=loaisp&event=them');
	}
?>