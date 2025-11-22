<?php
$host   = "localhost"; 
$user   = "root";
$pass   = "";
$dbname = "thuthapdltm";
$port   = 3307;

$conn = new mysqli($host, $user, $pass, $dbname, $port);

if ($conn->connect_error) {
    die(json_encode([
        "status" => "error", 
        "message" => "Không thể kết nối đến Database Online: " . $conn->connect_error
    ]));
}

mysqli_set_charset($conn, "utf8");
?>
