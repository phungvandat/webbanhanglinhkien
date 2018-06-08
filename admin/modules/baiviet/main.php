<article  style="width: 100%;">
<div class="top feildContent">
	<h3>Danh Sách bài viết</h3>
	<?php
		include('modules/baiviet/lietke.php');
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
		include('modules/baiviet/them.php');
	}elseif($tam=='sua'){
		include('modules/baiviet/sua.php');
	}
	?>
</div>
</article>
	<script>
	$('.ddcolortabs').attr('id','ddtabs3');
	console.log( $('.ddcolortabs').attr('id'));
	</script>