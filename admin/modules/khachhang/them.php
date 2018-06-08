<script src="https://cloud.tinymce.com/stable/tinymce.min.js"></script>
  <script>tinymce.init({ selector:'textarea' });</script>

<form action="modules/khachhang/xuly.php" method="post" enctype="multipart/form-data">
<table width="100%" border="0" style="border-collapse:collapse">
  <tr>
    <td colspan="2"><h3 >Thêm khách hàng</h3></td>
  </tr>
  <tr>
    <td width="150px" height="37">Tên khách hàng</td>
    <td width="150px"><input type="text" name="tenkh" style="width:100%"></td>
  </tr>
  <tr>
    <td height="42">Giới tính</td>
    <td><input type="text" name="gt" style="width:100%"></td>
  </tr>
  <tr>
    <td height="43">Ngày sinh</td>
    <td><input type="date" name="ngaysinh" ></td>
  </tr>
  <tr>
    <td height="118">Địa chỉ</td>
    <td><textarea rows="4" name="diachi"></textarea></td>
  </tr>
  
  <tr>
    <td height="50">Điện thoại</td>
    <td><input type="text" name="dt"/></td>
  </tr>
  
  <tr>
    <td height="50">Email</td>
    <td><input type="email" name="email" /></td>
  </tr>

  <tr>
    <td height="121" colspan="2"><div align="center">
    <button name="them" id="them" value="Thêm" class="btn btn-primary">Thêm</button>
    </div></td>
  </tr>
</table>
</form>