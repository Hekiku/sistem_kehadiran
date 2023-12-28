<?php
session_start();
include 'inc/database-inc.php';

$sql = "SELECT * FROM aktiviti
        WHERE DATE(tarikh) >= CURDATE()
        LIMIT 1";
$result = mysqli_query($conn, $sql);
while ($row = mysqli_fetch_assoc($result)) {
  $namaAktiviti = $row['namaAktiviti'];
  $tarikh = date('d M Y', strtotime($row['tarikh']));
  $tempat = $row['tempat'];
  $masaMula = date('h:i A', strtotime($row['masaMula']));
  $masaAkhir = date('h:i A', strtotime($row['masaAkhir']));
}
?>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Sistem Kehadiran Cavell</title>
    <link rel="stylesheet" href="style.css" />
  </head>
  <body>
    <h1 id="header">Sistem Kehadiran Cavell</h1>
    <ul id="menu">
      <?php include 'inc/menu.php' ?>
    </ul>
    <div id="makluman">
      <h2 id="tajuk">Aktiviti Terkini!!!</h2>
      <p><span class="details">Nama Aktiviti:</span> <?php echo $namaAktiviti?></p>
      <p><span class="details">Tarikh:</span> <?php echo $tarikh?></p>
      <p><span class="details">Masa:</span> <?php echo $masaMula?> - <?php echo $masaAkhir?></p>
      <p><span class="details">Tempat:</span> <?php echo $tempat?></p>
    </div>
  </body>
</html>
;