<?php
include_once("library/database.php");
$xlsanpham= new database();
if(isset($_REQUEST["ma_loai"]))
 $xlsanpham->sql="SELECT * FROM san_pham where ma_loai= ".$_REQUEST["ma_loai"];
else
	$xlsanpham->sql="SELECT * FROM san_pham order by ngay_tao desc  limit 0,16";
$bangsp=$xlsanpham->query();
/*if(count($bangsp)>0)
{
foreach ($bangsp as $san_pham)
{
 $ma_san_pham = $san_pham['ma_san_pham'];
		$don_gia = $san_pham['don_gia'];
		$ten_san_pham =substr( $san_pham['ten_san_pham'],1,35);
			
		$hinh = "<img src='images/san_pham/{$san_pham['hinh']}' alt='{$row['hinh']}' width='100' height='100' />";
	?>
		<div class="khung_san_pham" style="height:195px">
        	<div class="ten_san_pham">
				<a  href="chi_tiet_san_pham.php?ma_san_pham=<?php echo $ma_san_pham ?>"><?php echo $ten_san_pham ?></a>
			</div>
			<div class="hinh_san_pham"><a  href="chi_tiet_san_pham.php?ma_san_pham=<?php echo $ma_san_pham ?>"><?php echo $hinh ?></a></div>
							
			<div class="gia">Giá: <?php echo number_format($don_gia) ?></div>
		</div>
    
    <?php
}*/
echo count($bangsp);


?>
?>