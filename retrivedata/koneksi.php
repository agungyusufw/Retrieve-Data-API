<?php

define('HOST','localhost');
define('USER','root');
define('PASS','');
define('DB','retrive_api');

$con = mysqli_connect(HOST, USER, PASS, DB) or die('Tidak Terkoneksi');

$response = array();
$sql = "SELECT * FROM homeauto";
$result = $con->query($sql);

if($result->num_rows > 0){
	while($row = $result->fetch_assoc()){
	array_push($response, $row);
}
}
echo json_encode($response)

?>