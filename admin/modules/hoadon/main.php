<div class="top">
	<?php
		include('modules/hoadon/lietke.php');
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
		include('modules/hoadon/them.php');
	}elseif($tam=='sua'){
		include('modules/hoadon/sua.php');
	}
	?>
</div>
