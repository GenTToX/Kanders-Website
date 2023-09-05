<?php
session_start();

if (!isset($_SESSION['uname'])) {
    header("Location: index.php");
    exit();
}

$uname = $_SESSION['uname'];
?>
<!--HTML-->
<!doctype html>
<html lang="en">
    <head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <link rel="stylesheet" href="https://unicons.iconscout.com/release/v2.1.9/css/unicons.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.5.0/css/bootstrap.min.css">
    <title>Main Seite</title>
</head>
<body>
<!--Card-->

<div class="section">
    <div class="container">
      <div class="row full-height justify-content-center">
        <div class="col-12 text-center align-self-center py-5">
          <div class="section pb-5 pt-5 pt-sm-2 text-center">
            <input class="checkbox" type="checkbox" id="reg-log" name="reg-log"/>
            <div class="card-3d-wrap mx-auto">
              <div class="card-3d-wrapper">
                <div class="card-front">
                  <div class="center-wrap">
                    <div class="section text-center">
                      <h4 class="mb-4 pb-3">Einloggen</h4>
                      <form id="loginForm">
                        <div class="form-group">


<!--_____________________-->
<h1> Hi hier kommt man zur Main Seite</h1>
<link rel="stylesheet" href="CSS/stylesheet.css">

  <a href="Logout.php" class="btn mt-4">Abmelden</a>
</head>
<p>Eingeloggt als: <?php echo $uname; ?></p>




</body>