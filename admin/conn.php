<?php
$dsn ='mysql:host=localhost;dbname=QLBanHang';
$username ='root';
$password ='1234';

try{
	$db = new PDO($dsn, $username, $password);
	$db->exec('set names utf8');

}catch(PDOException $e){
	echo $e->getMessage();
}
?>