<?php
	ob_start();
	session_start();
	include('conn.php');
	if(isset($_POST['dangnhap'])){
		$username=$_POST['username'];
		$password=$_POST['password'];
		$sql="select * from nguoi_dung where ma_loai_nguoi_dung=1 and ten_dang_nhap='$username' and mat_khau='$password' limit 1";
		$stmt = $db->prepare($sql);
		$stmt->execute();
		$data=$stmt->fetch(PDO::FETCH_ASSOC);
		if($data>0){
			$_SESSION['dangnhap']=$username;
			header('location:index.php');
		}else{
			header('location:login.php');
		}
	}
	
?>

<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8" />
    <title>Bán linh kiến</title>
    <link rel="icon" type="images/x-icon" href="../images/favicon.ico" />


    <link href="../Style/Main.css" rel="stylesheet" />
    <link href="style/loggin.css" rel="stylesheet" />

    <link href="../Style/jquery-ui.css" rel="stylesheet" />
    <script src="../Js/jquery-3.2.1.min.js" rel="stylesheet"></script>

    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
    <link href="style/style.css" rel="stylesheet" type="text/css" />
    <script type="text/javascript" src="js/bootstrap.js"></script>
    <link rel="stylesheet" type="text/css" href="css/bootstrap.min.css"/>


</head>
<body style='background-color: #DCE3EA;'>



  <div class="form-signin  card-wrapper" >
  <div class="brand" style="width:100%; text-align:center">
    <img class="mb-4" src="../images/Alphatek.png" alt="" width="200" height="100">
  </div>
  <div class="card fat">
    <div class="card-body">
      <h4 class="card-title">Đăng Nhập</h4>
      <form  method="post">
        <div class="form-group">
          <label>Tên đăng nhập</label>
          <input id="inputEmail" type="text" class="form-control" name="username" value="" required autofocus>
        </div>

        <div class="form-group">
          <label for="password" style="width:100%">Mật Khâu
          </label>
          <input  type="password" class="form-control" name="password" required data-eye>
        </div>

        <div class="form-group no-margin">
          <button type="submit" name="dangnhap" class="btn btn-primary btn-block">
            Đăng Nhập
          </button>
          
      </form>
    </div>
  </div>
  <p class="mt-5 mb-3 text-muted text-center">&copy; 2017-2018</p>
</div>



    

</body>
</html>