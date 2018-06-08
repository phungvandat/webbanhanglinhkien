<?php 

$query_tbTypeProductParent = "SELECT * FROM  typeProduct where ma_loai_cha=0 ";
                        $tbTypeProductParent= $dbQuanLyBanLinhKien->query($query_tbTypeProductParent);
                    while( $rowParent = mysqli_fetch_array($tbTypeProductParent))
                    {
				?>
                   <li class ="titleProduct"><?php echo $rowParent["ten_loai"] ?></li>
                      <ul class="ListProduct">
                      
                    <?php 
					$query_tbTypeProductChild = 'SELECT * FROM  typeProduct where ma_loai_cha='.$rowParent["ma_loai"];
                    $tbTypeProductChild= $dbQuanLyBanLinhKien->query($query_tbTypeProductChild);
                    while( $rowChild = mysqli_fetch_array($tbTypeProductChild))
                    {
                     ?>
                                <li><a href='index.php?ma_loai=<?php echo $rowChild["ma_loai"] ?>&ten_loai=<?php echo $rowChild["ten_loai"] ?>'> 
                                <?php echo $rowChild["ten_loai"] ?>
                                </a></li>
                        
                   <?php
                  }
                    echo "</ul>";
                    }
                   ?>

<script>
 $('.ListProduct').hide();
  $('.titleProduct').click(function () {
    $(this).next().slideToggle(500);
});
</script>

 