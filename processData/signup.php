<div id="divSignup" class="modal">
	<form class="modal-content animate" method="POST">
        <div class="imgcontainer"> <span onclick="document.getElementById('divSignup').style.display='none'" class="close" title="Close Modal">&times;</span> <img src="images/logo.jpg" alt="logo" class="avatar"> </div>
        <div class="containerLogin">
          <input type="text" placeholder="Họ và tên" name="hoTenDK" id = 'hoTenDK' required>
          <input type="text" placeholder="Tên đăng nhập" name="tenDangNhapDK" id = 'tenDangNhapDK' required>
          <input type="password" placeholder="Mật khẩu" name="passDK" id = 'passDK' id = 'passDK' required>
          <input type="password" placeholder="Xác nhận mật khẩu" name="passDKXN" id = 'passDKXN' required>
          <input type="email" placeholder="Email liên hệ" name="emailDK" id = 'emailDK' required> 
          <input type="text" placeholder="Địa chỉ" name="diaChiDK" id = 'diaChiDK' required>
          <?php include_once('processData/handle_signup.php');?>
          <button  name = "buttonDangKy" id = 'buttonDangKy'>Đăng Ký</button>
         </div>
     </form>
</div>

<script>
	$(document).ready(function(){
		$('#btnDangKy').click(function(){
			$('#divSignup').css('display','block');		
		});	
		$('#passDKXN').on('keyup', function () {
			if ($(this).val() == $('#passDK').val()) {
				$('#passDKXN').css('border-color', 'lime');
			} 
			else{
				$('#passDKXN').css('border-color', 'red');
			}
		});
	});
</script>