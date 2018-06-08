<?php  
	//Xử lý session
	if(isset($_SESSION['userName']) && isset($_SESSION['pass'])){
		$query_uer = 'select * from user where ten_dang_nhap ="'.$_SESSION['userName'].'" and mat_khau = "'.$_SESSION['pass'].'"';
		$user = mysqli_fetch_array($dbQuanLyBanLinhKien->query($query_uer));
		if(!isset($_COOKIE['donHang'])){
			echo "<h1>Chưa có sản phẩm nào trong giỏ hàng của bạn</h1>";
			return;	
		}	
		echo 
		'<table id="tableCheckOut" border="1" cellspadding="0" cellspacing="0">
				<tr class ="rowHang">
					<td>
						<p><b>Tài khoản của bạn:</b> '.$_SESSION['userName'].'</p>
						<p><b>Email:</b> '.$user['email'].'<br>Thông báo đơn hàng sẽ được gửi tới email này</p>
					</td>
				</tr>
				<tr>
					<td>
						<p><b>Địa chỉ nhận hàng</b><br>
						<input size = "50" type = "text" id ="txtdiaChiuser" value = "'.$user["dia_chi"].'" readonly><br>
						<a id = "divChange" style = "cursor: pointer; color: orange"><b>Nhấp vào đây thay đổi</b></a></p>
					</td>
				</tr>
				<tr class="rowHang" >
                    <td colspan="2" style="text-align:center">
                    <button class="btn"onclick="window.location.href=\'product.php\'">< Tiếp tục mua hàng </button>
                    <button id="btnThanhToanUser" class="btn" type="button" >Đặt Hàng ></button>
                    </td>
                </tr>
                <tr class="rowHang" >
                    <td colspan="2" style=\'text-align:center\'>
                    Phương thức thanh toán:<span style="color:red"> Trả tiền khi nhận được hàng.</br>
                    </td>
                </tr>
			</table>';
	}
	//Xử lý Không tồn tại session
	else{
		if(!isset($_COOKIE['donHang'])){
			echo "<h1>Chưa có sản phẩm nào trong giỏ hàng của bạn</h1>";
			return;	
		}	
            echo '
            <h2>Thanh Toán</h2>
			<form>
            <table id="tableCheckOut" border="1" cellspadding="0" cellspacing="0">
                <tr  class ="nameCol" style="background-color:#fe980f">
                    <td colspan ="2" ><h3  style="color:white" >Thông tin liên hệ của bạn</h3> </td>
                </tr>  
                <tr class="rowHang" >
                    <td class="titleText">Họ và Tên: <span style="color:red">(*)</span></td>
                    <td ><input class="textinput" id="hoTen"   type="text" ></td>
                </tr>
                <tr class="rowHang" >
                    <td class="titleText">Số điện thoại: <span style="color:red">(*)</span></td>
                    <td ><input class="textinput" id="sdt"  type="number" ></td>
                </tr>
                <tr class="rowHang" >
                    <td class="titleText">Địa chỉ:<span style="color:red">(*)</span></td>
                    <td ><input class="textinput" id ="diaChi"  type="text" ></td>
                </tr>
                <tr class="rowHang" >
                    <td class="titleText">Email:</td>
                    <td ><input class="textinput" id="email"  type="email" "></td>
                </tr>
                <tr class="rowHang" >
                    <td class="titleText">Giới Tính:</td>
                    <td >
                    Nam: <input type="radio" id="nam" name="gender" value="Nam">
                    Nữ:<input type="radio" id="nu" name="gender" value="Nữ">
                    </td>
                </tr>
                <tr class="rowHang" >
                    <td class="titleText">Ngày Sinh:</td>
                    <td ><input class="textinput" id="ngaySinh" type="date" ></td>
                </tr>
                <tr class="rowHang" >
                    <td colspan="2" style="text-align:center">
                    <button class="btn"><a href = "product.php">< Tiếp tục mua hàng</a> </button>
                    <button id="btnThanhToan" class="btn">Đặt Hàng ></button>
                    </td>
                </tr>
                <tr class="rowHang" >
                    <td colspan="2" style="text-align:center">
                    <span style="color:red">(*)</span>: bắt buộc nhập.</br>
                    Phương thức thanh toán:<span style="color:red"> Trả tiền khi nhận được hàng.</span> </br>
                    </td>
                </tr>
        </table>
		</form>
		<div id = "divThanhToan"></div>';
        }

?>
<script>
	$(document).ready(function(){
		$('#divChange').click(function(){
			$('#txtdiaChiuser').attr('readonly',false);
			});
		$('#btnThanhToan').click(function(){
			$gioiTinh = 1;
			if($('#nu').is(':checked')){$gioiTinh = 0;}
			$.ajax({
				url : 'processData/handle_order.php',
				type : 'GET',
				dataType: 'text',
				data: {
					 hoTen: $('#hoTen').val(),
					 gioiTinh : $gioiTinh,
					 ngaySinh : $('#ngaySinh').val(),
					 diaChi : $('#diaChi').val(),
					 sdt : $('#sdt').val(),
					 email : $('#email').val()},
				success: function(result){
					alert('Đặt hàng thành công');
					window.location.href = 'cart.php?thanh_toan';
					}			
				});
			});
			$('#btnThanhToanUser').click(function(){
				$.ajax({
					url: 'processData/handle_order.php',
					type : 'GET',
					dataType:"text",
					data : {session: 1,
							diaChi : $('#txtdiaChiuser').val()},
					success: function(result){alert('Đặt hàng thành công');
					window.location.href = 'cart.php?thanh_toan';}
					});	
			});
	});
</script>