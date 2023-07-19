<?php
defined('BASEPATH') or exit('No direct script access allowed');
class Documento extends MY_Controller
{

	function __construct()
	{
		parent::__construct();
		if (!$this->session->userdata('authorized')) {
			redirect(base_url() . "login");
		}
		if (!$this->session->userdata('authorizedadmin'))
			redirect(base_url());
		$this->load->library('Cssjs');
		$this->load->model("Model_general");
		$this->load->model("Model_documento");
		$this->load->helper('Form');
	}

	function inicio()
	{
		$this->load->library('Framework');
		$this->load->library('Ssp');
		$this->load->database();
		$this->cssjs->set_path_js(base_url() . "assets/js/");
		$this->cssjs->add_js('documento/dt');

		$json = isset($_GET['json']) ? $_GET['json'] : false;
		$excel = isset($_GET['excel']) ? $_GET['excel'] : false;
		$columns = array(
			//array('db' => 'docu_id', 'dt' => 'Id','field'=>"docu_id"),
			array('db' => 'docu_nombre', 'dt' => 'Nombre', 'field' => "docu_nombre"),
			array('db' => 'docu_codigo', 'dt' => 'Código', 'field' => "docu_codigo"),
			array('db' => 'docu_id', 'dt' => 'DT_RowId', 'field' => "docu_id"),
			array('db' => 'docu_estado', 'dt' => 'Activo', "field" => 'docu_estado', 'formatter' => function ($d, $row) {
				if ($d == 1)
					return "SI";
				return "NO";
			}),


			array('db' => 'docu_interno', 'dt' => 'Interno', "field" => 'docu_interno', 'formatter' => function ($d, $row) {
				if ($d == 1)
					return "SI";
				return "NO";
			}),

			array('db' => 'docu_externo', 'dt' => 'Externo', "field" => 'docu_externo', 'formatter' => function ($d, $row) {
				if ($d == 1)
					return "SI";
				return "NO";
			}),
		);

		if ($json || $excel) {

			$json = isset($_GET['json']) ? $_GET['json'] : false;
			$excel = isset($_GET['excel']) ? $_GET['excel'] : false;

			$table = 'documento';
			$primaryKey = 'docu_id';

			$sql_details = array(
				'user' => $this->db->username,
				'pass' => $this->db->password,
				'db' => $this->db->database,
				'host' => $this->db->hostname
			);

			$condiciones = array();
			$where = count($condiciones) > 0 ? implode(' AND ', $condiciones) : "";
			$data = $this->ssp->simple($_POST, $sql_details, $table, $primaryKey, $columns, $where);
			if ($excel) {
				echo $this->exportarXLS("Documento", '', '', $data['data']);
			} else {
				echo json_encode($data);
			}
			exit(0);
		}

		$script['js'] = $this->cssjs->generate_js();
		$datos['columns'] = $columns;
		$this->load->view('header', $script);
		$this->load->view('menu');
		$this->load->view('documento/inicio', $datos);
		$this->load->view('footer');
	}
	function exportarXLS($titulo, $termino, $fecha, $json)
	{

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
		if (!empty($fecha)) {
			$objPHPExcel->getActiveSheet()->mergeCells("A{$row}:D{$row}");
			$objPHPExcel->getActiveSheet()->setCellValue("A{$row}", "FILTRO FECHA:");
			$objPHPExcel->getActiveSheet()->setCellValue("E{$row}", $fecha);
			$row++;
		}
		if (!empty($termino)) {
			$objPHPExcel->getActiveSheet()->mergeCells("A{$row}:D{$row}");
			$objPHPExcel->getActiveSheet()->setCellValue("A{$row}", "FILTRO TERMINO:");
			$objPHPExcel->getActiveSheet()->setCellValue("E{$row}", "$termino");
			$row++;
		}
		$objPHPExcel->getActiveSheet()->mergeCells("A{$row}:D{$row}");

		PHPExcel_Cell::setValueBinder(new PHPExcel_Cell_AdvancedValueBinder());

		$row += 2;

		$end = $excel->write_table($objPHPExcel, $json, $row - 1);

		$objPHPExcel->getActiveSheet()->freezePane("A{$row}");
		$objPHPExcel->getActiveSheet()->getSheetView()->setZoomScale(90);
		$objPHPExcel->getActiveSheet()->setTitle(substr($titulo, 0, 30));
		$objPHPExcel->setActiveSheetIndex(0);

		setcookie("fileDownload", 'true');
		$excel->excel_output($objPHPExcel, $titulo);
	}
	function form($id = 0)
	{
		$this->load->library('Framework');

		if ($id != 0) {
			$id = array("docu_id" => $id);
			$documento["documento"] = $this->Model_documento->getdocumento($id);
			$this->load->view('documento/form', $documento);
		} else {
			$this->load->view('documento/new_form');
		}
	}
	function guardar()
	{
		$documento = $this->input->post('documento');

		$nombre = $this->input->post('nombre');
		$codigo = $this->input->post('codigo');
		$habilitado = isset($_POST['habilitado']) ? '1' : '0';

		$interno = isset($_POST['interno']) ? '1' : '0';
		$externo = isset($_POST['externo']) ? '1' : '0';


		$datos = array("docu_nombre" => $nombre, "docu_codigo" => $codigo, "docu_interno" => $interno, "docu_externo" => $externo, "docu_estado" => $habilitado);
		if (isset($documento)) {
			if ($this->Model_general->guardar_edit_registro("documento", $datos, array("docu_id" => $documento)) == TRUE) :
				$json['exito'] = true;
			else :
				$json['exito'] = false;
				$json['mensaje'] = "Error al actualizar los datos";
			endif;
		} else {
			if ($this->Model_general->guardar_registro("documento", $datos) == TRUE) :
				$json['exito'] = true;
			else :
				$json['exito'] = false;
				$json['mensaje'] = "Error al guardar los datos";
			endif;
		}
		echo json_encode($json);
	}

	public function borrar()
	{
		$delete = $_POST['data'];
		$table = 'documento';

		foreach ($delete as $id) {
			$where = array(
				'docu_id' => $id
			);
			if ($this->Model_general->borrar($where, $table) != TRUE) {
				$json['exito'] = false;
				$json['mensaje'] = "No se pudo borrar algunos documentos por que estan siendo usados";
			} else {
				$json['exito'] = true;
				$json['mensaje'] = false;
			}
		}
		echo json_encode($json);
	}
}
