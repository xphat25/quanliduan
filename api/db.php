<?php
$host   = "localhost";
$user   = "sql_nhom30_itimi";
$pass   = "71bbaeb8a35948";
$dbname = "sql_nhom30_itimi";

$conn = new mysqli($host, $user, $pass, $dbname);

if ($conn->connect_error) {
    die("Kết nối thất bại: " . $conn->connect_error);
}

mysqli_set_charset($conn, "utf8");
?>
