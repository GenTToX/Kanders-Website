<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>Document</title>
    <link rel="stylesheet" href="CSS/stylesheet.css">
</head>
<body>  
    <div id="stars"></div>
    <div id="stars2"></div>
    <div id="stars3"></div>
    <br>
   <div class="card">
   
    <div class="slot">
    <ul class="menu">
      <li>
          <a href="/?tabelle=band">Konzerte</a></li>
      <li> 
      <li>
          <a href="/?tabelle=konzert">Konzert</a></li>
      <li>
          <a href="/?tabelle=">Jahr</a></li>
      <li>
          <a href="/?tabelle=">Monat</a></li>
      <li>
          <a href="/?tabelle=">Woche</a></li>
      <li>
          <a href="/?tabelle=">Tag</a></li>

      <li>
          <a href="" class="dropdown">Wochentag</a></div>
          <ul class="submenu">
          <li><a href="#">Montag</a></li>
          <li><a href="#">Dienstag</a></li>
          <li><a href="#">Mittwoch</a></li>
          <li><a href="#">Donnerstag</a></li>
          <li><a href="#">Freitag</a></li>
          <li><a href="#">Samstag</a></li>
          <li><a href="#">Sonntag</a></li>
          </ul>			
      </li>
      </ul>

    <div id="Tabelle" class="tabelle">
      <?php
    
            $con=mysqli_connect("localhost","root","","kanders"); //adresse, username, password, datenbank
            // Check connection
            if (mysqli_connect_errno())
            {
            echo "Failed to connect to MySQL: " . mysqli_connect_error();
            }

            $selected = $_GET["tabelle"];

            try{
            $result = mysqli_query($con,"SELECT * FROM $selected");

            echo "<table>";

            $i = 0;
            while($row = $result->fetch_assoc())
            {
                if ($i == 0) {
                $i++;
                echo "<tr>";
                foreach ($row as $key => $value) {
                    echo "<th>" . $key . "</th>";
                }
                echo "</tr>";
                }
                echo "<tr>";
                foreach ($row as $value) {
                echo "<td>" . $value . "</td>";
                }
                echo "</tr>";
                for($j = 0; $j<3; $j++) {
                    echo "<tr>";
                    foreach ($row as $value) {
                    echo "<td>" . $value . "</td>";
                    }
                    echo "</tr>";
                }
                
            }
            echo "</table>";
            } catch(Exception $e) {}

            mysqli_close($con);

        ?>
    </div>

        <div class="content">
            <button class="login" href="">Login</button>
            <input type="text" class="search" placeholder="Search..">
            <button class="erstellen" href="">Neuer Eintrag</button>
        </div>
     </div>









</body>
</html>    
