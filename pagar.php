<?php
include "./php/conexion.php";
if(!isset($_GET['id_venta'])){
    header("Location: ./");
}
$datos = $conexion->query("select 
        ventas.*,  
        usuario.nombre,usuario.telefono,usuario.email
        from ventas 
        inner join usuario on ventas.id_usuario = usuario.id
        where ventas.id=".$_GET['id_venta'])or die($conexion->error);
$datosUsuario = mysqli_fetch_row($datos);
$datos2 = $conexion->query("select * from envios where id_venta=".$_GET['id_venta'])or die($conexion->error);
$datosEnvio= mysqli_fetch_row($datos2);

$datos3= $conexion->query("select productos_venta.*,    
                productos.nombre as nombre_producto, productos.imagen 
                from productos_venta inner join productos on productos_venta.id_producto = productos.id 
                where id_venta =".$_GET['id_venta'])or die($conexion->error);

$total = $datosUsuario[2];
$descuento = "0";
$banderadescuento = false;
if($datosUsuario[6] != 0){
  $banderadescuento = true;
  $cupon = $conexion->query("select *from cupones where id =".$datosUsuario[6]);
  $filaCupon = mysqli_fetch_row($cupon);
  if($filaCupon[3] == "moneda"){
    $total =$total - $filaCupon[4];
    $descuento =$filaCupon[4]."PEN";
  }else{
    $total = $total - ($total * ($filaCupon[4] / 100 ));
    $descuento =$filaCupon[4]."%";
  }
  
}

// SDK de Mercado Pago
require __DIR__ .  '/vendor/autoload.php';

// Agrega credenciales
MercadoPago\SDK::setAccessToken('TEST-709269902119004-082821-52aea1366458ec835e61317b71bdce9a-635354844');

// Crea un objeto de preferencia
$preference = new MercadoPago\Preference();
//...
$preference->back_urls = array(
    "success" => "https://localhost/carrito/thankyou.php?id_venta=".$_GET['id_venta']."&metodo=mercado_pago",
    "failure" => "https://localhost/carrito/errorpago.php?error=failure",
    "pending" => "https://localhost/carrito/errorpago.php?error=pending"
);
$preference->auto_return = "approved";
// ..

// Crea un ítem en la preferencia
$datos=array();
if($banderadescuento){
 
  $item = new MercadoPago\Item();
  $item->title = "Productos con el descuento";
  $item->quantity = 1;
  $item->unit_price = $total;
  $datos[]=$item;

}else {
  while($f = mysqli_fetch_array($datos3)){
    $item = new MercadoPago\Item();
    $item->title = $f['nombre_producto'];;
    $item->quantity = $f['cantidad'];;
    $item->unit_price = $f['precio'];;
    $datos[]=$item;
}
}
$preference->items = $datos;
$preference->save();
//curl -X POST -H "Content-Type: application/json" "https://api.mercadopago.com/users/test_user?access_token=TEST-7504747632902355-082820-0d8ca14f3a967811cfadfa9ab887c602-129806001" -d "{'site_id':'MPE'}"
//{"id":635354844,"nickname":"TETE4848235","password":"qatest7703","site_status":"active","email":"test_user_32800014@testuser.com"}
//{"id":635356343,"nickname":"TEST8QAQ2HWZ","password":"qatest6439","site_status":"active","email":"test_user_97783259@testuser.com"}

?>
<!DOCTYPE html>
	<html>
	<head>
		<title>Elige metodo de pago</title>
		  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Mukta:300,400,700"> 
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.15.1/css/all.css" integrity="sha384-vp86vTRFVJgpjF9jiIGPEEqYqlDwgyBgEF109VFjmqGmIY/Y4HV4d3Gp2irVfcrp" crossorigin="anonymous">
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
	    <!-- Include the PayPal JavaScript SDK -->
    <script src="https://www.paypal.com/sdk/js?client-id=Ae1wYOo1m1UCRON-X2CNhfq7gnwrYyYChitwecmACnPS5XSQORS2vXWvAoBzXPBVbD6R7KTm6J5trpxB"></script>

<div class="site-wrap">
  <?php include("./layouts/header.php"); ?> 

    <div class="site-section">
      <div class="container">
        <div class="row">
          <div class="col-md-12">
            <h2 class="h3 mb-3 text-black">Elige metodo de pago</h2>
          </div>
          <div class="col-md-7">

            <form action="#" method="post">
              
              <div class="p-3 p-lg-5 border">
                
                <div class="form-group row">
                  <div class="col-md-12">
                    <span class="font-weight-bold text-black">Venta:&nbsp;</span> <span class="text-secondary">#<?php echo $_GET['id_venta'];?></span>
                  </div>
                </div>
                <div class="form-group row">
                  <div class="col-md-12">
                    <span class="font-weight-bold text-black">Nombres:&nbsp;</span><span class="text-secondary"> <?php echo $datosUsuario[7];?></span>
                  </div>
                </div>
                <div class="form-group row">
                  <div class="col-md-12">
                    <span class="font-weight-bold text-black">Email:&nbsp;</span><span class="text-secondary"><?php echo $datosUsuario[9];?></span>
                  </div>
                </div>
                <div class="form-group row">
                  <div class="col-md-12">
                    <span class="font-weight-bold text-black">Telefono:&nbsp;</span><span class="text-secondary"><?php echo $datosUsuario[8];?></span>
                  </div>
                </div>
                <div class="form-group row">
                  <div class="col-md-12">
                    <span class="font-weight-bold text-black">Compañia:&nbsp;</span><span class="text-secondary"><?php echo $datosEnvio[2];?></span>
                  </div>
                </div>
                 <div class="form-group row">
                  <div class="col-md-12">
                    <span class="font-weight-bold text-black">Distrito:&nbsp;</span><span class="text-secondary"><?php echo $datosEnvio[1];?></span>
                  </div>
                </div>
                <div class="form-group row">
                  <div class="col-md-12">
                    <span class="font-weight-bold text-black">Direccion:&nbsp;</span><span class="text-secondary"><?php echo $datosEnvio[3];?></span>
                  </div>
                </div>
             
                
              </div>
            </form>
          </div>
          <div class="col-md-5 ml-auto">
          
              <h4>Resumen de Pedido</h4>
            <hr>
            <p>Total: S/&nbsp;<?php echo number_format($datosUsuario[2],2,'.','');?></p>
            <p>Descuento: S/&nbsp;<?php echo number_format($descuento,2,'.','');?></p>
            <hr>
            <h4 class="h4">Total Final: S/&nbsp;<?php echo number_format($total,2,'.','');?></h4>
            <hr>
            <center><img width="50%" src="images/100seguro.png"></center>
            <p><i class="fas fa-user-shield"></i>&nbsp;Protección al comprador</p>
            <p><i class="fas fa-headphones"></i>&nbsp;Asesoria telefonica: (01)6400-240</p>
				  <hr>
          <h4 class="text-center">Selecciones metodo de pago</h4>
          <hr>
          <img class="pr-4" width="120px" src="images/pago.png">
          <script
				   src="https://www.mercadopago.com.pe/integrations/v1/web-payment-checkout.js"
				   data-preference-id="<?php echo $preference->id; ?>">
				  </script>
          <hr>
          <!-- Set up a container element for the button -->
          <div id="paypal-button-container"></div>
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
  <script>
      paypal.Buttons({
        createOrder: function(data, actions) {
          return actions.order.create({
            purchase_units: [{
              amount: {
                value: '<?php echo $datosUsuario[2]; ?>'
              }
            }]
          });
        },
        onApprove: function(data, actions) {
          return actions.order.capture().then(function(details) {
            if (details.status =='COMPLETED') {
            	location.href="./thankyou.php?id_venta=<?php echo $_GET['id_venta'];?>&metodo=paypal";
            }
           
          });
        }
      }).render('#paypal-button-container'); // Display payment options on your web page
    </script>

	</body>
	</html>	