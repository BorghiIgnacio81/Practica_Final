<?php
        
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
                if (isset($data["data"])) {
                    //$pTitulo = $data["data"];
                    $respuesta = Pedidos_modelo::get_pedidos_modelo();
                    if($respuesta)
                        echo json_encode($respuesta);
                    else
                        array("status"=>"no");
                }
                break;
            case "add":
                if (isset($data["data"])) {
                    $aux = $data["data"];

                    $pedido = array(
                        "titulo" => $aux["titulo"],
                        "idAutor" => $aux["idAutor"],
                        "idEditorial" => $aux["idEditorial"],
                        "ubicacionFisica" => $aux["cantidad"],
                        "lugarEdicion" => $aux["lugarEdicion"],
                        "anio" => $aux["anio"],
                        "serie" => $aux["serie"],
                        "observaciones" => $aux["observaciones"],
                        "idMateria" => $aux["idMateria"],
                        "idUsuario" => $aux["idUsuario"],
                        "cantidad" => $aux["cantidad"],
                        "fechaPedido" => $aux["fechaPedido"]
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
                   
                    $pedido = array(
                        "idPedido" => $aux["idPedido"],
                        "libro" => $aux["libro"],
                        "usuario" => $aux["usuario"],
                        "cantidad" => $aux["cantidad"],
                        "fechaPedido" => $aux["fechaPedido"]
                                        
                    $respuesta = Pedidos_modelo::editar_pedido_modelo($pedido);
                    if ($respuesta) {
                        echo json_encode(array("status"=>"ok"));
                    }else {
                        echo json_encode(array("status"=>"no"));
                    }
                }
                break;

        }
    }
} 
