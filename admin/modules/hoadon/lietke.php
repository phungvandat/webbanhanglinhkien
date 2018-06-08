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
	

	$sql_trang="select * from hoa_don";
	$sql="SELECT * FROM hoa_don,khach_hang where hoa_don.ma_khach_hang=khach_hang.ma_khach_hang ORDER BY so_hoa_don DESC LIMIT $trang,8";
	$stmt = $db->prepare($sql);
	$stmt->setFetchMode(PDO::FETCH_ASSOC);
	$stmt->execute();
	$data = $stmt->fetchAll();
	
	$stmt2 = $db->query($sql_trang);
	$total_rows= $stmt2->rowCount();
	
	
?>

<table class="table table-hover" width="100%" border="0">
  <tr>
    <td width="124"><div align="center">Số hóa đơn</div></td>
    <td width="218"><div align="center">Ngày thanh toán</div></td>
	<td width="157"><div align="center">Tên khách hàng</div></td>
    <td width="70"><div align="center">Trị giá</div></td>

  </tr>
  <?php
 	foreach($data as $hd)
	{

	?>
 <tr>

    <td> <div align="center"><a href="index.php?quanly=cthd&event=them&id=<?php echo $hd['so_hoa_don']?>"><?php echo $hd['so_hoa_don']; ?></a></div></td>
    <td><div align="center"><?php echo $hd['ngay_hd'] ?></div></td>
    
    <td><div align="center"><?php echo $hd['ten_khach_hang']; ?></div></td>
    <td><div align="center"><?php echo $hd['tri_gia']; ?></div></td>
    
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
    <li class="page-item"><a class="page-link" href="index.php?quanly=hoadon&event=them&trang=<?php echo $i ?>"><?php echo $i ?></a></li>
    <?php } ?>
 <a class="page-link" href="#" >Next</a>
 </ul>
    
    