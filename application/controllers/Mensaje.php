<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Mensaje extends MY_Controller {
	function __construct()
	{
			parent::__construct();
			$this->load->library('Cssjs');
		if(!$this->session->userdata('authorized')){
			redirect(base_url()."login");
		}
			$this->load->model("Model_general");
			
	}
	public function inicio()
	{
		$this->load->model("Model_usuario");
		$this->cssjs->set_path_js(base_url()."assets/js/");
		$this->cssjs->add_js('mensaje/mensaje_dt');
		$where = array("usua_id !="=>$this->session->userdata('authorized'));
		$datos["usuarios"] = $this->Model_general->usuario_oficinas($where,false,$this->session->userdata('authorized'));
			
		$script['js'] = $this->cssjs->generate_js();
		$this->load->view('header',$script);
		$this->load->view('menu');
		$this->load->view('mensaje/inicio',$datos);
		$this->load->view('footer');
		// $this->output->enable_profiler(TRUE);
	}
	function info_mensaje($id){

		$this->load->model("Model_usuario");
		$this->load->model("Model_general");

		$this->Model_general->guardar_edit_registro("mensaje",array("mens_leido"=>"SI"),array("mens_user_ini" => $id,"mens_user_fin"=>$this->session->userdata('authorized')));
		$where = array("usua_id"=>$id);

		$response = new StdClass;
		$response->destino = $this->Model_general->usuario_oficinas($where,true);
		$mensajes = $this->Model_usuario->mensajes($id,$this->session->userdata('authorized'));
		if($mensajes!=FALSE){
			$response->mensajes = $mensajes;

			foreach ($response->mensajes as $key => $value) {
				$nombre = explode('/',$response->mensajes[$key]["mens_archivo"]);
				$nombre = array_pop($nombre);
				$add_array = array(
									"nomb_archivo"=>$nombre,
									"nomb_usua_ini"=>strtoupper(substr($response->mensajes[$key]["usuario_ini"],0,1)).strtoupper(substr($response->mensajes[$key]["usuario_ini_apellidos"],0,1))
									// "nomb_usua_fin"=>substr($response->mensajes[$key]["usuario_fin"],0,1)
									);
				$response->mensajes[$key]=array_merge($response->mensajes[$key],$add_array);
			}
		}
		echo json_encode($response);
	}
	function nuevo_mensaje(){
		$this->load->model("Model_general");
		$mensaje = $this->input->post('mensaje');
		$usuario = $this->input->post('usuario');
		$oficina = $this->input->post('oficina');

		$datos = array(
			"mens_ofic_ini" => $this->session->userdata('authorizedofic'),
			"mens_ofic_fin" => $oficina,
			"mens_user_ini" => $this->session->userdata('authorized'),
			"mens_user_fin" => $usuario,
			"mens_mensaje" => $mensaje,
			"mens_fechareg" => date("Y-m-d H:i:s")
			);

		if(!empty($_FILES["archivo"]["name"]))
		{
			$archivo = $_FILES["archivo"]["tmp_name"];
			$nombre = $_FILES["archivo"]["name"];

    		$date = date('Y').'/'.date('n').'/'.date('j').'/';
    		$urlDest = FCPATH.'archivos/mensajes/'.$date;
    		$sep = explode('.',$nombre);
			$extension = array_pop($sep);

    		$nom_ = url_title(convert_accented_characters($sep[0]),'dash', TRUE)."-".date("His").".".$extension;

    		if(!file_exists($urlDest)){
    			mkdir($urlDest,0777,true);
    		}
    		if(move_uploaded_file($archivo,$urlDest.$nom_)){
				$datos = array_merge($datos,array("mens_archivo" => $date.$nom_));
    		}
    		else{
    			$json['mensaje'] = "Nose pudo enviar el archivo adjunto";
    		}
    	}
		if($this->Model_general->guardar_registro("mensaje",$datos)==TRUE):
			$json['exito'] = true;
		else:
			$json['exito'] = false;
			$json['mensaje'] = "Error al guardar los datos";
		endif;
		echo json_encode($json);
	}
	function mensaje_noleidos(){
		$where = array("usua_id !="=>$this->session->userdata('authorized'));
		$mensajes = $this->Model_general->usuario_oficinas($where,false,$this->session->userdata('authorized'));
		foreach ($mensajes as $key => $value) {
			if($value->mens_leido=="NO")
				$mensajes[$key]->mens_mensaje = substr($value->mens_mensaje, 0, 40);
			else
				unset($mensajes[$key]);
		}
		echo json_encode($mensajes);
	}
	
}
