<?php 
include "./conexion.php";
if (isset($_POST['nombre']) && isset($_POST['descripcion']))  {
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
	$conexion->query("insert into categorias(nombre,descripcion,imagen)values
		(
		'".$_POST['nombre']."',
		'".$_POST['descripcion']."',
		'$nombreFinal'
		)
		")or die($conexion->error);
	header("Location: ../admin/categorias.php?success");
	
}else{
	header("Location: ../admin/categorias.php?error=No se pudo subir imagen valida");
}
	}else{
		header("Location: ../admin/categorias.php?error=Favor de subir imagen valida");
	}
}else{
	header("Location: ../admin/categorias.php?error=Favor de llenar los campos");
}

 ?>