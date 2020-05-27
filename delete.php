<?php
$servername = "127.0.0.1";
$username = "root";
$password = "";
$dbname = "library";
 $conn = new mysqli($servername, $username, $password, $dbname);
 $sql = "DELETE from x WHERE id_x=".$_POST['id']."";
 mysqli_query($conn, $sql);
 header('Location: http://127.0.0.1/library/index.php');
?>