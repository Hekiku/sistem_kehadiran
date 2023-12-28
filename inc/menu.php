<?php
if (isset($_SESSION['status'])) {
    $status = $_SESSION['status'];
    if ($status == 'ahli') {
        echo '
        <li><a href="index.php">Halaman Utama</a></li>
        <li><a href="senarai_aktiviti.php">Senarai Aktiviti</a></li>
        <li><a href="kehadiran.html">Kehadiran</a></li>
        <li><a href="rekod_kehadiran.html">Rekod Kehadiran</a></li>
        <li><a href="profil.html">Profil</a></li>
        <li><a href="inc/log_keluar-inc.php">Log Keluar</a></li>
        ';
    } elseif ($status == 'guru') {
        echo '
        <li><a href="index.php">Halaman Utama</a></li>
        <li><a href="senarai_aktiviti_admin.html">Senarai Aktiviti</a></li>
        <li><a href="senarai_ahli.html">Senarai Ahli</a></li>
        <li><a href="rekod_kehadiran_admin.html">Rekod Kehadiran</a></li>
        <li><a href="inc/log_keluar-inc.php">Log Keluar</a></li>
        ';
    }
} else {
    echo '
    <li><a href="index.php">Halaman Utama</a></li>
    <li><a href="senarai_aktiviti.php">Senarai Aktiviti</a></li>
    <li><a href="log_masuk.php">Log Masuk</a></li>
    ';
}
?>