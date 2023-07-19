<?php

defined('BASEPATH') OR exit('No direct script access allowed');

class Procesos extends MY_Controller {

    function __construct() {

        parent::__construct();
        if(!$this->session->userdata('authorized')){
            redirect(base_url()."login");
        }
        $this->load->library('Cssjs');
        $this->load->model("Model_general");
        $this->load->model("Model_procesos");
        $this->load->helper('Form');
    }

    function inicio() {

        $this->load->library('Framework');
        $this->load->library('Ssp');
        $this->load->database();
        $this->cssjs->set_path_js(base_url() . "assets/js/");
        $this->cssjs->add_js('procesos/dt');

        $json = isset($_GET['json']) ? $_GET['json'] : false;
        $excel = isset($_GET['excel']) ? $_GET['excel'] : false;
        $columns = array(
            //array('db' => 'proc_id', 'dt' => 'Id', 'field' => "proc_id"),
            array('db' => 'proc_nombre', 'dt' => 'Nombre', 'field' => "proc_nombre"),
            array('db' => 'proc_activo', 'dt' => 'Activo', 'field' => "proc_activo"),
            array('db' => 'proc_id', 'dt' => 'DT_RowId', 'field' => "proc_id")
        );

        if ($json||$excel) {

            $json = isset($_GET['json']) ? $_GET['json'] : false;
            $excel = isset($_GET['excel']) ? $_GET['excel'] : false;

            $table = 'procesos';
            $primaryKey = 'proc_id';

            $sql_details = array(
                'user' => $this->db->username,
                'pass' => $this->db->password,
                'db' => $this->db->database,
                'host' => $this->db->hostname
            );

            $condiciones = array();

            $where = count($condiciones) > 0 ? implode(' AND ', $condiciones) : "";
            $data=$this->ssp->simple($_POST, $sql_details, $table, $primaryKey, $columns, $where);
            if($excel){
			echo $this->exportarXLS("Procesos", '', '', $data['data']);
		}else{
			echo json_encode($data);
		}
            exit(0);
        }
        $script['js'] = $this->cssjs->generate_js();
        $datos['columns'] = $columns;
        $this->load->view('header', $script);
        $this->load->view('menu');
        $this->load->view('procesos/inicio', $datos);
        $this->load->view('footer');
    }
function exportarXLS($titulo, $termino, $fecha, $json) {
		$this->load->library('Excel');
		$excel = new Excel($this);
		$objPHPExcel = $excel->excel_init();

		$objPHPExcel->getDefaultStyle()->getFont()->setName('Arial');
		$objPHPExcel->getDefaultStyle()->getFont()->setSize(10);

		$objPHPExcel->setActiveSheetIndex(0);

		$objPHPExcel->getActiveSheet()->getStyle('A1:B6')->getFont()->setBold(true);
		$row = 0;
		$objPHPExcel->getActiveSheet()->mergeCells("A1:F1");
		$objPHPExcel->getActiveSheet()->setCellValue("A1", "REPORTE : " . $titulo);
		$row = 3;
		$objPHPExcel->getActiveSheet()->mergeCells("A{$row}:D{$row}");
		$objPHPExcel->getActiveSheet()->setCellValue("A{$row}", "FECHA CONSULTA:");
		$objPHPExcel->getActiveSheet()->setCellValue("E{$row}", date('d/m/Y H:i'));
		$row++;
		if(!empty($fecha)){
			$objPHPExcel->getActiveSheet()->mergeCells("A{$row}:D{$row}");
			$objPHPExcel->getActiveSheet()->setCellValue("A{$row}", "FILTRO FECHA:");
			$objPHPExcel->getActiveSheet()->setCellValue("E{$row}", $fecha);
			$row++;
		}
		if(!empty($termino)){
			$objPHPExcel->getActiveSheet()->mergeCells("A{$row}:D{$row}");
			$objPHPExcel->getActiveSheet()->setCellValue("A{$row}", "FILTRO TERMINO:");
			$objPHPExcel->getActiveSheet()->setCellValue("E{$row}", "$termino");
			$row++;
		}
		$objPHPExcel->getActiveSheet()->mergeCells("A{$row}:D{$row}");

		PHPExcel_Cell::setValueBinder(new PHPExcel_Cell_AdvancedValueBinder());

		$row += 2;

		$end = $excel->write_table($objPHPExcel, $json, $row-1);

		$objPHPExcel->getActiveSheet()->freezePane("A{$row}");
		$objPHPExcel->getActiveSheet()->getSheetView()->setZoomScale(90);
		$objPHPExcel->getActiveSheet()->setTitle(substr($titulo, 0, 30));
		$objPHPExcel->setActiveSheetIndex(0);
		setcookie("fileDownload", 'true');
		$excel->excel_output($objPHPExcel, $titulo);

	}
    function form($id = 0) {

        if ($id != 0) {
            $id = array("proc_id" => $id);
            $procesos["procesos"] = $this->Model_procesos->getProcesos($id);
            $idd = array("deta_proc_id" => $procesos["procesos"]->proc_id);
            $procesos["detalle"] = $this->Model_procesos->Detalles_procesos_oficina($idd);
            $idq = array("requ_proc_id" => $procesos["procesos"]->proc_id);
            $procesos["requisitos"] = $this->Model_procesos->Requisitos_procesos_oficina($idq);

            $this->load->view('procesos/form', $procesos);
        } else {
            $procesos['proc_activo'] = 'SI';
            $this->load->view('procesos/new_form',$procesos);
        }
    }

    public function form_deta($id = 0) {
        $this->load->helper('Funciones');
        $this->load->model("Model_oficina");

        if ($id != 0) {
            $where = array(
                'deta_id' => $id);
            $datos["deta_proc"] = $this->Model_procesos->getProcesos_detalle($where);
            $datos["oficina"] = select_options($this->Model_oficina->getoficina(), "ofic_id", "ofic_nombre");            
            $this->load->view('procesos/form_deta', $datos);
        } else {
            $proc_id = $_GET['proc_id'];
            $where = array(
                'deta_proc_id' => $proc_id
            );
            $datos["oficina"] = select_options($this->Model_oficina->getoficina(), "ofic_id", "ofic_nombre");
            $datos["proc_id"] = $proc_id;
            $datos["orden"] = $this->Model_procesos->deta_orden($where);
            $this->load->view('procesos/new_form_deta', $datos);
        }
    }
    public function form_requ($id = 0) {

        if ($id != 0) {
            $where = array(
                'requ_id' => $id);
            $datos["requisitos"] = $this->Model_procesos->getProcesos_requisito($where);
            $this->load->view('procesos/form_requ', $datos);
        } else {
            $proc_id = $_GET['proc_id'];
            $where = array(
                'deta_proc_id' => $proc_id
            );
            $datos["proc_id"] = $proc_id;
            $this->load->view('procesos/new_form_requ', $datos);
        }
    }

    public function guardar_detalle() {
        $detalle = $this->input->post('detalle');
        $proceso = $this->input->post('proceso');
        $oficina = $this->input->post('oficina');
        $plazo = $this->input->post('plazo');
        $estado = $this->input->post('estado');
        $orden = $this->input->post('orden');
        $activo = $this->input->post('activo');

        if (isset($activo)) {
            $activo = 'SI';
        } else {
            $activo = 'NO';
        }
        if (isset($detalle)) {
            $datos = array(
                'deta_ofic_id' => $oficina,
                'deta_plazo' => $plazo,
                'deta_activo' => $activo
                );
            $data = $this->Model_general->guardar_edit_registro("proceso_detalle", $datos, array("deta_id" => $detalle));
            if ($data != FALSE):
                $json['exito'] = true;
            else:
                $json['exito'] = false;
                $json['mensaje'] = "Error al guardar los datos";
            endif;
        } else {

            $datos = array(
                "deta_proc_id" => $proceso,
                "deta_ofic_id" => $oficina,
                "deta_plazo" => $plazo,
                "deta_estado" => $estado,
                "deta_orden" => $orden,
                "deta_activo" => $activo
            );
            $datosupdate = array(
                "deta_estado" => 'DERIVAR'
            );
            $this->Model_general->guardar_edit_registro("proceso_detalle", $datosupdate, array("deta_proc_id" => $proceso));
            $data = $this->Model_general->guardar_registro("proceso_detalle", $datos);
            
            if ($data != FALSE):
                $json['id'] = $data["id"];
                $json['exito'] = true;
            else:
                $json['exito'] = false;
                $json['mensaje'] = "Error al guardar los datos";
            endif;
        }
          echo json_encode($json);
    }
    public function guardar_requisito()
    {
        $requisito = $this->input->post('requisito');
        $proceso = $this->input->post('proceso');
        $nombre = $this->input->post('nombre');
        $activo = $this->input->post('activo');

        if (isset($activo)) {
            $activo = 'SI';
        } else {
            $activo = 'NO';
        }
        if (isset($requisito)) {
            $datos = array(
                "requ_nombre" => $nombre,
                "requ_activo" => $activo 
                );
            $data = $this->Model_general->guardar_edit_registro("proceso_requisito", $datos, array("requ_id" => $requisito));
            if ($data != FALSE):
                $json['exito'] = true;
            else:
                $json['exito'] = false;
                $json['mensaje'] = "Error al guardar los datos";
            endif;
        }else{
            $datos = array(
                "requ_proc_id" => $proceso,
                "requ_nombre" => $nombre,
                "requ_activo" => $activo 
                );
            $data = $this->Model_general->guardar_registro("proceso_requisito",$datos);
            if ($data != FALSE):
                $json['id'] = $data["id"];
                $json['exito'] = true;
            else:
                $json['exito'] = false;
                $json['mensaje'] = "Error al guardar los datos";
            endif;
        }
        echo json_encode($json);
    }
    public function guardar() {
        $procesos = $this->input->post('procesos');
        $nombre = $this->input->post('nombre');
        $activo = $this->input->post('activo');
        if (isset($activo)) {
            $activo = 'SI';
        } else {
            $activo = 'NO';
        }

        $datos = array("proc_nombre" => $nombre,
            "proc_activo" => $activo
        );
        if (isset($procesos)) {
            if ($this->Model_general->guardar_edit_registro("procesos", $datos, array("proc_id" => $procesos)) == TRUE):
                $json['exito'] = true;
            else:
                $json['exito'] = false;
                $json['mensaje'] = "Error al actualizar los datos";
            endif;
        }
        else {
            $data = $this->Model_general->guardar_registro("procesos", $datos);
            if ($data != FALSE):
                $json['id'] = $data["id"];
                $json['exito'] = true;
            else:
                $json['exito'] = false;
                $json['mensaje'] = "Error al guardar los datos";
            endif;
        }
        echo json_encode($json);
    }

    public function borrar() {
        $delete = $_POST['data'];
        $table = 'procesos';

        foreach ($delete as $id) {
            $where = array(
                'proc_id' => $id
            );
           if($this->Model_general->borrar($where,$table)!=TRUE){
                $json['exito'] = false;
                $json['mensaje'] = "No se pudo borrar algunos procesos por que estan siendo usados";
            }else{
                $json['exito'] = true;
                $json['mensaje'] = false;
            }
        }
        echo json_encode($json);
    }
    public function borrar_detalle()
    {
        $id = $this->input->post("id");
        $table = "proceso_detalle";
        $where = array('deta_id' => $id );
        $datos = $this->Model_procesos->getProcesos_detalle($where);
        if($datos->deta_estado != "CONCLUIDO"){
            if($this->Model_general->borrar($where,$table)== TRUE)
            {
                $json['exito'] = TRUE;
            }else{
                $json['exito'] = FALSE;
                $json['mensaje'] = "Error al borrar los datos";
            }
        }else{
            $cond = array(
                'deta_orden' => ($datos->deta_orden-1),
                'deta_proc_id' => $datos->deta_proc_id);
            $datosupdate = array('deta_estado' => 'CONCLUIDO' ); 
            $this->Model_general->guardar_edit_registro("proceso_detalle", $datosupdate, $cond);
            if($this->Model_general->borrar($where,$table)== TRUE)
            {
                $json['exito'] = TRUE;
            }else{
                $json['exito'] = FALSE;
                $json['mensaje'] = "Error al borrar los datos";
            }
        }
        echo json_encode($json);
    }
    public function borrar_requisito()
    {
        $id = $this->input->post("id");
        $table = "proceso_requisito";
        $where = array('requ_id' => $id );
        if($this->Model_general->borrar($where,$table)== TRUE)
        {
            $json['exito'] = TRUE;
        }else{
            $json['exito'] = FALSE;
            $json['mensaje'] = "Error al borrar los datos";
        }
        echo json_encode($json);
    }
    function firts_oficina() {
        $response = new StdClass;
        $proceso = $this->input->post('proceso');
        if(empty($proceso))
            exit;
        $where = array("deta_proc_id" => $proceso, "deta_orden" => "1");
        $procesos = $this->Model_procesos->getProcesos_detalle($where);

        $where = array("deta_proc_id" => $proceso, "deta_activo" => "SI");
        $procesos_detalle = $this->Model_procesos->Detalles_procesos_oficina($where);
        foreach ($procesos_detalle as $value) {
            $response->procesos_detalle[] = array("oficina" => $value->ofic_nombre, "plazo" => $value->deta_plazo);
        }

        $where = array("requ_proc_id" => $proceso, "requ_activo" => "SI");
        $procesos_requisito = $this->Model_procesos->Detalles_requisitos($where);
        foreach ($procesos_requisito as $value) {
            $response->procesos_requisito[] = $value->requ_nombre;
        }
        // var_dump($procesos_detalle);
        // var_dump($procesos_requisito);

        $response->oficina = $procesos->deta_ofic_id;

        echo json_encode($response);
    }
    
    function updown(){
        
        $deta = $_POST["id"];
        //echo $deta;
        $tipo = $_POST["tipo"];

        
        if($tipo == "up")
        {
             $where = array('deta_id' => $deta);
             $actual = $this->Model_procesos->getProcesos_detalle($where);
             $orden_actual = $actual->deta_orden;
             
             $proc_actual = $actual->deta_proc_id;
             if($actual->deta_estado=='CONCLUIDO'){
                
                $datosactual = array(
                "deta_estado" => 'DERIVAR',
                "deta_orden" => 0
                );
                $this->Model_general->guardar_edit_registro("proceso_detalle", $datosactual, array("deta_orden" => $orden_actual,"deta_proc_id" => $proc_actual));
                
                $datosup = array(
                "deta_estado" => 'CONCLUIDO',
                "deta_orden" => $orden_actual
                );
                $this->Model_general->guardar_edit_registro("proceso_detalle", $datosup, array("deta_orden" => ($orden_actual-1),"deta_proc_id" => $proc_actual));
                
                $datos = array(
                "deta_orden" => ($orden_actual-1)
                );
                $this->Model_general->guardar_edit_registro("proceso_detalle", $datos, array("deta_orden" => 0,"deta_proc_id" => $proc_actual));

             }else{
                $datosactual = array(
                "deta_orden" => 0
                );
                $this->Model_general->guardar_edit_registro("proceso_detalle", $datosactual, array("deta_orden" => $orden_actual,"deta_proc_id" => $proc_actual));
                
                $datosup = array(
                "deta_orden" => $orden_actual
                );
                $this->Model_general->guardar_edit_registro("proceso_detalle", $datosup, array("deta_orden" => ($orden_actual-1),"deta_proc_id" => $proc_actual));
                
                $datos = array(
                "deta_orden" => ($orden_actual-1)
                );
                $this->Model_general->guardar_edit_registro("proceso_detalle", $datos, array("deta_orden" => 0,"deta_proc_id" => $proc_actual));
                
             }
        }
        else
        {
             $where = array('deta_id' => $deta);
             $actual = $this->Model_procesos->getProcesos_detalle($where);
             $orden_actual = $actual->deta_orden;
             $proc_actual = $actual->deta_proc_id;
             $where1 = array('deta_orden' => ($orden_actual+1),
                             'deta_proc_id' => $proc_actual);
             $down = $this->Model_procesos->getProcesos_detalle($where1);
             //var_dump($down);

             if($down->deta_estado=='CONCLUIDO'){
                
                $datosactual = array(
                "deta_estado" => 'CONCLUIDO',
                "deta_orden" => 0
                );
                $this->Model_general->guardar_edit_registro("proceso_detalle", $datosactual, array("deta_orden" => $orden_actual,"deta_proc_id" => $proc_actual));
                
                $datosdown = array(
                "deta_estado" => 'DERIVAR',
                "deta_orden" => $orden_actual
                );
                $this->Model_general->guardar_edit_registro("proceso_detalle", $datosdown, array("deta_orden" => ($orden_actual+1),"deta_proc_id" => $proc_actual));
                
                $datos = array(
                "deta_orden" => ($orden_actual+1)
                );
                $this->Model_general->guardar_edit_registro("proceso_detalle", $datos, array("deta_orden" => 0,"deta_proc_id" => $proc_actual));

             }else{
                $datosactual = array(
                "deta_orden" => 0
                );
                $this->Model_general->guardar_edit_registro("proceso_detalle", $datosactual, array("deta_orden" => $orden_actual,"deta_proc_id" => $proc_actual));
                
                $datosdown = array(
                "deta_orden" => $orden_actual
                );
                $this->Model_general->guardar_edit_registro("proceso_detalle", $datosdown, array("deta_orden" => ($orden_actual+1),"deta_proc_id" => $proc_actual));
                
                $datos = array(
                "deta_orden" => ($orden_actual+1)
                );
                $this->Model_general->guardar_edit_registro("proceso_detalle", $datos, array("deta_orden" => 0,"deta_proc_id" => $proc_actual));
                
             }
        }
    }
}
                                                             
