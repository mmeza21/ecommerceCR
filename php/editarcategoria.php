<?php 
include "conexion.php";
if (isset($_POST['nombre']) && isset($_POST['descripcion']))  {
	# code...
	
		if ($_FILES['imagen']['name']!='') {
			$carpeta="../images/";
			$nombre = $_FILES['imagen']['name'];

			$temp = explode('.', $nombre);
	$extension=end($temp);

	$nombreFinal = time().'.'.$extension;
	if ($extension=='jpg' || $extension='png' ) {
		# code...
if (move_uploaded_file($_FILES['imagen']['tmp_name'], $carpeta.$nombreFinal)) {
	$fila=$conexion->query('select imagen from categorias where id='.$_POST['id']);
$id = mysqli_fetch_row($fila);
if (file_exists('../images/'.$id[0])) {
	unlink('../images/'.$id[0]);
}
	$conexion->query("update categorias set imagen='".$nombreFinal."' where id=".$_POST['id']);
		}
	}//llave tipo archivpo
	
}//llave vacia


//lave imagne
$conexion->query("update categorias set 
	nombre='".$_POST['nombre']."',
	descripcion='".$_POST['descripcion']."',
	where id=".$_POST['id'].);
header("Location: ../admin/categorias.php?edits");
}


 ?>