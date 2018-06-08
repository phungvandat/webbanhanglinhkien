<?php

	$sql_loaisp="select * from bai_viet,loai_bai_viet,nguoi_dung where bai_viet.ma_loai_bai_viet=loai_bai_viet.ma_loai_bai_viet and bai_viet.ma_nguoi_dung=nguoi_dung.ma_nguoi_dung and ma_bai_viet='$_GET[id]'";
	$stmt = $db->prepare($sql_loaisp);
	$stmt->setFetchMode(PDO::FETCH_ASSOC);
	$stmt->execute();
	$data1 = $stmt->fetchAll();
	foreach($data1 as $bv){
?>
<script src="https://cloud.tinymce.com/stable/tinymce.min.js"></script>
  <script>tinymce.init({ selector:'textarea' });</script>
<form action="modules/baiviet/xuly.php?id=<?php echo $bv['ma_bai_viet']?>" method="post" enctype="multipart/form-data">
<table width="100%" border="0" style="border-collapse:collapse">
  <tr>
    <td colspan="2"><h3 align="center">Sửa thông tin bài viết</h3></td>
  </tr>
  <?php
  	$sql_loaisp="select * from loai_bai_viet";
	$stmt = $db->prepare($sql_loaisp);
	$stmt->setFetchMode(PDO::FETCH_ASSOC);
	$stmt->execute();
	$data2 = $stmt->fetchAll();
	
  ?>
  <tr>
    <td height="61">Loại bài viết</td>
    
    <td><select name="loaibv">
 	<?php
		foreach($data2 as $loaibv){
			if($bv['ma_loai_bai_viet']==$loaibv['ma_loai_bai_viet']){
    ?>
    <option selected="selected" value="<?php echo $loaibv['ma_loai_bai_viet'] ?>"><?php echo $loaibv['ten_loai_bai_viet']?></option>
    <?php }else{
		?>
    <option value="<?php echo $loaibv['ma_loai_bai_viet'] ?>"><?php echo $loaibv['ten_loai_bai_viet']?></option>
    <?php
			}
	}
	?>
    </select></td>
  </tr>
   <tr>
    <td width="114" height="37">Tên người đăng</td>
    <td width="210"><input type="text" name="tennguoidang" style="width:100%"
    					value="<?php echo $bv['ho_ten'] ?>"></td>
  </tr>
  <tr>
    <td height="42">Tittle</td>
    <td><input type="text" name="tittle" style="width:100%"
    		value="<?php echo $bv['tieu_de'] ?>"></td>
  </tr>
  
  <tr>
    <td height="118">Nội dung tóm tắt</td>
    <td><textarea rows="4" name="tomtat"><?php echo $bv['noi_dung_tom_tat']?></textarea></td>
  </tr>
  
  <tr>
    <td height="118">Nội dung chi tiết</td>
    <td><textarea rows="4" name="chitiet"><?php echo $bv['noi_dung_chi_tiet']?></textarea></td>
  </tr>
  <tr>

    <td height="43">Ngày gửi bài</td>
    <td><input type="datetime" name="guibai" value="<?php echo $bv['ngay_gui_bai'] ?>" /></td>
  </tr>
  
  <tr>

    <td height="43">Ngày xuất bản</td>
    <td><input type="datetime" name="xuatban" value="<?php echo $bv['ngay_xuat_ban'] ?>" /></td>
  </tr>
  
  <tr>
  
  <tr>

    <td height="43">Ngày hết hạn</td>
    <td><input type="datetime" name="hethan" value="<?php echo $bv['ngay_het_han'] ?>" /></td>
  </tr>
  
  <tr>
    <td height="69" colspan="2"><div align="center">
    <button name="sua" id="sua" value="Sửa" class="btn btn-primary" >Sửa</button>

    </div></td>
  </tr>
</table>
</form>

<?php } ?>