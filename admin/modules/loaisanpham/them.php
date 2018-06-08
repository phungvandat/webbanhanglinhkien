<script src="https://cloud.tinymce.com/stable/tinymce.min.js"></script>
  <script>tinymce.init({ selector:'textarea' });</script>

<form action="modules/loaisanpham/xuly.php" method="post" enctype="multipart/form-data">
<table width="100%" border="0" style="border-collapse:collapse">
  <tr>
    <td colspan="2"><div align="center">Thêm loại sản phẩm</div></td>
  </tr>
  <tr>
    <td width="150px" height="37">Tên loại</td>
    <td width="150px"><input type="text" name="tenloaisp" style="width:100%"></td>
  </tr>
  <tr>
    <td height="42">Mã loại cha</td>
    <td><input type="text" name="maloaicha" style="width:100%"></td>
  </tr>
  <tr>
    <td height="43">Hình ảnh</td>
    <td><input type="file" name="hinhanh" ></td>
  </tr>
  <tr>
    <td height="118">Mô tả</td>
    <td><textarea rows="4" name="mota"></textarea></td>
  </tr>

  <tr>
    <td height="121" colspan="2"><div align="center">
    <button name="them" id="them" value="Thêm" class="btn btn-primary">Thêm</button>
    </div></td>
  </tr>
</table>
</form>