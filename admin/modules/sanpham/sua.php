<?php

	$sql_chitietsp="select * from san_pham where ma_san_pham='$_GET[id]'";
	$stmt = $db->prepare($sql_chitietsp);
	$stmt->setFetchMode(PDO::FETCH_ASSOC);
	$stmt->execute();
	$data1 = $stmt->fetchAll();
	foreach($data1 as $sp){
?>
<script src="https://cloud.tinymce.com/stable/tinymce.min.js"></script>
  <script>tinymce.init({ selector:'textarea' });</script>
<form action="modules/sanpham/xuly.php?id=<?php echo $sp['ma_san_pham']?>" method="post" enctype="multipart/form-data">
<table width="100%" border="0" style="border-collapse:collapse">
  <tr>
    <td colspan="2"><h3 align="center">Sửa sản phẩm</h3></td>
  </tr>
  <tr>
    <td width="114" height="37">Tên sản phẩm</td>
    <td width="210"><input type="text" name="tensp" style="width:100%"
    					value="<?php echo $sp['ten_san_pham'] ?>"></td>
  </tr>
  <tr>
    <td height="42">Giá</td>
    <td><input type="text" name="gia" style="width:100%"
    		value="<?php echo $sp['don_gia']?>"></td>
  </tr>
  <tr>

    <td height="43">Hình ảnh</td>
    <td><input type="file" name="hinhanh" /><img src="modules/sanpham/upload/<?php echo $sp['hinh'];?>" width="60" height="60"/></td>
  </tr>
  <tr>
    <td height="118">Mô tả</td>
    <td><textarea rows="4" name="mota"><?php echo $sp['mo_ta_tom_tat']?></textarea></td>
  </tr>
  <?php
  	$sql_loaisp="select * from loai_san_pham";
	$stmt = $db->prepare($sql_loaisp);
	$stmt->setFetchMode(PDO::FETCH_ASSOC);
	$stmt->execute();
	$data2 = $stmt->fetchAll();
	
  ?>
  <tr>
    <td height="61">Loại sản phẩm</td>
    
    <td><select name="loaisp">
 	<?php
		foreach($data2 as $loaisp){
			if($sp['ma_loai']==$loaisp['ma_loai']){
    ?>
    <option selected="selected" value="<?php echo $loaisp['ma_loai'] ?>"><?php echo $loaisp['ten_loai']?></option>
    <?php }else{
		?>
    <option value="<?php echo $loaisp['ma_loai'] ?>"><?php echo $loaisp['ten_loai']?></option>
    <?php
			}
	}
	?>
    </select></td>
  </tr>
  <tr>
    <td height="69" colspan="2"><div align="center">
    <button name="sua" id="sua" value="Sửa" >Sửa</button>

    </div></td>
  </tr>
</table>
</form>

<?php } ?>