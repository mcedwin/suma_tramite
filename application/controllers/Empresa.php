<?php
defined('BASEPATH') OR exit('No direct script access allowed');
class Empresa extends MY_Controller {

	function __construct() {
		parent::__construct();
		if(!$this->session->userdata('authorized')){
			redirect(base_url()."login");
		}
		if(!$this->session->userdata('authorizedadmin'))
			redirect(base_url());
		$this->load->model("Model_general");
		$this->load->model("Model_empresa");
		$this->load->helper('Form');
		$this->load->library('Cssjs');
	}

	function inicio() {
		$this->load->database();
		$this->cssjs->set_path_js(base_url()."assets/js/");
		$this->cssjs->add_js('empresa/empresa');

		$datos["empresa"] = $this->Model_empresa->getempresa(array("conf_id"=>1));
		$script['js'] = $this->cssjs->generate_js();
		$this->load->view('header',$script);
		$this->load->view('menu');
		$this->load->view('empresa/inicio',$datos);
		$this->load->view('footer');
	}
	function guardar(){
		$empresa = $this->input->post('empresa');
		$active = isset($_POST['active'])?"active":"";
		$enviar = isset($_POST['enviar'])?"enviar":"";

		$datos = array(
			"conf_nombres" => $this->input->post('nombre'),
			"conf_siglas" => $this->input->post('siglas'),
			"conf_ruc" => $this->input->post('ruc'),
			"conf_email" => $this->input->post('email'),
			"conf_telefono" => $this->input->post('telefono'),
			"conf_direccion" => $this->input->post('direccion'),
			"conf_periodo" => $this->input->post('periodo'),
			);
		if($enviar!=""){
			$datos_email = array(
				"conf_enviaremail" => "SI",
				);
			$datos = array_merge($datos,$datos_email);
		}
		else{
			$datos_email = array(
				"conf_enviaremail" => "NO",
				);
			$datos = array_merge($datos,$datos_email);
		}

		if($active!=""){
			$datos_email = array(
				"conf_smtp" => "SI",
				"conf_email_host" => $this->input->post('host'),
				"conf_email_user" => $this->input->post('user'),
				"conf_email_password" => $this->input->post('password'),
				"conf_email_puerto" => $this->input->post('puerto'),
				
				);
			$datos = array_merge($datos,$datos_email);
		}
		else{
			$datos_email = array(
				"conf_smtp" => "NO",
				);
			$datos = array_merge($datos,$datos_email);
		}
		
		if(isset($empresa)){
			if($this->Model_general->guardar_edit_registro("configuracion",$datos,array("conf_id" => $empresa))==TRUE):
				$json['exito'] = true;
				$json['mensaje'] = "Error al actualizar los datos";
			else:
				$json['exito'] = false;
				$json['mensaje'] = "Error al actualizar los datos";
			endif;
		}
		else{
			if($this->Model_general->guardar_registro("configuracion",$datos)==TRUE):
				$json['exito'] = true;
				$json['mensaje'] = "Error al guardar los datos";
			else:
				$json['exito'] = false;
				$json['mensaje'] = "Error al guardar los datos";
			endif;
		}
		echo json_encode($json);
	}

	// public function borrar()
	// {
	// 	$delete = $_POST['data'];
	// 	$table = 'configuracion';
					
	// 	foreach ($delete as $id) {
	// 		$where = array(
	// 			'conf_id' => $id
	// 			);
	// 		if($this->Model_general->borrar($where,$table)==TRUE){
	// 			echo "EXITO";
	// 		}else{
	// 			echo "ERROR";
	// 		}
	// 	}
	// }
}

?>
