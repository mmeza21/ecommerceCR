<?php
session_start();
include('./php/conexion.php');
if(!isset($_GET['texto'])){
 header("location:./index.php");
}
?>

<!DOCTYPE html>
<html lang="en">
  <head>
    <title>Tienda</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.15.1/css/all.css" integrity="sha384-vp86vTRFVJgpjF9jiIGPEEqYqlDwgyBgEF109VFjmqGmIY/Y4HV4d3Gp2irVfcrp" crossorigin="anonymous">
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

        <div class="row mb-5">
          <div class="col-md-9 order-2">

            <div class="row">
              <div class="col-md-12 mb-5">
                <div class="float-md-left mb-2"><a href="index.php"><h2 class="text-info">Catalogo</h2></a><p class="text-justify">Busqueda de resultados para <?php echo $_GET['texto'];?>...</p></div>  <!-- busqueda -->
                <div class="d-flex">
              
                 
                </div>
              </div>
            </div>
            <div class="row mb-5">
              <!--Incluir la conexion -->
              <!-- busqueda -->
              <?php 
                  
                 $resultado = $conexion ->query("select productos.*, categorias.nombre as categoria from productos 
                 inner JOIN categorias on productos.id_categoria = categorias.id
                 where   
                  productos.nombre like '%".$_GET['texto']."%' or
                  productos.descripcion like '%".$_GET['texto']."%' or
                  productos.talla like '%".$_GET['texto']."%' or
                  categorias.nombre like '%".$_GET['texto']."%' or
                  productos.color like '%".$_GET['texto']."%'
                  

                  order by id DESC limit 10")or die($conexion ->error);
            if(mysqli_num_rows($resultado) >0){
                  while ($fila = mysqli_fetch_array($resultado)){
                    # code...

                    
               ?>
             
              <div class="col-sm-6 col-lg-4 mb-4" data-aos="fade-up">
                <div class="block-4 text-center border">
                  <figure class="block-4-image">
                    <a href="shop-single.php?id=<?php echo $fila['id']; ?>">
                    <img src="images/<?php echo $fila['imagen']; ?>" alt="<?php echo $fila['nombre']; ?>" class="img-fluid"></a>
                  </figure>
                  <div class="block-4-text p-4">
                    <h3><a href="shop-single.php?id=<?php echo $fila['id']; ?>"><span class="text-secondary"><?php echo $fila['nombre']; ?></span></a></h3>
                    
                    <p class="text-info font-weight-bold">S/&nbsp;<?php echo number_format($fila['precio'],2,'.',''); ?></p>
                  </div>
                </div>
              </div>

            <?php } }else{
                echo '<h2>sin resultados</h2>';
            }?>


            </div>
            <div class="row" data-aos="fade-up">
              <div class="col-md-12 text-center">
                <div class="site-block-27">
                  <ul>
                    <li><a href="#">&lt;</a></li>
                    <li class="active" ><span class="bg-warning">1</span></li>
                    <li><a href="#">2</a></li>
                    <li><a href="#">3</a></li>
                    <li><a href="#">&gt;</a></li>
                  </ul>
                </div>
              </div>
            </div>
          </div>

          <div class="col-md-3 order-1 mb-5 mb-md-0">
          <div class="border p-4 rounded mb-4">
              <h3 class="mb-3 h6 text-uppercase text-black d-block">Categorias</h3>
              <ul class="list-unstyled mb-0">
              <?php
               $re= $conexion->query("select * from categorias ");
                while($f= mysqli_fetch_array($re)){

              ?>
                <li class="mb-1">
                <a href="./busqueda.php?texto=<?php echo $f['nombre']?>" class="d-flex">
                <span class="btn btn-block text-info" style="text-align: left;"><?php echo $f['nombre'];?></span>
                 <span class="text-black ml-auto">
                 <?php 
                  $re2 = $conexion->query("select count(*) from productos where id_categoria =".$f['id']);
                  $fila = mysqli_fetch_row($re2);
                  echo $fila[0];
                 ?>
                 </span>
                 </a></li>
               
              <?php } ?>
              </ul>
            </div>
            <div class="border p-4 rounded mb-4">
             

              <div class="mb-4">
                <h3 class="mb-3 h6 text-uppercase text-black d-block">Tama??o</h3>
                  <a href="./busqueda.php?texto=Grande">
                  <span class="btn btn-block text-info" style="text-align: left;">Grande</span>
                  </a>
                  <a href="./busqueda.php?texto=Mediano">
                  <span class="btn btn-block text-info" style="text-align: left;">Mediano</span>
                  <a href="./busqueda.php?texto=Peque??o">
                  <span class="btn btn-block text-info" style="text-align: left;">Peque??o</span>
                  </a>
                  <a href="./index.php">
                  <span class="btn btn-block text-info" style="text-align: left;">Todo</span>
                  </a>
              </div>

                 <div class="mb-4">
                <h3 class="mb-3 h6 text-uppercase text-black d-block">Color</h3>
                <?php
                 $re =$conexion->query("SELECT * from colores");
                 while($f=mysqli_fetch_array($re)){

                ?>
                <a href="./busqueda.php?texto=<?php echo $f['color'];?>" class="d-flex color-item align-items-center" >
                  <span style="background-color:<?php echo $f['codigo'];?>" class="color d-inline-block rounded-circle mr-2"></span><span class="btn btn-block text-info" style="text-align: left;"><?php echo $f['color'];?></span>
                </a>
                <?php 
                }
                ?>
             
              </div>

            </div>
          </div>
        </div>

        <div class="row">
          <div class="col-md-12">
            <div class="site-section site-blocks-2">
                <div class="row justify-content-center text-center mb-5">
                  <div class="col-md-7 site-section-heading pt-4">
                    <h2>Proximos lanzamientos</h2>
                  </div>
                </div>
                <div class="row">
                  <div class="col-sm-6 col-md-6 col-lg-4 mb-4 mb-lg-0" data-aos="fade" data-aos-delay="">
                    <a class="block-2-item" href="#">
                      <figure class="image">
                        <img src="images/cat1.jpg" alt="" class="img-fluid">
                      </figure>
                      <div class="text">
                        <span class="text-uppercase">Colecci??n</span>
                        <h3>Moderna</h3>
                      </div>
                    </a>
                  </div>
                  <div class="col-sm-6 col-md-6 col-lg-4 mb-5 mb-lg-0" data-aos="fade" data-aos-delay="100">
                    <a class="block-2-item" href="#">
                      <figure class="image">
                        <img src="images/img1.jpg" alt="" class="img-fluid">
                      </figure>
                      <div class="text">
                        <span class="text-uppercase">Colecci??n</span>
                        <h3>Minimalista</h3>
                      </div>
                    </a>
                  </div>
                  <div class="col-sm-6 col-md-6 col-lg-4 mb-5 mb-lg-0" data-aos="fade" data-aos-delay="200">
                    <a class="block-2-item" href="#">
                      <figure class="image">
                        <img src="images/tipos-de-sofas-8.jpg" alt="" class="img-fluid">
                      </figure>
                      <div class="text">
                        <span class="text-uppercase">Colecci??n</span>
                        <h3>Multifamiliar</h3>
                      </div>
                    </a>
                  </div>
                </div>
              
            </div>
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