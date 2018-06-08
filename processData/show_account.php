<?php
	if(isset($_SESSION['userName']) && isset($_SESSION['pass'])){
		$ten_dang_nhap = $_SESSION['userName'];
		$mat_khau = $_SESSION['pass'];
		$query_accout = 'select * from user where ten_dang_nhap = "'.$ten_dang_nhap.'" and mat_khau = "'.$mat_khau.'"';
		$accout = mysqli_fetch_array($dbQuanLyBanLinhKien->query($query_accout));
		$hoten = $accout['ho_ten'];
		$email = $accout['email'];
		$diaChi = $accout['dia_chi'];
			
?>
<h4><b>Tài khoản của tôi</b></h4>
Quản lý thông tin hồ sơ
<hr>
<table>
	<tr>
    	<td>Họ và tên</td>
        <td><b><?php echo $hoten; ?></b></td>
    </tr>
    <tr>
    	<td>Tên đăng nhập</td>
        <td><b><?php echo $ten_dang_nhap; ?></b></td>
    </tr>
    <tr>
    	<td>email</td>
        <td><b><?php echo $email; ?></b></td>
    </tr>
    <tr>
    	<td>Địa chỉ</td>
        <td><b><?php echo $diaChi; ?></b></td>
    </tr>
    
</table>
<?php }?>