<?php 
	$query_tbPost = "SELECT * FROM post where 	ma_loai_bai_viet >0 ";
    $tbPost= $dbQuanLyBanLinhKien->query($query_tbPost);
    while( $row = mysqli_fetch_array($tbPost))
    {
    ?>
<p>
    <a href='news.php?ma_bai_viet= <?php echo $row["ma_bai_viet"] ?>' style="margin-bottom:10px" >
         <?php echo $row['tieu_de']?> 
    </a>
    </p>
    <?php }
?>
