<?php
	$servername = "localhost";
	$username = "root";
	$password = "";
	$dbname = "isdm";
	$con = mysqli_connect($servername, $username, $password, $dbname);
	session_start();
	$uname = $_SESSION['user_name'];

	$pid = $_REQUEST['q'];
	$bid = $_REQUEST['r'];

	// echo "$pid,$bid";
	$r1 = mysqli_query($con, "delete from basketprods where pid=$pid and bid=$bid") or die("q error");
	echo "Entry removed</br><a href=\"basket.php\">Click here to refresh</a>";
?>