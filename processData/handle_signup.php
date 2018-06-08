<?php
	if(isset($_POST['buttonDangKy'])){
		$hoTenDK =  $_POST['hoTenDK'];
		$tenDangNhapDK =  $_POST['tenDangNhapDK'];
		$passDK =  $_POST['passDK'];
		$passDKXN =  $_POST['passDKXN'];
		$emailDK =  $_POST['emailDK'];
		$diaChiDK =  $_POST['diaChiDK'];
		//Kiểm tra mật khẩu xác nhận đã trùng
		if($passDK != $passDKXN){
			echo "<script>
					$(document).ready(function(){
							$('#divSignup').css('display','block');	
							$('#hoTenDK').val('".$hoTenDK."');
							$('#tenDangNhapDK').val('".$tenDangNhapDK."');
							$('#passDK').val('".$passDK."');
							$('#emailDK').val('".$emailDK."');
							$('#diaChiDK').val('".$diaChiDK."');
						}); 
				</script>";
			echo "<p id = 'txtThongBao' style = 'color: red'><b>Mật khẩu xác nhận không khớp!</b> </p><br>";	
			return;
		}
		//Kiểm tra tên đăng nhập chưa tồn tại
		$query_tenDangNhap = 'select * from user where ten_dang_nhap = "'.$tenDangNhapDK.'"';
		if(mysqli_num_rows($dbQuanLyBanLinhKien->query($query_tenDangNhap)) > 0){
			echo "<script>
					$(document).ready(function(){
							$('#divSignup').css('display','block');	
							$('#hoTenDK').val('".$hoTenDK."');
							$('#passDK').val('".$passDK."');
							$('#passDKXN').val('".$passDKXN."');
							$('#emailDK').val('".$emailDK."');
							$('#diaChiDK').val('".$diaChiDK."');	
						}); 
				</script>";
			echo "<p id = 'txtThongBao' style = 'color: red'><b>Tên đăng nhập đã tồn tại. Vui lòng chọn tên khác.</b> </p><br>";
			return;	
		}
		
		//Kiểm tra email đã tồn tại
		$query_email = 'select * from user where email ="'.$emailDK.'"';
		if(mysqli_num_rows($dbQuanLyBanLinhKien->query($query_email)) > 0){
			echo "<script>
					$(document).ready(function(){
							$('#divSignup').css('display','block');	
							$('#divSignup').css('display','block');	
							$('#hoTenDK').val('".$hoTenDK."');
							$('#tenDangNhapDK').val('".$tenDangNhapDK."');
							$('#passDK').val('".$passDK."');
							$('#passDKXN').val('".$passDKXN."');
							$('#diaChiDK').val('".$diaChiDK."');		
						}); 
				</script>";
			echo "<p id = 'txtThongBao' style = 'color: red'><b>Email đã tồn tại. Vui lòng đăng ký bằng một email mới.</b> </p><br>";	
			return;	
		}
		$ngayDK = date("Y-m-d H:i:s");
		$query_newUser = "INSERT INTO user ( ho_ten, ten_dang_nhap, mat_khau, email, ngay_dang_ky, dia_chi) VALUES ('".$hoTenDK."', '".$tenDangNhapDK."', '".$passDK."', '".$emailDK."', '".$ngayDK."', '".$diaChiDK."')";
		$dbQuanLyBanLinhKien->query($query_newUser);
		echo '<script>alert("Đăng ký thành công. Mời bạn đăng nhập")</script>';
		
	}
 ?>