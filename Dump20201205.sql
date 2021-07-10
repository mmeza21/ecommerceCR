-- MySQL dump 10.13  Distrib 5.7.17, for Win64 (x86_64)
--
-- Host: localhost    Database: carrito
-- ------------------------------------------------------
-- Server version	5.5.5-10.1.32-MariaDB

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `carrito`
--

DROP TABLE IF EXISTS `carrito`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `carrito` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_producto` int(11) NOT NULL,
  `cantidad` double NOT NULL,
  `id_usuario` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `carrito`
--

LOCK TABLES `carrito` WRITE;
/*!40000 ALTER TABLE `carrito` DISABLE KEYS */;
/*!40000 ALTER TABLE `carrito` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `categorias`
--

DROP TABLE IF EXISTS `categorias`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `categorias` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) NOT NULL,
  `descripcion` varchar(400) NOT NULL,
  `imagen` varchar(400) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categorias`
--

LOCK TABLES `categorias` WRITE;
/*!40000 ALTER TABLE `categorias` DISABLE KEYS */;
INSERT INTO `categorias` VALUES (1,'Modular','Un mueble modular es un mueble de fácil manejo, que se puede mover con facilidad y puede ser reutilizado en numerosas combinaciones para crear cocinas en forma de L, de U, lineales, con isla central o en paralelo. ',''),(2,'Juegos de Sala','Conjunto de muebles que unidos armonicamente mediante diseño y color crearan una experiencia de comidad y buen ambiente para tus espacios del hogar.',''),(3,'Unidad','Un sofá es un mueble utilizado para sentarse confortablemente una o más personas.','');
/*!40000 ALTER TABLE `categorias` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `colores`
--

DROP TABLE IF EXISTS `colores`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `colores` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `color` varchar(50) NOT NULL,
  `codigo` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `colores`
--

LOCK TABLES `colores` WRITE;
/*!40000 ALTER TABLE `colores` DISABLE KEYS */;
INSERT INTO `colores` VALUES (1,'negro','#000000'),(2,'verde','#008000'),(6,'amarillo','#FFFF00'),(8,'Fucsia','#FF00FF'),(9,'Azul','#0000FF'),(10,'GRIS','#808080'),(11,'Marron','#800000');
/*!40000 ALTER TABLE `colores` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cupones`
--

DROP TABLE IF EXISTS `cupones`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cupones` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `codigo` varchar(50) NOT NULL,
  `status` varchar(50) NOT NULL,
  `tipo` varchar(50) NOT NULL,
  `valor` varchar(50) NOT NULL,
  `fecha_vencimiento` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cupones`
--

LOCK TABLES `cupones` WRITE;
/*!40000 ALTER TABLE `cupones` DISABLE KEYS */;
INSERT INTO `cupones` VALUES (4,'68093','utilizado','moneda','1','2020-10-29'),(5,'98678','activo','moneda','20','2020-12-03'),(6,'65913','activo','porcentaje','5','2020-12-17'),(7,'39540','activo','porcentaje','15','2020-12-15'),(8,'38392','activo','porcentaje','10','2020-12-24'),(9,'28709','activo','porcentaje','5','2020-12-24'),(10,'13571','activo','porcentaje','15','2020-12-24'),(11,'42658','activo','moneda','50','2020-12-16'),(12,'72903','activo','moneda','100','2020-12-31'),(13,'87403','activo','moneda','50','2020-12-14'),(14,'70240','activo','porcentaje','15','2020-12-15');
/*!40000 ALTER TABLE `cupones` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `demo`
--

DROP TABLE IF EXISTS `demo`;
/*!50001 DROP VIEW IF EXISTS `demo`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `demo` AS SELECT 
 1 AS `nombre`,
 1 AS `cantidad`,
 1 AS `SUM(subtotal)`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `envios`
--

DROP TABLE IF EXISTS `envios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `envios` (
  `id_envio` int(11) NOT NULL AUTO_INCREMENT,
  `pais` varchar(50) NOT NULL,
  `company` varchar(50) NOT NULL,
  `direccion` varchar(100) NOT NULL,
  `estado` varchar(50) NOT NULL,
  `cp` varchar(10) NOT NULL,
  `id_venta` int(11) NOT NULL,
  PRIMARY KEY (`id_envio`)
) ENGINE=InnoDB AUTO_INCREMENT=102 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `envios`
--

LOCK TABLES `envios` WRITE;
/*!40000 ALTER TABLE `envios` DISABLE KEYS */;
INSERT INTO `envios` VALUES (93,'Chosica','','Jr San jose n 858','','15468',139),(94,'San Juan de Lurigancho','','Av. El Polo Mz i Lote 6','','15096',140),(95,'San Juan de Lurigancho','','Av. Los Pinos calle 8 Mz i Lote 4','','15403',141),(96,'Chosica','','Mz Z Lote 1 - Urbanización las terrazas','','15457',142),(97,'Chosica','','Mz A Lote 16 - Chosica','','15461',143),(98,'Chosica','','Alameda Huampan 526','','15468',144),(99,'1','','','','',152),(100,'2','nada','av los cielos','','',153),(101,'SJL','','Sector 6a Grupo1','','',154);
/*!40000 ALTER TABLE `envios` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pagos`
--

DROP TABLE IF EXISTS `pagos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pagos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `metodo` varchar(50) DEFAULT NULL,
  `id_venta` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pagos`
--

LOCK TABLES `pagos` WRITE;
/*!40000 ALTER TABLE `pagos` DISABLE KEYS */;
INSERT INTO `pagos` VALUES (9,'paypal',133),(10,'paypal',134),(11,'paypal',144);
/*!40000 ALTER TABLE `pagos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `ppendientes`
--

DROP TABLE IF EXISTS `ppendientes`;
/*!50001 DROP VIEW IF EXISTS `ppendientes`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `ppendientes` AS SELECT 
 1 AS `pais`,
 1 AS `direccion`,
 1 AS `nombre`,
 1 AS `status`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `productos`
--

DROP TABLE IF EXISTS `productos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `productos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(300) NOT NULL,
  `descripcion` text NOT NULL,
  `precio` double NOT NULL,
  `imagen` varchar(200) NOT NULL,
  `inventario` int(11) NOT NULL,
  `id_categoria` int(11) NOT NULL,
  `talla` varchar(100) NOT NULL,
  `color` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=580 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `productos`
--

LOCK TABLES `productos` WRITE;
/*!40000 ALTER TABLE `productos` DISABLE KEYS */;
INSERT INTO `productos` VALUES (536,'Sofa Russian','Dale este toque elegante a tu sala con los mejores productos que la exclusiva marca CR tiene para ti.El sofa Russian esta fabricado en poliester (tela charleston) de la mejor calidad y cuenta con estructura de madera que te brindara la durabilidad y comodidad que necesitas.<br>Su diseno elegante encantara a mas de uno y combinara de forma perfecta con los demas muebles y accesorios del ambiente. <br>Luce una habitacion de primera con este sofa que encuentras a un insuperable precio solo en comercialrosmery.com, No lo dejes pasar!',900,'1604627647.jpg',100,2,'Grande','verde'),(537,'Sofa Italiam','Dale este toque elegante a tu sala con los mejores productos que la exclusiva marca CR tiene para ti.El sofa Russian esta fabricado en poliester (tela charleston) de la mejor calidad y cuenta con estructura de madera que te brindara la durabilidad y comodidad que necesitas.<br>Su diseno elegante encantara a mas de uno y combinara de forma perfecta con los demas muebles y accesorios del ambiente. <br>Luce una habitacion de primera con este sofa que encuentras a un insuperable precio solo en comercialrosmery.com, No lo dejes pasar!',850,'1604627681.jpg',6,1,'Mediano','verde'),(539,'Sofa Mexican','Dale este toque elegante a tu sala con los mejores productos que la exclusiva marca CR tiene para ti.El sofa Russian esta fabricado en poliester (tela charleston) de la mejor calidad y cuenta con estructura de madera que te brindara la durabilidad y comodidad que necesitas.<br>Su diseno elegante encantara a mas de uno y combinara de forma perfecta con los demas muebles y accesorios del ambiente. <br>Luce una habitacion de primera con este sofa que encuentras a un insuperable precio solo en comercialrosmery.com, No lo dejes pasar!',800,'1604627750.jpg',10,1,'Grande','marron'),(540,'Sofa Peruvian','Dale este toque elegante a tu sala con los mejores productos que la exclusiva marca CR tiene para ti.El sofa Russian esta fabricado en poliester (tela charleston) de la mejor calidad y cuenta con estructura de madera que te brindara la durabilidad y comodidad que necesitas.<br>Su diseno elegante encantara a mas de uno y combinara de forma perfecta con los demas muebles y accesorios del ambiente. <br>Luce una habitacion de primera con este sofa que encuentras a un insuperable precio solo en comercialrosmery.com, No lo dejes pasar!',750,'1604627782.jpg',100,2,'Mediano','marron'),(541,'Sofa American','Tendrï¿½s una obra de arte en tu living. El tapizado de tela convierte el espacio en un ambiente sumamente moderno y acogedor. Comprende de cuatro espaldares acolchonados para entregarte los descansos y charlas mï¿½s entretenidas donde definitivamente tu sala se convertirï¿½ en el nuevo punto de encuentro.',560,'1606868875.jpg',11,2,'Pequeno','verde'),(542,'Sofa Ruchianmos','Tendrï¿½s una obra de arte en tu living. El tapizado de tela convierte el espacio en un ambiente sumamente moderno y acogedor. Comprende de cuatro espaldares acolchonados para entregarte los descansos y charlas mï¿½s entretenidas donde definitivamente tu sala se convertirï¿½ en el nuevo punto de encuentro.',652,'1606869301.jpg',10,3,'Mediano','verde'),(543,'Sofa American','Tendrï¿½s una obra de arte en tu living. El tapizado de tela convierte el espacio en un ambiente sumamente moderno y acogedor. Comprende de cuatro espaldares acolchonados para entregarte los descansos y charlas mï¿½s entretenidas donde definitivamente tu sala se convertirï¿½ en el nuevo punto de encuentro.',520,'1606871607.jpg',10,2,'grande','rojo'),(544,'Sofa American','Tendrï¿½s una obra de arte en tu living. El tapizado de tela convierte el espacio en un ambiente sumamente moderno y acogedor. Comprende de cuatro espaldares acolchonados para entregarte los descansos y charlas mï¿½s entretenidas donde definitivamente tu sala se convertirï¿½ en el nuevo punto de encuentro.',700,'1606871709.jpg',10,2,'Mediano','amarillo'),(545,'Chaise Longue a la Derecha Margot â€“ Azul Marino Oscuro','El sofÃ¡ Chaise Longue Brazo Derecho Margot es un modelo novedoso, que no puede faltar en tu hogar para completar el estilo vintage que deseas. EstÃ¡ compuesto por un sillÃ³n alargado, tapizado en terciopelo y patas de madera con un toque Dorado en sus puntas para darle una vistosidad retro y moderno a su vez. Perfecto para decoraciones en dormitorios, salas y recintos de tu elecciÃ³n con ambientes nÃ³rdicos o eclÃ©cticos. ',1599,'1607091005.jpg',10,3,'PequeÃ±o','negro'),(546,'Chaise Longue a la Derecha Margot â€“ Azul Pavo Real','El sofÃ¡ Chaise Longue Brazo Derecho Margot es un modelo novedoso, que no puede faltar en tu hogar para completar el estilo vintage que deseas. EstÃ¡ compuesto por un sillÃ³n alargado, tapizado en terciopelo y patas de madera con un toque Dorado en sus puntas para darle una vistosidad retro y moderno a su vez. Perfecto para decoraciones en dormitorios, salas y recintos de tu elecciÃ³n con ambientes nÃ³rdicos o eclÃ©cticos.',1599,'1607091289.jpg',10,3,'Pequeno','negro'),(547,'Chaise Longue a la Derecha Charley â€“ Gris Grafito','El Chaise Longue a la Derecha Charley de tamaÃ±o medio, destaca en cualquier espacio de tu hogar que lo ubiques. Puedes usarlo en el dormitorio, en tu despacho u oficina, versÃ¡til y sin duda elegante.',1599,'1607091174.jpg',10,3,'PequeÃ±o','negro'),(548,'Chaise Longue a la Derecha Margot â€“ Cerceta','El sofÃ¡ Chaise Longue Brazo Derecho Margot es un modelo novedoso, que no puede faltar en tu hogar para completar el estilo vintage que deseas. EstÃ¡ compuesto por un sillÃ³n alargado, tapizado en terciopelo y patas de madera con un toque Dorado en sus puntas para darle una vistosidad retro y moderno a su vez. Perfecto para decoraciones en dormitorios, salas y recintos de tu elecciÃ³n con ambientes nÃ³rdicos o eclÃ©cticos. ',1599,'1607091219.jpg',10,3,'PequeÃ±o','verde'),(549,'Asiento Esquinero Modular Juno â€“ Azul Espuma de Mar','El Asiento Esquinero Modular Juno te permitirÃ¡ ser tu propio diseÃ±ador, podrÃ¡s combinarlo con distintas opciones, tamaÃ±os, mover y hasta dar con la composiciÃ³n ideal',899,'1607091727.jpg',10,1,'PequeÃ±o','verde'),(550,'Asiento Esquinero Modular Juno â€“ Gris Marga','El Asiento Esquinero Modular Juno te permitirÃ¡ ser tu propio diseÃ±ador, podrÃ¡s combinarlo con distintas opciones, tamaÃ±os, mover y hasta dar con la composiciÃ³n ideal',899,'1607091763.jpg',10,1,'PequeÃ±o','negro'),(551,'Asiento modular con funda extraÃ­ble Trent â€“ AlgodÃ³n azul lavado','El Asiento Modular Trent te permitirÃ¡ ser tu propio diseÃ±ador, podrÃ¡s combinarlo con distintas opciones, tamaÃ±os, mover y hasta dar con la composiciÃ³n ideal.',849,'1607091847.jpg',10,1,'PequeÃ±o','negro'),(552,'Asiento Modular Juno â€“ Azul Espuma de Mar','El Asiento Modular Juno te permitirÃ¡ ser tu propio diseÃ±ador, podrÃ¡s combinarlo con distintas opciones, tamaÃ±os, mover y hasta dar con la composiciÃ³n ideal.',1199,'1607091898.jpg',10,1,'PequeÃ±o','verde'),(553,'Asiento Modular Juno â€“ MarrÃ³n','El Asiento Modular Juno te permitirÃ¡ ser tu propio diseÃ±ador, podrÃ¡s combinarlo con distintas opciones, tamaÃ±os, mover y hasta dar con la composiciÃ³n ideal.',849,'1607091934.jpg',10,1,'PequeÃ±o','Fucsia'),(554,'Conjunto de SofÃ¡ Esquinero Modular Mortimer â€“ Azul Puerto','El SofÃ¡ Esquinero Modular Mortimer â€“ Azul Puerto te darÃ¡ la oportunidad de jugar con tu imaginaciÃ³n creando innumerables composiciones, podrÃ¡s utilizar las modulares por si solas o emparejando a una con la otra.',3499,'1607093640.jpg',10,1,'Grande','negro'),(555,'Conjunto de SofÃ¡ Esquinero Modular Mortimer â€“ Gris foca','El SofÃ¡ Esquinero Modular Mortimer â€“ Gris Foca te darÃ¡ la oportunidad para jugar con tu imaginaciÃ³n creando innumerables composiciones, podrÃ¡s utilizarlo solos o emparejando a uno con el otro.',3499,'1607093679.jpg',10,1,'Grande','negro'),(556,'SofÃ¡ con Chaise Longue a la Izquierda Herman â€“ Gris','Descubre el placer de estar cÃ³modo con el SofÃ¡ con Chaise Longue a la Izquierda Herman â€“ Gris . Cuenta con un diseÃ±o Multifuncional donde se combina perfectamente la madera y la tapiceria en un sobrio color Gris a un moderno estilo europeo. Por su elegante diseÃ±o sera facil su cominaciÃ³n a cualquier ambiente.',2799,'1607093729.jpg',10,3,'Grande','negro'),(557,'SofÃ¡ con Chaise Longue a la Izquierda Herman â€“ Verde Bosque','Descubre el placer de estar cÃ³modo con el SofÃ¡ con Chaise Longue a la Izquierda Herman â€“ Verde Bosque . Cuenta con un diseÃ±o Multifuncional donde se combina perfectamente la madera y la tapiceria en un sobrio color Gris a un moderno estilo europeo. Por su elegante diseÃ±o sera facil su cominaciÃ³n a cualquier ambiente.',2799,'1607093761.jpg',10,1,'Grande','negro'),(558,'SofÃ¡ con Chaise Longue a la Izquierda Monterosso â€“ Gris Marengo','El SofÃ¡ con Chaise Longue a la Izquierda Monterosso es espacioso, para que estÃ©s mÃ¡s cÃ³modo con quienes amas, sencillo diseÃ±o que se ajusta perfectamente al espacio que prefieras, combinÃ¡ndolo con demÃ¡s piezas de la misma colecciÃ³n.',3199,'1607093799.jpg',10,1,'Grande','negro'),(559,'SofÃ¡ de Esquina Rufus â€“ Amarillo Mostaza','Descubre el placer de estar cÃ³modo con el SofÃ¡ de Esquina Rufus. Cuenta con un diseÃ±o Multifuncional donde se combina perfectamente la madera y la tapiceria a un estilo Vintage. Por su elegante diseÃ±o sera fÃ¡cil adaptarlo a cualquier ambiente.',2899,'1607093832.jpg',10,1,'Grande','amarillo'),(560,'SofÃ¡ de Esquina Rufus â€“ Gris Rinoceronte','Descubre el placer de estar cÃ³modo con el SofÃ¡ de Esquina Rufus. Cuenta con un diseÃ±o Multifuncional donde se combina perfectamente la madera y la tapiceria en un sobrio color Gris a un estilo Vintage. Por su elegante diseÃ±o sera facil adaptarlo a cualquier am',2899,'1607093874.jpg',10,1,'Grande','negro'),(561,'SofÃ¡ Esquinero Trent â€“ Azul Lavado','El SofÃ¡ Esquinero Trent es una pieza que te permite diseÃ±ar tu propio ambiente y administrar el espacio en tu hogar, ya que puedes combinarlo con demÃ¡s de la misma colecciÃ³n u otros modulares segÃºn tu necesidad.',3399,'1607093912.jpg',10,3,'Grande','negro'),(562,'SofÃ¡ Esquinero Trent â€“ Gris Lavado','El SofÃ¡ Esquinero Trent es una pieza que te permite diseÃ±ar tu propio ambiente y administrar el espacio en tu hogar, ya que puedes combinarlo con demÃ¡s de la misma colecciÃ³n u otros modulares segÃºn tu necesidad',3399,'1607093939.jpg',10,3,'Grande','negro'),(563,'SofÃ¡ Esquinero a la Derecha Kiva â€“ Azul Egeo','El SofÃ¡ Esquinero a la Derecha Kiva que ofrece Yolodecoro Le proporcionarÃ¡ un toque elegante y moderno a tu sala, Sumergete en sus amplios y mullidos asientos y disfruta de la hospitalidad y del confort de este esquinero.',2799,'1607094703.jpg',10,3,'Grande','verde'),(564,'SofÃ¡ Esquinero a la Derecha Kiva â€“ Gris Granizo','El SofÃ¡ Esquinero a la Derecha Kiva que ofrece Yolodecoro Le proporcionarÃ¡ un toque elegante y moderno a tu sala, Sumergete en sus amplios y mullidos asientos y disfruta de la hospitalidad y del confort de este esquinero.',2799,'1607094732.jpg',10,3,'Grande','negro'),(565,'SofÃ¡ Esquinero con Chaise Longue a la Derecha Monterosso â€“ MarrÃ³n','El SofÃ¡ Esquinero con Chaise Longue a la Derecha Monterosso es espacioso, para que estÃ©s mÃ¡s cÃ³modo con quienes amas, sencillo diseÃ±o que se ajusta perfectamente al espacio que prefieras, combinÃ¡ndolo con demÃ¡s piezas de la misma colecciÃ³n.',4199,'1607094765.jpg',10,3,'Grande','verde'),(566,'SofÃ¡ Esquinero con Chaise Longue a la Derecha Ariana â€“ Azul Zafiro','El SofÃ¡ Esquinero con Chaise Longue a la Derecha Ariana â€“ Azul Zafiro que ofrece Yolodecoro es para los amantes del buen espacio; su aspecto se vuelve irresistible por sus delicadas lineas, con diseÃ±o practico. CÃ³modo y espacioso, ideal para compartir con amigos y familia en el espacio de tu preferencia.',2499,'1607094792.jpg',10,2,'Grande','negro'),(567,'SofÃ¡ Esquinero con Chaise Longue a la Derecha Dallas â€“ Azul Marino','El SofÃ¡ Esquinero con Chaise Longue a la Derecha Dallas que ofrece Yolodecoro es para los amantes del buen espacio; su aspecto se vuelve irresistible por sus asientos profundos y aroma, reflejan la esencia de esta pieza. CÃ³modo y espacioso, ideal para compartir con amigos y familia en el espacio de tu preferencia.',2599,'1607094820.jpg',10,2,'Grande','negro'),(568,'SofÃ¡ Esquinero con Chaise Longue a la Derecha Dallas â€“ Gris Cemento','El SofÃ¡ Esquinero con Chaise Longue a la Derecha Dallas que ofrece Yolodecoro es para los amantes del buen espacio; su aspecto se vuelve irresistible por sus asientos profundos y aroma, reflejan la esencia de esta pieza. CÃ³modo y espacioso, ideal para compartir con amigos y familia en el espacio de tu preferencia',2599,'1607094853.jpg',10,2,'Grande','negro'),(569,'HYS SALA 3-2-1 + MESA CENTRO VELO','HYS SALA 3-2-1 + MESA CENTRO VELO Excelente Juego de sala con un acabado detallista al estilo Romano: Detalle: Sofa 3 cuerpos color: Varios colores Tapiz: Ultracuero con microfibra relleno: Espuma zetaflex resortes y algodÃ³n y estructura: Tornillo + MDF CaracterÃ­stica: Brazos anchos Respaldar: Espuma 20 Kg/m3 Sofa 2 cuerpos color: Varios colores Tapiz: Ultracuero con microfibra relleno: Espuma zetaflex resortes y algodÃ³n y estructura: Tornillo + MDF',1599,'1607095878.jpg',10,3,'Mediano','negro'),(570,'SECCIONAL FREZIA + PUFF - PLOMO','Decora cada rincÃ³n de tu hogar con los muebles Decohome donde nos caracterizamos por ofrecer productos de altos estandares de calidad en tiempos de entrega reducidos. Comienza a embellecer mucho mas tu hogar con este hermoso SECCIONAL FREZIA + PUFF - Plomo el cual posee las siguientes caracterÃ­sticas: Madera tornillo Relleno espuma y algodÃ³n industrial Patas de madera Tapiz Iker.',969,'1607095926.jpg',10,3,'Mediano','negro'),(571,'HYS SALA 3-2-1 + MESA CENTRO VELO','Excelente Juego de sala con un acabado detallista al estilo Romano: Detalle: Sofa 3 cuerpos color: Varios colores Tapiz: Ultracuero con microfibra relleno: Espuma zetaflex resortes y algodÃ³n y estructura: Tornillo + MDF CaracterÃ­stica: Brazos anchos Respaldar: Espuma 20 Kg/m3 Sofa 2 cuerpos color: Varios colores Tapiz: Ultracuero con microfibra relleno: Espuma zetaflex resortes y algodÃ³n y estructura: Tornillo + MDF.',2999,'1607095988.jpg',10,3,'Grande','negro'),(572,'HYS SALA 321 SENA ULTRACUERO','Excelente Juego de sala con un acabado detallista al estilo Vaquero : Detalle: Sofa 3 cuerpos color: MarrÃ³n Tapiz: Ultracuero relleno: Espuma paraiso resorte y algodÃ³n y estructura: Pino + MDF CaracterÃ­stica: Patas de madera / Asiento: Espuma 23 Kg/m3 Sofa 2 cuerpos color: MarrÃ³n Tapiz: Ultracuero relleno: Espuma paraiso resorte y algodÃ³n y estructura: Pino + MDF CaracterÃ­stica: Respaldar: Espuma 20 Kg/m3 / Patas de madera Sofa 1 cuerpos color: MarrÃ³n Tapiz: Ultracuero relleno: Espuma paraiso resorte y algodÃ³n y estructura: Pino + MDF CaracterÃ­stica: Asiento: Espuma 23 Kg/m3 / Respaldar: Espuma 20 Kg/m3',2399,'1607096033.jpg',10,3,'Grande','Fucsia'),(573,'Juego de Sala Lisboa 3-2-1 Cuerpos','Excelente Juego de sala con un acabado detallista al estilo Vaquero : Detalle: Sofa 3 cuerpos color: MarrÃ³n Tapiz: Ultracuero relleno: Espuma paraiso resorte y algodÃ³n y estructura: Pino + MDF CaracterÃ­stica: Patas de madera / Asiento: Espuma 23 Kg/m3 Sofa 2 cuerpos color: MarrÃ³n Tapiz: Ultracuero relleno: Espuma paraiso resorte y algodÃ³n y estructura: Pino + MDF CaracterÃ­stica: Respaldar: Espuma 20 Kg/m3 / Patas de madera Sofa 1 cuerpos color: MarrÃ³n Tapiz: Ultracuero relleno: Espuma paraiso resorte y algodÃ³n y estructura: Pino + MDF CaracterÃ­stica: Asiento: Espuma 23 Kg/m3 / Respaldar: Espuma 20 Kg/m3',2199,'1607096359.jpg',10,3,'Mediano','negro'),(574,'Juego de Sala Alaska 3-2-1 Cuerpos','Excelente Juego de sala con un acabado detallista al estilo Vaquero : Detalle: Sofa 3 cuerpos color: MarrÃ³n Tapiz: Ultracuero relleno: Espuma paraiso resorte y algodÃ³n y estructura: Pino + MDF CaracterÃ­stica: Patas de madera / Asiento: Espuma 23 Kg/m3 Sofa 2 cuerpos color: MarrÃ³n Tapiz: Ultracuero relleno: Espuma paraiso resorte y algodÃ³n y estructura: Pino + MDF CaracterÃ­stica: Respaldar: Espuma 20 Kg/m3 / Patas de madera Sofa 1 cuerpos color: MarrÃ³n Tapiz: Ultracuero relleno: Espuma paraiso resorte y algodÃ³n y estructura: Pino + MDF CaracterÃ­stica: Asiento: Espuma 23 Kg/m3 / Respaldar: Espuma 20 Kg/m3',1599,'1607096395.jpg',10,3,'Mediano','negro'),(575,'Juego de Sala MÃ¡laga 3-1 Cuerpos + Banqueta','Excelente Juego de sala con un acabado detallista al estilo Vaquero : Detalle: Sofa 3 cuerpos color: MarrÃ³n Tapiz: Ultracuero relleno: Espuma paraiso resorte y algodÃ³n y estructura: Pino + MDF CaracterÃ­stica: Patas de madera / Asiento: Espuma 23 Kg/m3 Sofa 2 cuerpos color: MarrÃ³n Tapiz: Ultracuero relleno: Espuma paraiso resorte y algodÃ³n y estructura: Pino + MDF CaracterÃ­stica: Respaldar: Espuma 20 Kg/m3 / Patas de madera Sofa 1 cuerpos color: MarrÃ³n Tapiz: Ultracuero relleno: Espuma paraiso resorte y algodÃ³n y estructura: Pino + MDF CaracterÃ­stica: Asiento: Espuma 23 Kg/m3 / Respaldar: Espuma 20 Kg/m3',1899,'1607096458.jpg',10,3,'Mediano','negro'),(576,'Juego de Sala Gales 3-2-1 Cuerpos','Excelente Juego de sala con un acabado detallista al estilo Vaquero : Detalle: Sofa 3 cuerpos color: MarrÃ³n Tapiz: Ultracuero relleno: Espuma paraiso resorte y algodÃ³n y estructura: Pino + MDF CaracterÃ­stica: Patas de madera / Asiento: Espuma 23 Kg/m3 Sofa 2 cuerpos color: MarrÃ³n Tapiz: Ultracuero relleno: Espuma paraiso resorte y algodÃ³n y estructura: Pino + MDF CaracterÃ­stica: Respaldar: Espuma 20 Kg/m3 / Patas de madera Sofa 1 cuerpos color: MarrÃ³n Tapiz: Ultracuero relleno: Espuma paraiso resorte y algodÃ³n y estructura: Pino + MDF CaracterÃ­stica: Asiento: Espuma 23 Kg/m3 / Respaldar: Espuma 20 Kg/m3',1599,'1607096490.jpg',10,3,'Mediano','negro'),(577,'Juego de Sala Spring 3-2 Cuerpos','Excelente Juego de sala con un acabado detallista al estilo Vaquero : Detalle: Sofa 3 cuerpos color: MarrÃ³n Tapiz: Ultracuero relleno: Espuma paraiso resorte y algodÃ³n y estructura: Pino + MDF CaracterÃ­stica: Patas de madera / Asiento: Espuma 23 Kg/m3 Sofa 2 cuerpos color: MarrÃ³n Tapiz: Ultracuero relleno: Espuma paraiso resorte y algodÃ³n y estructura: Pino + MDF CaracterÃ­stica: Respaldar: Espuma 20 Kg/m3 / Patas de madera Sofa 1 cuerpos color: MarrÃ³n Tapiz: Ultracuero relleno: Espuma paraiso resorte y algodÃ³n y estructura: Pino + MDF CaracterÃ­stica: Asiento: Espuma 23 Kg/m3 / Respaldar: Espuma 20 Kg/m3',1299,'1607096519.jpg',10,3,'Mediano','verde'),(578,'Juego de Sala James 3-2-1 Cuerpos','Excelente Juego de sala con un acabado detallista al estilo Vaquero : Detalle: Sofa 3 cuerpos color: MarrÃ³n Tapiz: Ultracuero relleno: Espuma paraiso resorte y algodÃ³n y estructura: Pino + MDF CaracterÃ­stica: Patas de madera / Asiento: Espuma 23 Kg/m3 Sofa 2 cuerpos color: MarrÃ³n Tapiz: Ultracuero relleno: Espuma paraiso resorte y algodÃ³n y estructura: Pino + MDF CaracterÃ­stica: Respaldar: Espuma 20 Kg/m3 / Patas de madera Sofa 1 cuerpos color: MarrÃ³n Tapiz: Ultracuero relleno: Espuma paraiso resorte y algodÃ³n y estructura: Pino + MDF CaracterÃ­stica: Asiento: Espuma 23 Kg/m3 / Respaldar: Espuma 20 Kg/m3',2499,'1607096546.jpg',10,3,'Mediano','Marron'),(579,'Juego de Sala HaitÃ­ 3-2-1 Cuerpos','Excelente Juego de sala con un acabado detallista al estilo Vaquero : Detalle: Sofa 3 cuerpos color: MarrÃ³n Tapiz: Ultracuero relleno: Espuma paraiso resorte y algodÃ³n y estructura: Pino + MDF CaracterÃ­stica: Patas de madera / Asiento: Espuma 23 Kg/m3 Sofa 2 cuerpos color: MarrÃ³n Tapiz: Ultracuero relleno: Espuma paraiso resorte y algodÃ³n y estructura: Pino + MDF CaracterÃ­stica: Respaldar: Espuma 20 Kg/m3 / Patas de madera Sofa 1 cuerpos color: MarrÃ³n Tapiz: Ultracuero relleno: Espuma paraiso resorte y algodÃ³n y estructura: Pino + MDF CaracterÃ­stica: Asiento: Espuma 23 Kg/m3 / Respaldar: Espuma 20 Kg/m3',2099,'1607096576.jpg',10,3,'Mediano','negro');
/*!40000 ALTER TABLE `productos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `productos_venta`
--

DROP TABLE IF EXISTS `productos_venta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `productos_venta` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_venta` int(11) NOT NULL,
  `id_producto` int(11) NOT NULL,
  `cantidad` double NOT NULL,
  `precio` double NOT NULL,
  `subtotal` double NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=148 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `productos_venta`
--

LOCK TABLES `productos_venta` WRITE;
/*!40000 ALTER TABLE `productos_venta` DISABLE KEYS */;
INSERT INTO `productos_venta` VALUES (133,133,536,1,1599,1599),(134,134,537,1,2499,2499),(135,135,536,2,699,1398),(136,136,537,1,1599,1599),(137,137,538,1,2199,2199),(138,138,536,2,650,1300),(139,139,539,1,1199,1199),(140,140,536,2,500,1000),(141,141,536,2,599,1198),(142,142,536,1,699,699),(143,143,536,1,599,599),(144,144,541,1,950,950),(145,152,537,1,850,850),(146,153,537,1,850,850),(147,154,539,1,800,800);
/*!40000 ALTER TABLE `productos_venta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuario`
--

DROP TABLE IF EXISTS `usuario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `usuario` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(200) NOT NULL,
  `telefono` varchar(200) NOT NULL,
  `email` varchar(200) NOT NULL,
  `password` varchar(100) NOT NULL,
  `img_perfil` varchar(300) NOT NULL,
  `nivel` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=193 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuario`
--

LOCK TABLES `usuario` WRITE;
/*!40000 ALTER TABLE `usuario` DISABLE KEYS */;
INSERT INTO `usuario` VALUES (97,'ANGEL JESUSDIAZ RODRIGUEZ ','907055352','andiro90@gmail.com','2f99bfd3be6347ba83cc75bc7226344c079041c0','default.jpg','admin'),(127,'MARIA DIAZ A','985632147','maria2020@hotmail.com','969f44591e9b4494b25db61eb4a64b5c7786029c','default.jpg','cliente'),(128,'Edgar Bolivar Gutierrez','960612047','ebolivar@gmail.com','40bd001563085fc35165329ea1ff5c5ecbdbbeef','default.jpg','cliente'),(135,'Manuel Lopez Vazquez','977418307','mlopez@gmail.com','$2y$10$5Fwf6VPhWpKzSju/fGq.WOou1TyP2azJa6fOaYwft.2UGNrxoDSxi','default.jpg','cliente'),(136,'Juan Pablo Torres','987643025','juantorres25@gmail.com','f1405b8e61bcea02c60bb1d376b3e57b','default.jpg','cliente'),(170,'Julian Perez Prada','987654321','jperez@hotmail.com','969f44851e9b4494b25db61eb4a64b5c7786029c','default.jpg','usuario'),(171,'Juan Rios del Solar','977418307','juan.rios@gmail.com','d033e22ae348aeb5660fc2140aec35850c4da997','default.jpg','motorizado'),(173,'Jose Luis Perez','986245456','jlperez@gmail.com','a1f9819caf453c801fa3d5793ec6e6798660af24','default.jpg','cliente'),(174,'Mario Salas Meneses','909876543','mario.salas26@gmail.com','a1f9819caf453c801fa3d5793ec6e6798660af24','default.jpg','secretaria'),(175,'Maria del Rosario','908031021','mariadel@gmail.com','4f30e41e37e1fd93eef8cdf97db6fa1a','default.jpg','secretaria'),(176,'Manuel Alonso Pereda','981354015','manuelpereda26@hotmail.com','6598f3a7cbc591032e8117aaafb5c56c','default.jpg','secretaria'),(177,'Juana del Arco Pozo','983604321','juana.pozo02@gmail.com','d8f0b41cef002b569482567a90ebff9c','default.jpg','secretaria'),(178,'Maria del Rosario Alcantara','987635413','maria.rosario10@gmail.com','6598f3a7cbc591032e8117aaafb5c56c','default.jpg','secretaria'),(179,'Juan Vargas Solis','987655415','jvargas300@gmail.com','3a062fb29bc1ed2ec4a0f3ba796e43db61c5d76b','default.jpg','secretaria'),(180,'Pedro Suarez Quiroz','960304320','pedrito.quiroz20@gmail.com','f5d01ba17efacfb48aa7d7dc429be18d021f2243','default.jpg','motorizado'),(181,'Julian de Puente Pereda','965312403','jpuente.p01@gmail.com','6598f3a7cbc591032e8117aaafb5c56c','default.jpg','motorizado'),(182,'Carlos Aquilez Rodriguez','963002315','aquilez.carlos2@gmail.com','9fd6af8aee56738c4735f6cabfb4f09ce885439f','default.jpg','admin'),(183,'Carol Meneses Pinedo','962220124','carol.m01@outlook.com','6598f3a7cbc591032e8117aaafb5c56c','default.jpg','cliente'),(184,'Martin Cardenas Paita','998654240','martincardenas320@outlook.com','a1f9819caf453c801fa3d5793ec6e6798660af24','default.jpg','cliente'),(185,'Mario Saldana Mina','988453212','saldana007@mintra.pe','6598f3a7cbc591032e8117aaafb5c56c','default.jpg','cliente'),(186,'Diego de la Roca','966561210','droca.jan2@gmail.com','6598f3a7cbc591032e8117aaafb5c56c','default.jpg','cliente'),(187,'Jesus Meneses Palma','987774001','jesus.meneses1@hotmail.com','6598f3a7cbc591032e8117aaafb5c56c','default.jpg','cliente'),(188,'Hugo Solis Palma','986521420','hugosolpa@gmail.com','6598f3a7cbc591032e8117aaafb5c56c','default.jpg','cliente'),(189,'Marco Ponse de Leon','900856116','marco.ponse23@outlook.com','6598f3a7cbc591032e8117aaafb5c56c','default.jpg','cliente'),(190,'Anahi Sarmiento Vidal','968554100','anahi.sar9@hotmail.com','6598f3a7cbc591032e8117aaafb5c56c','default.jpg','cliente'),(191,'Milagros Vilma del Villar','989898521','mili2053.palma@gmail.com','6598f3a7cbc591032e8117aaafb5c56c','default.jpg','cliente'),(192,'Karina Aponte Villegas','999551245','karina02.aponte@hotmail.com','6598f3a7cbc591032e8117aaafb5c56c','default.jpg','cliente');
/*!40000 ALTER TABLE `usuario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ventas`
--

DROP TABLE IF EXISTS `ventas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ventas` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_usuario` int(11) NOT NULL,
  `total` double NOT NULL,
  `fecha` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `status` varchar(20) DEFAULT NULL,
  `id_pago` int(11) DEFAULT NULL,
  `id_cupon` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=155 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ventas`
--

LOCK TABLES `ventas` WRITE;
/*!40000 ALTER TABLE `ventas` DISABLE KEYS */;
INSERT INTO `ventas` VALUES (133,130,740,'2020-10-29 08:10:58','Entregago',9,0),(134,130,900,'2020-10-29 08:10:18','Entregago',10,4),(138,131,1200,'2020-11-03 08:11:47','Entregago',11,0),(139,131,800,'2020-11-04 10:11:09','Entregago',12,0),(143,131,1559,'2020-11-04 11:11:21','Entregago',16,0),(151,171,1566,'2020-11-16 02:11:39','Preparando',11,0),(152,172,850,'2020-11-17 14:11:34','Preparando',NULL,0),(153,173,850,'2020-11-17 14:11:25','Entregado',NULL,0),(154,173,800,'2020-11-17 15:11:41','Entregado',NULL,0);
/*!40000 ALTER TABLE `ventas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Final view structure for view `demo`
--

/*!50001 DROP VIEW IF EXISTS `demo`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `demo` AS select `productos`.`nombre` AS `nombre`,`productos_venta`.`cantidad` AS `cantidad`,sum(`productos_venta`.`subtotal`) AS `SUM(subtotal)` from (`productos_venta` join `productos` on((`productos_venta`.`id_producto` = `productos`.`id`))) group by `productos_venta`.`id_producto` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `ppendientes`
--

/*!50001 DROP VIEW IF EXISTS `ppendientes`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `ppendientes` AS select `t2`.`pais` AS `pais`,`t2`.`direccion` AS `direccion`,`t1`.`nombre` AS `nombre`,`t0`.`status` AS `status` from ((`ventas` `t0` join `usuario` `t1` on((`t1`.`id` = `t0`.`id_usuario`))) join `envios` `t2` on((`t2`.`id_venta` = `t0`.`id`))) where (`t0`.`status` = 'Preparando') */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-12-05 23:18:31
