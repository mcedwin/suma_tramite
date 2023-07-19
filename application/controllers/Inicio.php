<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Inicio extends MY_Controller {

	function __construct()
	{
		parent::__construct();
		if(!$this->session->userdata('authorized')){
			redirect(base_url()."Consultar");
			exit(0);
		}
		$this->load->library('Cssjs');
		$this->load->model("Model_general");
	}
	public function index()
	{
		$this->load->library('Framework');
		$this->load->library('Ssp');
		$this->load->database();
		$this->cssjs->set_path_css(base_url()."assets/css/");
		$this->cssjs->set_path_js(base_url()."assets/plg/");
		$this->cssjs->add_js('flot/jquery.flot');
		$this->cssjs->add_js('flot/jquery.flot.pie');
		$this->cssjs->set_path_js(base_url()."assets/js/");
		$this->cssjs->add_js('inicio/panel');

		$json = isset($_GET['json']) ? $_GET['json'] : false;
		$columns = array(
			array('db' => 'expe_id', 'dt' => 'Expediente',"field" => "expe_id"),
			array('db' => 'tram_fechareg', 'dt' => 'Fecha',"field" => "tram_fechareg",'formatter'=> function ($d, $row) {
                                                                     return date ("d/m/Y", strtotime($d));
                                                                 }),
			array('db' => 'expe_asunto',  'dt' => "Asunto","field" => "expe_asunto"),
			array('db' => 'expe_remitente',  'dt' => "Remitente","field" => "expe_remitente"),
			array('db' => 'deta_plazo',  'dt' => "Plazo","field" => "deta_plazo"),
			array ('db'=> 'tram_fechareg','dt'=> "Quedan", 'field'=> 'tram_fechareg','formatter'=> function ($d, $row) {
																	$dates = new DateTime($d);
																	$dates1 = new DateTime(date("Y-m-d"));
																	$interval = $dates->diff($dates1);
																	$dias_cont = $interval->format('%a');
                                                                     return ($row['deta_plazo']-$dias_cont)." dias";
                                                                 }),

			array('db' => 'expe_id', 'dt' => 'DT_RowId',"field" => "expe_id")
		);

		if ($json) {

			$json = isset($_GET['json']) ? $_GET['json'] : false;
			$excel = isset($_GET['excel']) ? $_GET['excel'] : false;

			$table = 'expediente';
			$primaryKey = 'expe_id';

			$sql_details = array(
					'user' => $this->db->username,
					'pass' => $this->db->password,
					'db' => $this->db->database,
					'host' => $this->db->hostname
				);

			$condiciones = array();

			$joinQuery = "FROM expediente
							INNER JOIN tramite ON tram_expe_id=expe_id AND tram_ofic_fin='".$this->session->userdata('authorizedofic')."' AND tram_estado ='RECIBIDO'
							INNER JOIN oficina ON (ofic_id = tram_ofic_fin )
							INNER JOIN procesos ON (proc_id = expe_proc_id)
							INNER JOIN proceso_detalle ON deta_proc_id = proc_id and deta_ofic_id='".$this->session->userdata('authorizedofic')."'
							";
			$condiciones[] = "";
			$where = count($condiciones) > 0 ? implode(' AND ', $condiciones) : "";
			echo json_encode(
				$this->ssp->simple($_POST, $sql_details, $table, $primaryKey, $columns,$joinQuery,$where)
			);
			exit(0);
		}

		$script['js'] = $this->cssjs->generate_js();
		$script['css'] = $this->cssjs->generate_css();
		$datos['columns'] = $columns;
		$this->load->view('header',$script);
		$this->load->view('menu');
		$this->load->view('panel/inicio',$datos);
		$this->load->view('footer');
	}
	
}
