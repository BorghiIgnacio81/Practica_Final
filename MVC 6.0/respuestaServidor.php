<?php

$libro = array(
    'isbn' => '1234512',
    'titulo' => 'Caperucita y el lobo',
    'autor' => 'Julio Cortazar',
    'ubicacionFisica' => 'A33',
    'editorial' => 'Santillana',
    'materia' => 'Lengua y literatura',
    'lugarEdicion' =>  'Buenos Aires',
    'anio' => '2000',
    'serie' => 'Ficcion',
    'observaciones' => 'Un libro muy interesante'
);

$arreglo = array($libro); 
array_push($arreglo, $libro);

echo json_encode($arreglo);

?>