<?php
	include('conn.php');
	if(isset($_GET['trang'])){
		$get_trang=$_GET['trang'];
	}else{
		$get_trang='';
	}

	if($get_trang=='' || $get_trang==1){
		$trang=0;
	}else{
		$trang=($get_trang*8)-8;
	}	
	

	$sql_trang="select * from khach_hang";
	$sql="SELECT * FROM `khach_hang` ORDER BY ma_khach_hang DESC LIMIT $trang,8";
	$stmt = $db->prepare($sql);
	$stmt->setFetchMode(PDO::FETCH_ASSOC);
	$stmt->execute();
	$data = $stmt->fetchAll();
	
	$stmt2 = $db->query($sql_trang);
	$total_rows= $stmt2->rowCount();
	
	
?>

<table class="table table-hover" width="100%" border="0">
  <tr>
    <td width="123"><div align="center">Tên khách hàng</div></td>
    <td width="78"><div align="center">Giới tính</div></td>

    <td width="100"><div align="center">Ngày sinh</div></td>
    <td width="109"><div align="center">Địa chỉ</div></td>
    <td width="115"><div align="center">Điện thoại</div></td>
    <td width="93"><div align="center">Email</div></td>
    <td colspan="2"><div align="center">Quản lí</div></td>
  </tr>
  <?php
 	foreach($data as $kh)
	{

	?>
  <tr>

    <td><?php echo $kh['ten_khach_hang']; ?></td>
    <td><?php if($kh['phai']==1)
				echo "Nữ";
				else echo "Nam"; ?></td>
    
    <td><div align="center"><?php echo $kh['ngay_sinh'] ?></div></td>
    <td><?php echo $kh['dia_chi']; ?></td>
    <td><?php echo $kh['dien_thoai']; ?></td>
     <td><?php echo $kh['email']; ?></td>
    <td width="48"><div align="center">
   
	<a href="index.php?quanly=khachhang&event=sua&trang=<?php echo $get_trang;?>&id=<?php echo $kh['ma_khach_hang']?>" >Sửa</a>
    </div></td>
    <td width="61"><div align="center">
    <a href="modules/khachhang/xuly.php?id=<?php echo $kh['ma_khach_hang']?>" onclick="return confirm('Bạn có muốn xóa khách hàng này?')">Xóa</a>
    </div></td>
  </tr>
  <?php
  }
  ?>
</table>

 <ul class="pagination justify-content-end">
    <li class="page-item disabled">
      <a class="page-link" href="#" tabindex="-1">Previous</a>
    </li>
     <?php
		 
			$dem=ceil($total_rows/8);
			for($i=1;$i<=$dem;$i++){
			
		 ?>
    <li class="page-item"><a class="page-link" href="index.php?quanly=loaisp&event=them&trang=<?php echo $i ?>"><?php echo $i ?></a></li>
    <?php } ?>
 <a class="page-link" href="#" >Next</a>
    </ul>
    