<?php 
	$query_info = "SELECT * FROM post where tieu_de = 'Giới thiệu về công ty' ";
    $info= $dbQuanLyBanLinhKien->query($query_info);
    while( $row = mysqli_fetch_array($info)){
    ?>
    <h2> <?php echo $row['tieu_de']?> </h2>
    <div id="noidung" style="padding-left:10px;">
        <?php echo $row['noi_dung_chi_tiet']?>
    </div>
    <?php }?>
