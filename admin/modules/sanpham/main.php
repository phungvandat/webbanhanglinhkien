<article style="width: 100%">
<div class="top feildContent">
	<h3>
		Danh sách sản phẩm
	</h3>
	<?php
		include('modules/sanpham/lietke.php');
	?>
</div>
<div class="bot feildContent">
	<?php
	if(isset($_GET['event'])){
		$tam=$_GET['event'];
	}
	else{
		$tam='';
	}
	if($tam=='them'){
		include('modules/sanpham/them.php');
	}elseif($tam=='sua'){
		include('modules/sanpham/sua.php');
	}
	?>
</div>
</article>
	<script>
	$('.ddcolortabs').attr('id','ddtabs4');
	console.log( $('.ddcolortabs').attr('id'));
	</script>