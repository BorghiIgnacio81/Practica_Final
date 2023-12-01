<?php
include_once 'Conectar.php';

class Pedidos_modelo 
{
    static public function get_pedidos_modelo(){
        try{ 
            $consulta = Conectar::conexion()->prepare("select * from pedidos");
            $consulta->execute();
            $resultados = $consulta->fetchAll(PDO::FETCH_ASSOC);
            if(count($resultados)> 0)
                return $resultados;
            else
                return null;
        }
        catch(Exception $e){
            return null;
        }
    }
    static public function nuevo_libro_pedido_modelo($pedido){
        try {
            $consulta = Conectar::conexion()->prepare("CALL `InsertarLibroYPedido`(
                :titulo,
                :idAutor,
                :idEditorial, 
                :ubicacionFisica, 
                :lugarEdicion, 
                :anio, 
                :serie, 
                :observaciones, 
                :idMateria,
                :idUsuario,
                :cantidad,
                :fechaPedido)");
           
            $consulta->bindParam(":titulo", $pedido["titulo"], PDO::PARAM_STR);
            $consulta->bindParam(":idAutor", $pedido["idAutor"], PDO::PARAM_STR);
            $consulta->bindParam(":idEditorial", $pedido["idEditorial"], PDO::PARAM_STR);
            $consulta->bindParam(":ubicacionFisica", $pedido["ubicacionFisica"], PDO::PARAM_STR);
            $consulta->bindParam(":lugarEdicion", $pedido["lugarEdicion"], PDO::PARAM_STR);
            $consulta->bindParam(":anio", $pedido["anio"], PDO::PARAM_INT);
            $consulta->bindParam(":serie", $pedido["serie"], PDO::PARAM_INT);
            $consulta->bindParam(":observaciones", $pedido["observaciones"], PDO::PARAM_STR);
            $consulta->bindParam(":idMateria", $pedido["idMateria"], PDO::PARAM_STR);
            $consulta->bindParam(":idUsuario", $pedido["idUsuario"], PDO::PARAM_INT);
            $consulta->bindParam(":cantidad", $pedido["cantidad"], PDO::PARAM_INT);
            $consulta->bindParam(":fechaPedido", $pedido["fechaPedido"], PDO::PARAM_STR);

            $consulta->execute();
            
            return true;
        
        } catch (Exception $e) {
            return false;
        }
    }
    static public function eliminar_pedido_modelo($idPedido){
        try {
            $consulta = Conectar::conexion()->prepare(" CALL eliminarPedido(:idPedido)");
            $consulta->bindParam(":idPedido", $idPedido, PDO::PARAM_INT);
            $consulta->execute();
            return true;
        
        }catch (Exception $e) {
            return false;
        }
    }
    static public function editar_pedido_modelo($pedido){
        try{
            $consulta = Conectar::conexion()->prepare(" CALL `editarLibro`(
                :idPedido, 
                :libro, 
                :usuario, 
                :cantidad, 
                :fechaPedido)");

            $consulta->bindParam(":idPedido", $pedido["idPedido"], PDO::PARAM_INT); //
            $consulta->bindParam(":libro", $pedido["libro"], PDO::PARAM_INT;
            $consulta->bindParam(":usuario", $pedido["usuario"], PDO::PARAM_INT);
            $consulta->bindParam(":cantidad", $pedido["cantidad"], PDO::PARAM_INT);
            $consulta->bindParam(":fechaPedido", $pedido["fechaPedido"], PDO::PARAM_STR);
            
            $consulta->execute();
            
            return true;
            
        } catch (Exception $e) {
            return false;
        }
    }

}