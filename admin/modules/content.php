  <div class="content">
    	<?php
		if(isset($_GET['quanly'])){
			$tam=$_GET['quanly'];
		}else{
			$tam='';
		}if($tam=='loaisp'){
			include('modules/loaisanpham/main.php');
		}if($tam=='sanpham'){
			include('modules/sanpham/main.php');
		}if($tam=='khachhang'){
			include('modules/khachhang/main.php');
		}if($tam=='baiviet'){
			include('modules/baiviet/main.php');
		}if($tam=='hoadon'){
			include('modules/hoadon/main.php');
		}if($tam=='cthd'){
			include('modules/hoadon/lietke_chitiet.php');
		}
		?>
     </div>
     <div class="clear"></div>