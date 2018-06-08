<?php 
if(!isset($_REQUEST["ma_san_pham"]))
{
	$query_tbProduct = "SELECT * FROM product ";
    $tbProduct= $dbQuanLyBanLinhKien->query($query_tbProduct);
    echo" <section id='SP' class='feildContent'>
          <h2>Sản Phẩm Mới</h2>
          <div id='hienThiSPMoi2'>";
    while( $row = mysqli_fetch_array($tbProduct))
    {
    ?>
      <div class="sanPham">
          <div class="thongTinSp">
            <a  href='product.php?ma_san_pham= <?php echo $row["ma_san_pham"] ?>' > <?php echo $row["ten_san_pham"] ?></a>
          </div>
          <a  href='product.php?ma_san_pham=<?php echo $row["ma_san_pham"] ?>'>
            <img src="images/san_pham/<?php echo $row["hinh"] ?>"  alt="<?php echo $row["hinh"] ?>" />
          </a> 
          <div class="Gia">Giá :<?php echo number_format($row["don_gia"]) ?></div>
          <form class="Mua" >
            <input name='ma_sp_mua' id = 'ma_sp_mua' style="display:none"value="<?php echo $row["ma_san_pham"] ?>"/>
            <input name="so_luong" id = 'so_luong' type="number" value="1" />
            <button type="submit" id = "<?php echo $row["ma_san_pham"] ?>" class="btnMua">Mua</button>
        </form>
      </div>
    <?php
    }
    echo "<div class='clear'></div>
    </div>
    </section>";
}
else
{
	$query_tbProduct = "SELECT * FROM product where ma_san_pham= ".$_REQUEST["ma_san_pham"];
  $tbProduct= $dbQuanLyBanLinhKien->query($query_tbProduct);
  echo" <section id='chiTiet' class='feildContent'>
          <h2>Chi tiết sản phẩm</h2>
          <div id='hienThiSPMoi2'>";
    while( $row = mysqli_fetch_array($tbProduct))
    {
        $maloai = $row["ma_loai"];
    ?>
    
    <div class="noidung" style="padding-left:10px;">
        <div id="anhSanPham" class="feildContent">
            <img src="images/san_pham/<?php echo $row['hinh'];?>" alt="">
        </div>
        <div id="chiTietSP" class="feildContent">
            <h3><?php echo $row['ten_san_pham'];?></h3>
            <div id="moTa" style="padding-left:10px;">
                <div>Đơn giá: <?php echo $row['don_gia'];?></div>
                <div><?php echo $row['mo_ta_chi_tiet'];?></div>
            </div>
            <form class="Mua" >
              <input name='ma_sp_mua' id = 'ma_sp_mua' style="display:none"value="<?php echo $row["ma_san_pham"] ?>"/>
                <input name="so_luong" id = 'so_luong' type="number" value="1" />
                <button type="submit" id = "<?php echo $row["ma_san_pham"] ?>" class="btnMua">Mua</button>
            </form>
        </div>
        
        <div class="clear"></div>
    </div>
    <?php
    }
    echo "<div class='clear'></div>
    </div>
    </section>";
	$query_tbProductDifferent = "SELECT * FROM product where  ma_loai= ".$maloai." AND ma_san_pham <>".$_REQUEST["ma_san_pham"];
    $tbProductDifferent= $dbQuanLyBanLinhKien->query($query_tbProductDifferent);
    echo" <section id='SP' class='feildContent'>
    <h2>Sản Phẩm Khác ".$row["ma_loai"]."</h2>
    <div id='hienThiSPMoi2'>";
    while( $row2 = mysqli_fetch_array($tbProductDifferent))
    {
    ?>
    <div class="sanPham">
        <div class="thongTinSp">
        <a  href='?ma_san_pham= <?php echo $row2["ma_san_pham"] ?>' > <?php echo $row2["ten_san_pham"] ?></a>
        </div>
        <a  href='?ma_san_pham=<?php echo $row2["ma_san_pham"] ?>'>
        <img src="images/san_pham/<?php echo $row2["hinh"] ?>"  alt="<?php echo $row2["hinh"] ?>" />
        </a> 
        <div class="Gia">Giá :<?php echo number_format($row2["don_gia"]) ?></div>
        <form class="Mua" >
            <input name='ma_sp_mua' id = 'ma_sp_mua' style="display:none"value="<?php echo $row2["ma_san_pham"] ?>"/>
            <input name="so_luong" id = 'so_luong' type="number" value="1" />
            <button type="submit" id = "<?php echo $row["ma_san_pham"] ?>" class="btnMua">Mua</button>
        </form>
    </div>
    <?php
    }
    echo "<div class='clear'></div>
    </div>
    </section>";

}
?>


<script>
$(document).ready( function(){
        $('.btnMua').click(function (){
			$ma_sp_mua = $(this).attr('id');
			$SL = $(this).parent().children().eq(1).val();			
			$.ajax({
				url : 'model/addInfoBill.php',
				type : 'GET',
				dataType : 'text',
				data : {ma_sp_mua : $ma_sp_mua,
						so_luong : $SL},
				success: function(result){
					window.location.href = window.location.pathname;	
				}
			});
			$(document).ajaxError(function(){
				alert('Lỗi ajax');	
			});
    	});
    });
    
</script>
