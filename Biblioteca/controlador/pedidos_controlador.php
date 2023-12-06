<?php
    session_start();
        
    include_once __DIR__ . '/../modelo/Pedidos_modelo.php';
    set_include_path(get_include_path() . PATH_SEPARATOR . __DIR__ . '/../modelo/');
    include_once 'Pedidos_modelo.php';


    $response = json_decode(file_get_contents('php://input'),true);

    if($response){
        Pedidos_Controlador::get_pedidos_Controlador($response);
    }
class Pedidos_Controlador 
{
    static public function get_pedidos_Controlador($data)
    { 
        switch ($data["funcion"]) {
            case "search":
                $respuesta = Pedidos_modelo::get_pedidos_modelo($data["filtros"]);
                if($respuesta)
                    echo json_encode($respuesta);
                else
                    echo json_encode(array("status"=>"no"));
                
                break;
            case "add":
                if (isset($data["data"])) {
                    $aux = $data["data"];
                    $libro = $aux["libro"];
                    $pedido = array(
                        "titulo" => $libro["titulo"],
                        "autor" => $libro["autor"],
                        "editorial" => $libro["editorial"],
                        "materia" => $libro["materia"],
                        "lugarEdicion" => $libro["lugarEdicion"],
                        "anio" => $libro["anio"],
                        "serie" => $libro["serie"],
                        "observaciones" => $libro["observaciones"],                        
                        "cantidad" => $aux["cantidad"]);
                    $respuesta = Pedidos_modelo::nuevo_libro_pedido_modelo($pedido);
                    if ($respuesta) {
                        echo json_encode(array("status"=>"ok"));
                    }else {
                        echo json_encode(array("status"=>"no"));
                    }
                    break;
                }
            case "del":
                if (isset($data["data"])) {
                    $aux = $data["data"];
                    
                    $idPedido = $aux["idPedido"];
                    
                    $respuesta = Pedidos_modelo::eliminar_pedido_modelo($idPedido);
                    if ($respuesta) {
                        echo json_encode(array("status"=>"ok"));
                    }else {
                        echo json_encode(array("status"=>"no"));
                    }
                    break;
                }
            case "edit":
                if (isset($data["data"])) {
                    $aux = $data["data"];
                    $libro = $aux["libro"];
                    $pedido = array(
                        "idPedido" => $aux["idPedido"],
                        "idLibro" => $libro["idLibro"],
                        "titulo" => $libro["titulo"],
                        "autor" => $libro["autor"],
                        "editorial" => $libro["editorial"],
                        "materia" => $libro["materia"],
                        "lugarEdicion" => $libro["lugarEdicion"],
                        "anio" => $libro["anio"],
                        "serie" => $libro["serie"],
                        "observaciones" => $libro["observaciones"],
                        "cantidad" => $aux["cantidad"]);
                                        
                    $respuesta = Pedidos_modelo::editar_pedido_modelo($pedido);
                    if ($respuesta) {
                        echo json_encode(array("status"=>"ok"));
                    }else {
                        echo json_encode(array("status"=>"no"));
                    }
                }
                break;
            case "confirm":
            if (isset($data["data"])) {
                $aux = $data["data"];
                    
                    $idLibro = $aux["idLibro"];
                    
                    $respuesta = Pedidos_modelo::get_pedidos_confirmar_modelo($idLibro);
                    if ($respuesta) {
                        echo json_encode(array("status"=>"ok"));
                    }else {
                        echo json_encode(array("status"=>"no"));
                    }
                    break;
            }
            case "reject":
                if (isset($data["data"])) {
                    $aux = $data["data"];
                    
                    $idPedido = $aux["idPedido"];
                    
                    $respuesta = Pedidos_modelo::eliminar_pedido_modelo($idPedido);
                    if ($respuesta) {
                        echo json_encode(array("status"=>"ok"));
                    }else {
                        echo json_encode(array("status"=>"no"));
                    }
                    break;
                }

        }
    }
} 
