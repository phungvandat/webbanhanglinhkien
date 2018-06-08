
<article style="width: 100%;">
<div class="top feildContent">
	<h3>Danh Sách Khách Hàng</h3>
	<?php
		include('modules/khachhang/lietke.php');
	?>
</div>
<div class=" feildContent bot">
	<?php
	if(isset($_GET['event'])){
		$tam=$_GET['event'];
	}
	else{
		$tam='';
	}
	if($tam=='them'){
		include('modules/khachhang/them.php');
	}elseif($tam=='sua'){
		include('modules/khachhang/sua.php');
	}
	?>
</div>
</article>
	<script>
	$('.ddcolortabs').attr('id','ddtabs2');
	console.log( $('.ddcolortabs').attr('id'));
	</script>