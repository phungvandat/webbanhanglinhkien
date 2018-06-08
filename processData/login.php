<div id="divLogin" class="modal">
  <form class="modal-content animate" method="POST">
    <div class="imgcontainer"> <span onclick="document.getElementById('divLogin').style.display='none'" class="close" title="Close Modal">&times;</span> <img src="images/logo.jpg" alt="logo" class="avatar"> </div>
    <div class="containerLogin">
      <label for="uname"><b>Tên đăng nhập</b></label>
      <input type="text" placeholder="Nhập tên đăng nhập" name="uname" required>
      <label for="psw"><b>Mật khẩu</b></label>
      <input type="password" placeholder="Nhập mật khẩu" name="psw" required>
      <button  name = "buttonDangNhap">Đăng nhập</button>
      <?php
	  $tenDangNhap;
	  $matKhau;
		if(isset($_POST["buttonDangNhap"])){
			$tenDangNhap = $_POST["uname"];
			$matKhau = $_POST["psw"];
			$query_login = "select * from user where ten_dang_nhap ='".$tenDangNhap."' and mat_khau = '".$matKhau."'";
			$result = $dbQuanLyBanLinhKien->query($query_login);
			if(mysqli_num_rows($result) == 1){
				$ho_ten;
				while($row = mysqli_fetch_array($result))
					$ho_ten = $row["ho_ten"];
				$_SESSION['userName'] = $tenDangNhap;
				$_SESSION['pass'] = $matKhau;
				
				if(isset($_COOKIE['donHang']))
					echo "<script>
							$(document).ready(function(){
									$('#divSync').css('display','block');		
								}); 
						</script>";
				else{
					include_once('processData/syncCart.php');
					header("Refresh:0");
				}
			}
			else{
				echo "<script>
					$(document).ready(function(){
							$('#divLogin').css('display','block');		
						}); 
				</script>";
				echo "<p id = 'txtThongBao' style = 'color: red'><b>Tên đăng nhập hoặc mật khẩu không đúng</b> </p><br>";
			}
			}
 ?>
      <label>
        <input type="checkbox" checked="checked" name="remember">
        Remember me </label>
    </div>
    <div class="containerLogin" style="background-color:#f1f1f1">
      <button type="button" onclick="document.getElementById('divLogin').style.display='none'" class="cancelbtn">Cancel</button>
    </div>
  </form>
</div>
<div class = "sync">
    <div id="divSync" class="modal">
      <div class="modal-content">
        <p align = 'center'><B>Bạn có muốn đồng bộ giỏ hàng hiện tại vào giỏ hàng của bạn không?</B></p>
        <form>
            <button  id = "btnSync">Đồng bộ</button>
            <button  id = "btnUnSync">Bỏ qua</button>
        </form>
      </div>
    </div>
</div>
<div id = "divlogout"></div>
<script>
	$(document).ready(function(){
		$('#btnDangNhap').click(function(){
			$('#txtThongBao').remove();
			$('#divLogin').css('display','block');		
		});
		$('span').click(function(){
			$('#divLogin').css('display', 'none');
			
		});
		
	});
	window.onload= function(){
		$('#btnSync').click(function(){
			$('#divSync').css('display','none');
			$.ajax({
				url : 'processData/handle_sync_cart.php',
				type : 'POST',
				dataType : 'text',
				data : {sync : 1},
				success: function(result){	
				window.location.href = window.location.pathname;
				}
			});
		});
		$('#btnUnSync').click(function(){
			$('#divSync').css('display','block');
			$.ajax({
				url : 'processData/handle_sync_cart.php',
				type : 'POST',
				dataType : 'text',
				data : {sync : 0},
				success: function(result){	
					window.location.href = window.location.pathname;
				}
			});
			
		});	
	}; 
</script>
