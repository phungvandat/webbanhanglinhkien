<?php
	class Database{
		private $_link;
		private $serverName;
		private $userName;
		private $passWord;
		private $databaseName;
		public function __construct($serverName, $userName, $passWord, $databaseName){
			$this->serverName = $serverName;
			$this->userName = $userName;
			$this->passWord = $passWord;
			$this->databaseName = $databaseName;
			$this->_link = mysqli_connect($serverName,$userName,$passWord) OR die("cannot connect to server");
			mysqli_select_db($this->_link,$databaseName) OR die("cannot connect to database: ".$databaseName );
			mysqli_set_charset($this->_link, 'UTF8');
			return true;
		}
		public function query($query){
			$result = mysqli_query($this->_link, $query);
			if(!$result)
				die("cannot query: ".mysqli_error($this->_link) );
			return $result;
		}
		public function __destruct(){
			mysqli_close($this->_link) or die("cannot disconnecting from databse");
		
		}
		public function getLink(){
			return $this->_link;
		}
		public function getServerName(){
			return $this->serverName;
		}
		public function getUserName(){
			return $this->userName;
		}
		public function getPassWord(){
			return $this->passWord;
		}
		public function getDatabaseName(){
			return $this->databaseName;
		}
		public function setLink($_link){
			$this->_link = $_link;
		}
		public function setServerName($serverName){
			$this->serverName = $serverName;
		}
		public function setUserName($userName){
			$this->userName = $userName;
		}
		public function setPassWord($passWord){
			$this->passWord = $passWord;
		}
		public function setDatabaseName($databaseName){
			$this->databaseName = $databaseName;
		}

	}
		
	
	
?>