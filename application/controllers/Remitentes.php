<?php
defined('BASEPATH') OR exit('No direct script access allowed');
class Remitentes extends MY_Controller {
	function __construct() {
		parent::__construct();
		
		$this->load->library('Cssjs');
		$this->load->model("Model_general");
		$this->load->model("Model_remitentes");
		$this->load->helper('Form');
		$this->load->helper('Funciones');
	}

	function inicio() {
		if(!$this->session->userdata('authorizedadmin'))
			redirect(base_url());
		$this->load->library('Framework');
		$this->load->library('Ssp');
		$this->load->database();
		$this->cssjs->set_path_js(base_url()."assets/js/");
		$this->cssjs->add_js('remitentes/dt');

		$json = isset($_GET['json']) ? $_GET['json'] : false;
		$excel = isset($_GET['excel']) ? $_GET['excel'] : false;
		$columns = array(
			//array('db' => 'enti_id', 'dt' => 'Id','field'=>"enti_id"),
			array('db' => 'enti_nombre', 'dt' => 'Nombre','field'=>"enti_nombre"),
			array('db' => 'enti_tipo', 'dt' => 'Tipo','field'=>"enti_tipo"),
			array('db' => 'enti_ruc', 'dt' => 'Ruc','field'=>"enti_ruc"),

			array('db' => 'enti_id', 'dt' => 'DT_RowId','field'=>"enti_id")
		);

		if ($json||$excel) {

			$json = isset($_GET['json']) ? $_GET['json'] : false;
			$excel = isset($_GET['excel']) ? $_GET['excel'] : false;

			$table = 'entidad';
			$primaryKey = 'enti_id';

			$sql_details = array(
					'user' => $this->db->username,
					'pass' => $this->db->password,
					'db' => $this->db->database,
					'host' => $this->db->hostname
				);
			$joinQuery = "";
			$condiciones = array();
			if (!empty($_POST['tipo']))
				$condiciones[] = "enti_tipo='".$_POST['tipo']."'";
			$where = count($condiciones) > 0 ? implode(' AND ', $condiciones) : "";
			$data=$this->ssp->simple($_POST, $sql_details, $table, $primaryKey, $columns,$joinQuery,$where);
			if($excel){
				echo $this->exportarXLS("Remitentes", '', '', $data['data']);
			}else{
				echo json_encode($data);
			}
			exit(0);
		}
		$datos["tipo"] = select_enum($this->Model_general->enum_valores("entidad","enti_tipo"),"- Tipos -");
		$script['js'] = $this->cssjs->generate_js();
		$datos['columns'] = $columns;
		$this->load->view('header',$script);
		$this->load->view('menu');
		$this->load->view('remitentes/inicio',$datos);
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
		if(!$this->session->userdata('authorized'))
			redirect(base_url());
		
		if($id!=0){
			$id = array("enti_id"=>$id);
			$remitentes["options"] = select_enum($this->Model_general->enum_valores("entidad","enti_tipo"),"- Tipos -");
			$remitentes["remitentes"] = $this->Model_remitentes->getRemitentes($id);
			$this->load->view('remitentes/form',$remitentes);
		}
		else{
			$remitentes["options"] = select_enum($this->Model_general->enum_valores("entidad","enti_tipo"),"- Tipos -");
			$this->load->view('remitentes/new_form',$remitentes);
		}
	}
	public function guardar($value='')
	{
		if(!$this->session->userdata('authorized'))
			redirect(base_url());
		$remitentes = $this->input->post('remitentes');
		$nombre = $this->input->post('nombre');
		$tipo = $this->input->post('tipo');
		$ruc = $this->input->post('ruc');
		$siglas = $this->input->post('siglas');
		$email = $this->input->post('email');

		$datos = array("enti_nombre" => $nombre,
					   "enti_tipo" => $tipo,
					   "enti_ruc" => $ruc,
					   "enti_siglas" => $siglas,
					   "enti_email" => $email
					   );
		if(isset($remitentes)){
			if($this->Model_general->guardar_edit_registro("entidad",$datos,array("enti_id" => $remitentes))==TRUE):
				$json['exito'] = true;
			else:
				$json['exito'] = false;
				$json['mensaje'] = "Error al actualizar los datos";
			endif;
		}
		else{
			$response = $this->Model_general->guardar_registro("entidad",$datos);
			if($response!=FALSE):
				$json['id'] = $response["id"];
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
		if(!$this->session->userdata('authorized'))
			redirect(base_url());
		$delete = $_POST['data'];
		$table = 'entidad';
					
		foreach ($delete as $id) {
			$where = array(
				'enti_id' => $id
				);
			if($this->Model_general->borrar($where,$table)!=TRUE){
				$json['exito'] = false;
				$json['mensaje'] = "No se pudo borrar algunos remitentes por que estan siendo usados";
			}else{
				$json['exito'] = true;
				$json['mensaje'] = false;
			}
		}
		echo json_encode($json);
	}
	function select2remitente(){

		$responese = new StdClass;
		$search='';
		if(isset($_GET['q'])){
			
			$search = $_GET["q"];
		}
		$remitente = $this->Model_general->select2("entidad",array("enti_nombre"=>$search));
		foreach ($remitente["items"] as $value) {
			$datos[] = array("id"=>$value->enti_id,"text"=>$value->enti_nombre,"sigla"=>$value->enti_siglas,"email"=>$value->enti_email);
		}
		$responese->total_count = $remitente["total_count"];
		$responese->items = $datos;

		echo json_encode($responese);
	}
}
                                                        