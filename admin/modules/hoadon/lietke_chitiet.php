<?php
	include('conn.php');
	$id=$_GET['id'];
	

	$sql="SELECT * FROM ct_hoa_don,san_pham where ct_hoa_don.ma_san_pham=san_pham.ma_san_pham and so_hoa_don='$id'";
	$stmt = $db->prepare($sql);
	$stmt->setFetchMode(PDO::FETCH_ASSOC);
	$stmt->execute();
	$data = $stmt->fetchAll();
	

	
?>

<table class="table table-hover" width="100%" border="0">
  <tr>
  	<td width="109"><div align="center">STT</div></td>
    <td width="123"><div align="center">Số hóa đơn</div></td>
    <td width="78"><div align="center">Tên sản phẩm</div></td>
	<td width="78"><div align="center">Số lượng</div></td>
    <td width="100"><div align="center">Đơn giá</div></td>
    

  </tr>
  
  <?php
	
 	foreach($data as $cthd)
	{

	?>
  <tr>

    <td><div align="center"><?php echo $cthd['stt']; ?></div></td>
    <td><div align="center"><?php echo $cthd['so_hoa_don']; ?></div></td>
    <td><div align="center"><?php echo $cthd['ten_san_pham'] ?></div></td>
    
    <td><div align="center"><?php echo $cthd['so_luong'] ?></div></td>
    <td><div align="center"><?php echo $cthd['don_gia']; ?></div></td>
   
   
  </tr>
  <?php
  }
  ?>
</table>

 