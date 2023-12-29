<?php
session_start();
include 'inc/database-inc.php';

$sql = "SELECT * FROM aktiviti";
$hasil = mysqli_query($conn, $sql);
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
    <form id="borang" action="inc/kehadiran-inc.php" method="post">
      <h2 id="tajuk">Kehadiran</h2>
      <label for="idAktiviti">Aktiviti</label>
      <select name="idAktiviti" id="idAktiviti">
        <?php
        while ($rekod = mysqli_fetch_assoc($hasil)) {
          $idAktiviti = $rekod['idAktiviti'];
          $namaAktiviti = $rekod['namaAktiviti'];

          echo "<option value='$idAktiviti'>$namaAktiviti</option>";
        }
        ?>
      </select>
      <label for="noKP">No Kad Pengenalan</label>
      <input type="text" name="noKP" id="noKP" required />
      <button type="submit" name="kemaskini">Kemaskini</button>
    </form>
  </body>
</html>
