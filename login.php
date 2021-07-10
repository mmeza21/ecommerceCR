<!DOCTYPE html>
<html>
<head>
  <title>Comercial Rosmery | Login</title>
  <link rel="stylesheet" type="text/css" href="css/styleLogin.css">
  <!-- css goolge fonts -->
  <link href="https://fonts.googleapis.com/css?family=Poppins:600&display=swap" rel="stylesheet">
  <!-- fontawesome iconos li -->
  <script src="https://kit.fontawesome.com/a81368914c.js"></script>
  <meta name="viewport" content="width=device-width, initial-scale=1">
</head>
<body>
  <div id="manzana">
  <img class="wave" src="img/wave.svg">
  <div class="container">
    <div class="img">
      <img src="img/undraw_dashboard_nklg.svg">
    </div>
    <div class="login-content">
      <form action="./php/check.php" method="post">
        <img src="img/bg.png">
        <h2 class="title">Bienvenido</h2>
              <div class="input-div one">
                 <div class="i">
                    <i class="fas fa-user"></i>
                 </div>
                 <div class="div">
                    <h5>Correo</h5>
                    <input type="text" class="input" name="email" pattern="[a-zA-Z0-9_]+([.][a-zA-Z0-9_]+)*@[a-zA-Z0-9_]+([.][a-zA-Z0-9_]+)*[.][a-zA-Z]{1,5}">
                 </div>
              </div>
              <div class="input-div pass">
                 <div class="i"> 
                    <i class="fas fa-lock"></i>
                 </div>
                 <div class="div">
                    <h5>Password</h5>
                    <input type="password" class="input" name="password" required>
                 </div>
              </div>
              
              <input type="submit" class="btn" value="Iniciar">
            </form>
        </div>
          <div class="alert alert-danger" role="alert">
          <!-- /.col -->
          <?php 
          if (isset($_GET['error'])) {
            # code...
            echo '<div class="col-12 alert alert-danger">'.$_GET['error'].'</div>';
          }

           ?>
         </div>
    </div>
    <script type="text/javascript" src="js/mainLogin.js"></script>
</body>
</html>
