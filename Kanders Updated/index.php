<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <link rel="stylesheet" href="https://unicons.iconscout.com/release/v2.1.9/css/unicons.css">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.5.0/css/bootstrap.min.css">
  <link rel="stylesheet" href="CSS/stylesheet.css">
</head>
<body>
  <div id="stars"></div>
  <div id="stars2"></div>
  <div id="stars3"></div>
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
                      <form action="login.php" method="post">
                        <div class="form-group">
                          <input type="text" id="username" class="form-style" name="username" placeholder="Vorname">
                          <i class="input-icon uil uil-at"></i>
                        </div>
                        <div class="form-group">
                          <input type="password" id="password" class="form-style" name="password" placeholder="Passwort">
                          <i class="input-icon uil uil-lock-alt"></i>
                        </div>
                        <button type="submit" id="loginButton" class="btn mt-4">Einloggen</button>
                      </form>
                      <p class="mb-0 mt-4 text-center">
                        <a href="platzhalter" class="link">Passwort vergessen?</a> 
                      </p>
                    </div>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
</body>
</html>