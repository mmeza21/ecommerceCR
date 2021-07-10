
<?php 

	$to = $_POST['c_email_address'];
	$subject = 'Gracias x comprar';
	$from = 'Papercut@papercut.com';
	$header='MIME-Version 1.0'."\r\n";
	$header.="Content-type: text/html; charset-iso-8859-1\r\n";
	$header.= 'From: me@example.com'."\r\n";
	$header.="X-Mailer: PHP/".phpversion();
	
	$message='<html>
<body>
<h1 style="color:#1d1d1d">Gracias x tu compra '.$_POST['c_fname']."".$_POST['c_lname'].'</h1>

<h3>Detalle de la compra:</h3>
<table>
	<thead>
		<tr>
			<td>Nombre de producto</td>
			<td>Precio</td>
			<td>Cantidad</td>
			<td>Subtotal</td>
		</tr>
	</thead>
	<tbody>';

		$total = 0;
        $arregloCarrito =$_SESSION['carrito'];
        for($i=0; $i<count($arregloCarrito);$i++) { 
        $total = $total + ($arregloCarrito[$i]['Precio'] * $arregloCarrito[$i]['Cantidad']);
	        $message.='<tr><td>'.$arregloCarrito[$i]['Nombre'].'</td>';
	        $message.='<td>'.$arregloCarrito[$i]['Precio'].'</td>';
	        $message.='<td>'.$arregloCarrito[$i]['Cantidad'].'</td>';
	        $message.='<td>'.($arregloCarrito[$i]['Precio']*$arregloCarrito[$i]['Cantidad']).'</td></tr>';
        } 
	
	$message.='</tbody></table>'; 
	$message.='<h2>Total de la compra:'.$total.'</h2>';
	$message.='<a href="http://127.0.0.1/carrito/php/verpedido.php?id_venta='.$id_venta.'" style="background: brown;color: white;padding: 10px;text-decoration: none;">Ver estatus del pedido</a></body></html>'; 
	if (mail($to,$subject,$message,$header)) {
		//	echo "mensaje enviado ";
	}else{
		//echo 'no se envio';
	}
?>


