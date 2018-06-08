<?php

	$sql_loaisp="select * from loai_san_pham where ma_loai='$_GET[id]'";
	$stmt = $db->prepare($sql_loaisp);
	$stmt->setFetchMode(PDO::FETCH_ASSOC);
	$stmt->execute();
	$data1 = $stmt->fetchAll();
	foreach($data1 as $loaisp){
?>
<script src="https://cloud.tinymce.com/stable/tinymce.min.js"></script>
  <script>tinymce.init({ selector:'textarea' });</script>
<form action="modules/loaisanpham/xuly.php?id=<?php echo $loaisp['ma_loai']?>" method="post" enctype="multipart/form-data">
<table width="100%" border="0" style="border-collapse:collapse">
  <tr>
    <td colspan="2"><div align="center">Sửa loại sản phẩm</div></td>
  </tr>
  <tr>
    <td width="114" height="37">Tên loại</td>
    <td width="210"><input type="text" name="tenloaisp" style="width:100%"
    					value="<?php echo $loaisp['ten_loai'] ?>"></td>
  </tr>
  <tr>
    <td height="42">Mã loại cha</td>
    <td><input type="text" name="maloaicha" style="width:100%"
    		value="<?php echo $loaisp['ma_loai_cha']?>"></td>
  </tr>
  <tr>

    <td height="43">Hình ảnh</td>
    <td><input type="file" name="hinhanh" /><img src="modules/loaisanpham/upload/<?php echo $loaisp['hinh_loaisp'];?>" width="60" height="60"/></td>
  </tr>
  <tr>
    <td height="118">Mô tả</td>
    <td><textarea rows="4" name="mota"><?php echo $loaisp['mo_ta']?></textarea></td>
  </tr>
  <tr>
    <td height="69" colspan="2"><div align="center">
    <button name="sua" id="sua" value="Sửa" class="btn btn-primary" >Sửa</button>

    </div></td>
  </tr>
</table>
</form>

<?php } ?>