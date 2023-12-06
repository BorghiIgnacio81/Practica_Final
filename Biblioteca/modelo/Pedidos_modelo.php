<?php
include_once 'Conectar.php';

class Pedidos_modelo 
{
    static public function get_pedidos_modelo($filtros){
        try{ 
            $order = "";
            if($filtros)
                $order = "ORDER BY ".$filtros;

            if($_SESSION["tipoUsuario"] == 1){
                $consulta = Conectar::conexion()->prepare("SELECT  p.idLibro, p.idPedido, p.idUsuario, cantidad, fechaPedido,
                titulo, l.idAutor, l.idEditorial, ubicacionFisica, lugarEdicion, anio, serie, observaciones, l.idMateria,
                activo, nombre, apellido, materia, autor, editorial, dni, direccion, telefono, email, fechaNac, penalidadDesde,
                penalidadHasta, tipoUsuario    
                FROM (((((pedidos AS p
                INNER JOIN libros AS l ON p.idLibro = l.idLibro)
                INNER JOIN usuarios AS u ON p.idUsuario = u.idUsuarios)
                INNER JOIN materias AS m ON l.idMateria = m.idMateria)
                INNER JOIN autores AS a ON l.idAutor = a.idAutor)
                INNER JOIN editoriales AS e ON l.idEditorial = e.idEditorial) 
                WHERE p.idUsuario = ".$_SESSION['idUsuarios']." $order");
            }else{
                $consulta = Conectar::conexion()->prepare("SELECT  p.idLibro, p.idPedido, p.idUsuario, cantidad, fechaPedido,
                titulo, l.idAutor, l.idEditorial, ubicacionFisica, lugarEdicion, anio, serie, observaciones, l.idMateria,
                activo, nombre, apellido, materia, autor, editorial, dni, direccion, telefono, email, fechaNac, penalidadDesde,
                penalidadHasta, tipoUsuario    
                FROM (((((pedidos AS p
                INNER JOIN libros AS l ON p.idLibro = l.idLibro)
                INNER JOIN usuarios AS u ON p.idUsuario = u.idUsuarios)
                INNER JOIN materias AS m ON l.idMateria = m.idMateria)
                INNER JOIN autores AS a ON l.idAutor = a.idAutor)
                INNER JOIN editoriales AS e ON l.idEditorial = e.idEditorial) $order");
            }
            
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
                :lugarEdicion, 
                :anio, 
                :serie, 
                :observaciones, 
                :idMateria,
                :idUsuario,
                :cantidad)");
           
            $consulta->bindParam(":titulo", $pedido["titulo"], PDO::PARAM_STR);
            $consulta->bindParam(":idAutor", $pedido["idAutor"], PDO::PARAM_STR);
            $consulta->bindParam(":idEditorial", $pedido["idEditorial"], PDO::PARAM_STR);
            $consulta->bindParam(":lugarEdicion", $pedido["lugarEdicion"], PDO::PARAM_STR);
            $consulta->bindParam(":anio", $pedido["anio"], PDO::PARAM_INT);
            $consulta->bindParam(":serie", $pedido["serie"], PDO::PARAM_INT);
            $consulta->bindParam(":observaciones", $pedido["observaciones"], PDO::PARAM_STR);
            $consulta->bindParam(":idMateria", $pedido["idMateria"], PDO::PARAM_STR);
            $consulta->bindParam(":idUsuario", $_SESSION['idUsuarios'], PDO::PARAM_INT);
            $consulta->bindParam(":cantidad", $pedido["cantidad"], PDO::PARAM_INT);

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
            $consulta = Conectar::conexion()->prepare(" CALL `editarPedido`(
                :idPedido,
                :idLibro, 
                :titulo,
                :idAutor,
                :idEditorial, 
                :lugarEdicion, 
                :anio, 
                :serie, 
                :observaciones, 
                :idMateria, 
                :cantidad)");

            $consulta->bindParam(":idPedido", $pedido["idPedido"], PDO::PARAM_INT); 
            $consulta->bindParam(":idLibro", $pedido["idLibro"], PDO::PARAM_INT);
            $consulta->bindParam(":titulo", $pedido["titulo"], PDO::PARAM_STR);
            $consulta->bindParam(":idAutor", $pedido["idAutor"], PDO::PARAM_STR);
            $consulta->bindParam(":idEditorial", $pedido["idEditorial"], PDO::PARAM_STR);
            $consulta->bindParam(":lugarEdicion", $pedido["lugarEdicion"], PDO::PARAM_STR);
            $consulta->bindParam(":anio", $pedido["anio"], PDO::PARAM_INT);
            $consulta->bindParam(":serie", $pedido["serie"], PDO::PARAM_INT);
            $consulta->bindParam(":observaciones", $pedido["observaciones"], PDO::PARAM_STR);
            $consulta->bindParam(":idMateria", $pedido["idMateria"], PDO::PARAM_STR);
            $consulta->bindParam(":cantidad", $pedido["cantidad"], PDO::PARAM_INT);
            
            $consulta->execute();
            
            return true;
            
        } catch (Exception $e) {
            return false;
        }
    }
    static public function get_pedidos_confirmar_modelo($idLibro){
        try{ 
            $consulta = Conectar::conexion()->prepare(" CALL pedidoConfirmar(:idLibro");
            $consulta->bindParam(":idLibro", $idLibro, PDO::PARAM_INT);
            $consulta->execute();
            return true;
        
        }catch (Exception $e) {
            return false;
        }
    }

}