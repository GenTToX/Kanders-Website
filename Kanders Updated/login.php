<?php
session_start();

if ($_SERVER["REQUEST_METHOD"] == "POST") {
    // Verbindung zur Datenbank herstellen (deine Datenbankverbindungsdaten hier eintragen)
    $servername = "localhost";
    $username = "root";
    $password = "";
    $dbname = "accounts";

    $conn = new mysqli($servername, $username, $password, $dbname);

    // Verbindung überprüfen
    if ($conn->connect_error) {
        die("Connection failed: " . $conn->connect_error);
    }

    $username = $_POST['username'];
    $password = $_POST['password'];

    $sql = "SELECT * FROM account WHERE Vorname = '$username' AND Passwort = '$password'";
    $result = $conn->query($sql);
   
    if ($result->num_rows == 1) {
        $_SESSION['uname'] = $username;
        header("Location: Home.php");
        exit();
    } else {
        $error = "Incorrect User name or password.";
        header("Location: Falsche_PW.php"); // Hier die gewünschte Seite eintragen
        exit();
    }

    $conn->close();
}
?>