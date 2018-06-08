<div style="height: 100%; width: 21%;  height: 150px; ">
  <div class="feildBasic" align="center">
    <div class = 'divAccount'>
	<?php
		if(isset($_SESSION['userName']) && isset($_SESSION['pass'])){
			$query = "select ho_ten from user where ten_dang_nhap = '".$_SESSION['userName']."' and mat_khau = '".$_SESSION['pass']."'";
			$hoten = mysqli_fetch_array($dbQuanLyBanLinhKien->query($query));
			echo "<div class = 'login'>
						<h4 id = 'btnLogout'><img src = \"images/avatar.jpg\" style = \"display: block; margin-left: auto; margin-right: auto; width: 30px; height: 30px;\"/>".$hoten['ho_ten']."</h4>
				
				<div class='container'>
					<div class='infoAccount'>
						<p><a href='account.php'>Tài khoản của tôi</a><p>
						<hr>
						<p id = 'txtDangXuat'>Đăng xuất</p>	
					</div>
				</div></div>";	
		}
		else{
			echo '<div><table style = "width:100%; table-layout: fixed">
					<tr>
					  <td align = "center"><h4 id ="btnDangKy">Đăng ký</h4></td>
					  <td align = "center"><h4 id = "btnDangNhap">Đăng Nhập</h4></td>
					</tr>
				  </table></div>'; 	
		}
	?>
      
    </div>
<?php 
	$numBill = 0;
	$total = 0;
	$arrInfoProduct = array();
	$dem = 0;
	// sử dụng session đăng nhập
	include_once($_SERVER['DOCUMENT_ROOT'].'/WebBanLinhKien/model/getCookie.php');
	// show dữ liệu vào giỏ hàng
	echo '<span class="badge"><a href="#" id="cart"><i class="fa fa-shopping-cart cart-icon"></i>'.$numBill.'</span></a>
			<div class="container">
				<div class="shopping-cart">
					<div class="shopping-cart-header">
						<i class="fa fa-shopping-cart cart-icon"></i>
						<div class="shopping-cart-total">
							<span class="lighter-text">Tổng tiền:</span>
							<span class="main-color-text">'.$total.'đ</span>
						 </div>
					</div>
					<ul class="shopping-cart-items">';
		foreach($arrInfoProduct as $mSP => $infoSP){
			//foreach($infoSP as $info)
			echo		'<li class="clearfix">
							<img src="images/san_pham/'.$infoSP[0].'" alt=""> 
							<span class="item-name"><a href="product.php?ma_san_pham='.$mSP.'">'.$infoSP[1].'</a>    </span>
							<span class="item-price">Giá: '.$infoSP[2].'</span>
							<span class="item-quantity">Số lượng: '.$infoSP[3].'</span>
						</li>';
		}
		echo	   '</ul>
 					<table style = "width: 100%;">
						<tr>
							<td><a href="cart.php?xem_gio_hang" class="button">Xem giỏ hàng</a></td>
							<td><a href="cart.php?thanh_toan" class="button">Thanh toán</a></td>
						</tr>
					</table>
				  </div>
			</div> ';
	/*showdata*/
?>
  </div>
</div>
<script>
$(document).ready(function(){
 $("#cart").on("click", function() {
    $(".shopping-cart").fadeToggle( "fast");
  });
  
 $('.login').hover( function(){
	$('.infoAccount').fadeToggle( "fast");
	});
$('#txtDangXuat').on('click',function(){
	$.ajax({
				url : 'processData/logout.php',
				type : 'POST',
				dataType : 'text',
				data : {},
				success: function(result){	
					window.location.href = window.location.pathname;
				}
			});
	
	});


})();
</script>