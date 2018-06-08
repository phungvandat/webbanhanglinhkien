<?php 
$query_tbPost = "SELECT * FROM post where tieu_de = 'Chính sách bảo hành' ";
    $tbPost= $dbQuanLyBanLinhKien->query($query_tbPost);
    while( $row = mysqli_fetch_array($tbPost))
    {
    ?>

    <h2> <?php echo $row['tieu_de']?> </h2>

    <div id="noidung" style="padding-left:10px;">
        <?php echo $row['noi_dung_chi_tiet']?>

    </div>
    <?php }
?>
