<?php
if (isset($_SESSION['status'])) {
    $status = $_SESSION['status'];
    if ($status == 'ahli') {
        echo '
        <li><a href="index.php">Halaman Utama</a></li>
        <li><a href="senarai_aktiviti.php">Senarai Aktiviti</a></li>
        <li><a href="kehadiran.php">Kehadiran</a></li>
        <li><a href="rekod_kehadiran.php">Rekod Kehadiran</a></li>
        <li><a href="profil.php">Profil</a></li>
        <li><a href="inc/log_keluar-inc.php">Log Keluar</a></li>
        ';
    } elseif ($status == 'guru') {
        echo '
        <li><a href="index.php">Halaman Utama</a></li>
        <li><a href="senarai_aktiviti_admin.php">Senarai Aktiviti</a></li>
        <li><a href="senarai_ahli.php">Senarai Ahli</a></li>
        <li><a href="rekod_kehadiran_admin.php">Kehadiran Aktiviti</a></li>
        <li><a href="rekod_kehadiran_semua.php">Kehadiran Seluruh</a></li>
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
