<?php 
  include("./php/conexion.php");
  if (isset($_GET['id'])) {
    # code...
    $resultado = $conexion ->query("select * from productos where id=".$_GET['id'])or die($conexion->error);
    if (mysqli_num_rows($resultado)>0) {
      # traer los resultados buscados...
    $fila = mysqli_fetch_row($resultado);
  }else{
    //redireccionar
    header("Location: ./index.php");
  }
  }else{
     header("Location: ./index.php");
  }
?>

<!DOCTYPE html>
<html lang="en">
  <head>
    <title>Tienda</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.15.1/css/all.css" integrity="sha384-vp86vTRFVJgpjF9jiIGPEEqYqlDwgyBgEF109VFjmqGmIY/Y4HV4d3Gp2irVfcrp" crossorigin="anonymous">
    <link rel="stylesheet" href="css/bootstrap.min.css">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Mukta:300,400,700"> 
    <link rel="stylesheet" href="fonts/icomoon/style.css">

    <link rel="stylesheet" href="css/bootstrap.min.css">
    <link rel="stylesheet" href="css/magnific-popup.css">
    <link rel="stylesheet" href="css/jquery-ui.css">
    <link rel="stylesheet" href="css/owl.carousel.min.css">
    <link rel="stylesheet" href="css/owl.theme.default.min.css">
    <link rel="stylesheet" href="css/aos.css">

    <link rel="stylesheet" href="css/style.css">
    
  </head>
  <body>
  
  <div class="site-wrap">
    <?php include("./layouts/header.php"); ?> 

    <div class="site-section">
      <div class="container">
        <div class="row">
          <div class="col-md-6">
            <img src="images/<?php echo $fila[4] ?>" alt="<?php echo $fila[1] ?>" class="img-fluid">
          </div>
          <div class="col-md-6">
          <form action="cart.php"  method="post">
            <h2 class="text-black text-center p-1"><?php echo $fila[1] ?></h2>
            
            <!-- Caracteristicas del Producto -->
          <div class="container">
                <ul class="nav nav-tabs nav-justified mb-3" id="pills-tab" role="tablist">
                  <li class="nav-item" role="presentation">
                  <a class="nav-link active" id="pills-home-tab" data-toggle="pill" href="#pills-home" role="tab" aria-controls="pills-home" aria-selected="true">Descripción</a>
                  </li>

                  <li class="nav-item" role="presentation">
                  <a class="nav-link" id="pills-profile-tab" data-toggle="pill" href="#pills-profile" role="tab" aria-controls="pills-profile" aria-selected="false">Especificaciones</a>
                  </li>
                </ul>
            <div class="tab-content" id="pills-tabContent">
              <div class="tab-pane fade show active" id="pills-home" role="tabpanel" aria-labelledby="pills-home-tab"><p class="text-justify small"><?php echo $fila[2] ?></p></div>
              <div class="tab-pane fade" id="pills-profile" role="tabpanel" aria-labelledby="pills-profile-tab"><p class="text-justify small"><?php echo $fila[7] ?></p></div>
            </div>
          </div>
            
            <p><strong class="h3">S/<?php echo number_format($fila[3],2,'.','')?></strong></p>
            <div class="mb-1 d-flex">
             
            </div>
            <div class="mb-5">
              <div class="input-group mb-3" style="max-width: 120px;">
                <div class="input-group-prepend">
                  <button class="btn btn-warning text-white js-btn-minus" type="button">&minus;</button>
                </div>
                <input type="text" id = "cant" name ="cant"  class="form-control text-center" value="1" placeholder="" aria-label="Example text with button addon" aria-describedby="button-addon1">
              
                <div class="input-group-append">
                  <button class="btn btn-warning text-white js-btn-plus" type="button">&plus;</button>
                </div>
              </div>

              <input type="hidden" id ="id" name="id" value="<?php echo $fila[0] ?>">
            </div>
            <!--<p><a href="cart.php?id=<?php echo $fila[0] ?>&cant=" class="buy-now btn btn-sm btn-primary">Add To Cart</a></p>-->
            <input type ="submit"  class="btn btn-warning text-white btn-sm btn-block" value ="Agregar">
          </form>
          </div>
        </div>
      </div>
    </div>


    <?php include("./layouts/footer.php"); ?> 
  </div>

  <script src="js/jquery-3.3.1.min.js"></script>
  <script src="js/jquery-ui.js"></script>
  <script src="js/popper.min.js"></script>
  <script src="js/bootstrap.min.js"></script>
  <script src="js/owl.carousel.min.js"></script>
  <script src="js/jquery.magnific-popup.min.js"></script>
  <script src="js/aos.js"></script>

  <script src="js/main.js"></script>
    
  </body>
</html>