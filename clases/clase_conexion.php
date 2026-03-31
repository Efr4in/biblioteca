<?php 
class clase_conexion{

  var $conect;
     function clase_conexion(){
	 }
	 
	 function getCon(){
	 return $this->conect;
	 }
	 
	 function conectarse() {
		
		 if(!($con=@mysqli_connect("localhost","root","","bibliotecauni")))
		 {
			 echo"Error al conectar a la base de datos";	
			 exit();
		  }
		   $this->conect=$con;
		   return true;	
	 }
}

?>
