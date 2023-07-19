<?php
defined('BASEPATH') or exit('No direct script access allowed');
class Expedientes extends MY_Controller
{

	function __construct()
	{
		parent::__construct();
		if (!$this->session->userdata('authorized')) {
			redirect(base_url() . "login");
		}
		$this->load->library('Cssjs');
		$this->load->model("Model_general");
		$this->load->model("Model_expediente");
		$this->load->helper('Form');
	}
	function internos()
	{
		$this->load->library('Framework');
		$this->load->library('Ssp');
		$this->load->database();
		$this->cssjs->set_path_js(base_url() . "assets/js/");
		$this->cssjs->add_js('expedientes/internos_dt');

		$sql_primera_oficina = '(SELECT 	ofic_nombre 
								FROM 		tramite 
								JOIN 		oficina 
								ON 			tram_ofic_fin = ofic_id 
								WHERE 		tram_expe_id = ex.expe_id 
								ORDER BY	tram_id ASC 
								LIMIT 		1) AS oficina';

		$json = isset($_GET['json']) ? $_GET['json'] : false;
		$excel = isset($_GET['excel']) ? $_GET['excel'] : false;


		$boton = function ($d, $row) {
			$url = base_url('expedientes/seguir/' . $row['expe_id']);
			return '<a href="' . $url . '" class="seguir btn btn-success btn-sm">' . $row['expe_codigo'] . '-' . $row['expe_periodo'] . '</a>';
		};

		$columns = array(
			array('db' => 'ex.expe_id', 'dt' => 'Expediente', "field" => "expe_id", "formatter" => $boton),
			array('db' => 'ex.expe_numero', 'dt' => 'Numero', "field" => "expe_numero"),
			array('db' => 'ex.expe_asunto', 'dt' => 'Asunto', "field" => "expe_asunto"),
			array('db' => 'ex.expe_remitente', 'dt' => 'Remitente', "field" => "expe_remitente"),
			array('db' => 'ex.expe_fechareg', 'dt' => 'Fecha', "field" => "expe_fechareg", 'formatter' => function ($d, $row) {
				return date("d/m/Y", strtotime($d));
			}),
			array('db' => 'do.docu_nombre',  'dt' => "Documento", "field" => "docu_nombre"),

			//array('db' => $sql_primera_oficina, 'dt' => 'Oficina', 'field' => 'oficina'),

			array('db' => 'us.usua_nombres',  'dt' => "Usuario", "field" => "usua_nombres"),
			array('db' => 'pr.proc_nombre',  'dt' => "Proceso", "field" => "proc_nombre"),

			array('db' => 'ex.expe_id', 'dt' => 'DT_RowId', "field" => "expe_id"),
			array('db' => 'ex.expe_periodo', 'dt' => 'DT_RowPeriodo', "field" => "expe_periodo"),
			array('db' => 'ex.expe_codigo', 'dt' => 'DT_RowCodigo', "field" => "expe_codigo"),
		);

		if ($json || $excel) {

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

			$joinQuery = "FROM expediente AS ex 
							LEFT JOIN documento AS do ON (ex.expe_docu_id = do.docu_id)
							LEFT JOIN usuario AS us ON (ex.expe_user_id = us.usua_id)
							LEFT JOIN procesos AS pr ON (ex.expe_proc_id = pr.proc_id)
							  ";

			if (!empty($_POST['fecha_ini']) && !empty($_POST['fecha_fin']))
				$condiciones[] = "expe_fechareg >='" . $_POST['fecha_ini'] . "' AND expe_fechareg <='" . $_POST['fecha_fin'] . "'";
			else {
				$condiciones[] = "expe_fechareg >='" . date("Y-m-d") . " 00:00:00' AND expe_fechareg <='" . date("Y-m-d H:i:s") . "'";
			}
			if (!empty($_POST['oficina']))
				$condiciones[] = "tram_ofic_fin='" . $_POST['oficina'] . "'";

			$condiciones[] = "expe_ofic_id='{$this->mc_ofic}'";
			$condiciones[] = "expe_tipo='INTERNO'";

			$where = count($condiciones) > 0 ? implode(' AND ', $condiciones) : "";
			$data = $this->ssp->simple($_POST, $sql_details, $table, $primaryKey, $columns, $joinQuery, $where);
			if ($excel) {
				echo $this->exportarXLS("Internos", '', '', $data['data']);
			} else {
				echo json_encode($data);
			}
			exit(0);
		}
		$this->load->model("Model_oficina");
		$this->load->helper('Funciones');
		$datos["oficina"] = select_options($this->Model_oficina->getoficina(), "ofic_id", "ofic_nombre", "- Oficina enviada -");
		$script['js'] = $this->cssjs->generate_js();
		$datos['columns'] = $columns;
		$this->load->view('header', $script);
		$this->load->view('menu');
		$this->load->view('expedientes/internos', $datos);
		$this->load->view('footer');
	}
	function externos()
	{
		$this->load->library('Framework');
		$this->load->library('Ssp');
		$this->load->database();
		$this->cssjs->set_path_js(base_url() . "assets/js/");
		$this->cssjs->add_js('expedientes/externos_dt');

		$sql_primera_oficina = '(SELECT 	ofic_nombre 
								FROM 		tramite 
								JOIN 		oficina 
								ON 			tram_ofic_fin = ofic_id 
								WHERE 		tram_expe_id = ex.expe_id 
								ORDER BY	tram_id ASC 
								LIMIT 		1) AS oficina';

		$json = isset($_GET['json']) ? $_GET['json'] : false;
		$excel = isset($_GET['excel']) ? $_GET['excel'] : false;


		$boton = function ($d, $row) {
			$url = base_url('expedientes/seguir/' . $row['expe_id']);
			return '<a href="' . $url . '" class="seguir btn btn-success btn-sm">' . $row['expe_codigo'] . '-' . $row['expe_periodo'] . '</a>';
		};


		$columns = array(
			array('db' => 'ex.expe_id', 'dt' => 'Expediente', "field" => "expe_id", "formatter" => $boton),
			array('db' => 'ex.expe_numero', 'dt' => 'Numero', "field" => "expe_numero"),
			array('db' => 'ex.expe_asunto', 'dt' => 'Asunto', "field" => "expe_asunto"),
			array('db' => 'ex.expe_remitente', 'dt' => 'Remitente', "field" => "expe_remitente"),
			array('db' => 'ex.expe_fechareg', 'dt' => 'Fecha', "field" => "expe_fechareg", 'formatter' => function ($d, $row) {
				return date("d/m/Y", strtotime($d));
			}),
			array('db' => 'do.docu_nombre',  'dt' => "Documento", "field" => "docu_nombre"),

			//array('db' => $sql_primera_oficina, 'dt' => 'Oficina', 'field' => 'oficina'),
			array('db' => 'us.usua_nombres',  'dt' => "Usuario", "field" => "usua_nombres"),
			array('db' => 'pr.proc_nombre',  'dt' => "Proceso", "field" => "proc_nombre"),

			array('db' => 'ex.expe_id', 'dt' => 'DT_RowId', "field" => "expe_id"),

			array('db' => 'ex.expe_periodo', 'dt' => 'DT_RowPeriodo', "field" => "expe_periodo"),
			array('db' => 'ex.expe_codigo', 'dt' => 'DT_RowCodigo', "field" => "expe_codigo"),
		);

		if ($json || $excel) {

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

			$joinQuery = "FROM expediente AS ex 
							LEFT JOIN documento AS do ON (ex.expe_docu_id = do.docu_id)
							JOIN usuario AS us ON (ex.expe_user_id = us.usua_id) AND usua_id='{$this->mc_user}'
							LEFT JOIN procesos AS pr ON (ex.expe_proc_id = pr.proc_id)
							  ";

			if (!empty($_POST['fecha_ini']) && !empty($_POST['fecha_fin']))
				$condiciones[] = "expe_fechareg >='" . $_POST['fecha_ini'] . "' AND expe_fechareg <='" . $_POST['fecha_fin'] . "'";
			else {
				$condiciones[] = "expe_fechareg >='" . date("Y-m-d") . " 00:00:00' AND expe_fechareg <='" . date("Y-m-d H:i:s") . "'";
			}
			if (!empty($_POST['oficina']))
				$condiciones[] = "tram_ofic_fin='" . $_POST['oficina'] . "'";
			$condiciones[] = "expe_ofic_id='{$this->mc_ofic}'";
			$condiciones[] = "expe_tipo='EXTERNO'";
			$where = count($condiciones) > 0 ? implode(' AND ', $condiciones) : "";
			$data = $this->ssp->simple($_POST, $sql_details, $table, $primaryKey, $columns, $joinQuery, $where);
			if ($excel) {
				echo $this->exportarXLS("Externos", '', '', $data['data']);
			} else {
				echo json_encode($data);
			}
			exit(0);
		}
		$this->load->model("Model_oficina");
		$this->load->helper('Funciones');
		$datos["oficina"] = select_options($this->Model_oficina->getoficina(), "ofic_id", "ofic_nombre", "- Oficina enviada -");
		$script['js'] = $this->cssjs->generate_js();
		$datos['columns'] = $columns;
		$this->load->view('header', $script);
		$this->load->view('menu');
		$this->load->view('expedientes/externos', $datos);
		$this->load->view('footer');
	}
	function recibidos()
	{

		$this->load->library('Framework');
		$this->load->library('Ssp');
		$this->load->database();
		$this->cssjs->set_path_js(base_url() . "assets/js/");
		$this->cssjs->add_js('expedientes/recibidos_dt');

		$json = isset($_GET['json']) ? $_GET['json'] : false;
		$excel = isset($_GET['excel']) ? $_GET['excel'] : false;



		$sql_tramitados_por_oficina = '(SELECT 	COUNT(*) 
										FROM 	tramite 
										WHERE 	tram_expe_id = ex.expe_id 
										AND 	tram_acci_id = 1 
										AND 	tram_ofic_fin = tr.tram_ofic_fin) AS veces_por_oficina';

		$sql_ultimo_tipo_tramite_por_oficina = '(SELECT		tram_acci_id
												FROM 		tramite 
												WHERE		tram_expe_id = ex.expe_id 
												AND 		tram_ofic_fin = tr.tram_ofic_fin 
												ORDER BY 	tram_id DESC 
												LIMIT 		1) AS ultimo_tipo_de_tramite';


		$boton = function ($d, $row) {
			$url = base_url('expedientes/seguir/' . $row['expe_id']);
			return '<a href="' . $url . '" class="seguir btn btn-success btn-sm">' . $row['expe_codigo'] . '-' . $row['expe_periodo'] . '</a>';
		};

		$columns = array(
			array('db' => 'ex.expe_id', 'dt' => 'Expediente', "field" => "expe_id", "formatter" => $boton),
			array('db' => 'tr.tram_estado', 'dt' => 'Estado', "field" => "tram_estado"),
			array('db' => 'ex.expe_asunto', 'dt' => 'Asunto', "field" => "expe_asunto"),
			array('db' => 'ex.expe_remitente', 'dt' => 'Remitente', "field" => "expe_remitente"),
			array('db' => 'doc.docu_nombre',  'dt' => "Documento", "field" => "docu_nombre"),
			array('db' => 'tr.tram_fechaestado',  'dt' => "Fecha", "field" => "tram_fechaestado", 'formatter' => function ($d, $row) {
				if (!empty($d))
					return date("d/m/Y", strtotime($d));
				return $d;
			}),
			array('db' => 'pr.proc_nombre',  'dt' => "Proceso", "field" => "proc_nombre"),
			/*array('db' => 'dt.deta_plazo',  'dt' => "Plazo","field" => "deta_plazo",'formatter'=> function ($d, $row) {
																	if($d==NULL)
																		return NULL;
                                                                     return $d." días";
																 }),*/
			//array('db' => 'GROUP_CONCAT(IF(ISNULL(dt.deta_plazo), NULL, CONCAT(dt.deta_plazo, " días")) ORDER BY deta_orden ASC SEPARATOR ",") AS deta_plazo',  'dt' => "Plazo", "field" => "deta_plazo"),
			array('db' => 'of1.ofic_nombre',  'dt' => "De Oficina", "field" => "ofic_nombre"),
			array('db' => 'us.usua_nombres',  'dt' => "Usuario", "field" => "usua_nombres"),


			array('db' => 'tr.tram_id', 'dt' => 'DT_RowId', "field" => "tram_id"),
			array('db' => 'ex.expe_id', 'dt' => 'DT_RowIdEx', "field" => "expe_id"),
			array('db' => $sql_tramitados_por_oficina, 'dt' => 'DT_vpo', "field" => "veces_por_oficina"),
			array('db' => $sql_ultimo_tipo_tramite_por_oficina, 'dt' => 'DT_utt', "field" => "ultimo_tipo_de_tramite"),
			array('db' => 'ex.expe_periodo', 'dt' => 'DT_RowPeriodo', "field" => "expe_periodo"),
			array('db' => 'ex.expe_codigo', 'dt' => 'DT_RowCodigo', "field" => "expe_codigo"),
		);
		if ($json || $excel) {

			$json = isset($_GET['json']) ? $_GET['json'] : false;
			$excel = isset($_GET['excel']) ? $_GET['excel'] : false;

			$table = 'tramite';
			$primaryKey = 'tram_id';

			$sql_details = array(
				'user' => $this->db->username,
				'pass' => $this->db->password,
				'db' => $this->db->database,
				'host' => $this->db->hostname
			);

			$condiciones = array();

			$joinQuery = "FROM expediente AS ex 
						  JOIN tramite tr on tr.tram_expe_id = ex.expe_id AND (tr.tram_estado='PENDIENTE' OR tr.tram_estado='RECIBIDO')  AND tram_ofic_fin='" . $this->session->userdata('authorizedofic') . "' AND tram_user_fin='{$this->full_user->usua_id}'
						  LEFT JOIN documento AS doc ON (ex.expe_docu_id = doc.docu_id)
						  LEFT JOIN oficina AS of1 ON (tr.tram_ofic_ini = of1.ofic_id)
						  LEFT JOIN oficina AS of2 ON (tr.tram_ofic_fin = of2.ofic_id )
						  LEFT JOIN usuario AS us ON (ex.expe_user_id = us.usua_id)
						  LEFT JOIN procesos AS pr ON (ex.expe_proc_id = pr.proc_id)
						  LEFT JOIN proceso_detalle AS dt ON (pr.proc_id = dt.deta_proc_id AND tr.tram_ofic_fin=dt.deta_ofic_id)";

			//echo $joinQuery;

			if (!empty($_POST['fecha_ini']) && !empty($_POST['fecha_fin']))
				$condiciones[] = "tram_fechaestado >=date('" . $_POST['fecha_ini'] . "') AND date(tram_fechaestado) <=date('" . $_POST['fecha_fin'] . "')";
			else {
				$condiciones[] = "tram_fechaestado >='" . date("Y-m-d") . "' AND date(tram_fechaestado) <='" . date("Y-m-d") . "'";
			}
			//print_r($condiciones);
			if (!empty($_POST['oficina']))
				$condiciones[] = "tram_ofic_ini='" . $_POST['oficina'] . "'";

			$where = count($condiciones) > 0 ? implode(' AND ', $condiciones) : "";
			$groupBy = 'ex.expe_id';
			$data = $this->ssp->simple($_POST, $sql_details, $table, $primaryKey, $columns, $joinQuery, $where, $groupBy);
			if ($excel) {
				echo $this->exportarXLS("Recibidos", '', '', $data['data']);
			} else {
				echo json_encode($data);
			}
			exit(0);
		}
		$this->load->model("Model_oficina");
		$this->load->helper('Funciones');
		$datos["oficina"] = select_options($this->Model_oficina->getoficina(), "ofic_id", "ofic_nombre", "- Oficina enviada -");
		$script['js'] = $this->cssjs->generate_js();
		$datos['columns'] = $columns;
		$this->load->view('header', $script);
		$this->load->view('menu');
		$this->load->view('expedientes/recibidos', $datos);
		$this->load->view('footer');
	}
	function derivados()
	{

		$this->load->library('Framework');
		$this->load->library('Ssp');
		$this->load->database();
		$this->cssjs->set_path_js(base_url() . "assets/js/");
		$this->cssjs->add_js('expedientes/derivados_dt');

		$json = isset($_GET['json']) ? $_GET['json'] : false;
		$excel = isset($_GET['excel']) ? $_GET['excel'] : false;


		$boton = function ($d, $row) {
			$url = base_url('expedientes/seguir/' . $row['expe_id']);
			return '<a href="' . $url . '" class="seguir btn btn-success btn-sm">' . $row['expe_codigo'] . '-' . $row['expe_periodo'] . '</a>';
		};

		$columns = array(
			array('db' => 'ex.expe_id', 'dt' => 'Expediente', "field" => "expe_id", "formatter" => $boton),
			array('db' => 'tr.tram_estado', 'dt' => 'Estado', "field" => "tram_estado"),
			array('db' => 'ex.expe_asunto', 'dt' => 'Asunto', "field" => "expe_asunto"),
			array('db' => 'ex.expe_remitente', 'dt' => 'Remitente', "field" => "expe_remitente"),
			array('db' => 'doc.docu_nombre',  'dt' => "Documento", "field" => "docu_nombre"),
			array('db' => 'tr.tram_fechaestado',  'dt' => "Fecha", "field" => "tram_fechaestado", 'formatter' => function ($d, $row) {
				if (!empty($d))
					return date("d/m/Y", strtotime($d));
				return $d;
			}),
			//array('db' => 'of1.ofic_nombre',  'dt' => "A Oficina","field" => "ofic_nombre"),
			//array('db' => 'us.usua_nombres',  'dt' => "Usuario","field" => "usua_nombres"),
			array('db' => 'pr.proc_nombre',  'dt' => "Proceso", "field" => "proc_nombre"),


			array('db' => 'tr.tram_id', 'dt' => 'DT_RowId', "field" => "tram_id"),
			array('db' => 'ex.expe_id', 'dt' => 'DT_RowIdEx', "field" => "expe_id"),
			array('db' => 'ex.expe_periodo', 'dt' => 'DT_RowPeriodo', "field" => "expe_periodo"),
			array('db' => 'ex.expe_codigo', 'dt' => 'DT_RowCodigo', "field" => "expe_codigo"),
		);
		if ($json || $excel) {

			$json = isset($_GET['json']) ? $_GET['json'] : false;
			$excel = isset($_GET['excel']) ? $_GET['excel'] : false;

			$table = 'tramite';
			$primaryKey = 'tram_id';

			$sql_details = array(
				'user' => $this->db->username,
				'pass' => $this->db->password,
				'db' => $this->db->database,
				'host' => $this->db->hostname
			);

			$condiciones = array();

			$joinQuery = "FROM expediente AS ex 
						  JOIN tramite tr on tr.tram_expe_id = ex.expe_id AND tr.tram_estado='DERIVADO' AND tram_ofic_fin='" . $this->session->userdata('authorizedofic') . "'
						  LEFT JOIN documento AS doc ON (ex.expe_docu_id = doc.docu_id)
						  LEFT JOIN oficina AS of1 ON (tr.tram_ofic_ini = of1.ofic_id)
						  LEFT JOIN oficina AS of2 ON (tr.tram_ofic_fin = of2.ofic_id )
						  LEFT JOIN usuario AS us ON (ex.expe_user_id = us.usua_id)
						  LEFT JOIN procesos AS pr ON (ex.expe_proc_id = pr.proc_id)
							";
			if (!empty($_POST['fecha_ini']) && !empty($_POST['fecha_fin']))
				$condiciones[] = "tram_fechaestado >='" . $_POST['fecha_ini'] . "' AND tram_fechaestado <='" . $_POST['fecha_fin'] . "'";
			else {
				$condiciones[] = "tram_fechaestado >='" . date("Y-m-d") . " 00:00:00' AND tram_fechaestado <='" . date("Y-m-d H:i:s") . "'";
			}
			if (!empty($_POST['oficina']))
				$condiciones[] = "tram_ofic_fin='" . $_POST['oficina'] . "'";
			$where = count($condiciones) > 0 ? implode(' AND ', $condiciones) : "";
			$data = $this->ssp->simple($_POST, $sql_details, $table, $primaryKey, $columns, $joinQuery, $where);
			if ($excel) {
				echo $this->exportarXLS("Derivados", '', '', $data['data']);
			} else {
				echo json_encode($data);
			}
			exit(0);
		}
		$this->load->model("Model_oficina");
		$this->load->helper('Funciones');
		$datos["oficina"] = select_options($this->Model_oficina->getoficina(), "ofic_id", "ofic_nombre", "- Oficina enviada -");
		$script['js'] = $this->cssjs->generate_js();
		$datos['columns'] = $columns;
		$this->load->view('header', $script);
		$this->load->view('menu');
		$this->load->view('expedientes/derivados', $datos);
		$this->load->view('footer');
	}
	function finalizados()
	{

		$this->load->library('Framework');
		$this->load->library('Ssp');
		$this->load->database();
		$this->cssjs->set_path_js(base_url() . "assets/js/");
		$this->cssjs->add_js('expedientes/finalizados_dt');

		$json = isset($_GET['json']) ? $_GET['json'] : false;
		$excel = isset($_GET['excel']) ? $_GET['excel'] : false;

		$boton = function ($d, $row) {
			$url = base_url('expedientes/seguir/' . $row['expe_id']);
			return '<a href="' . $url . '" class="seguir btn btn-success btn-sm">' . $row['expe_codigo'] . '-' . $row['expe_periodo'] . '</a>';
		};

		$columns = array(
			array('db' => 'ex.expe_id', 'dt' => 'Expediente', "field" => "expe_id", "formatter" => $boton),
			array('db' => 'tr.tram_estado', 'dt' => 'Estado', "field" => "tram_estado"),
			array('db' => 'ex.expe_asunto', 'dt' => 'Asunto', "field" => "expe_asunto"),
			array('db' => 'ex.expe_remitente', 'dt' => 'Remitente', "field" => "expe_remitente"),
			array('db' => 'doc.docu_nombre',  'dt' => "Documento", "field" => "docu_nombre"),
			//array('db' => 'of1.ofic_nombre',  'dt' => "De Oficina","field" => "ofic_nombre"),
			array('db' => 'tr.tram_fechaestado',  'dt' => "Fecha", "field" => "tram_fechaestado", 'formatter' => function ($d, $row) {
				if (!empty($d))
					return date("d/m/Y", strtotime($d));
				return $d;
			}),
			//array('db' => 'us.usua_nombres',  'dt' => "Usuario","field" => "usua_nombres"),
			array('db' => 'pr.proc_nombre',  'dt' => "Proceso", "field" => "proc_nombre"),


			array('db' => 'tr.tram_id', 'dt' => 'DT_RowId', "field" => "tram_id"),
			array('db' => 'ex.expe_id', 'dt' => 'DT_RowIdEx', "field" => "expe_id"),
			array('db' => 'ex.expe_periodo', 'dt' => 'DT_RowPeriodo', "field" => "expe_periodo"),
			array('db' => 'ex.expe_codigo', 'dt' => 'DT_RowCodigo', "field" => "expe_codigo"),
		);
		if ($json || $excel) {

			$json = isset($_GET['json']) ? $_GET['json'] : false;
			$excel = isset($_GET['excel']) ? $_GET['excel'] : false;

			$table = 'tramite';
			$primaryKey = 'tram_id';

			$sql_details = array(
				'user' => $this->db->username,
				'pass' => $this->db->password,
				'db' => $this->db->database,
				'host' => $this->db->hostname
			);

			$condiciones = array();

			$joinQuery = "FROM expediente AS ex 
						  JOIN tramite tr on tr.tram_expe_id = ex.expe_id AND tr.tram_estado='FINALIZADO' AND tram_ofic_fin='" . $this->session->userdata('authorizedofic') . "'
						  LEFT JOIN documento AS doc ON (ex.expe_docu_id = doc.docu_id)
						  LEFT JOIN oficina AS of1 ON (tr.tram_ofic_ini = of1.ofic_id)
						  LEFT JOIN oficina AS of2 ON (tr.tram_ofic_fin = of2.ofic_id )
						  LEFT JOIN usuario AS us ON (ex.expe_user_id = us.usua_id)
						  LEFT JOIN procesos AS pr ON (ex.expe_proc_id = pr.proc_id)
							";
			if (!empty($_POST['fecha_ini']) && !empty($_POST['fecha_fin']))
				$condiciones[] = "tram_fechaestado >='" . $_POST['fecha_ini'] . "' AND tram_fechaestado <='" . $_POST['fecha_fin'] . "'";
			else {
				$condiciones[] = "tram_fechaestado >='" . date("Y-m-d") . " 00:00:00' AND tram_fechaestado <='" . date("Y-m-d H:i:s") . "'";
			}
			$where = count($condiciones) > 0 ? implode(' AND ', $condiciones) : "";
			$data = $this->ssp->simple($_POST, $sql_details, $table, $primaryKey, $columns, $joinQuery, $where);
			if ($excel) {
				echo $this->exportarXLS("Finalizados", '', '', $data['data']);
			} else {
				echo json_encode($data);
			}
			exit(0);
		}
		$this->load->model("Model_oficina");
		$this->load->helper('Funciones');
		$datos["oficina"] = select_options($this->Model_oficina->getoficina(), "ofic_id", "ofic_nombre", "- Oficina enviada -");
		$script['js'] = $this->cssjs->generate_js();
		$datos['columns'] = $columns;
		$this->load->view('header', $script);
		$this->load->view('menu');
		$this->load->view('expedientes/finalizados', $datos);
		$this->load->view('footer');
	}
	function archivados()
	{

		$this->load->library('Framework');
		$this->load->library('Ssp');
		$this->load->database();
		$this->cssjs->set_path_js(base_url() . "assets/js/");
		$this->cssjs->add_js('expedientes/archivados_dt');

		$json = isset($_GET['json']) ? $_GET['json'] : false;
		$excel = isset($_GET['excel']) ? $_GET['excel'] : false;

		$boton = function ($d, $row) {
			$url = base_url('expedientes/seguir/' . $row['expe_id']);
			return '<a href="' . $url . '" class="seguir btn btn-success btn-sm">' . $row['expe_codigo'] . '-' . $row['expe_periodo'] . '</a>';
		};

		$columns = array(
			array('db' => 'ex.expe_id', 'dt' => 'Id', "field" => "expe_id", "formatter" => $boton),
			array('db' => 'tr.tram_estado', 'dt' => 'Estado', "field" => "tram_estado"),
			array('db' => 'ex.expe_asunto', 'dt' => 'Asunto', "field" => "expe_asunto"),
			array('db' => 'ex.expe_remitente', 'dt' => 'Remitente', "field" => "expe_remitente"),
			array('db' => 'doc.docu_nombre',  'dt' => "Documento", "field" => "docu_nombre"),
			array('db' => 'tr.tram_fechaestado',  'dt' => "Fecha", "field" => "tram_fechaestado", 'formatter' => function ($d, $row) {
				if (!empty($d))
					return date("d/m/Y", strtotime($d));
				return $d;
			}),
			//array('db' => 'of1.ofic_nombre',  'dt' => "De Oficina","field" => "ofic_nombre"),
			//array('db' => 'us.usua_nombres',  'dt' => "Usuario","field" => "usua_nombres"),
			array('db' => 'pr.proc_nombre',  'dt' => "Proceso", "field" => "proc_nombre"),


			array('db' => 'tr.tram_id', 'dt' => 'DT_RowId', "field" => "tram_id"),
			array('db' => 'ex.expe_id', 'dt' => 'DT_RowIdEx', "field" => "expe_id"),
			array('db' => 'ex.expe_periodo', 'dt' => 'DT_RowPeriodo', "field" => "expe_periodo"),
			array('db' => 'ex.expe_codigo', 'dt' => 'DT_RowCodigo', "field" => "expe_codigo"),
		);
		if ($json || $excel) {

			$json = isset($_GET['json']) ? $_GET['json'] : false;
			$excel = isset($_GET['excel']) ? $_GET['excel'] : false;

			$table = 'tramite';
			$primaryKey = 'tram_id';

			$sql_details = array(
				'user' => $this->db->username,
				'pass' => $this->db->password,
				'db' => $this->db->database,
				'host' => $this->db->hostname
			);

			$condiciones = array();

			$joinQuery = "FROM expediente AS ex 
						  JOIN tramite tr on tr.tram_expe_id = ex.expe_id AND tr.tram_estado='ARCHIVADO' AND tram_ofic_fin='" . $this->session->userdata('authorizedofic') . "'
						  LEFT JOIN documento AS doc ON (ex.expe_docu_id = doc.docu_id)
						  LEFT JOIN oficina AS of1 ON (tr.tram_ofic_ini = of1.ofic_id)
						  LEFT JOIN oficina AS of2 ON (tr.tram_ofic_fin = of2.ofic_id )
						  LEFT JOIN usuario AS us ON (ex.expe_user_id = us.usua_id)
						  LEFT JOIN procesos AS pr ON (ex.expe_proc_id = pr.proc_id)
							";
			if (!empty($_POST['fecha_ini']) && !empty($_POST['fecha_fin']))
				$condiciones[] = "tram_fechaestado >='" . $_POST['fecha_ini'] . "' AND tram_fechaestado <='" . $_POST['fecha_fin'] . "'";
			else {
				$condiciones[] = "tram_fechaestado >='" . date("Y-m-d") . " 00:00:00' AND tram_fechaestado <='" . date("Y-m-d H:i:s") . "'";
			}
			$where = count($condiciones) > 0 ? implode(' AND ', $condiciones) : "";
			$data = $this->ssp->simple($_POST, $sql_details, $table, $primaryKey, $columns, $joinQuery, $where);
			if ($excel) {
				echo $this->exportarXLS("Archivados", '', '', $data['data']);
			} else {
				echo json_encode($data);
			}
			exit(0);
		}
		$this->load->model("Model_oficina");
		$this->load->helper('Funciones');
		$datos["oficina"] = select_options($this->Model_oficina->getoficina(), "ofic_id", "ofic_nombre", "- Oficina enviada -");
		$script['js'] = $this->cssjs->generate_js();
		$datos['columns'] = $columns;
		$this->load->view('header', $script);
		$this->load->view('menu');
		$this->load->view('expedientes/archivados', $datos);
		$this->load->view('footer');
	}


	function form($id, $tipo)
	{
		$this->load->library('Framework');
		$this->load->library('Ssp');
		$this->cssjs->set_path_js(base_url() . "assets/js/");
		$this->cssjs->add_js('expedientes/form');

		if ($id != 0) {
		} else {

			$this->load->helper('Funciones');
			$this->load->model("Model_documento");
			$this->load->model("Model_oficina");
			$this->load->model("Model_acciones");

			$datos["codigo"] = $this->Model_general->ultimo_registro("expe_id", "expe_id", "expediente");
			$datos["codigo"]->expe_id = empty($datos["codigo"]->expe_id) ? '1' : ((int)($datos["codigo"]->expe_id)) + 1;
			$datos["documento"] = select_options($this->Model_documento->getdocumento(0, strtolower($tipo)), "docu_id", "docu_nombre", "- Seleccione tipo de documento -");
			$datos["oficina"] = select_options($this->Model_oficina->getoficinaex($this->mc_ofic), "ofic_id", "ofic_nombre", "- Seleccione Oficina -");
			$datos["procesos"] = select_options($this->Model_general->getprocesos(), "proc_id", "proc_nombre", "- Seleccione Proceso -");
			$datos["acciones"] = select_options($this->Model_acciones->getacciones(), "acci_id", "acci_nombre", "- Seleccione accion -");

			$datos['tipo'] = $tipo;

			if ($tipo == 'INTERNO') {
				$ru = $this->db->query("SELECT * FROM usuario WHERE usua_id='{$this->mc_user}'")->row();
				$datos['remitente'] = $ru->usua_nombres . ' ' . $ru->usua_apellidos;
				$datos["interno_tipo"] = select_enum($this->Model_general->enum_valores("expediente", "expe_interno_tipo"));
			} else {
				$datos['remitente'] = '';
			}

			$script['js'] = $this->cssjs->generate_js();
			$this->load->view('header', $script);
			$this->load->view('menu');
			$this->load->view('expedientes/form', $datos);

			$this->load->view('footer');
		}
	}

	function internos_form($id = 0)
	{
		$this->form($id, 'INTERNO');
	}
	function externos_form($id = 0)
	{
		$this->form($id, 'EXTERNO');
	}

	function probar()
	{
		$this->enviar_mensaje_correo('175', 'Pendiente', 1);
	}

	function guardar()
	{
		$this->load->library('Form_validation');

		$this->form_validation->set_rules('documento', 'Tipo de documento', 'required');
		$this->form_validation->set_rules('asunto', 'Asunto', 'required');
		$this->form_validation->set_rules('folio', 'Folio', 'required');
		//$this->form_validation->set_rules('remitente', 'Remitente', 'required');
		//$this->form_validation->set_rules('tram_ofic_fin', 'Oficina destino', 'required');

		//$this->form_validation->set_rules('archivo', 'Archivo adjunto', 'required');


		$tipo = $this->input->post('tipo');
		$finExterno = $this->input->post('finExterno');
		$finExterno = $finExterno == '1'?$finExterno:'0';

		$json['exito'] = true;
		$json['mensaje'] = "";

		if (isset($_POST['tram_ofic_fin'])) {
			
			foreach ($this->input->post('tram_ofic_fin') as $key => $value) {
				$this->form_validation->set_rules('tram_ofic_fin[' . $key . ']', 'Oficina ' . ($key + 1), 'required');
				$this->form_validation->set_rules('acciones[' . $key . ']', 'Accion ' . ($key + 1), 'required');
			}
		} else if ($finExterno == '1') {
			$this->form_validation->set_rules('entidad', 'Entidad', 'required');
		} else {
			$json['exito'] = false;
			$json['mensaje'] = "Destinatario es necesario";
			echo json_encode($json);
			exit;
		}



		if ($this->form_validation->run() == FALSE) {
			$json['exito'] = false;
			$json['mensaje'] = validation_errors();
			echo json_encode($json);
			exit;
		}
		if (empty($_FILES["archivo"]["name"])) {
			$json['exito'] = false;
			$json['mensaje'] = "Adjuntar archivo digital";
			echo json_encode($json);
			exit;
		}



		$periodo = $this->Model_general->ultimo_registro("conf_periodo", "conf_id", "configuracion");
		$periodo = $periodo->conf_periodo;

		$reg = $this->db->query("SELECT MAX(expe_codigo) as expe_codigo FROM expediente WHERE expe_periodo='{$periodo}'")->row();


		$datos_expediente = array(
			"expe_codigo" => $reg->expe_codigo + 1,
			"expe_docu_id" => $this->input->post('documento'),
			"expe_numero_int" => $this->input->post('tipo') == 'INTERNO' ? $this->input->post('numero') : '',
			"expe_sigla" => $this->input->post('tipo') == 'INTERNO' ? $this->input->post('sigla') : '',
			"expe_numero" => $this->input->post('tipo') == 'INTERNO' ? $this->input->post('numero') . '-' . $this->input->post('sigla') : $this->input->post('numero'),
			"expe_folio" => $this->input->post('folio'),
			"expe_remitente" => $this->input->post('remitente'),
			"expe_email" => $this->input->post('email'),
			"expe_finExterno" => $finExterno,
			"expe_asunto" => $this->input->post('asunto'),
			"expe_observacion" => $this->input->post('observacion'),
			"expe_referencia" => $this->input->post('referencia'),
			"expe_fechareg" => date("Y-m-d H:i:s"),
			"expe_fecharec" => $this->input->post('fecha'),
			"expe_externo_fecha" => $this->input->post('fecha'),
			"expe_tipo" => $this->input->post('tipo'),
			"expe_periodo" => $periodo,
			"expe_ofic_id" => $this->session->userdata('authorizedofic'),
			"expe_proc_id" => empty($_POST['proceso']) ? NULL : $this->input->post('proceso'),
			"expe_user_id" => $this->session->userdata('authorized'),
			"expe_enti_id" => $this->input->post('entidad')
		);
		if (!empty($_FILES["archivo"]["name"])) {
			$carpeta = ($this->input->post('tipo') == "INTERNO") ? "interno" : "externo";
			$archivo = $_FILES["archivo"]["tmp_name"];
			$nombre = $_FILES["archivo"]["name"];
			$date = date('Y') . '/' . date('n') . '/' . date('j') . '/';
			$urlDest = FCPATH . 'archivos/expedientes/' . $carpeta . '/' . $date;
			$sep = explode('.', $nombre);
			$extension = array_pop($sep);

			$nom_ = url_title(convert_accented_characters($nombre), 'dash', TRUE) . "-" . date("His") . "." . $extension;
			if (!file_exists($urlDest)) {
				mkdir($urlDest, 0777, true);
			}
			if (move_uploaded_file($archivo, $urlDest . $nom_)) {
				$datos_expediente = array_merge($datos_expediente, array("expe_archivo" => $date . $nom_));
			} else {
				$json['mensaje'] = "No se pudo enviar el archivo adjunto";
			}
		}
		$expediente = $this->Model_general->guardar_registro("expediente", $datos_expediente);
		//die($this->db->last_query());
		if ($expediente != FALSE) :
			$oficinas = $this->input->post('tram_ofic_fin');
			$usuarios = $this->input->post('tram_user_fin');
			$acciones = $this->input->post('acciones');
			$observaciones = $this->input->post('tramite_observaciones');

			if ($finExterno != '1') {
				foreach ($oficinas as $index => $oficid) {

					$userid = $usuarios[$index];
					if ($userid == '-1') $add = ' AND 1';
					else if ($userid == '0') $add = ' ORDER BY usua_responsable DESC LIMIT 1';
					else $add = " AND usua_id='{$userid}'";

					$users = $this->db->query("SELECT * FROM usuario WHERE usua_ofic_id='{$oficid}' {$add}")->result();

					foreach ($users as $item) {
						$datos_tramite = array(
							"tram_expe_id" => $expediente["id"],
							"tram_estado" => "PENDIENTE",
							"tram_ofic_ini" => $this->session->userdata('authorizedofic'),
							"tram_ofic_fin" => $oficid,
							"tram_user_ini" => $this->session->userdata('authorized'),
							"tram_user_fin" => $item->usua_id,
							//"tram_observacion" => $observaciones[$index],
							"tram_acci_id" => $acciones[$index],
							"tram_fechareg" => date("Y-m-d H:i:s"),
							"tram_fechaestado" => date("Y-m-d H:i:s")
						);
						//$this->enviar_mensaje_correo($expediente["id"], 'DERIVADO', $value);

						if ($this->Model_general->guardar_registro("tramite", $datos_tramite) != FALSE) :
							$json['exito'] = true;
						else :
							$json['exito'] = false;
							$json['mensaje'] = "Algunos tramites no se guardaron";
						endif;
					}
				}
			}



			$this->load->model("Model_empresa");
			$empresa = $this->Model_empresa->getempresa(array("conf_id" => 1));
			if ($empresa->conf_enviaremail == "SI") :

				$body = str_replace(
					array('[N_EXPEDIENTE]', '[REMITENTE]', '[PERIODO]', '[ASUNTO]', '[FOLIO]', '[FECHA]', '[OBSERVACION]', '[BASE_URL]'),
					array($expediente["id"], $this->input->post('remitente'), $empresa->conf_periodo, $this->input->post('asunto'), $this->input->post('folio'), date("Y/m/d H:i:s"), $this->input->post('observacion'), base_url()),
					$empresa->conf_email_body
				);

				if ($empresa->conf_smtp == "SI") :
					$email = array(
						"Host" => $empresa->conf_email_host,
						"Port" => $empresa->conf_email_puerto,
						"Username" => $empresa->conf_email_user,
						"passsword" => $empresa->conf_email_password,
						"From" => $empresa->conf_email_user,
						"addReplyTo" => $empresa->conf_email,
						"addReplyToName" => $empresa->conf_nombres,
						"addAddress" => $this->input->post('email'),
						"Subject" => "Expediente Creado",
						"Body" => $body,
						"AltBody" => "pruebas de html"
					);
					$this->enviar_email_smtp($email);
				else :
					$email = array(
						"From" => $empresa->conf_email_user,
						"addReplyTo" => $empresa->conf_email,
						"addReplyToName" => $empresa->conf_nombres,
						"addAddress" => $this->input->post('email'),
						"Subject" => "Expediente Creado",
						"Body" => $body,
						"AltBody" => "pruebas de html"
					);
					$this->enviar_email($email);
				endif;
			endif;

		else :
			$json['exito'] = false;
			$json['mensaje'] = "Error al guardar los datos";
		endif;
		echo json_encode($json);
	}

	function enviar_mensaje_correo($expediente, $estado, $oficina)
	{
		$this->load->model("Model_usuario");
		$usuarios = $this->Model_usuario->getUsuario(array("usua_ofic_id" => $oficina), 1);

		$mails = [];
		foreach ($usuarios as $user) {
			$mails[] = $user->usua_email;
		}
		$mails = implode(",", $mails);



		$this->load->model("Model_expediente");
		$where = array("expe_id" => $expediente);
		$reg = $this->Model_expediente->getExpediente($where);
		$this->load->model("Model_empresa");
		$empresa = $this->Model_empresa->getempresa(array("conf_id" => 1));
		if ($empresa->conf_enviaremail == "SI") :

			$body = str_replace(
				array('[N_EXPEDIENTE]', '[REMITENTE]', '[PERIODO]', '[ASUNTO]', '[FECHA]', '[ESTADO]'),
				array($expediente, $reg->expe_remitente, $empresa->conf_periodo, $reg->expe_asunto, date("Y/m/d H:i:s"), $estado),
				'<div style="border: solid 1px; padding: 1em; width: 80%;">
					<div style="display: inline-block; width: 40%;">
					<div>
					<p style="display: inline-block; width: 40%;"><strong>Expediente:</strong></p>
					<p style="display: inline-block; width: 55%; height: 40px;">[N_EXPEDIENTE]</p>
					</div>
					<div>
					<p style="display: inline-block; width: 40%;"><strong>Remitente:</strong></p>
					<p style="display: inline-block; width: 55%; height: 40px;">[REMITENTE]</p>
					</div>
					<div>
					<p style="display: inline-block; width: 40%;"><strong>Periodo:</strong></p>
					<p style="display: inline-block; width: 55%; height: 40px;">[PERIODO]</p>
					</div>
					</div>
					<div style="display: inline-block; width: 40%;">
					<div>
					<p style="display: inline-block; width: 30%;"><strong>Asunto:</strong></p>
					<p style="display: inline-block; width: 55%; height: 40px;">[ASUNTO]</p>
					</div>
					<div>
					<p style="display: inline-block; width: 40%;"><strong>Estado:</strong></p>
					<p style="display: inline-block; width: 55%; height: 40px;">[ESTADO]</p>
					</div>
					<div>
					<p style="display: inline-block; width: 40%;"><strong>Fecha:</strong></p>
					<p style="display: inline-block; width: 55%; height: 40px;">[FECHA]</p>
					</div>
					</div>
					</div>
					<div>
					<div>&nbsp;</div>
					</div>
					<p>Para consultar el expediente haga click <a href="http://192.168.255.82/tramite/consultar/">aqui<a/></p>
<p>ó</p>
<p>Para consultar externamente <a href="http://190.116.42.20/tramite/consultar/">aqui<a/></p>
'
			);

			if ($empresa->conf_smtp == "SI" && (strlen($mails) > 0)) :
				$email = array(
					"Host" => $empresa->conf_email_host,
					"Port" => $empresa->conf_email_puerto,
					"Username" => $empresa->conf_email_user,
					"passsword" => $empresa->conf_email_password,
					"From" => $empresa->conf_email_user,
					"addReplyTo" => $empresa->conf_email,
					"addReplyToName" => $empresa->conf_nombres,
					"addAddress" => $mails,
					"Subject" => "Expediente Creado",
					"Body" => $body,
					"AltBody" => "pruebas de html"
				);
				$this->enviar_email_smtp($email);
			elseif ((strlen($mails) > 0)) :
				$email = array(
					"From" => $empresa->conf_email_user,
					"addReplyTo" => $empresa->conf_email,
					"addReplyToName" => $empresa->conf_nombres,
					"addAddress" => $mails,
					"Subject" => "Expediente Creado",
					"Body" => $body,
					"AltBody" => "pruebas de html"
				);
				$this->enviar_email($email);
			endif;
		endif;
	}

	function enviar_email_smtp($datos = array())
	{
		date_default_timezone_set('Etc/UTC');
		$this->load->library('phpmailer/Phpmailer');

		$mail = new Phpmailer;
		$mail->isSMTP();
		$mail->isHTML(TRUE);
		$mail->SMTPDebug = 0;
		// $mail->Host = "mail.gruposistemas.org";
		$mail->Host = $datos["Host"];
		$mail->Port = $datos["Port"];
		$mail->SMTPAuth = true;
		$mail->SMTPSecure = 'tls';
		// $mail->Username = "elard@gruposistemas.org";
		$mail->Username = $datos["Username"];
		// $mail->Password = "elard.com";
		$mail->Password = $datos["passsword"];
		$mail->SetFrom($datos["From"], $datos["addReplyToName"]);
		// $mail->From = $datos["From"];
		$mail->addReplyTo($datos["addReplyTo"], $datos["addReplyToName"]);
		$mails = explode(",", $datos["addAddress"]);
		foreach ($mails as $em) {
			$mail->addAddress($em);
		}

		$mail->Subject = $datos["Subject"];

		$mail->Body = $datos["Body"];

		$mail->AltBody = $datos["AltBody"];
		if (!$mail->send()) {
			// echo $mail->ErrorInfo;
		} else {
			// echo "MENSAJE ENVIADO";
		}
	}
	function enviar_email($datos = array())
	{
		$this->load->library('phpmailer/Phpmailer');

		$mail = new Phpmailer();
		$mail->IsSendmail();
		$mail->SetFrom($datos["From"], $datos["addReplyToName"]);
		$mail->AddReplyTo($datos["addReplyTo"], $datos["addReplyToName"]);
		$address = $datos["addAddress"];
		$mail->AddAddress($address);
		$mail->Subject = $datos["Subject"];
		$mail->AltBody = $datos["AltBody"];
		$mail->Body = $datos["Body"];

		if (!$mail->send()) {
			// echo $mail->ErrorInfo;
		} else {
			// echo "MENSAJE ENVIADO";
		}
	}
	function numero_expediente()
	{
		$documento = $this->input->post('documento');
		$interno_tipo = $this->input->post('tipo');

		$periodo = $this->Model_general->ultimo_registro("conf_periodo", "conf_id", "configuracion");
		$periodo = $periodo->conf_periodo;


		$sigla = $periodo . ($interno_tipo == 'PERSONAL' ? '-' . $this->full_user->usua_sigla : '') . '-SGC-' . $this->full_ofic->ofic_codigo;;

		$datos = $this->Model_general->ultimo_registro("expe_id,expe_numero_int", "expe_id", "expediente", array("expe_tipo" => "INTERNO", "expe_sigla" => $sigla));

		$sigla_docu = $this->Model_general->ultimo_registro("docu_nombre", "docu_id", "documento", array("docu_id" => $documento));
		$sigla_ofic = $this->Model_general->ultimo_registro("ofic_nombre", "ofic_id", "oficina", array("ofic_id" => $this->session->userdata('authorizedofic')));

		$response = new StdClass;
		$response->numero = (isset($datos->expe_numero_int)) ? (int)$datos->expe_numero_int + 1 : 1;
		$response->numero = str_pad($response->numero, 3, "0", STR_PAD_LEFT);
		//die(print_r($this->full_user));
		$response->siglas = $sigla;

		if ($interno_tipo != 'PERSONAL' && $interno_tipo != 'OFICINA') {
			$response->numero = '';
			$response->siglas = '';
		}

		echo json_encode($response);
	}
	function enviar_expediente($id)
	{
		$this->load->model("Model_oficina");
		$this->load->model("Model_acciones");
		$this->load->helper('Funciones');
		$datos["expediente"] = $id;
		$datos["oficina"] = select_options($this->Model_oficina->getoficinaex($this->mc_ofic), "ofic_id", "ofic_nombre", "- Seleccione Oficina -");
		$datos["acciones"] = select_options($this->Model_acciones->getacciones(), "acci_id", "acci_nombre", "- Seleccione Accion -");

		$this->load->view('expedientes/enviar_form', $datos);
	}
	function recibir_expediente($id)
	{
		$where = array("tram_id" => $id);
		$datos = array("tram_estado" => "RECIBIDO", "tram_fechaestado" => date("Y-m-d H:i:s"));
		if ($this->Model_general->guardar_edit_registro("tramite", $datos, $where) != FALSE) {
			$json['exito'] = true;
		} else {
			$json['exito'] = false;
			$json['mensaje'] = "No se puedo recibir";
		}
		echo json_encode($json);
	}
	function rechazar_expediente($id)
	{
		$where = array("tram_id" => $id);
		$datos = array("tram_estado" => "RECHAZADO", "tram_fechaestado" => date("Y-m-d H:i:s"));

		$this->load->model("Model_tramite");
		$tramite = $this->Model_tramite->getTramite($id);
		$this->enviar_mensaje_correo($tramite->tram_expe_id, 'RECHAZADO', $tramite->tram_ofic_ini);


		if ($this->Model_general->guardar_edit_registro("tramite", $datos, $where) != FALSE) {
			$json['exito'] = true;
		} else {
			$json['exito'] = false;
			$json['mensaje'] = "No se puedo recibir";
		}
		echo json_encode($json);
	}
	function finalizar_expediente_guardar()
	{


		$datos_tramite = array(
			"tram_expe_id" => $this->input->post('expediente'),
			"tram_estado" => "FINALIZADO",
			"tram_ofic_ini" => $this->session->userdata('authorizedofic'),
			"tram_ofic_fin" => $this->session->userdata('authorizedofic'),
			"tram_user_ini" => $this->session->userdata('authorized'),
			"tram_observacion" => $this->input->post('observacion'),
			"tram_fechareg" => date("Y-m-d H:i:s"),
			"tram_fechaestado" => date("Y-m-d H:i:s"),
			"tram_acci_id" => $this->input->post('accion')
		);

		/* Upload file */
		if (!empty($_FILES["archivo"]["name"])) {
			$carpeta = ($this->input->post('tipo') == "INTERNO") ? "interno" : "externo";
			$archivo = $_FILES["archivo"]["tmp_name"];
			$nombre = $_FILES["archivo"]["name"];
			$date = date('Y') . '/' . date('n') . '/' . date('j') . '/';
			$urlDest = FCPATH . 'archivos/expedientes/' . $carpeta . '/' . $date;
			$sep = explode('.', $nombre);
			$extension = array_pop($sep);

			$nom_ = url_title(convert_accented_characters($nombre), 'dash', TRUE) . "-" . date("His") . "." . $extension;
			if (!file_exists($urlDest)) {
				mkdir($urlDest, 0777, true);
			}
			if (move_uploaded_file($archivo, $urlDest . $nom_)) {
				$datos_tramite['tram_archivo'] =  $date . $nom_;
			} else {
				$json['mensaje'] = "No se pudo enviar el archivo adjunto";
			}
		}
		/* End Upload file */

		$where = array("tram_id" => $this->input->post("tramite"));
		$datos = array("tram_estado" => "ARCHIVADO", "tram_fechaestado" => date("Y-m-d H:i:s"));

		if ($this->Model_general->guardar_registro("tramite", $datos_tramite) != FALSE) :
			//echo $this->db->last_query();
			if ($this->Model_general->guardar_edit_registro("tramite", $datos, $where) != FALSE) :
				$json['exito'] = true;
			else :
				$json['exito'] = false;
				$json['mensaje'] = "Expediente finalizado, con dificultad";
			endif;
		else :
			$json['exito'] = false;
			$json['mensaje'] = "Error al guarda datos";
		endif;

		echo json_encode($json);
	}
	function archivar_expediente($id)
	{
		$where = array("tram_id" => $id);
		$datos = array("tram_estado" => "ARCHIVADO", "tram_fechaestado" => date("Y-m-d H:i:s"));
		if ($this->Model_general->guardar_edit_registro("tramite", $datos, $where) != FALSE) {
			$json['exito'] = true;
		} else {
			$json['exito'] = false;
			$json['mensaje'] = "No se puedo archivar";
		}
		echo json_encode($json);
	}

	function finalizar_expediente($id)
	{
		$this->load->model("Model_expediente");
		$this->load->model("Model_tramite");
		$this->load->helper('Funciones');

		$where = array("tram_id" => $id);
		$tramite = $this->Model_tramite->getTramite($where);

		$expediente = $this->Model_expediente->getExpediente(['expe_id' => $tramite->tram_expe_id]);
		$datos['tipo'] = $expediente->expe_tipo;

		$datos["expediente"] = $tramite->tram_expe_id;
		$datos["tramite"] = $id;
		$this->load->view('expedientes/finalizar_form', $datos);
	}
	function derivar_expediente($id)
	{
		$this->load->model("Model_oficina");
		$this->load->model("Model_expediente");
		$this->load->model("Model_procesos");
		$this->load->model("Model_tramite");
		$this->load->model("Model_acciones");
		$this->load->helper('Funciones');

		$where = array("tram_id" => $id);
		$tramite = $this->Model_tramite->getTramite($where);

		$expediente = $this->Model_expediente->getExpediente(['expe_id' => $tramite->tram_expe_id]);
		$datos['tipo'] = $expediente->expe_tipo;

		$where = array("expe_id" => $tramite->tram_expe_id);
		$datos["proceso"] = $this->Model_expediente->expediente_proceso($where);
		$sig_oficina = -1;
		$datos["procesos_detalle"] = array();
		$datos["procesos_requisito"]  = array();

		if (isset($datos["proceso"]->expe_proc_id)) {
			$proc_id = $datos["proceso"]->expe_proc_id;

			$where = array("deta_proc_id" => $proc_id, "deta_activo" => "SI");
			$datos["procesos_detalle"] = $this->Model_procesos->Detalles_procesos_oficina($where);

			$id_oficina = $this->session->userdata('authorizedofic');
			$cont = 0;

			$ultimo_tramite = $this->Model_expediente->getUltimaOficinaDeTramite($tramite->tram_expe_id);

			$veces_por_oficina = 0;
			$size = 0;
			if (is_array($datos['procesos_detalle']))
				$size = sizeof($datos['procesos_detalle']);
			$sig_proceso = -1;

			for ($i = 0; $i < $size; $i++) {
				$proceso = $datos['procesos_detalle'][$i];
				if ($proceso->ofic_id == $ultimo_tramite->oficina) {
					$veces_por_oficina++;
					if ($veces_por_oficina == $ultimo_tramite->total) {
						if ($i + 1 < $size) {
							$aux = $datos['procesos_detalle'][$i + 1];
							$sig_proceso = $aux->deta_id;
							$sig_oficina = $aux->ofic_id;
							break;
						}
					}
				}
			}


			$datos['sig_proceso'] = $sig_proceso;
			//$datos['sig_oficina'] = $sig_oficina;

			$where = array("requ_proc_id" => $proc_id, "requ_activo" => "SI");
			$datos["procesos_requisito"] = $this->Model_procesos->Detalles_requisitos($where);
		}
		$datos["expediente"] = $tramite->tram_expe_id;
		$datos["tramite"] = $id;
		$datos["oficina"] = select_options($this->Model_oficina->getoficinaex($this->mc_ofic), "ofic_id", "ofic_nombre", "- Seleccione oficina -");
		$datos["acciones"] = select_options($this->Model_acciones->getacciones(), "acci_id", "acci_nombre", "- Seleccione Accion -");
		$datos['sig_oficina'] = $sig_oficina;
		$this->load->view('expedientes/derivar_form', $datos);
	}
	function guardar_derivar()
	{

		$this->load->library('Form_validation');

		$this->form_validation->set_rules('accion', 'Accion', 'required');
		$this->form_validation->set_rules('usuario', 'Usuario', 'required');
		$this->form_validation->set_rules('oficina', 'Oficina', 'required');

		if ($this->form_validation->run() == FALSE) {
			$json['exito'] = false;
			$json['mensaje'] = validation_errors();
			echo json_encode($json);
			exit;
		}

		$datos_tramite = array(
			"tram_expe_id" => $this->input->post('expediente'),
			"tram_estado" => "PENDIENTE",
			"tram_ofic_ini" => $this->session->userdata('authorizedofic'),
			"tram_ofic_fin" => $this->input->post('oficina'),
			"tram_user_ini" => $this->session->userdata('authorized'),
			"tram_observacion" => $this->input->post('observacion'),
			"tram_fechareg" => date("Y-m-d H:i:s"),
			"tram_fechaestado" => date("Y-m-d H:i:s"),
			"tram_acci_id" => $this->input->post('accion')
		);



		$this->enviar_mensaje_correo($this->input->post('expediente'), 'DERIVADO', $this->input->post('oficina'));


		/* Upload file */
		if (!empty($_FILES["archivo"]["name"])) {
			$carpeta = ($this->input->post('tipo') == "INTERNO") ? "interno" : "externo";
			$archivo = $_FILES["archivo"]["tmp_name"];
			$nombre = $_FILES["archivo"]["name"];
			$date = date('Y') . '/' . date('n') . '/' . date('j') . '/';
			$urlDest = FCPATH . 'archivos/expedientes/' . $carpeta . '/' . $date;
			$sep = explode('.', $nombre);
			$extension = array_pop($sep);

			$nom_ = url_title(convert_accented_characters($nombre), 'dash', TRUE) . "-" . date("His") . "." . $extension;
			if (!file_exists($urlDest)) {
				mkdir($urlDest, 0777, true);
			}
			if (move_uploaded_file($archivo, $urlDest . $nom_)) {
				$datos_tramite['tram_archivo'] =  $date . $nom_;
			} else {
				$json['mensaje'] = "No se pudo enviar el archivo adjunto";
			}
		}
		/* End Upload file */

		$where = array("tram_id" => $this->input->post("tramite"));
		$datos = array("tram_estado" => "DERIVADO", "tram_fechaestado" => date("Y-m-d H:i:s"));

		$this->Model_general->guardar_edit_registro("tramite", $datos, $where);

		//foreach ($oficinas as $index => $oficid) {
		$oficid = $this->input->post('oficina');
		$userid = $this->input->post('usuario');
		if ($userid == '-1') $add = ' AND 1';
		else if ($userid == '0') $add = ' ORDER BY usua_responsable DESC LIMIT 1';
		else $add = " AND usua_id='{$userid}'";

		$users = $this->db->query("SELECT * FROM usuario WHERE usua_ofic_id='{$oficid}' {$add}")->result();

		foreach ($users as $item) {
			$datos_tramite["tram_user_fin"] = $item->usua_id;

			if ($this->Model_general->guardar_registro("tramite", $datos_tramite) != FALSE) :
				$json['exito'] = true;
			else :
				$json['exito'] = false;
				$json['mensaje'] = "Algunos tramites no se guardaron";
			endif;
		}
		//}
		//

		/*if ($this->Model_general->guardar_registro("tramite", $datos_tramite) != FALSE) :
			if ($this->Model_general->guardar_edit_registro("tramite", $datos, $where) != FALSE) :
				$json['exito'] = true;
			else :
				$json['exito'] = false;
				$json['mensaje'] = "Expediente derivado, con dificultad";
			endif;
		else :
			$json['exito'] = false;
			$json['mensaje'] = "Error al guarda datos";
		endif;*/

		$json['exito'] = true;
		$json['mensaje'] = "";

		echo json_encode($json);
	}


	function guardar_enviar()
	{
		$this->load->library('Form_validation');

		$this->form_validation->set_rules('accion', 'Accion', 'required');
		$this->form_validation->set_rules('usuario', 'Usuario', 'required');
		$this->form_validation->set_rules('oficina', 'Oficina', 'required');

		if ($this->form_validation->run() == FALSE) {
			$json['exito'] = false;
			$json['mensaje'] = validation_errors();
			echo json_encode($json);
			exit;
		}
		$datos_tramite = array(
			"tram_expe_id" => $this->input->post('expediente'),
			"tram_estado" => "PENDIENTE",
			"tram_ofic_ini" => $this->session->userdata('authorizedofic'),
			"tram_ofic_fin" => $this->input->post('oficina'),
			"tram_user_ini" => $this->session->userdata('authorized'),
			"tram_observacion" => $this->input->post('observacion'),
			"tram_fechareg" => date("Y-m-d H:i:s"),
			"tram_fechaestado" => date("Y-m-d H:i:s"),
			"tram_acci_id" => $this->input->post('accion')
		);


		//foreach ($oficinas as $index => $oficid) {
		$oficid = $this->input->post('oficina');
		$userid = $this->input->post('usuario');
		if ($userid == '-1') $add = ' AND 1';
		else if ($userid == '0') $add = ' ORDER BY usua_responsable DESC LIMIT 1';
		else $add = " AND usua_id='{$userid}'";

		$users = $this->db->query("SELECT * FROM usuario WHERE usua_ofic_id='{$oficid}' {$add}")->result();

		foreach ($users as $item) {
			$datos_tramite["tram_user_fin"] = $item->usua_id;

			if ($this->Model_general->guardar_registro("tramite", $datos_tramite) != FALSE) :
				$json['exito'] = true;
			else :
				$json['exito'] = false;
				$json['mensaje'] = "Algunos tramites no se guardaron";
			endif;
		}
		//}
		//

		$this->enviar_mensaje_correo($this->input->post('expediente'), 'DERIVADO', $this->input->post('oficina'));


		//i/f ($this->Model_general->guardar_registro("tramite", $datos_tramite) != FALSE) :
		//$json['exito'] = true;
		//	else :
		$json['exito'] = true;
		$json['mensaje'] = "";
		//	endif;
		echo json_encode($json);
	}
	function seguir($id)
	{
		$this->load->model("Model_expediente");
		$this->load->model("Model_oficina");
		$this->load->model("Model_documento");
		$this->load->model("Model_remitentes");
		$this->load->model("Model_tramite");
		$this->load->model("Model_procesos");
		$where = array("expe_id" => $id);
		$datos["expediente"] = $this->Model_expediente->getExpediente($where);
		$datos["oficina"] = $this->Model_oficina->getoficina(array("ofic_id" => $datos["expediente"]->expe_ofic_id));
		$datos["documento"] = $this->Model_documento->getdocumento(array("docu_id" => $datos["expediente"]->expe_docu_id));
		$datos["remitente"] = $this->Model_remitentes->getRemitentes(array("enti_id" => $datos["expediente"]->expe_enti_id));

		$datos["tramite"] = $this->Model_tramite->expediente_tramites($where);

		$datos["suma_plazo"] = $this->Model_procesos->suma_plazo(array("deta_proc_id" => $datos["expediente"]->expe_proc_id));

		$datos["tramite_"] = $this->Model_tramite->expediente_tramites(array("expe_id" => $id, "tram_ofic_fin" => $this->session->userdata('authorizedofic')));
		$datos["dias_"] = $this->Model_procesos->getProcesos_detalle(array("deta_proc_id" => $datos["expediente"]->expe_proc_id, "deta_ofic_id" => $this->session->userdata('authorizedofic')));
		$this->load->view('expedientes/seguir_expediente', $datos);
	}

	function consultar()
	{
		$this->load->library('Framework');
		$this->load->library('Ssp');
		$this->load->helper('Funciones');
		$this->load->database();
		$this->cssjs->set_path_js(base_url() . "assets/js/");
		$this->cssjs->add_js('expedientes/consultar_dt');

		$json = isset($_GET['json']) ? $_GET['json'] : false;
		$excel = isset($_GET['excel']) ? $_GET['excel'] : false;

		$columns = array(
			array('db' => 'ex.expe_id', 'dt' => 'Expediente', "field" => "expe_id"),
			array('db' => 'ex.expe_fechareg', 'dt' => 'Fecha', "field" => "expe_fechareg"),
			array('db' => 'ex.expe_remitente', 'dt' => 'Remitente', "field" => "expe_remitente"),
			array('db' => 'ex.expe_asunto', 'dt' => 'Asunto', "field" => "expe_asunto"),
			array('db' => 'do.docu_nombre',  'dt' => "Documento", "field" => "docu_nombre"),
			array('db' => 'ex.expe_numero',  'dt' => "Nº docu", "field" => "expe_numero"),
			array('db' => 'tr.tram_estado', 'dt' => 'Estado', "field" => "tram_estado"),
			array('db' => 'ex.expe_tipo', 'dt' => 'Tipo', "field" => "expe_tipo"),
			array('db' => 'pr.proc_nombre',  'dt' => "Proceso", "field" => "proc_nombre"),

			array('db' => 'ex.expe_id', 'dt' => 'DT_RowId', "field" => "expe_id")
		);

		if ($json || $excel) {

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

			$joinQuery = "FROM expediente AS ex 
						  LEFT JOIN tramite AS tr ON (tr.tram_expe_id = ex.expe_id AND tr.tram_id = (select MAX(t.tram_id) from tramite t where t.tram_expe_id = ex.expe_id) )
						  LEFT JOIN documento AS do ON (ex.expe_docu_id = do.docu_id)
						  LEFT JOIN oficina AS ofi ON (ex.expe_ofic_id = ofi.ofic_id)
						  LEFT JOIN usuario AS us ON (ex.expe_user_id = us.usua_id)
						  LEFT JOIN procesos AS pr ON (ex.expe_proc_id = pr.proc_id)
							";
			if (!empty($_POST['estado']))
				$condiciones[] = "tr.tram_estado='" . $_POST['estado'] . "'";
			if (!empty($_POST['tipo']))
				$condiciones[] = "ex.expe_tipo='" . $_POST['tipo'] . "'";
			if (!empty($_POST['anio']))
				$condiciones[] = "ex.expe_fechareg LIKE '%" . $_POST['anio'] . "%'";
			$where = count($condiciones) > 0 ? implode(' AND ', $condiciones) : "";

			$data = $this->ssp->simple($_POST, $sql_details, $table, $primaryKey, $columns, $joinQuery, $where);
			if ($excel) {
				echo $this->exportarXLS("Consultar", '', '', $data['data']);
			} else {
				echo json_encode($data);
			}
			exit(0);
		}
		$datos["estado"] = select_enum($this->Model_general->enum_valores("tramite", "tram_estado"), "- Estados -");
		$datos["tipo"] = select_enum($this->Model_general->enum_valores("expediente", "expe_tipo"), "- Tipo -");
		$datos["anio"] = select_enum($this->Model_general->select_anio(), "- Años -");

		$script['js'] = $this->cssjs->generate_js();
		$datos['columns'] = $columns;
		$this->load->view('header', $script);
		$this->load->view('menu');
		$this->load->view('expedientes/consultar', $datos);
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
		//$objPHPExcel->getActiveSheet()->getSheetView()->setZoomScale(90);
		$objPHPExcel->getActiveSheet()->setTitle(substr($titulo, 0, 30));
		$objPHPExcel->setActiveSheetIndex(0);
		setcookie("fileDownload", 'true');
		$excel->excel_output($objPHPExcel, $titulo);
	}
	function dlgprocesar_interno()
	{
		$this->load->model("Model_expediente");
		$where = array("expe_procesado" => "NO", "expe_tipo" => "INTERNO", "expe_ofic_id" => $this->session->userdata('authorizedofic'));
		$datos["valores"] = $this->Model_expediente->menor_mayor($where);
		$this->load->view('expedientes/procesar_interno', $datos);
	}
	function dlgprocesar_externo()
	{
		$this->load->model("Model_expediente");
		$where = array("expe_procesado" => "NO", "expe_tipo" => "EXTERNO", "expe_ofic_id" => $this->session->userdata('authorizedofic'));
		$datos["valores"] = $this->Model_expediente->menor_mayor($where);
		$this->load->view('expedientes/procesar_externo', $datos);
	}
	function procesar($options)
	{
		$datos["desde"] = $this->input->post('desde');
		$datos["hasta"] = $this->input->post('hasta');
		$datos["tipo"] = $this->input->post('tipo');
		if ($datos["desde"] != "" && $datos["hasta"] != "") :
			switch ($options) {
				case 1:
					for ($i = $datos["desde"]; $i <= $datos["hasta"]; $i++) {
						$where = array(
							"expe_id" => $i,
							"expe_tipo" => $datos["tipo"],
							"expe_ofic_id" => $this->session->userdata('authorizedofic')
						);
						$this->Model_general->guardar_edit_registro("expediente", array("expe_procesado" => "SI"), $where);
					}
					$this->load->view('expedientes/hojaderuta', $datos);
					break;
				case 2:
					for ($i = $datos["desde"]; $i <= $datos["hasta"]; $i++) {
						$where = array(
							"expe_id" => $i,
							"expe_tipo" => $datos["tipo"],
							"expe_ofic_id" => $this->session->userdata('authorizedofic')
						);
						$this->Model_general->guardar_edit_registro("expediente", array("expe_procesado" => "SI"), $where);
					}
					$this->load->view('expedientes/hojadecargo', $datos);

					break;
				case 3:
					for ($i = $datos["desde"]; $i <= $datos["hasta"]; $i++) {
						$where = array(
							"expe_id" => $i,
							"expe_tipo" => $datos["tipo"],
							"expe_ofic_id" => $this->session->userdata('authorizedofic')
						);
						$this->Model_general->guardar_edit_registro("expediente", array("expe_procesado" => "SI"), $where);
					}
					$this->load->view('expedientes/hojarutaycargo', $datos);
					break;

				default:
					# code...
					break;
			}
		else :
			$json['exito'] = false;
			$json['mensaje'] = "Llene los campos";
			echo json_encode($json);
		endif;
	}
	function generarpdf($id = 0)
	{
		$this->load->library("fpdf/Fpdf");

		$this->load->model("Model_expediente");
		$this->load->model("Model_oficina");
		$this->load->model("Model_documento");
		$this->load->model("Model_remitentes");
		$this->load->model("Model_tramite");
		$this->load->model("Model_procesos");
		$where = array("expe_id" => $id);
		$expediente = $this->Model_expediente->getExpediente($where);
		$oficina = $this->Model_oficina->getoficina(array("ofic_id" => $expediente->expe_ofic_id));
		$documento = $this->Model_documento->getdocumento(array("docu_id" => $expediente->expe_docu_id));
		$remitente = $this->Model_remitentes->getRemitentes(array("enti_id" => $expediente->expe_enti_id));
		$tramite = $this->Model_tramite->expediente_tramites($where);

		$suma_plazo = $this->Model_procesos->suma_plazo(array("deta_proc_id" => $expediente->expe_proc_id));
		$tramite_ = $this->Model_tramite->expediente_tramites(array("expe_id" => $id, "tram_ofic_fin" => $this->session->userdata('authorizedofic')));
		$dias_ = $this->Model_procesos->getProcesos_detalle(array("deta_proc_id" => $expediente->expe_proc_id, "deta_ofic_id" => $this->session->userdata('authorizedofic')));

		$plazo = isset($dias_->deta_plazo) ? $dias_->deta_plazo : "0";
		$dates = new DateTime(isset($tramite_[0]->tram_fechareg) ? $tramite_[0]->tram_fechareg : "");
		$dates1 = new DateTime(date("Y-m-d"));
		$interval = $dates->diff($dates1);
		$dias_cont = $interval->format('%a');

		$fechareg = "";
		if (isset($expediente->expe_fechareg)) :
			$date = new DateTime($expediente->expe_fechareg);
			$fechareg = $date->format('j/M/Y h:i a');
		endif;

		// $pdf = new FPDF();
		$this->fpdf->AliasNbPages();
		$this->fpdf->AddPage();
		$this->fpdf->SetFont('Arial', '', 12);
		$this->fpdf->Cell(50, 0, "");
		$this->fpdf->Cell(100, 0, "Reporte de seguimiento de expediente");
		$this->fpdf->Ln(6);
		$this->fpdf->Line(60, 35, 135, 35);

		$this->fpdf->SetFont('Arial', 'B', 10);
		$this->fpdf->Cell(40, 6, 'Nro de expediente:');
		$this->fpdf->SetFont('Arial', '', 10);
		$this->fpdf->Cell(50, 6, $expediente->expe_id);
		$this->fpdf->Cell(10, 6, '');
		$this->fpdf->SetFont('Arial', 'B', 10);
		$this->fpdf->Cell(40, 6, 'Plazo:');
		$this->fpdf->SetFont('Arial', '', 10);
		$this->fpdf->Cell(50, 6, (isset($suma_plazo->deta_plazo) ? $suma_plazo->deta_plazo . " dias" : '-'));
		$this->fpdf->Ln(8);

		$this->fpdf->SetFont('Arial', 'B', 10);
		$this->fpdf->Cell(40, 6, 'Tipo de expediente:');
		$this->fpdf->SetFont('Arial', '', 8);
		$this->fpdf->Cell(50, 6, $documento->docu_nombre);
		$this->fpdf->Cell(10, 6, '');
		$this->fpdf->SetFont('Arial', 'B', 10);
		$this->fpdf->Cell(40, 6, 'Nro de folios:');
		$this->fpdf->SetFont('Arial', '', 10);
		$this->fpdf->Cell(50, 6, $expediente->expe_folio);
		$this->fpdf->Ln(8);

		$this->fpdf->SetFont('Arial', 'B', 10);
		$this->fpdf->Cell(40, 6, 'Fecha de registro:');
		$this->fpdf->SetFont('Arial', '', 10);
		$this->fpdf->Cell(50, 6, $fechareg);
		$this->fpdf->Cell(10, 6, '');
		$this->fpdf->SetFont('Arial', 'B', 10);
		$this->fpdf->Cell(40, 6, 'Entidad:');
		$this->fpdf->SetFont('Arial', '', 10);
		$this->fpdf->Cell(50, 6, @$remitente->enti_nombre);
		$this->fpdf->Ln(8);
		$this->fpdf->SetFont('Arial', 'B', 10);
		$this->fpdf->Cell(40, 6, 'Nro de documento:');
		$this->fpdf->SetFont('Arial', '', 10);
		$this->fpdf->Cell(50, 6, '3-2016');
		$this->fpdf->Cell(10, 6, '');
		$this->fpdf->SetFont('Arial', 'B', 10);
		//$this->fpdf->Cell(40,6,'Tiempo de tramite:');
		//$this->fpdf->SetFont('Arial','',10);
		//$this->fpdf->Cell(50,6,($plazo - $dias_cont));
		$this->fpdf->Ln(8);
		$this->fpdf->SetFont('Arial', 'B', 10);
		$this->fpdf->Cell(40, 6, 'Asunto:');
		$this->fpdf->SetFont('Arial', '', 10);
		$this->fpdf->Cell(50, 6, $expediente->expe_asunto);
		$this->fpdf->Cell(10, 6, '');

		$this->fpdf->SetLineWidth(0.5);
		$this->fpdf->Line(10, 80, 200, 80);
		$this->fpdf->SetLineWidth(0);

		$this->fpdf->Ln(15);

		$this->fpdf->SetFont('Arial', 'B', 10);
		$this->fpdf->Cell(10, 7, 'Nro', 0, 0, "C");
		$this->fpdf->Cell(30, 7, 'Origen', 0, 0, "C");
		$this->fpdf->Cell(35, 7, 'Destino', 0, 0, "C");
		$this->fpdf->Cell(35, 7, 'Fecha', 0, 0, "C");
		$this->fpdf->Cell(50, 7, 'Observacion', 0, 0, "C");
		$this->fpdf->Cell(30, 7, 'Estado', 0, 0, "C");
		$this->fpdf->Ln(8);

		$this->fpdf->SetLineWidth(0.5);
		$this->fpdf->Line(10, 91, 200, 91);
		$this->fpdf->SetLineWidth(0);

		$this->fpdf->SetFont('Arial', '', 7);
		// $this->fpdf->SetAligns(0);
		$this->fpdf->SetWidths(array(10, 30, 35, 35, 50, 30));
		$i = 1;
		foreach ($tramite as $value) :
			if (isset($value->tram_fechaestado)) :
				$date = new DateTime($value->tram_fechaestado);
				$fechaestado = $date->format('d/m/Y h:i');
			endif;
			$this->fpdf->Row(array($i, $value->origen, $value->destino, $fechaestado, $value->tram_observacion, $value->tram_estado));
			$i++;
		endforeach;
		$this->fpdf->Output();
	}
	function generarHojadeRuta($desde, $hasta, $tipo)
	{
		$this->load->model("Model_expediente");
		$this->load->model("Model_acciones");

		$where = array(
			"expe_id >=" => $desde,
			"expe_id <=" => $hasta,
			"expe_ofic_id" => $this->session->userdata('authorizedofic'),
			"expe_tipo" => $tipo
		);
		$expedientes = $this->Model_expediente->expedientes($where);
		// var_dump($expedientes);
		$this->load->library("fpdf/Fpdf");
		$this->fpdf->AliasNbPages();
		$this->fpdf->AddPage();

		$ultimo_id = count($expedientes);
		if ($expedientes == FALSE) {
			print("Hoja de ruta no existente");
			exit(0);
		} else {
			foreach ($expedientes as $key => $value) :
				$this->fpdf->SetFont('Arial', 'B', 12);
				$this->fpdf->Cell(50, 0, "");
				$this->fpdf->Cell(90, 0, "Hoja de Ruta de expediente", 0, 1, "C");
				$this->fpdf->Ln(6);
				$this->fpdf->Line(75, 35, 135, 35);

				$this->fpdf->SetFont('Arial', 'B', 10);
				$this->fpdf->Cell(40, 6, 'Nro de expediente:');
				$this->fpdf->SetFont('Arial', '', 10);
				$this->fpdf->Cell(50, 6, $value->expe_id);
				$this->fpdf->Cell(10, 6, '');
				$this->fpdf->SetFont('Arial', 'B', 10);
				$this->fpdf->Cell(40, 6, 'Plazo:');
				$this->fpdf->SetFont('Arial', '', 10);
				$this->fpdf->Cell(50, 6, 'nose');
				$this->fpdf->Ln(8);

				$this->fpdf->SetFont('Arial', 'B', 10);
				$this->fpdf->Cell(40, 6, 'Tipo de expdiente:');
				$this->fpdf->SetFont('Arial', '', 10);
				$this->fpdf->Cell(50, 6, $value->docu_nombre);
				$this->fpdf->Cell(10, 6, '');
				$this->fpdf->SetFont('Arial', 'B', 10);
				$this->fpdf->Cell(40, 6, 'Nro de folios:');
				$this->fpdf->SetFont('Arial', '', 10);
				$this->fpdf->Cell(50, 6, $value->expe_folio);
				$this->fpdf->Ln(8);

				$this->fpdf->SetFont('Arial', 'B', 10);
				$this->fpdf->Cell(40, 6, 'Fecha de registro:');
				$this->fpdf->SetFont('Arial', '', 10);
				$this->fpdf->Cell(50, 6, $value->expe_fechareg);
				$this->fpdf->Cell(10, 6, '');
				$this->fpdf->SetFont('Arial', 'B', 10);
				$this->fpdf->Cell(40, 6, 'Entidad:');
				$this->fpdf->SetFont('Arial', '', 10);
				$this->fpdf->Cell(50, 6, $value->expe_remitente);
				$this->fpdf->Ln(8);
				$this->fpdf->SetFont('Arial', 'B', 10);
				$this->fpdf->Cell(40, 6, 'Nro de documento:');
				$this->fpdf->SetFont('Arial', '', 10);
				$this->fpdf->Cell(50, 6, $value->expe_numero);
				$this->fpdf->Cell(10, 6, '');
				$this->fpdf->SetFont('Arial', 'B', 10);
				$this->fpdf->Cell(40, 6, 'Tipo de tramite:');
				$this->fpdf->SetFont('Arial', '', 10);
				$this->fpdf->Cell(50, 6, 'Nose');
				$this->fpdf->Ln(8);
				$this->fpdf->SetFont('Arial', 'B', 10);
				$this->fpdf->Cell(40, 6, 'Asunto:');
				$this->fpdf->SetFont('Arial', '', 10);
				$this->fpdf->Cell(50, 6, $value->expe_asunto);
				$this->fpdf->Cell(10, 6, '');


				$this->fpdf->Ln(8);
				$this->fpdf->SetFont('Arial', 'B', 10);
				$this->fpdf->Cell(10, 7, 'Nro', 1, 0, "C");
				$this->fpdf->Cell(50, 7, 'Destinatario', 1, 0, "C");
				$this->fpdf->Cell(35, 7, 'Fecha', 1, 0, "C");
				$this->fpdf->Cell(15, 7, 'Accion', 1, 0, "C");
				$this->fpdf->Cell(15, 7, 'Folios', 1, 0, "C");
				$this->fpdf->Cell(60, 7, 'Remitente', 1, 0, "C");
				$this->fpdf->Ln(7);

				$this->fpdf->SetLineWidth(0);

				$where_expe = array("expe_id" => $value->expe_id);
				$expediente = $this->Model_expediente->expedienteRuta($where_expe);
				for ($i = 0; $i < 14; $i++) :

					$this->fpdf->SetFont('Arial', '', 7);
					if (isset($expediente[$i])) :
						$this->fpdf->Cell(10, 9, $i + 1, 1, 0, "");
						$this->fpdf->Cell(50, 9, $expediente[$i]->ofic_nombre, 1, 0, "");
						$this->fpdf->Cell(35, 9, $expediente[$i]->expe_fechareg, 1, 0, "");
						$this->fpdf->Cell(15, 9, $expediente[$i]->tram_acci_id, 1, 0, "");
						$this->fpdf->Cell(15, 9, $expediente[$i]->expe_folio, 1, 0, "");
						$this->fpdf->Cell(60, 9, $expediente[$i]->expe_remitente, 1, 0, "");
					else :
						$this->fpdf->Cell(10, 9, $i + 1, 1, 0, "");
						$this->fpdf->Cell(50, 9, "", 1, 0, "");
						$this->fpdf->Cell(35, 9, "", 1, 0, "");
						$this->fpdf->Cell(15, 9, "", 1, 0, "");
						$this->fpdf->Cell(15, 9, "", 1, 0, "");
						$this->fpdf->Cell(60, 9, "", 1, 0, "");
					endif;

					$this->fpdf->Ln(9);
				endfor;

				$this->fpdf->Ln(0);
				$acciones = $this->Model_acciones->getacciones();
				$this->fpdf->SetFont('Arial', 'B', 8);
				$this->fpdf->Cell(10, 7, "Acciones:", 0, 0, "");
				$this->fpdf->SetFont('Arial', '', 5);

				$this->fpdf->Ln(5);
				$this->fpdf->SetWidths(array(48, 48, 48, 48));
				$t = 0;
				for ($j = 0; $j < sizeof($acciones) / 4; $j++) :
					$t = 4 * $j;
					$this->fpdf->Row(array(
						$acciones[$t]->acci_id . ".-" . $acciones[$t]->acci_nombre,
						$acciones[$t + 1]->acci_id . ".-" . $acciones[$t + 1]->acci_nombre,
						$acciones[$t + 2]->acci_id . ".-" . $acciones[$t + 2]->acci_nombre,
						$acciones[$t + 3]->acci_id . ".-" . $acciones[$t + 3]->acci_nombre
					));
				endfor;
				$this->fpdf->SetFont('Arial', 'B', 8);
				$this->fpdf->Cell(10, 7, "Observacion:", 0, 0, "");
				$this->fpdf->Ln(5);
				$this->fpdf->Cell(185, 25, "", 1, 0, "");
				if ($key != ($ultimo_id - 1))
					$this->fpdf->AddPage();
			endforeach;
		}
		$this->fpdf->Output();
	}

	function generarHojadeCargo($desde, $hasta, $tipo)
	{
		$this->load->model("Model_expediente");
		$this->load->model("Model_acciones");

		$where = array(
			"expe_id >=" => $desde,
			"expe_id <=" => $hasta,
			"expe_ofic_id" => $this->session->userdata('authorizedofic'),
			"expe_tipo" => $tipo
		);
		$expedientes = $this->Model_expediente->expedientes($where);
		// var_dump($expedientes);
		$this->load->library("fpdf/Fpdf");
		$this->fpdf->AliasNbPages();
		$this->fpdf->AddPage();

		$this->fpdf->SetFont('Arial', 'B', 10);
		$this->fpdf->Cell(50, 0, "");
		$this->fpdf->Cell(90, 0, "Hoja de cargo", 0, 1, "C");
		$this->fpdf->Ln(6);
		$this->fpdf->Line(85, 35, 125, 35);

		$this->fpdf->Cell(20, 8, "Nro", 1, 0, "C");
		$this->fpdf->Cell(20, 8, "Accion", 1, 0, "C");
		$this->fpdf->Cell(30, 8, "Documento", 1, 0, "C");
		$this->fpdf->Cell(20, 8, "Fecha", 1, 0, "C");
		$this->fpdf->Cell(25, 8, "Asunto", 1, 0, "C");
		$this->fpdf->Cell(50, 8, "Observacion", 1, 0, "C");
		$this->fpdf->Cell(25, 8, "Firma", 1, 0, "C");
		$this->fpdf->Ln(8);
		if ($expedientes == FALSE) {
			print("Hoja de cargo no existente");
			exit(0);
		} else {
			foreach ($expedientes as $key => $value) {

				if (($key + 1) % 9 == 1 && $key != 0) {
					$this->fpdf->AddPage();
					$this->fpdf->SetFont('Arial', 'B', 10);
					$this->fpdf->Cell(50, 0, "");
					$this->fpdf->Cell(90, 0, "Hoja de cargo", 0, 1, "C");
					$this->fpdf->Ln(6);
					$this->fpdf->Line(85, 35, 125, 35);

					$this->fpdf->Cell(20, 8, "Nro", 1, 0, "C");
					$this->fpdf->Cell(20, 8, "Accion", 1, 0, "C");
					$this->fpdf->Cell(30, 8, "Documento", 1, 0, "C");
					$this->fpdf->Cell(20, 8, "Fecha", 1, 0, "C");
					$this->fpdf->Cell(25, 8, "Asunto", 1, 0, "C");
					$this->fpdf->Cell(50, 8, "Observacion", 1, 0, "C");
					$this->fpdf->Cell(25, 8, "Firma", 1, 0, "C");
					$this->fpdf->Ln(8);
				}
				$this->fpdf->SetFont('Arial', '', 10);
				$this->fpdf->Cell(20, 24, $value->expe_id, 1, 0, "C");
				$this->fpdf->Cell(170, 8, "Destinatario: " . $value->ofic_nombre, 1, 0, "");
				$this->fpdf->Ln(8);
				$this->fpdf->Cell(20, 16, "", 0, 0, "");
				$this->fpdf->Cell(20, 16, "", 1, 0, "");
				$this->fpdf->Cell(30, 16, "", 1, 0, "");
				$this->fpdf->Cell(20, 16, "", 1, 0, "");
				$this->fpdf->Cell(25, 16, "", 1, 0, "");
				$this->fpdf->Cell(50, 16, "", 1, 0, "");
				$this->fpdf->Cell(25, 16, "", 1, 0, "");
				$this->fpdf->Ln(16);
			}
		}

		$this->fpdf->Output();
	}
	function hojaRutayCargo($desde, $hasta, $tipo)
	{
		$this->load->model("Model_expediente");
		$this->load->model("Model_acciones");

		$where = array(
			"expe_id >=" => $desde,
			"expe_id <=" => $hasta,
			"expe_ofic_id" => $this->session->userdata('authorizedofic'),
			"expe_tipo" => $tipo
		);
		$expedientes = $this->Model_expediente->expedientes($where);
		$this->load->library("fpdf/Fpdf");
		$this->fpdf->AliasNbPages();
		$this->fpdf->AddPage();

		$ultimo_id = count($expedientes);
		if ($expedientes == FALSE) {
			print("Hoja de ruta y cargo no existente");
			exit(0);
		} else {
			foreach ($expedientes as $key => $value) :
				$this->fpdf->SetFont('Arial', 'B', 12);
				$this->fpdf->Cell(50, 0, "");
				$this->fpdf->Cell(90, 0, "Hoja de Ruta de expediente", 0, 1, "C");
				$this->fpdf->Ln(6);
				$this->fpdf->Line(75, 35, 135, 35);

				$this->fpdf->SetFont('Arial', 'B', 10);
				$this->fpdf->Cell(40, 6, 'Nro de expediente:');
				$this->fpdf->SetFont('Arial', '', 10);
				$this->fpdf->Cell(50, 6, $value->expe_id);
				$this->fpdf->Cell(10, 6, '');
				$this->fpdf->SetFont('Arial', 'B', 10);
				$this->fpdf->Cell(40, 6, 'Plazo:');
				$this->fpdf->SetFont('Arial', '', 10);
				$this->fpdf->Cell(50, 6, 'nose');
				$this->fpdf->Ln(8);

				$this->fpdf->SetFont('Arial', 'B', 10);
				$this->fpdf->Cell(40, 6, 'Tipo de expdiente:');
				$this->fpdf->SetFont('Arial', '', 10);
				$this->fpdf->Cell(50, 6, $value->docu_nombre);
				$this->fpdf->Cell(10, 6, '');
				$this->fpdf->SetFont('Arial', 'B', 10);
				$this->fpdf->Cell(40, 6, 'Nro de folios:');
				$this->fpdf->SetFont('Arial', '', 10);
				$this->fpdf->Cell(50, 6, $value->expe_folio);
				$this->fpdf->Ln(8);

				$this->fpdf->SetFont('Arial', 'B', 10);
				$this->fpdf->Cell(40, 6, 'Fecha de registro:');
				$this->fpdf->SetFont('Arial', '', 10);
				$this->fpdf->Cell(50, 6, $value->expe_fechareg);
				$this->fpdf->Cell(10, 6, '');
				$this->fpdf->SetFont('Arial', 'B', 10);
				$this->fpdf->Cell(40, 6, 'Entidad:');
				$this->fpdf->SetFont('Arial', '', 10);
				$this->fpdf->Cell(50, 6, $value->expe_remitente);
				$this->fpdf->Ln(8);
				$this->fpdf->SetFont('Arial', 'B', 10);
				$this->fpdf->Cell(40, 6, 'Nro de documento:');
				$this->fpdf->SetFont('Arial', '', 10);
				$this->fpdf->Cell(50, 6, $value->expe_numero);
				$this->fpdf->Cell(10, 6, '');
				$this->fpdf->SetFont('Arial', 'B', 10);
				$this->fpdf->Cell(40, 6, 'Tipo de tramite:');
				$this->fpdf->SetFont('Arial', '', 10);
				$this->fpdf->Cell(50, 6, 'Nose');
				$this->fpdf->Ln(8);
				$this->fpdf->SetFont('Arial', 'B', 10);
				$this->fpdf->Cell(40, 6, 'Asunto:');
				$this->fpdf->SetFont('Arial', '', 10);
				$this->fpdf->Cell(50, 6, $value->expe_asunto);
				$this->fpdf->Cell(10, 6, '');


				$this->fpdf->Ln(8);
				$this->fpdf->SetFont('Arial', 'B', 10);
				$this->fpdf->Cell(10, 7, 'Nro', 1, 0, "C");
				$this->fpdf->Cell(50, 7, 'Destinatario', 1, 0, "C");
				$this->fpdf->Cell(35, 7, 'Fecha', 1, 0, "C");
				$this->fpdf->Cell(15, 7, 'Accion', 1, 0, "C");
				$this->fpdf->Cell(15, 7, 'Folios', 1, 0, "C");
				$this->fpdf->Cell(60, 7, 'Remitente', 1, 0, "C");
				$this->fpdf->Ln(7);

				$this->fpdf->SetLineWidth(0);
				$where_expe = array("expe_id" => $value->expe_id);
				$expediente = $this->Model_expediente->expedienteRuta($where_expe);
				for ($i = 0; $i < 14; $i++) :

					$this->fpdf->SetFont('Arial', '', 7);
					if (isset($expediente[$i])) :
						$this->fpdf->Cell(10, 9, $i + 1, 1, 0, "");
						$this->fpdf->Cell(50, 9, $expediente[$i]->ofic_nombre, 1, 0, "");
						$this->fpdf->Cell(35, 9, $expediente[$i]->expe_fechareg, 1, 0, "");
						$this->fpdf->Cell(15, 9, $expediente[$i]->tram_acci_id, 1, 0, "");
						$this->fpdf->Cell(15, 9, $expediente[$i]->expe_folio, 1, 0, "");
						$this->fpdf->Cell(60, 9, $expediente[$i]->expe_remitente, 1, 0, "");
					else :
						$this->fpdf->Cell(10, 9, $i + 1, 1, 0, "");
						$this->fpdf->Cell(50, 9, "", 1, 0, "");
						$this->fpdf->Cell(35, 9, "", 1, 0, "");
						$this->fpdf->Cell(15, 9, "", 1, 0, "");
						$this->fpdf->Cell(15, 9, "", 1, 0, "");
						$this->fpdf->Cell(60, 9, "", 1, 0, "");
					endif;

					$this->fpdf->Ln(9);
				endfor;

				$this->fpdf->Ln(0);
				$acciones = $this->Model_acciones->getacciones();
				$this->fpdf->SetFont('Arial', 'B', 8);
				$this->fpdf->Cell(10, 7, "Acciones:", 0, 0, "");
				$this->fpdf->SetFont('Arial', '', 5);

				$this->fpdf->Ln(5);
				$this->fpdf->SetWidths(array(48, 48, 48, 48));
				$t = 0;
				for ($j = 0; $j < sizeof($acciones) / 4; $j++) :
					$t = 4 * $j;
					$this->fpdf->Row(array(
						$acciones[$t]->acci_id . ".-" . $acciones[$t]->acci_nombre,
						$acciones[$t + 1]->acci_id . ".-" . $acciones[$t + 1]->acci_nombre,
						$acciones[$t + 2]->acci_id . ".-" . $acciones[$t + 2]->acci_nombre,
						$acciones[$t + 3]->acci_id . ".-" . $acciones[$t + 3]->acci_nombre
					));

				endfor;
				$this->fpdf->SetFont('Arial', 'B', 8);
				$this->fpdf->Cell(10, 7, "Observacion:", 0, 0, "");
				$this->fpdf->Ln(5);
				$this->fpdf->Cell(185, 25, "", 1, 0, "");
				$this->fpdf->AddPage();
			endforeach;
		}

		$this->fpdf->SetFont('Arial', 'B', 10);
		$this->fpdf->Cell(50, 0, "");
		$this->fpdf->Cell(90, 0, "Hoja de cargo", 0, 1, "C");
		$this->fpdf->Ln(6);
		$this->fpdf->Line(85, 35, 125, 35);

		$this->fpdf->Cell(20, 8, "Nro", 1, 0, "C");
		$this->fpdf->Cell(20, 8, "Accion", 1, 0, "C");
		$this->fpdf->Cell(30, 8, "Documento", 1, 0, "C");
		$this->fpdf->Cell(20, 8, "Fecha", 1, 0, "C");
		$this->fpdf->Cell(25, 8, "Asunto", 1, 0, "C");
		$this->fpdf->Cell(50, 8, "Observacion", 1, 0, "C");
		$this->fpdf->Cell(25, 8, "Firma", 1, 0, "C");
		// $this->fpdf->Ln(9);
		$this->fpdf->Ln(8);

		// $this->fpdf->SetFont('Arial','',10);
		foreach ($expedientes as $key => $value) {

			if (($key + 1) % 9 == 1 && $key != 0) {
				$this->fpdf->AddPage();
				$this->fpdf->SetFont('Arial', 'B', 10);
				$this->fpdf->Cell(50, 0, "");
				$this->fpdf->Cell(90, 0, "Hoja de cargo", 0, 1, "C");
				$this->fpdf->Ln(6);
				$this->fpdf->Line(85, 35, 125, 35);

				$this->fpdf->Cell(20, 8, "Nro", 1, 0, "C");
				$this->fpdf->Cell(20, 8, "Accion", 1, 0, "C");
				$this->fpdf->Cell(30, 8, "Documento", 1, 0, "C");
				$this->fpdf->Cell(20, 8, "Fecha", 1, 0, "C");
				$this->fpdf->Cell(25, 8, "Asunto", 1, 0, "C");
				$this->fpdf->Cell(50, 8, "Observacion", 1, 0, "C");
				$this->fpdf->Cell(25, 8, "Firma", 1, 0, "C");
				$this->fpdf->Ln(8);
			}
			$this->fpdf->SetFont('Arial', '', 10);
			$this->fpdf->Cell(20, 24, $value->expe_id, 1, 0, "C");
			$this->fpdf->Cell(170, 8, "Destinatario: " . $value->ofic_nombre, 1, 0, "");
			$this->fpdf->Ln(8);
			$this->fpdf->Cell(20, 16, "", 0, 0, "");
			$this->fpdf->Cell(20, 16, "", 1, 0, "");
			$this->fpdf->Cell(30, 16, "", 1, 0, "");
			$this->fpdf->Cell(20, 16, "", 1, 0, "");
			$this->fpdf->Cell(25, 16, "", 1, 0, "");
			$this->fpdf->Cell(50, 16, "", 1, 0, "");
			$this->fpdf->Cell(25, 16, "", 1, 0, "");
			$this->fpdf->Ln(16);
		}
		$this->fpdf->Output();
	}
	function imprimir($id)
	{
		$datos["id"] = $id;
		$this->load->view('expedientes/imprimir', $datos);
	}

	function json_expedientes_externos_hoy()
	{
		$this->load->model("Model_expediente");
		$expedientes = new stdClass();
		// ***************externos hoy ***********************************
		$where = array(
			"tram_estado" => "PENDIENTE", "expe_tipo" => "EXTERNO", "tram_fechareg >" => date("Y-m-d"), "tram_ofic_fin" => $this->session->userdata('authorizedofic')
		);
		$query = $this->Model_expediente->cont_expedientes($where);
		$expedientes->cont_externos_hoy[] = ($query != false) ? $query : 0;
		$where = array(
			"tram_estado" => "RECIBIDO", "expe_tipo" => "EXTERNO", "tram_fechareg >" => date("Y-m-d"), "tram_ofic_fin" => $this->session->userdata('authorizedofic')
		);
		$query = $this->Model_expediente->cont_expedientes($where);
		$expedientes->cont_externos_hoy[] = ($query != false) ? $query : 0;
		$where = array(
			"tram_estado" => "DERIVADO", "expe_tipo" => "EXTERNO", "tram_fechareg >" => date("Y-m-d"), "tram_ofic_fin" => $this->session->userdata('authorizedofic')
		);
		$query = $this->Model_expediente->cont_expedientes($where);
		$expedientes->cont_externos_hoy[] = ($query != false) ? $query : 0;
		$where = array(
			"tram_estado" => "FINALIZADO", "expe_tipo" => "EXTERNO", "tram_fechareg >" => date("Y-m-d"), "tram_ofic_fin" => $this->session->userdata('authorizedofic')
		);
		$query = $this->Model_expediente->cont_expedientes($where);
		$expedientes->cont_externos_hoy[] = ($query != false) ? $query : 0;
		// ****************** internos hoy***************************
		$where = array(
			"tram_estado" => "PENDIENTE", "expe_tipo" => "INTERNO", "tram_fechareg >" => date("Y-m-d"), "tram_ofic_fin" => $this->session->userdata('authorizedofic')
		);
		$query = $this->Model_expediente->cont_expedientes($where);
		$expedientes->cont_internos_hoy[] = ($query != false) ? $query : 0;
		$where = array(
			"tram_estado" => "RECIBIDO", "expe_tipo" => "INTERNO", "tram_fechareg >" => date("Y-m-d"), "tram_ofic_fin" => $this->session->userdata('authorizedofic')
		);
		$query = $this->Model_expediente->cont_expedientes($where);
		$expedientes->cont_internos_hoy[] = ($query != false) ? $query : 0;
		$where = array(
			"tram_estado" => "DERIVADO", "expe_tipo" => "INTERNO", "tram_fechareg >" => date("Y-m-d"), "tram_ofic_fin" => $this->session->userdata('authorizedofic')
		);
		$query = $this->Model_expediente->cont_expedientes($where);
		$expedientes->cont_internos_hoy[] = ($query != false) ? $query : 0;
		$where = array(
			"tram_estado" => "FINALIZADO", "expe_tipo" => "INTERNO", "tram_fechareg >" => date("Y-m-d"), "tram_ofic_fin" => $this->session->userdata('authorizedofic')
		);
		$query = $this->Model_expediente->cont_expedientes($where);
		$expedientes->cont_internos_hoy[] = ($query != false) ? $query : 0;
		// ****************** externos todo***************************
		$where = array(
			"tram_estado" => "PENDIENTE", "expe_tipo" => "EXTERNO", "tram_ofic_fin" => $this->session->userdata('authorizedofic')
		);
		$query = $this->Model_expediente->cont_expedientes($where);
		$expedientes->cont_externos_todo[] = ($query != false) ? $query : 0;
		$where = array(
			"tram_estado" => "RECIBIDO", "expe_tipo" => "EXTERNO", "tram_ofic_fin" => $this->session->userdata('authorizedofic')
		);
		$query = $this->Model_expediente->cont_expedientes($where);
		$expedientes->cont_externos_todo[] = ($query != false) ? $query : 0;
		$where = array(
			"tram_estado" => "DERIVADO", "expe_tipo" => "EXTERNO", "tram_ofic_fin" => $this->session->userdata('authorizedofic')
		);
		$query = $this->Model_expediente->cont_expedientes($where);
		$expedientes->cont_externos_todo[] = ($query != false) ? $query : 0;
		$where = array(
			"tram_estado" => "FINALIZADO", "expe_tipo" => "EXTERNO", "tram_ofic_fin" => $this->session->userdata('authorizedofic')
		);
		$query = $this->Model_expediente->cont_expedientes($where);
		$expedientes->cont_externos_todo[] = ($query != false) ? $query : 0;
		// ****************** interno todo***************************
		$where = array(
			"tram_estado" => "PENDIENTE", "expe_tipo" => "INTERNO", "tram_ofic_fin" => $this->session->userdata('authorizedofic')
		);
		$query = $this->Model_expediente->cont_expedientes($where);
		$expedientes->cont_internos_todo[] = ($query != false) ? $query : 0;
		$where = array(
			"tram_estado" => "RECIBIDO", "expe_tipo" => "INTERNO", "tram_ofic_fin" => $this->session->userdata('authorizedofic')
		);
		$query = $this->Model_expediente->cont_expedientes($where);
		$expedientes->cont_internos_todo[] = ($query != false) ? $query : 0;
		$where = array(
			"tram_estado" => "DERIVADO", "expe_tipo" => "INTERNO", "tram_ofic_fin" => $this->session->userdata('authorizedofic')
		);
		$query = $this->Model_expediente->cont_expedientes($where);
		$expedientes->cont_internos_todo[] = ($query != false) ? $query : 0;
		$where = array(
			"tram_estado" => "FINALIZADO", "expe_tipo" => "INTERNO", "tram_ofic_fin" => $this->session->userdata('authorizedofic')
		);
		$query = $this->Model_expediente->cont_expedientes($where);
		$expedientes->cont_internos_todo[] = ($query != false) ? $query : 0;
		// ****************** expediente interno ***************************
		$where = array(
			"tram_estado !=" => "FINALIZADO", "expe_tipo" => "INTERNO", "expe_ofic_id" => $this->session->userdata('authorizedofic')
		);
		$query = $this->Model_expediente->cont_expedientes($where);
		$expedientes->cont_internos[] = ($query != false) ? $query : 0;
		$where = array(
			"tram_estado" => "FINALIZADO", "expe_tipo" => "INTERNO", "expe_ofic_id" => $this->session->userdata('authorizedofic')
		);
		$query = $this->Model_expediente->cont_expedientes($where);
		$expedientes->cont_internos[] = ($query != false) ? $query : 0;

		// $this->output->enable_profiler(TRUE);
		echo json_encode($expedientes);
	}
	function json_alertas()
	{
		$this->load->model("Model_expediente");
		$expedientes = new stdClass();
		// ***************externos hoy ***********************************
		$where = array(
			"tram_estado" => "PENDIENTE", "tram_ofic_fin" => $this->session->userdata('authorizedofic')
		);
		$query = $this->Model_expediente->cont_expedientes($where);
		$expedientes->cont_porrecepcionar = ($query != false) ? $query : 0;
		$where = array(
			"tram_estado" => "RECIBIDO", "tram_ofic_fin" => $this->session->userdata('authorizedofic')
		);
		$query = $this->Model_expediente->cont_expedientes($where);
		$expedientes->cont_pendientes = ($query != false) ? $query : 0;
		$where = array(
			"tram_estado" => "RECIBIDO", "expe_proc_id !=" => NULL, "tram_ofic_fin" => $this->session->userdata('authorizedofic')
		);
		$query = $this->Model_expediente->cont_expedientes($where);
		$expedientes->cont_conplazos = ($query != false) ? $query : 0;

		$where = array(
			"tram_estado" => "FINALIZADO", "tram_ofic_fin" => $this->session->userdata('authorizedofic')
		);
		$query = $this->Model_expediente->cont_expedientes($where);
		$expedientes->cont_finalizados = ($query != false) ? $query : 0;
		echo json_encode($expedientes);
	}



	public function get($docu, $numero)
	{

		$row = $this->db->query("SELECT * FROM documento WHERE docu_id='{$docu}'")->row();

		$path = FCPATH . 'assets/plantilla.docx';

		$outpath = FCPATH . 'assets/' . uniqid();
		copy($path, $outpath);

		// $temp = tmpfile();
		// $outpath = stream_get_meta_data($temp)['uri'];

		// fwrite($temp, file_get_contents($path));

		$zip = new \ZipArchive;
		//This is the main document in a .docx file.
		$fileToModify = 'word/document.xml';

		if ($zip->open($outpath) === TRUE) {
			$contents = $zip->getFromName($fileToModify);
			$contents = str_replace('[DOCUMENTO]', $row->docu_nombre, $contents);
			$contents = str_replace('[NROSIGLA]', $numero, $contents);
			$contents = str_replace('[NOMBRE_REMITENTE]', $this->full_user->usua_nombres . ' ' . $this->full_user->usua_apellidos, $contents);
			$contents = str_replace('[CARGO_REMITENTE]', $this->full_user->usua_cargo, $contents);
			$contents = str_replace('[NOMBRE_DESTINATARIO]', '', $contents);
			$contents = str_replace('[CARGO_DESTINATARIO]', '', $contents);
			$contents = str_replace('[ASUNTO]', '', $contents);
			$zip->deleteName($fileToModify);
			$zip->addFromString($fileToModify, $contents);
			$return = $zip->close();
			/* if ($return == TRUE) {
                echo "Success!";
            }*/
		} else {
			echo 'failed';
		}

		header('Content-Description: File Transfer');
		header('Content-Type: application/vnd.openxmlformats-officedocument.wordprocessingml.document');
		header('Content-Disposition: attachment; filename="' . $row->docu_nombre . ' ' . $numero . '.docx"');
		header('Content-Transfer-Encoding: binary');

		echo file_get_contents($outpath);
		exit(0);
	}


	public function getUsers($id)
	{
		$add = '1';
		if ($id > 0) $add = "ofic_id={$id}";
		$result = $this->db->query("SELECT * FROM oficina WHERE {$add} AND ofic_id!='{$this->full_user->usua_ofic_id}'")->result();

		$output = [];
		foreach ($result as $row) {
			$resultU = $this->db->query("SELECT * FROM usuario WHERE usua_ofic_id='{$row->ofic_id}' ORDER BY usua_responsable DESC, usua_apellidos ASC, usua_nombres ASC")->result();
			$output[] = ['id' => $row->ofic_id, 'name' => $row->ofic_nombre, 'users' => $resultU];
		}
		echo json_encode($output);
	}
}
