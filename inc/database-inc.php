<?php
$hostname = "localhost";
$username = "root";
$password = "";
$database = "sistem_kehadiran_safwan";

$conn = mysqli_connect($hostname, $username, $password, $database);

if (!$conn) {
    die("Hubungan ke pangakalan data gagal: " . mysqli_connect_error());
}
?>