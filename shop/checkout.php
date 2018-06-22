<?php
	$servername = "localhost";
	$username = "root";
	$password = "";
	$dbname = "isdm";
	$con = mysqli_connect($servername, $username, $password, $dbname);
	session_start();
	$uname = $_SESSION['user_name'];

	$bid = $_REQUEST["q"];
	$r10 = mysqli_query($con, "select CID from customer where CUserName = '$uname'") or die("q10 error!");
	$cid = mysqli_fetch_row($r10);
	$cid = $cid[0];

	$r1 = mysqli_query($con, "insert into ordr(cid,purchasedate,paymentMode,orderstatus) values($cid,date(now()),'COD', 'pending')") or die("q1 err");
	$ordrid = mysqli_insert_id($con);

	// echo "$ordrid";

	$r2 = mysqli_query($con, "insert into orderedproduct(orderID,PId, quantity) select '$ordrid',pid,quantity from basketprods where bid=$bid") or die("q2 err");

	$r3 = mysqli_query($con, "update basket set numprods=0,totalcost=0 where bid=$bid") or die("q3 err");

	$r4 = mysqli_query($con, "delete from basketprods where bid = $bid") or die("q4 err");

	echo "Items bought successfuly. Thank You :)";
?>