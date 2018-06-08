<?php
	include('../../conn.php');

	@$id=$_GET['id'];
	if(isset($_POST['them'])){
		//them
	$tenkh=$_POST['tenkh'];
	$gt=$_POST['gt'];
	$diachi=$_POST['diachi'];
	$ngaysinh=$_POST['ngaysinh'];
	$dt=$_POST['dt'];
	$email=$_POST['email'];
	if($gt=="nam")
	 	$gender=0;
	else
		$gender=1;
	
	$sql="INSERT INTO `khach_hang`(`ten_khach_hang`, `phai`, `ngay_sinh`, `dia_chi`, `dien_thoai`, `email`) VALUES ('$tenkh','$gender','$ngaysinh','$diachi','$dt','$email')";
		$stmt = $db->prepare($sql);
		$stmt->setFetchMode(PDO::FETCH_ASSOC);
		$stmt->execute();
		header('location:../../index.php?quanly=khachhang&event=them');
	}elseif(isset($_POST['sua'])){
		//sua
	$tenkh=$_POST['tenkh'];
	$gt=$_POST['gt'];
	$diachi=$_POST['diachi'];
	$ngaysinh=$_POST['ngaysinh'];
	$dt=$_POST['dt'];
	$email=$_POST['email'];
	if($gt=="nam")
	 	$gender=0;
	else
		$gender=1;
	
	$sql="UPDATE `khach_hang` SET `ten_khach_hang`='$tenkh',`phai`='$gender',`ngay_sinh`='$ngaysinh',`dia_chi`='$diachi',`dien_thoai`='$dt',`email`='$email' WHERE `ma_khach_hang`='$id'";
		
		$stmt = $db->prepare($sql);
		$stmt->setFetchMode(PDO::FETCH_ASSOC);
		$stmt->execute();
		header('location:../../index.php?quanly=khachhang&event=sua&id='.$id);
	}else{
		//xoa
		$sql="delete from khach_hang where ma_khach_hang='$id'";
		$stmt = $db->prepare($sql);
		$stmt->setFetchMode(PDO::FETCH_ASSOC);
		$stmt->execute();
		header('location:../../index.php?quanly=khachhang&event=them');
	}
?>