<?php

//============================================================+
// File name   : example_061.php
// Begin       : 2010-05-24
// Last Update : 2014-01-25
//
// Description : Example 061 for TCPDF class
//               XHTML + CSS
//
// Author: Nicola Asuni
//
// (c) Copyright:
//               Nicola Asuni
//               Tecnick.com LTD
//               www.tecnick.com
//               info@tecnick.com
//============================================================+

/**
 * Creates an example PDF TEST document using TCPDF
 * @package com.tecnick.tcpdf
 * @abstract TCPDF - Example: XHTML + CSS
 * @author Nicola Asuni
 * @since 2010-05-25
 */

// Include the main TCPDF library (search for installation path).
require_once('../tcpdf.php');

// create new PDF document
$pdf = new TCPDF(PDF_PAGE_ORIENTATION, PDF_UNIT, PDF_PAGE_FORMAT, true, 'UTF-8', false);

// set document information
$pdf->SetTitle('Informe Biblioteca - Libros pedidos');

// set default header data
//$pdf->SetHeaderData(PDF_HEADER_LOGO, PDF_HEADER_LOGO_WIDTH, PDF_HEADER_TITLE.' 061', PDF_HEADER_STRING);

// set header and footer fonts
$pdf->setHeaderFont(Array(PDF_FONT_NAME_MAIN, '', PDF_FONT_SIZE_MAIN));
$pdf->setFooterFont(Array(PDF_FONT_NAME_DATA, '', PDF_FONT_SIZE_DATA));

// set default monospaced font
$pdf->SetDefaultMonospacedFont(PDF_FONT_MONOSPACED);

// set margins
$pdf->SetMargins(PDF_MARGIN_LEFT, PDF_MARGIN_TOP, PDF_MARGIN_RIGHT);
$pdf->SetHeaderMargin(PDF_MARGIN_HEADER);
$pdf->SetFooterMargin(PDF_MARGIN_FOOTER);

// set auto page breaks
$pdf->SetAutoPageBreak(TRUE, PDF_MARGIN_BOTTOM);

// set image scale factor
$pdf->setImageScale(PDF_IMAGE_SCALE_RATIO);

// set some language-dependent strings (optional)
if (@file_exists(dirname(__FILE__).'/lang/eng.php')) {
    require_once(dirname(__FILE__).'/lang/eng.php');
    $pdf->setLanguageArray($l);
}

// ---------------------------------------------------------

// set font
$pdf->SetFont('helvetica', '', 11);

// add a page
$pdf->AddPage();

/* NOTE:
 * *********************************************************
 * You can load external XHTML using :
 *
 * $html = file_get_contents('/path/to/your/file.html');
 *
 * External CSS files will be automatically loaded.
 * Sometimes you need to fix the path of the external CSS.
 * *********************************************************
 */

// define some HTML content with style
$html = <<<EOF
<style>
    h1 {
        color: #333;
        font-size: 24pt;
    }
    table.first {
        color: #003300;
        border: 1px solid #333;
    }
    th{
        color: #FAFAFA;
        border: 1px solid #333;
        background-color: #002040;
        font-size: 9pt;
        text-align: center;
    }
    td {
        border: 1px solid #333;
        background-color: #ffffee;
        padding: 0px 5px;
        font-size: 8pt;
        text-align: center;
    }
</style>

<h1 class="title">SOLICITUD DE LIBROS 2023</h1>

<table class="first">
    <tr>
        <th width="150"><b>PROFESOR</b></th>
        <th width="75"><b>MATERIA</b></th>
        <th width="150"><b>LIBRO</b></th>
        <th width="75"><b>AUTOR</b></th>
        <th width="75"><b>EDITORIAL</b></th>
        <th width="50"><b>CANT.</b></th>
        <th width="65"><b>FECHA</b></th>
    </tr>
    <tr>
        <td width="150">Margarita Sanchez</td>
        <td width="75">Literatura</td>
        <td width="150">El Quijote</td>
        <td width="75">Unamuno</td>
        <td width="75">Estrada</td>
        <td width="50">5</td>
        <td width="65">22/11/2023</td>
    </tr>
    <tr>
        <td width="150">Luis Gonzalez</td>
        <td width="75">Matemática</td>
        <td width="150">Calculo diferencial I</td>
        <td width="75">Stallman</td>
        <td width="75">Barco</td>
        <td width="50">10</td>
        <td width="65">21/11/2023</td>
    </tr>
    <tr>
        <td width="150">Lorena Stud</td>
        <td width="75">Psicología</td>
        <td width="150">La mente humana</td>
        <td width="75">Freud</td>
        <td width="75">Pearson</td>
        <td width="50">2</td>
        <td width="65">20/11/2023</td>
    </tr>
</table>
EOF;

// output the HTML content
$pdf->writeHTML($html, true, false, true, false, '');

// reset pointer to the last page
$pdf->lastPage();

// ---------------------------------------------------------

//Close and output PDF document
$pdf->Output('example_061.pdf', 'I');

//============================================================+
// END OF FILE
//============================================================+


?>