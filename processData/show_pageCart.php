<?php
if(isset($_REQUEST["xem_gio_hang"]))
{
    if(!isset($_COOKIE['donHang']))
    {
        echo "<h1>Chưa có sản phẩm trong giỏ hàng</h1>";
    }
    else{
        ?>
        <h2>Giỏ hàng của bạn </h2>
        <table border="0" cellspadding="0" cellspacing="0">
        <tr class ="nameCol">
            <td ><h4>Tên Sản Phẩm</h4> </td>
            <td> <h4>Số lượng</h4></td>
            <td><h4>Đơn giá</h4></td>
            <td><h4>Thành Tiền</h4></td>
            <td ></td>
        </tr>
        <?php
        foreach( $arrInfoProduct as $mSP => $infoSP)
        {
			
        ?>  
        <tr class="rowHang" >
            <td class="tenSP" style="padding:10px" >
                <img src="images/san_pham/<?php echo $infoSP[0];?>" alt=""> 
                <a href="product.php?ma_san_pham=<?php echo $mSP;?>"><?php echo $infoSP[1];?>
                <input type ='hidden' name = 'txtMaSP' value = '<?php echo $maSp;?>'/> </a>    
            </td>
            <td ><input class="dongia" type="number" id ='txtSoLuong' value="<?php echo $infoSP[3];?>"></td>
            <td ><?php echo $infoSP[2];?></td>
            <td><?php echo $infoSP[2] * $infoSP[3];  ?></td>

            <td >
                <a class="btnCN" id = <?php echo $mSP;?> href="#">Cập nhật  </a>
                <a class="btnXoa" id = <?php echo $mSP;?> href="#">  Xóa</a>
            </td>   
            
        </tr>

        <?php 
        }?>
        <tr class="chucNang" >
            <td colspan ='2'  ><button class="btn" onclick="window.location.href='product.php'" > < Tiếp Tục mua Hàng</button></td>
            <td colspan ='1'  > <h4>Tổng tiền</h4></td>
            <td><h4 id='tongTien' ><?php echo $total; ?>đ</h4></td>
            <td  ><button class="btn" style="width: 105px;" onclick="window.location.href='?thanh_toan'">Thanh Toán ></button></td>
            
        </tr>
        </table>   
        <?php 
        }
}
else if(isset($_REQUEST["thanh_toan"]))
{
    include_once('Model/pay.php');

}
?> 
<script>
	$(document).ready(function(){
		$('.btnCN').click(function () {
        	$SL = $(this).parent().parent().children().eq(1).children().val();			
			$.ajax({
				url : 'model/updateInfoBill.php',
				type : 'GET',
				dataType: 'text',
				data: {	ma_sp_capnhat : $(this).attr('id'),
						soluong : $SL},
				success: function(result){
					window.location.href = 'cart.php?xem_gio_hang';
					}			
			});	
			$(document).ajaxError(function(){
        		alert("An error occured!");
   		 	});
    	});
		$('.btnXoa').click(function () {			
			$.ajax({
				url : 'model/deleteInfoBill.php',
				type : 'GET',
				dataType: 'text',
				data: {	ma_sp_xoa : $(this).attr('id')},
				success: function(result){
					window.location.href = 'cart.php?xem_gio_hang';
					}			
			});	
			$(document).ajaxError(function(){
				alert('An error occured!');	
			});
			
		});
	});
</script>   

