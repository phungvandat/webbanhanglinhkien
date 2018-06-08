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
	

	$sql_trang="select * from bai_viet";
	$sql="SELECT * FROM bai_viet,loai_bai_viet,nguoi_dung where bai_viet.ma_loai_bai_viet=loai_bai_viet.ma_loai_bai_viet and bai_viet.ma_nguoi_dung=nguoi_dung.ma_nguoi_dung  ORDER BY ma_bai_viet DESC LIMIT $trang,8";
	$stmt = $db->prepare($sql);
	$stmt->setFetchMode(PDO::FETCH_ASSOC);
	$stmt->execute();
	$data = $stmt->fetchAll();
	
	$stmt2 = $db->query($sql_trang);
	$total_rows= $stmt2->rowCount();
	
	
?>

<table class="table table-hover" width="100%" border="0">
  <tr>
    <td width="123"><div align="center">Tên loại bài viết</div></td>
    <td width="78"><div align="center">Tên người đăng</div></td>
	<td width="78"><div align="center">Tiêu đề</div></td>
    <td width="100"><div align="center">Nội dung tóm tắt</div></td>
    <td width="109"><div align="center">Ngày gửi bài</div></td>
    <td width="115"><div align="center">Ngày xuất bản</div></td>
    <td width="115" colspan="2"><div align="center">Quản lí</div></td>
  </tr>
  <?php
 	foreach($data as $bv)
	{

	?>
  <tr>

    <td><?php echo $bv['ten_loai_bai_viet']; ?></td>
    <td><?php echo $bv['ho_ten'] ?></td>
    
    <td><div align="center"><?php echo $bv['tieu_de'] ?></div></td>
    <td><?php echo $bv['noi_dung_tom_tat']; ?></td>
    <td><?php echo $bv['ngay_gui_bai']; ?></td>
     <td><?php echo $bv['ngay_xuat_ban']; ?></td>
    <td width="48"><div align="center">
   
	<a href="index.php?quanly=baiviet&event=sua&trang=<?php echo $get_trang;?>&id=<?php echo $bv['ma_bai_viet']?>" >Sửa</a>
    </div></td>
    <td width="61"><div align="center">
    <a href="modules/baiviet/xuly.php?id=<?php echo $bv['ma_bai_viet']?>" onclick="return confirm('Bạn có muốn xóa bài viết này này?')">Xóa</a>
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
    <li class="page-item"><a class="page-link" href="index.php?quanly=baiviet&event=them&trang=<?php echo $i ?>"><?php echo $i ?></a></li>
    <?php } ?>
 <a class="page-link" href="#" >Next</a>
 </ul>
    
    