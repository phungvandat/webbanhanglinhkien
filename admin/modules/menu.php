<?php

	if(isset($_GET['event'])&&$_GET['event']=='logout'){
		unset($_SESSION['dangnhap']);
		header('location:login.php');
	}
	
?>



<!-- CSS for Tab Menu #4 -->
<link rel="stylesheet" type="text/css" href="../ddtabmenu/ddtabmenufiles/ddcolortabs.css">
<script src="../ddtabmenu/ddtabmenufiles/ddtabmenu.js"></script>
<script type="text/javascript">
//SYNTAX: ddtabmenu.definemenu("tab_menu_id", integer OR "auto")
ddtabmenu.definemenu("ddtabs1", 0) 
ddtabmenu.definemenu("ddtabs2", 1) 
ddtabmenu.definemenu("ddtabs3", 2)
ddtabmenu.definemenu("ddtabs4", 3) 
ddtabmenu.definemenu("ddtabs5", 4) 
ddtabmenu.definemenu("ddtabs6", 5)
ddtabmenu.definemenu("ddtabs7", 6) 


</script>
<nav style='height: 35px;margin-top: -24px;'>
<div id="ddtabs1" class="ddcolortabs">
<ul>
        <li><a href="index.php"><span> Trang chủ</span></a></li>
        <li><a href="index.php?quanly=khachhang&event=them"><span>Khách hàng</span></a></li>
        <li><a href="index.php?quanly=baiviet&event=them"><span>Bài viết</span></a></li>
        <li><a href="index.php?quanly=sanpham&event=them"><span>Sản phẩm</span></a></li>
        <li><a href="index.php?quanly=loaisp&event=them"><span>Loại sản phẩm</span></a></li>
        <li><a href="index.php?quanly=hoadon"><span>Hóa đơn</span></a></li>
    
        <div style="float:right">
        <?php if(isset($_SESSION['dangnhap'])){?>
        <li><a id="username"  href="#" style="color:#00F; text-decoration:underline; background-color: white;height: 35px;font-size: 20px"><span> <?php echo $_SESSION['dangnhap']?> </span></a></li>
        <?php } ?>
        <li ><a href="index.php?event=logout"><span>Đăng xuất</span></a></li>
        </div>

</ul>
</div>
</nav >
