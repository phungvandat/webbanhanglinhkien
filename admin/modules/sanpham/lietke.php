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
	

	$sql_trang="select * from san_pham";
	$sql="select * from san_pham,loai_san_pham where san_pham.ma_loai=loai_san_pham.ma_loai Order by ma_san_pham DESC limit $trang,8";
	$stmt = $db->prepare($sql);
	$stmt->setFetchMode(PDO::FETCH_ASSOC);
	$stmt->execute();
	$data = $stmt->fetchAll();
	
	$stmt2 = $db->query($sql_trang);
	$total_rows= $stmt2->rowCount();
	
	
?>

<table class="table table-hover" width="100%" border="0">
  <tr>
    <td width="51"><div align="center">ID</div></td>
    <td width="58"><div align="center">Tên sp</div></td>
    <td width="118"><div align="center">Loại sp</div></td>

    <td width="183"><div align="center">Hình ảnh</div></td>
    <td width="182"><div align="center">Mô tả</div></td>
    <td colspan="2"><div align="center">Quản lí</div></td>
  </tr>
  <?php
 	foreach($data as $sp)
	{

	?>
  <tr>
    <td height="70"><?php echo $sp['ma_san_pham']; ?></td>
    <td><?php echo $sp['ten_san_pham']; ?></td>
    <td><?php echo $sp['ten_loai']; ?></td>
    
    <td><div align="center"><img src="../images/san_pham/<?php echo $sp['hinh'];?>" class="img-thumbnail"></div></td>
    <td><?php echo $sp['mo_ta_tom_tat']; ?></td>
    <td width="64"><div align="center">
   
	<a href="index.php?quanly=sanpham&event=sua&trang=<?php echo $get_trang;?>&id=<?php echo $sp['ma_san_pham']?>" >Sửa</a>
    </div></td>
    <td width="75"><div align="center">
    <a href="modules/sanpham/xuly.php?id=<?php echo $sp['ma_san_pham']?>" onclick="return confirm('Bạn có muốn xóa sản phẩm này?')">Xóa</a>
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
    <li class="page-item"><a class="page-link" href="index.php?quanly=sanpham&event=them&trang=<?php echo $i ?>"><?php echo $i ?></a></li>
    <?php } ?>
 <a class="page-link" href="#" >Next</a>
    </ul>
    