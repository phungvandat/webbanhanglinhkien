<script src="https://cloud.tinymce.com/stable/tinymce.min.js"></script>
  <script>tinymce.init({ selector:'textarea' });</script>

<form action="modules/sanpham/xuly.php" method="post" enctype="multipart/form-data">
<table width="100%" border="0" style="border-collapse:collapse">
  <tr>
    <td colspan="2"><h3 align="center">Thêm sản phẩm</h3></td>
  </tr>
  <tr>
    <td width="150px" height="37">Tên sản phẩm</td>
    <td width="150px"><input type="text" name="tensp" style="width:100%"></td>
  </tr>
  <tr>
    <td height="42">Giá</td>
    <td><input type="text" name="gia" style="width:100%"></td>
  </tr>
  <tr>
    <td height="43">Hình ảnh</td>
    <td><input type="file" name="hinhanh" ></td>
  </tr>
  <tr>
    <td height="118">Mô tả</td>
    <td><textarea rows="4" name="mota"></textarea></td>
  </tr>
  <?php
  	$sql_loaisp="select * from loai_san_pham ";
	$stmt = $db->prepare($sql_loaisp);
	$stmt->setFetchMode(PDO::FETCH_ASSOC);
	$stmt->execute();
	$data = $stmt->fetchAll();
	
  ?>
  <tr>
    <td height="61">Loại sản phẩm</td>
    
    <td><select name="loaisp">
 	<?php
		foreach($data as $loaisp){
    ?>
    <option value="<?php echo $loaisp['ma_loai'] ?>"><?php echo $loaisp['ten_loai']?></option>
    <?php
	}
	?>
    </select></td>
  </tr>
  <tr>
    <td height="121" colspan="2"><div align="center">
    <button name="them" id="them" value="Thêm" class="btn btn-primary">Thêm</button>
    </div></td>
  </tr>
</table>
</form>