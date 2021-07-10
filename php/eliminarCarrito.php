<?php 
session_start();
$arreglo = $_SESSION['carrito'];
for ($i=0; $i<count($arreglo);$i++){ 
	if($arreglo[$i]['Id'] != $_POST['id']){
		$arregloNuevo[]=array(
			'Id'=>$arreglo[$i]['Id'],
			'Nombre'=>$arreglo[$i]['Id'],
			'Precio'=>$arreglo[$i]['Precio'],
			'Imagen'=>$arreglo[$i]['Imagen'],
			'Cantidad'=>$arreglo[$i]['Cantidad']
			
		);
	}
}
if (isset($arregloNuevo)) {
	$_SESSION['carrito']=$arregloNuevo;
	# code...
}else{
	//queire decir que el registro a eliminar es el unico que haia
	unset($_SESSION['carrito']);
 }
 echo "listo";
 ?>
