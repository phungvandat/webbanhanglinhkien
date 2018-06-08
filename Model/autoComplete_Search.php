<script>
        var ListSP =[];
        var ListTenSP =[];
        var SP={ TenSP:"", MaSP:"",}
        <?php
		$query_tbSearch = "SELECT * FROM product ";
          $tbSearch= $dbQuanLyBanLinhKien->query($query_tbSearch);
            while( $row = mysqli_fetch_array($tbSearch))
            {
         ?>     
                SP = {
                    TenSP:'<?php echo $row["ten_san_pham"];?>',
                    MaSP:'<?php echo $row["ma_san_pham"];?>'
                }

                 ListSP.push(SP);
                 ListTenSP.push(SP.TenSP);

        <?php }
         ?>
$(document).ready(function () {
    $('#btnSearch').click(function () {
        let name = $('#textSearch').val();
        var dem=0;
        ListSP.forEach(function (item) {
            if(name === item.TenSP)
            {   dem++;
                $(location).attr('href','product.php?ma_san_pham='+item.MaSP);   
            }
        })
        if(dem===0) alert('không có sản phẩm cần tìm ');
    })
    $('#textSearch').keypress(function(e){
                     $('#textSearch').autocomplete(
                     {
                         source:  ListTenSP,
                     });

                     if(e.which == 13 || e.keyCode == 13)
                     {  
                        $('#btnSearch').click();
                     }
                });
    })


</script>