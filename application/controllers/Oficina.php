<?php
defined('BASEPATH') OR exit('No direct script access allowed');
class Oficina extends MY_Controller {

	function __construct() {
		parent::__construct();
		if(!$this->session->userdata('authorized')){
			redirect(base_url()."login");
		}
		if(!$this->session->userdata('authorizedadmin'))
			redirect(base_url());
		$this->load->library('Cssjs');
		$this->load->model("Model_oficina");
		$this->load->model("Model_general");
		$this->load->helper('Form');
	}

	function inicio() {
		$this->load->library('Framework');
		$this->load->library('Ssp');
		$this->load->database();
		$this->cssjs->set_path_js(base_url()."assets/js/");
		$this->cssjs->add_js('oficina/dt');

		$json = isset($_GET['json']) ? $_GET['json'] : false;
		$excel = isset($_GET['excel']) ? $_GET['excel'] : false;
		$columns = array(
			array('db' => 'ofic_nombre', 'dt' => 'Nombre','field'=>"ofic_nombre"),
			array('db' => 'ofic_estado', 'dt' => 'Activo', "field" => 'ofic_estado', 'formatter' => function ($d, $row) {
				if ($d == 1)
					return "SI";
				return "NO";
			}),
			array('db' => 'ofic_codigo', 'dt' => 'Código','field'=>"ofic_codigo"),
			array('db' => 'ofic_id', 'dt' => 'DT_RowId','field'=>"ofic_id")
		);

		if ($json||$excel) {

			$json = isset($_GET['json']) ? $_GET['json'] : false;
			$excel = isset($_GET['excel']) ? $_GET['excel'] : false;

			$table = 'oficina';
			$primaryKey = 'ofic_id';

			$sql_details = array(
					'user' => $this->db->username,
					'pass' => $this->db->password,
					'db' => $this->db->database,
					'host' => $this->db->hostname
				);

			$condiciones = array();
			$where = count($condiciones) > 0 ? implode(' AND ', $condiciones) : "";
                        $data=$this->ssp->simple($_POST, $sql_details, $table, $primaryKey, $columns,$where);
                        if($excel){
				echo $this->exportarXLS("Oficinas", '', '', $data['data']);
			}else{
				echo json_encode($data);
			}

			exit(0);
		}
		$script['js'] = $this->cssjs->generate_js();
		$datos['columns'] = $columns;

		$this->load->helper('Funciones');

		$this->load->view('header',$script);
		$this->load->view('menu');
		$this->load->view('oficina/inicio',$datos);
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
	function form($id=0) {
		$this->load->library('Framework');

		
		if($id!=0){
			$id = array("ofic_id"=>$id); 
			$oficina["oficina"] = $this->Model_oficina->getoficina($id);
			$this->load->view('oficina/form',$oficina);
		}
		else{
			$this->load->view('oficina/new_form');
		}
	}
	function guardar(){
		$oficina = $this->input->post('oficina');
		
		$nombre = $this->input->post('nombre');
		$codigo = $this->input->post('codigo');
		$habilitado = isset($_POST['habilitado']) ? '1' : '0';
		
		$datos = array("ofic_nombre" => $nombre,'ofic_codigo'=>$codigo, "ofic_estado" => $habilitado);
		
		if(isset($oficina)){
			if($this->Model_general->guardar_edit_registro("oficina",$datos,array("ofic_id" => $oficina))==TRUE):
				$json['exito'] = true;
			else:
				$json['exito'] = false;
				$json['mensaje'] = "Error al actualizar los datos";
			endif;
		}
		else{
			if($this->Model_general->guardar_registro("oficina",$datos)==TRUE):
				$json['exito'] = true;
			else:
				$json['exito'] = false;
				$json['mensaje'] = "Error al guardar los datos";
			endif;
		}
		echo json_encode($json);
	}
	public function borrar()
	{
		$delete = $_POST['data'];
		$table = 'oficina';
					
		foreach ($delete as $id) {
			$where = array(
				'ofic_id' => $id
				);
			if($this->Model_general->borrar($where,$table)!=TRUE){
				$json['exito'] = false;
				$json['mensaje'] = "No se pudo borrar algunas oficinas por que estan siendo usadas";
			}else{
				$json['exito'] = true;
				$json['mensaje'] = false;
			}
		}
		echo json_encode($json);
	}

	

}

?>
