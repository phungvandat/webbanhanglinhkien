<?php 
if(!isset($_REQUEST["ma_loai"]))
{
	$query_tbProduct = "SELECT * FROM product where  san_pham_moi = 1";
    $tbProduct= $dbQuanLyBanLinhKien->query($query_tbProduct);
    echo" <section id='spBanMoi' class='feildContent'>
          <h2>Sản Phẩm Mới</h2>
          <div id='hienThiSPMoi'>";
    while( $row = mysqli_fetch_array($tbProduct))
    {
    ?>
      
      <div class="single-products">
  	<div class="productinfo text-center"> 
    	<a  href='product.php?ma_san_pham=<?php echo $row["ma_san_pham"] ?>'> <img src="images/san_pham/<?php echo $row["hinh"] ?>"  alt="<?php echo $row["hinh"] ?>" /> </a>
        <div class = "gia">Giá :<?php echo number_format($row["don_gia"]) ?></div>
        <div class="thongTinSanPham">
        	<a  href='product.php?ma_san_pham= <?php echo $row["ma_san_pham"] ?>' > <?php echo $row["ten_san_pham"] ?></a>
         </div>
    </div>
  <div class="product-overlay">
    <div class="overlay-content">
          <div class = "gia">Giá :<?php echo number_format($row["don_gia"]) ?></div>
          <div class="thongTinSanPham">
          	<a  href='product.php?ma_san_pham= <?php echo $row["ma_san_pham"] ?>' > <?php echo $row["mo_ta_tom_tat"] ?></a>
           </div>
   	</div>
  </div>
</div>
    <?php
    }
    echo "<div class='clear'></div>
    </div>
    </section>";
}
else
{
	$query_tbProduct = "SELECT * FROM product where ma_loai= ".$_REQUEST["ma_loai"];
  $tbProduct= $dbQuanLyBanLinhKien->query($query_tbProduct);
  echo" <section id='spBanMoi' class='feildContent'>
          <h2>".$_REQUEST["ten_loai"]."</h2>
          <div id='hienThiSPMoi'>";
    while( $row = mysqli_fetch_array($tbProduct))
    {
    ?>
      <div class="single-products">
  	<div class="productinfo text-center"> 
    	<a  href='product.php?ma_san_pham=<?php echo $row["ma_san_pham"] ?>'> <img src="images/san_pham/<?php echo $row["hinh"] ?>"  alt="<?php echo $row["hinh"] ?>" /> </a>
        <div class = "gia">Giá :<?php echo number_format($row["don_gia"]) ?></div>
        <div class="thongTinSanPham">
        	<a  href='product.php?ma_san_pham= <?php echo $row["ma_san_pham"] ?>' > <?php echo $row["ten_san_pham"] ?></a>
         </div>
    </div>
  <div class="product-overlay">
    <div class="overlay-content">
          <div class = "gia">Giá :<?php echo number_format($row["don_gia"]) ?></div>
          <div class="thongTinSanPham">
          	<a  href='product.php?ma_san_pham= <?php echo $row["ma_san_pham"] ?>' > <?php echo $row["mo_ta_tom_tat"] ?></a>
           </div>
   	</div>
  </div>
</div>
    <?php
    }
    echo "<div class='clear'></div>
    </div>
    </section>";
}
?>

