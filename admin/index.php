
<?php include('conn.php'); ?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>	
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta charset="utf-8" />
<title>Admin</title>


    <link href="../Style/Main.css" rel="stylesheet" />



    <link href="../Style/Main.css" rel="stylesheet" />
    <link href="style/loggin.css" rel="stylesheet" />

    <link href="../Style/jquery-ui.css" rel="stylesheet" />
    <script src="../Js/jquery-3.2.1.min.js" rel="stylesheet"></script>

    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
    <link href="style/style.css" rel="stylesheet" type="text/css" />
    <link rel="stylesheet" type="text/css" href="css/bootstrap.min.css"/>
</head>

<body style='background-color: #DCE3EA;'>
<?php
	session_start();
	if(!isset($_SESSION['dangnhap'])){
		header('location:login.php');
	}
?>

	<div class="wrapper" id="container">
		<?php
			include('modules/header.php');
			include('modules/menu.php');
			include('modules/content.php');
		?>
	</div>

	<!--Js reference-->
    <script type="text/javascript" src="js/bootstrap.js"></script>
    <script src="../Js/jquery-ui.js" ></script>

</body>

</html>