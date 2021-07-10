<!DOCTYPE html>
<html lang="en">
  <head>
    <title>Contacto &mdash; Comercial Rosmery</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

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

   
      
       
     <div class="container">

            <div class="row">

                <div class="col-xl-8 offset-xl-2 py-5">

                    <h1>Formulario de contacto para <a href="http://comercialrosmery.com">comercialrosmery.com</a></h1>

                    <p class="lead">Ponerse en contacto</p>
<hr>
                    <!-- We're going to place the form here in the next step -->
                    <form id="contact-form" method="post" action="contact.php" role="form">

    <div class="messages"></div>

    <div class="controls">

        <div class="row">
            <div class="col-md-6">
                <div class="form-group">
                    <label for="form_name">Nombres *</label>
                    <input id="form_name" type="text" name="name" class="form-control" placeholder="porfavor ingrese sus Nombres *" required="required" data-error="Firstname is required.">
                    <div class="help-block with-errors"></div>
                </div>
            </div>
            <div class="col-md-6">
                <div class="form-group">
                    <label for="form_lastname">Apellidos *</label>
                    <input id="form_lastname" type="text" name="surname" class="form-control" placeholder="Porfavor ingrese sus Apellidos *" required="required" data-error="Lastname is required.">
                    <div class="help-block with-errors"></div>
                </div>
            </div>
        </div>
        <div class="row">
            <div class="col-md-6">
                <div class="form-group">
                    <label for="form_email">Email *</label>
                    <input id="form_email" type="email" name="email" class="form-control" placeholder="Porfavor ingrese su email *" required="required" data-error="Valid email is required.">
                    <div class="help-block with-errors"></div>
                </div>
            </div>
            <div class="col-md-6">
                <div class="form-group">
                    <label for="form_need">Porfavor especifique su consulta *</label>
                    <select id="form_need" name="need" class="form-control" required="required" data-error="Seleccione, la especificación de su consulta.">
                        <option value=""></option>
                        <option value="Request quotation">Disponibilidad de productos</option>
                        <option value="Request order status">Estado de pedido</option>
                        <option value="Request copy of an invoice">Cancelación de pedido</option>
                        <option value="Other">Otros</option>
                    </select>
                    <div class="help-block with-errors"></div>
                </div>
            </div>
        </div>
        <div class="row">
            <div class="col-md-12">
                <div class="form-group">
                    <label for="form_message">Mensaje *</label>
                    <textarea id="form_message" name="message" class="form-control" placeholder="Ingrese mensaje *" rows="4" required="required" data-error="Por favor, ingrese su mensaje..."></textarea>
                    <div class="help-block with-errors"></div>
                </div>
            </div>
            <div class="col-md-12">
                <input type="submit" class="btn btn-warning btn-block btn-send text-white" value="Enviar mensaje">
            </div>
        </div>
        <div class="row">
            <div class="col-md-12">
                <p class="text-muted">
                    <strong>*</strong> Es importante llenar los campos requeridos.</p>
            </div>
        </div>
    </div>

</form>

                </div>

           

       
        </div>
      
    </div><hr>

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