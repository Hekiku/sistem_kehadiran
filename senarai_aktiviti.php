<?php
session_start();
include 'inc/database-inc.php';

$sql = "SELECT * FROM aktiviti";
$result = mysqli_query($conn, $sql);
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
    <h2 id="tajuk">Senarai Aktiviti</h2>
    <table id="senarai">
      <tr>
        <th>Bil</th>
        <th>Nama Aktiviti</th>
        <th>Tarikh</th>
        <th>Masa</th>
        <th>Tempat</th>
      </tr>
      <?php
      $bil = 0;
      while ($row = mysqli_fetch_assoc($result)) {
        $namaAktiviti = $row['namaAktiviti'];
        $tarikh = date('d M Y', strtotime($row['tarikh']));
        $tempat = $row['tempat'];
        $masaMula = date('h:i A', strtotime($row['masaMula']));
        $masaAkhir = date('h:i A', strtotime($row['masaAkhir']));
        $bil++; 
      ?>
      <tr>
        <td><?php echo $bil?>.</td>
        <td><?php echo $namaAktiviti?></td>
        <td><?php echo $tarikh?></td>
        <td><?php echo $masaMula?> - <?php echo $masaAkhir?></td>
        <td><?php echo $tempat?></td>
      </tr>
      <?php
      }
      ?>
    </table>
  </body>
</html>
