<div class="top">
	<?php
		include('modules/loaisanpham/lietke.php');
	?>
</div>
<div class="bot">
	<?php
	if(isset($_GET['event'])){
		$tam=$_GET['event'];
	}
	else{
		$tam='';
	}
	if($tam=='them'){
		include('modules/loaisanpham/them.php');
	}elseif($tam=='sua'){
		include('modules/loaisanpham/sua.php');
	}
	?>
</div>
