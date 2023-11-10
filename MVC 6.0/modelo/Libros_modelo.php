<?php
include_once 'Conectar.php';
class Libros_modelo {
    static public function get_libros_modelo($pTitulo) {          
       
        try {
            $consulta = Conectar::conexion()->prepare("CALL `LibrosCompletoXTitulo`(:pTitulo)");
            $consulta->bindParam(":pTitulo", $pTitulo, PDO::PARAM_STR);
            $consulta->execute();
            
            $resultados = $consulta->fetchAll(PDO::FETCH_ASSOC);
            if (empty($resultados)){
                echo json_encode(["error" => "no hay resultadOOOOS"]);
            }else{
                echo json_encode(["respuesta" => $resultados]);
            }
            // return $resultados;
            
            // $data = array();
            // for($i = 0; $i < count($aux); $i++){
            //     array_push($data, $aux[$i]);
            // }

            // return $data;
            
            
        } catch (PDOException $e) {
            echo "Error PDO!!!: " . $e->getMessage();
        }
    }    
}
?>
