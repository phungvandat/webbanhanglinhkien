<?php

	$sql_loaisp="select * from khach_hang where ma_khach_hang='$_GET[id]'";
	$stmt = $db->prepare($sql_loaisp);
	$stmt->setFetchMode(PDO::FETCH_ASSOC);
	$stmt->execute();
	$data1 = $stmt->fetchAll();
	foreach($data1 as $kh){
?>
<script src="https://cloud.tinymce.com/stable/tinymce.min.js"></script>
  <script>tinymce.init({ selector:'textarea' });</script>
<form action="modules/khachhang/xuly.php?id=<?php echo $kh['ma_khach_hang']?>" method="post" enctype="multipart/form-data">
<table width="100%" border="0" style="border-collapse:collapse">
  <tr>
    <td colspan="2"><h3>Sửa thông tin khách hàng</h3></td>
  </tr>
  <tr>
    <td width="114" height="37">Tên khách hàng</td>
    <td width="210"><input type="text" name="tenkh" style="width:100%"
    					value="<?php echo $kh['ten_khach_hang'] ?>"></td>
  </tr>
  <tr>
    <td height="42">Giới tính</td>
    <td><input type="text" name="gt" style="width:100%"
    		value="<?php if($kh['phai']==1)
				echo "Nữ";
				else echo "Nam"; ?>"></td>
  </tr>
  <tr>

    <td height="43">Ngày sinh</td>
    <td><input type="date" name="ngaysinh" value="<?php echo $kh['ngay_sinh'] ?>" /></td>
  </tr>
  <tr>
    <td height="118">Địa chỉ</td>
    <td><textarea rows="4" name="diachi"><?php echo $kh['dia_chi']?></textarea></td>
  </tr>
   <tr>
    <td height="118">Điện thoại</td>
    <td><input type="text" name="dt" value="<?php echo $kh['dien_thoai']?>" /></td>
  </tr>
   <tr>
    <td height="118">Email</td>
    <td><input type="email" name="email" value="<?php echo $kh['email']?>"  /></td>
  </tr>
  <tr>
    <td height="69" colspan="2"><div align="center">
    <button name="sua" id="sua" value="Sửa" class="btn btn-primary" >Sửa</button>

    </div></td>
  </tr>
</table>
</form>

<?php } ?>