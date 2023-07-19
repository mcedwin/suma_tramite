<?php
defined('BASEPATH') OR exit('No direct script access allowed');
class Plantillas extends MY_Controller {

	function __construct() {
		parent::__construct();
		if(!$this->session->userdata('authorized')){
			redirect(base_url()."login");
		}
		$this->load->library('Cssjs');
		$this->load->model("Model_general");
		$this->load->model("Model_plantillas");
		$this->load->helper('Form');
	}

	function inicio() {
		$this->load->library('Framework');
		$this->load->library('Ssp');
		$this->load->database();
		$this->cssjs->set_path_js(base_url()."assets/js/");
		$this->cssjs->add_js('plantillas/dt');

		$json = isset($_GET['json']) ? $_GET['json'] : false;

		$columns = array(
			//array('db' => 'recu_id', 'dt' => 'Id',"field" => "recu_id"),
			array('db' => 'recu_nombre', 'dt' => 'Formato',"field" => "recu_nombre"),
			array ('db'=> 'recu_archivo','dt'=> "Archivo", 'field'=> 'recu_archivo','formatter'=> function ($d, $row) {
																	$icon = "";
																	if($row["recu_ext"]=="doc")$icon = "fa-file-word-o";
																	if($row["recu_ext"]=="pdf")$icon = "fa-file-pdf-o";
																	if($row["recu_ext"]=="otro")$icon = "fa-file-o";
                                                                     return "<i class='fa ".$icon." fa-fw'></i><a href='".base_url()."archivos/plantillas/".$d."' download='".$row["recu_nombre"]."'>Descargar</a>";
                                                                 }),
			

			array('db' => 'recu_id', 'dt' => 'DT_RowId',"field" => "recu_id"),
			array('db' => 'recu_ext', 'dt' => 'DT_RowExt',"field" => "recu_ext")
		);
		if ($json) {

			$json = isset($_GET['json']) ? $_GET['json'] : false;
			$excel = isset($_GET['excel']) ? $_GET['excel'] : false;

			$table = 'recursos';
			$primaryKey = 'recu_id';

			$sql_details = array(
					'user' => $this->db->username,
					'pass' => $this->db->password,
					'db' => $this->db->database,
					'host' => $this->db->hostname
				);

			$condiciones = array();

			$joinQuery = "";
			$where = count($condiciones) > 0 ? implode(' AND ', $condiciones) : "";
			echo json_encode(
				$this->ssp->simple($_POST, $sql_details, $table, $primaryKey, $columns,$joinQuery,$where)
			);
			exit(0);
		}

		$script['js'] = $this->cssjs->generate_js();
		$datos['columns'] = $columns;
		$this->load->view('header',$script);
		$this->load->view('menu');
		$this->load->view('plantillas/inicio',$datos);
		$this->load->view('footer');
	}

	function init(){
		if(!$this->session->userdata('authorizedadmin'))
			redirect(base_url());
		$this->load->library('Framework');
		$this->load->library('Ssp');
		$this->load->database();
		$this->cssjs->set_path_js(base_url()."assets/js/");
		$this->cssjs->add_js('plantillas/init_dt');

		$json = isset($_GET['json']) ? $_GET['json'] : false;
		$excel = isset($_GET['excel']) ? $_GET['excel'] : false;
		$columns = array(
			//array('db' => 'recu_id', 'dt' => 'Id','field'=>"recu_id"),
			array('db' => 'recu_nombre', 'dt' => 'Nombre','field'=>"recu_nombre"),

			array('db' => 'recu_id', 'dt' => 'DT_RowId','field'=>"recu_id")
		);

		if ($json||$excel) {

			$json = isset($_GET['json']) ? $_GET['json'] : false;
			$excel = isset($_GET['excel']) ? $_GET['excel'] : false;

			$table = 'recursos';
			$primaryKey = 'recu_id';

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
				echo $this->exportarXLS("Plantillas", '', '', $data['data']);
			}else{
				echo json_encode($data);
			}
			exit(0);
		}

		$script['js'] = $this->cssjs->generate_js();
		$datos['columns'] = $columns;
		$this->load->view('header',$script);
		$this->load->view('menu');
		$this->load->view('plantillas/init',$datos);
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
		if(!$this->session->userdata('authorizedadmin'))
			redirect(base_url());
		$this->load->library('Framework');

		
		if($id!=0){
			$id = array("recu_id"=>$id); 
			$recursos["recursos"] = $this->Model_plantillas->getplantillas($id);
			$archivo = explode('/',$recursos["recursos"]->recu_archivo);
			$archivo = array_pop($archivo);
			$recursos["recursos"]->recu_archivo = $archivo;

			$this->load->view('plantillas/form',$recursos);
		}
		else{
			$this->load->view('plantillas/new_form');
		}
	}
	function guardar(){
		if(!$this->session->userdata('authorizedadmin'))
			redirect(base_url());
		$recursos = $this->input->post('recursos');
		
		$nombre_recu = $this->input->post('nombre');
		

		$datos = array("recu_nombre" => $nombre_recu);
		if(isset($recursos)){
			if(!empty($_FILES["archivo"]["name"]))
			{
				$archivo = $_FILES["archivo"]["tmp_name"];
				$nombre = $_FILES["archivo"]["name"];
	    		$date = date('Y').'/'.date('n').'/'.date('j').'/';
	    		$urlDest = FCPATH.'archivos/plantillas/'.$date;
	    		$sep = explode('.',$nombre);
				$extension = array_pop($sep);

	    		$nom_ = url_title(convert_accented_characters($nombre_recu),'dash', TRUE)."-".date("His").".".$extension;
	    		if(!file_exists($urlDest)){
	    			mkdir($urlDest,0777,true);
	    		}
	    		if(move_uploaded_file($archivo,$urlDest.$nom_)){
	    			$id = array("recu_id"=>$recursos); 
					$recurso = $this->Model_plantillas->getplantillas($id);
					unlink(FCPATH."archivos/plantillas/".$recurso->recu_archivo);
					if($extension == "docx"|| $extension == "docm"|| $extension == "dotx"|| $extension == "doc")
						$extension = "doc";
					elseif($extension =="pdf")
						$extension = "pdf";
					else
						$extension = "otro";
					$datos = array_merge($datos,array("recu_archivo" => $date.$nom_,"recu_ext"=>$extension));
	    		}
	    		else{
	    			$json['mensaje'] = "Nose pudo enviar el archivo adjunto";
	    		}
	    	}
			if($this->Model_general->guardar_edit_registro("recursos",$datos,array("recu_id" => $recursos))==TRUE):
				$json['exito'] = true;
			else:
				$json['exito'] = false;
				$json['mensaje'] = "Error al actualizar los datos";
			endif;
		}
		else{
			if(!empty($_FILES["archivo"]["name"]))
			{
				$archivo = $_FILES["archivo"]["tmp_name"];
				$nombre = $_FILES["archivo"]["name"];
	    		$date = date('Y').'/'.date('n').'/'.date('j').'/';
	    		$urlDest = FCPATH.'archivos/plantillas/'.$date;
	    		$sep = explode('.',$nombre);
				$extension = array_pop($sep);

	    		$nom_ = url_title(convert_accented_characters($nombre_recu),'dash', TRUE)."-".date("His").".".$extension;
	    		if(!file_exists($urlDest)){
	    			mkdir($urlDest,0777,true);
	    		}
	    		if(move_uploaded_file($archivo,$urlDest.$nom_)){
					$datos = array_merge($datos,array("recu_archivo" => $date.$nom_,"recu_ext"=>$extension));
	    		}
	    		else{
	    			$json['mensaje'] = "Nose pudo enviar el archivo adjunto";
	    		}
	    	}
			if($this->Model_general->guardar_registro("recursos",$datos)==TRUE):
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
		if(!$this->session->userdata('authorizedadmin'))
			redirect(base_url());
		$delete = $_POST['data'];
		$table = 'recursos';
					
		foreach ($delete as $id) {
			$where = array(
				'recu_id' => $id
				);
			if($this->Model_general->borrar($where,$table)!=TRUE){
				$json['exito'] = false;
				$json['mensaje'] = "No se pudo borrar algunas plantillas por que estan siendo usadas";
			}else{
				$json['exito'] = true;
				$json['mensaje'] = false;
			}
		}
		echo json_encode($json);

	}

}

?>
