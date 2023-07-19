<?php
defined('BASEPATH') OR exit('No direct script access allowed');
class Login extends MY_Controller {

	function __construct() {
		parent::__construct();
		
		$this->load->library('Cssjs');
		$this->load->model("Model_login");
		$this->load->model("Model_general");
	}

	function index() {
		if($this->session->userdata('authorized')){
			redirect(base_url());
		}
		$this->cssjs->set_path_js(base_url()."assets/js/");
		$this->cssjs->add_js('usuario/login');
		$script['js'] = $this->cssjs->generate_js();
		$captcha= array();

		if(isset($_COOKIE["captcha_count"])){ 
			if($_COOKIE["captcha_count"]>3)
			{

				$this->load->helper('Captcha');
				

				$vals = array(
		        //'word'          => '',
		        'img_path'      => FCPATH.'captcha/',
		        'img_url'       => base_url().'captcha/',
		        'font_path'     => FCPATH.'assets/comic.ttf',
		        'word_length'   => 4,
		        /*'img_width'     => 200,
		        'img_height'    => 75,
		        'expiration'    => 7200,
		        
		        'font_size'     => 17,
		        'img_id'        => 'Imageid',
		        'pool'          => '0123456789abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ',
*/
		      /*  'colors'        => array(
		                'background' => array(255, 255, 255),
		                'border' => array(200, 200, 200),
		                'text' => array(40, 96, 144),
		                'grid' => array(200, 200, 200)
		        	)*/
				);
				$img_path = FCPATH.'/captcha/';
				$img_url = base_url().'/captcha/';

				
				$cap = create_captcha($vals);
				//print_r($cap);
				//exit(0);
				$captcha["cap"] = $cap;
				$data = array(
				        'captcha_time'  => $cap['time'],
				        'ip_address'    => $this->input->ip_address(),
				        'word'          => $cap['word']
				);

				$query = $this->db->insert_string('captcha', $data);
				$this->db->query($query);
			}
		}

		$this->load->view('header',$script);
		$this->load->view('login/inicio',$captcha);
		$this->load->view('footer');
	}
	function verificar_login()
	{
		$this->load->helper('Cookie');
		$usuario  = $this->security->xss_clean(strip_tags($this->input->post("usuario")));
		$password = $this->security->xss_clean(strip_tags($this->input->post("password")));
		$captcha  = $this->security->xss_clean(strip_tags($this->input->post("captcha")));
		$response = new StdClass;
		$success_captcha = TRUE;
		$ip =$this->input->ip_address();
		if(isset($_COOKIE["captcha_count"])){ 
			if($_COOKIE["captcha_count"]>3)
			{	
				$expira = time() - 7200;
				$this->Model_general->borrar(array("captcha_time <"=>$expira),"captcha");
				$success_captcha = $this->Model_general->check_captcha(array("word" => $captcha,"ip_address"=>$ip,"captcha_time >"=>$expira));
				//echo $success_captcha;
			}
		}
		if($success_captcha != FALSE ){
			if($usuario != FALSE){
			 	$user = array(
			 		"usua_user" => $usuario,
			 		"usua_estado" => '1'
			 		);

			 	$usua = $this->Model_login->login($user);
			 	if($usua != FALSE)
			 	{
			 		$usu_pas = array(
			 		"usua_user" => $usuario,
			 		"usua_password" => md5($password),
			 		"usua_estado" => '1'
			 		);

			 		if($this->Model_login->login($usu_pas,TRUE)!=FALSE){
			 			$cambios = array("usua_intento"=>'0');
						$this->Model_login->guargar_edit_registro($cambios,$usua["id"]);
						unset($_COOKIE['captcha_count']);
						unset($_COOKIE['error']);
			 			$response->url = base_url();
			 		}
			 		else {
			 			$id = $usua["id"];
			 			$contador = $usua["intento"];
			 			$this->bloquear($contador,$id,$ip);
			 			$response->error ="Contraseña incorrecta";
			 			$response->url = base_url()."login";

			 		}
			 	}
			 	else
			 	{
			 		$response->error = "El usuario no exisite o fue bloqueado !!";
					$this->activar_cookie();
					$response->url = base_url()."login";
			 	}
			}
			else
			{
				$response->error = "Error al enviar datos";
				$this->activar_cookie();
				$response->url = base_url()."login";
			}
		}
		else{

			$response->error = "El captcha no coincide";
			$response->url = base_url()."login";

				$user = array(
			 		"usua_user" => $usuario,
			 		"usua_estado" => '1'
			 		);

			 	$usua = $this->Model_login->login($user);
			 	if($usua != FALSE)
			 	{
			 		$id = $usua["id"];
			 			$contador = $usua["intento"];
			 			$this->bloquear($contador,$id,$ip);
			 	}
			 	else{
					$this->activar_cookie();
			 	}
		}

		echo json_encode($response);
	}
	function bloquear($contador,$id,$ip){
		if($contador<3){
 			if(isset($_COOKIE["captcha_count"])){ 
				if($_COOKIE["captcha_count"]>3)
				{
					$contador = 3;
				}
			}
			$this->activar_cookie();
		}
		else{
			$cookie = array(
			    'name'   => 'captcha_count',
		        'value'  => $contador+1,
		        // 'expire' => time()+86500,
		        'expire' => 60*10,
		        'path'   => '/'
			);
			 $this->input->set_cookie($cookie);	
		}
		$cambios = array("usua_intento" => $contador+1,"usua_ultimoip"=>$ip);
		if($cambios["usua_intento"]>=6){
			$cambios = array("usua_estado"=>'0',"usua_ultimoip"=>$ip);
		}
		$this->Model_login->guargar_edit_registro($cambios,$id);
	}
	function activar_cookie(){
		$cont=isset($_COOKIE["captcha_count"])?($this->input->cookie("captcha_count")+1): 1;
 		$cookie = array(
		    'name'   => 'captcha_count',
	        'value'  => $cont,
	        // 'expire' => time()+86500,
	        'expire' => 60*10,
	        'path'   => '/'
		);
		$this->input->set_cookie($cookie);
	}
	function salir() {
 		$cookie = array(
		    'name'   => 'captcha_count',
	        'value'  => 0,
	        // 'expire' => time()+86500,
	        'expire' => 60*10,
	        'path'   => '/'
		);
		$this->input->set_cookie($cookie);
		$this->session->sess_destroy();
 		unset($_COOKIE['captcha_count']);
 		redirect(base_url().'login');
	}

}
?>
