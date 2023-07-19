<?php
defined('BASEPATH') or exit('No direct script access allowed');
class Usuario extends MY_Controller
{

	function __construct()
	{
		parent::__construct();
		if (!$this->session->userdata('authorized')) {
			redirect(base_url() . "login");
		}
		$this->load->library('Cssjs');
		$this->load->model("Model_usuario");
		$this->load->model("Model_general");
		$this->load->helper('Form');
	}

	function inicio()
	{
		if (!$this->session->userdata('authorizedadmin'))
			redirect(base_url());
		$this->load->helper('Funciones');
		$this->load->library('Framework');
		$this->load->library('Ssp');
		$this->load->database();
		// var_dump($this->db->hostname);
		$this->cssjs->set_path_js(base_url() . "assets/js/");
		$this->cssjs->add_js('usuario/dt');

		$json = isset($_GET['json']) ? $_GET['json'] : false;
		$excel = isset($_GET['excel']) ? $_GET['excel'] : false;

		$boton = function ($d, $row) {
			$url = base_url('usuario/responsable/' . $row['usua_id']);
			return $row['usua_responsable'] == '1' ?
				'<span class="responsable label label-success btn-sm">Responsable</span>' :
				'<span class="responsable label label-info btn-sm">NO</span>';
		};

		$columns = array(
			//array('db' => 'usua_id', 'dt' => 'Id',"field"=>'usua_id'),
			array('db' => 'usua_nombres', 'dt' => 'Nombres', "field" => 'usua_nombres'),
			array('db' => 'usua_apellidos', 'dt' => 'Apellidos', "field" => 'usua_apellidos'),
			array('db' => 'usua_sigla', 'dt' => 'Sigla', "field" => 'usua_sigla'),
			array('db' => 'usua_cargo', 'dt' => 'Cargo', "field" => 'usua_cargo'),
			array('db' => 'usua_tipo', 'dt' => 'Tipo de usuario', "field" => 'usua_tipo'),
			array('db' => 'usua_user', 'dt' => 'Login', "field" => 'usua_user'),
			array('db' => 'usua_responsable', 'dt' => 'Responsable', "field" => "usua_responsable", "formatter" => $boton),
			array('db' => 'ofic_nombre', 'dt' => 'oficina', "field" => 'ofic_nombre'),
			array('db' => 'usua_estado', 'dt' => 'Activo', "field" => 'usua_estado', 'formatter' => function ($d, $row) {
				if ($d == 1)
					return "SI";
				return "NO";
			}),

			array('db' => 'usua_id', 'dt' => 'DT_RowId', "field" => 'usua_id')
		);


		if ($json || $excel) {

			$json = isset($_GET['json']) ? $_GET['json'] : false;
			$excel = isset($_GET['excel']) ? $_GET['excel'] : false;

			$table = 'usuario';
			$primaryKey = 'usua_id';

			$sql_details = array(
				'user' => $this->db->username,
				'pass' => $this->db->password,
				'db' => $this->db->database,
				'host' => $this->db->hostname
			);

			$condiciones = array();
			$joinQuery = "FROM usuario 
						  LEFT JOIN oficina ON (usua_ofic_id=ofic_id)
							";

			if (!empty($_POST['tipo']))
				$condiciones[] = "usua_tipo='" . $_POST['tipo'] . "'";
			if (!empty($_POST['oficina']))
				$condiciones[] = "usua_ofic_id='" . $_POST['oficina'] . "'";

			$where = count($condiciones) > 0 ? implode(' AND ', $condiciones) : "";
			$data = $this->ssp->simple($_POST, $sql_details, $table, $primaryKey, $columns, $joinQuery, $where);
			if ($excel) {
				echo $this->exportarXLS("Usuarios", '', '', $data['data']);
			} else {
				echo json_encode($data);
			}
			exit(0);
		}

		$this->load->model("Model_oficina");
		$datos["tipo"] = select_enum($this->Model_general->enum_valores("usuario", "usua_tipo"), "- Tipos -");
		$datos["oficina"] = select_options($this->Model_oficina->getoficina(), "ofic_id", "ofic_nombre", "- Oficina -");
		$script['js'] = $this->cssjs->generate_js();
		$datos['columns'] = $columns;
		$this->load->view('header', $script);
		$this->load->view('menu');
		$this->load->view('usuario/inicio', $datos);
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
		if (!$this->session->userdata('authorizedadmin'))
			redirect(base_url());
		$this->load->helper('Funciones');
		$this->load->library('Framework');
		$this->load->model("Model_oficina");

		if ($id != 0) {
			$id = array("usua_id" => $id);
			$usuario["options"] = select_enum($this->Model_general->enum_valores("usuario", "usua_tipo"), "- Tipos -");
			$usuario["oficina"] = select_options($this->Model_oficina->getoficina(), "ofic_id", "ofic_nombre", "- Oficina -");
			$usuario["usuario"] = $this->Model_usuario->getUsuario($id);
			$this->load->view('usuario/form', $usuario);
		} else {
			$usuario["options"] = select_enum($this->Model_general->enum_valores("usuario", "usua_tipo"), "- Tipos -");
			$usuario["oficina"] = select_options($this->Model_oficina->getoficina(), "ofic_id", "ofic_nombre", "- Oficina -");
			$this->load->view('usuario/new_form', $usuario);
		}
	}
	function guardar()
	{
		if (!$this->session->userdata('authorizedadmin'))
			redirect(base_url());
		$active = isset($_POST['active']) ? "password" : "";

		$usuario = $this->input->post('usuario');
		$tipo = $this->input->post('tipo');
		$login = $this->input->post('login');
		$email = $this->input->post('email');
		$dni = $this->input->post('dni');
		$movil = $this->input->post('movil');
		$nombres = $this->input->post('nombres');
		$apellidos = $this->input->post('apellidos');
		$sigla = $this->input->post('sigla');
		$cargo = $this->input->post('cargo');
		$oficina = $this->input->post('oficina');
		$habilitado = isset($_POST['habilitado']) ? '1' : '0';
		$responsable = isset($_POST['responsable']) ? '1' : '0';

		$datos = array(
			"usua_tipo" => $tipo,
			"usua_user" => $login,
			"usua_email" => $email,
			"usua_dni" => $dni,
			"usua_movil" => $movil,
			"usua_nombres" => strtoupper($nombres),
			"usua_apellidos" => strtoupper($apellidos),
			"usua_sigla" => $sigla,
			"usua_cargo" => $cargo,
			"usua_ofic_id" => $oficina,
			"usua_estado" => $habilitado,
			"usua_responsable" => $responsable,
		);
		if ($active != "") {
			$password = $this->input->post('password');
			$datos = array_merge($datos, array("usua_password" => md5($password)));
		}
		if (isset($usuario)) {
			if ($this->Model_general->guardar_edit_registro("usuario", $datos, array("usua_id" => $usuario)) == TRUE) :
				$json['exito'] = true;
				$this->db->query("UPDATE usuario SET usua_responsable = '0' WHERE usua_ofic_id='{$oficina}'");
				$this->db->query("UPDATE usuario SET usua_responsable = '1' WHERE usua_id='{$usuario}' AND usua_ofic_id='{$oficina}'");
			else :
				$json['exito'] = false;
				$json['mensaje'] = "Error al actualizar los datos";
			endif;
		} else {
			if ($this->Model_general->guardar_registro("usuario", $datos) == TRUE) :
				$json['exito'] = true;
			else :
				$json['exito'] = false;
				$json['mensaje'] = "Error al guardar los datos";
			endif;
		}
		echo json_encode($json);
	}
	function perfil()
	{
		$this->load->helper('Funciones');
		$this->load->model("Model_oficina");

		$where = array("usua_id" => $this->session->userdata('authorized'));
		$datos["usuario"] = $this->Model_usuario->perfil($where);

		$script['js'] = $this->cssjs->generate_js();
		$this->load->view('usuario/perfil', $datos);
	}
	function guardar_perfil()
	{
		$active = isset($_POST['active']) ? "active" : "";

		$usuario = $this->session->userdata('authorized');
		$email = $this->input->post('email');
		$movil = $this->input->post('movil');
		$datos = array(
			"usua_email" => $email,
			"usua_movil" => $movil
		);
		if ($active != "") {
			// echo "marcado";
			$old_password = $this->input->post('old_password');
			$new_password = $this->input->post('new_password');
			$new2_password = $this->input->post('new2_password');
			$user = $this->Model_usuario->getUsuario(array("usua_id" => $usuario));
			$actual_password = $user->usua_password;
			if (md5($old_password) == $actual_password) {
				if (empty($new_password) || empty($new2_password) || $new_password != $new2_password) {
					$json['exito'] = false;
					$json['mensaje'] = "Error en la nueva contraseña";
					echo json_encode($json);
					exit;
				}
				$datos = array(
					"usua_email" => $email,
					"usua_movil" => $movil,
					"usua_password" => md5($new_password)
				);
			} else {
				$json['exito'] = false;
				$json['mensaje'] = "La contraseña anterior no coincide";
				echo json_encode($json);
				exit;
			}
		}
		if (isset($usuario)) {
			if ($this->Model_general->guardar_edit_registro("usuario", $datos, array("usua_id" => $usuario)) == TRUE) :
				$json['exito'] = true;
			else :
				$json['exito'] = false;
				$json['mensaje'] = "Error al actualizar los datos";
			endif;
		}
		echo json_encode($json);
	}
	public function borrar()
	{
		if (!$this->session->userdata('authorizedadmin'))
			redirect(base_url());
		$delete = $_POST['data'];
		$table = 'usuario';

		foreach ($delete as $id) {
			$where = array(
				'usua_id' => $id
			);
			if ($this->Model_general->borrar($where, $table) != TRUE) {
				$json['exito'] = false;
				$json['mensaje'] = "No se pudo borrar algunos usuarios por que estan siendo usados";
			} else {
				$json['exito'] = true;
				$json['mensaje'] = false;
			}
		}
		echo json_encode($json);
	}
}
