<?php 
include "./conexion.php";
if (isset($_POST['nombre']) && isset($_POST['descripcion']) && isset($_POST['precio']) && isset($_POST['inventario']) && isset($_POST['categoria']) && isset($_POST['talla']) && isset($_POST['talla']) && isset($_POST['color']))  {
	# code...
	$carpeta="../images/";
	$nombre = $_FILES['imagen']['name'];
	
	//imagen.jpg
	$temp = explode('.', $nombre);
	$extension=end($temp);

	$nombreFinal = time().'.'.$extension;
	if ($extension=='jpg' || $extension='png' ) {
		# code...
if (move_uploaded_file($_FILES['imagen']['tmp_name'], $carpeta.$nombreFinal)) {
	# code...
	$conexion->query("insert into productos(nombre,descripcion,imagen,precio,talla,color,id_categoria,inventario)values
		(
		'".$_POST['nombre']."',
		'".$_POST['descripcion']."',
		'$nombreFinal',
		".$_POST['precio'].",
		'".$_POST['talla']."',
		'".$_POST['color']."',
		".$_POST['categoria'].",
		'".$_POST['inventario']."'
		)
		")or die($conexion->error);
	header("Location: ../admin/productos.php?success");
	
}else{
	header("Location: ../admin/productos.php?error=No se pudo subir imagen valida");
}
	}else{
		header("Location: ../admin/productos.php?error=Favor de subir imagen valida");
	}
}else{
	header("Location: ../admin/productos.php?error=Favor de llenar los campos");
}

 ?>