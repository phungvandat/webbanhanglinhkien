<script src="https://cloud.tinymce.com/stable/tinymce.min.js"></script>
  <script>tinymce.init({ selector:'textarea' });</script>

<form action="modules/baiviet/xuly.php" method="post" enctype="multipart/form-data">
<table width="100%" border="0" style="border-collapse:collapse">
  <tr>
    <td colspan="2"><div align="center">Thêm bài viết</div></td>
  </tr>
   <?php
  	$sql_loaisp="select * from loai_bai_viet ";
	$stmt = $db->prepare($sql_loaisp);
	$stmt->setFetchMode(PDO::FETCH_ASSOC);
	$stmt->execute();
	$data = $stmt->fetchAll();
	
  ?>
  <tr>
    <td height="61">Loại bài viết</td>
    
    <td><select name="loaibv">
 	<?php
		foreach($data as $loaibv){
    ?>
    <option value="<?php echo $loaibv['ma_loai_bai_viet'] ?>"><?php echo $loaibv['ten_loai_bai_viet']?></option>
    <?php
	}
	?>
    </select></td>
  </tr>
  <tr>
    <td width="150px" height="37">Tên người đăng</td>
    <td width="150px"><input type="text" name="tennguoidang" style="width:100%"></td>
  </tr>
   <tr>
    <td height="42">Tittle</td>
    <td><input type="text" name="tittle" style="width:100%"></td>
  </tr>
  
  <tr>
    <td height="118">Nội dung tóm tắt</td>
    <td><textarea rows="4" name="tomtat"></textarea></td>
  </tr>
  
  <tr>
    <td height="118">Nội dung chi tiết</td>
    <td><textarea rows="4" name="chitiet"></textarea></td>
  </tr>
 

  <tr>
    <td height="121" colspan="2"><div align="center">
    <button name="them" id="them" value="Thêm" class="btn btn-primary">Thêm</button>
    </div></td>
  </tr>
</table>
</form>