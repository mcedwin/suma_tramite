<?php
defined('BASEPATH') OR exit('No direct script access allowed');
class Consultar extends MY_Controller {

	function __construct() {
		parent::__construct();
		$this->load->model("Model_general");
		$this->load->model("Model_empresa");
		$this->load->helper('form');
		$this->load->library('Cssjs');
	}

	function index() {
		$this->load->database();
		$this->cssjs->set_path_js(base_url()."assets/js/");
		$this->cssjs->add_js('consultar/consultar');

		$datos["empresa"] = $this->Model_empresa->getempresa(array("conf_id"=>1));
				$this->load->helper('Captcha');
				

				$vals = array(
		        //'word'          => '',
		        'img_path'      => FCPATH.'/captcha/',
		        'img_url'       => base_url().'captcha/',
		        'font_path'     => FCPATH.'/assets/comic.ttf',
		        'word_length'   => 4,
		        /*'img_width'     => 200,
		        'img_height'    => 75,
		        'expiration'    => 7200,
		        'word_length'   => 0,
		        'font_size'     => 17,
		        'img_id'        => 'Imageid',
		        'pool'          => '0123456789abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ',
*/
		        'colors'        => array(
		                'background' => array(255, 255, 255),
		                'border' => array(200, 200, 200),
		                'text' => array(40, 96, 144),
		                'grid' => array(200, 200, 200)
		        	)
				);

				$cap = create_captcha($vals);

				$captcha["cap"] = $cap;
				//die($cap['word']);
				// $cap = create_captcha($vals);
				$data = array(
				        'captcha_time'  => $cap['time'],
				        'ip_address'    => $this->input->ip_address(),
				        'word'          => $cap['word']
				);

				$query = $this->db->insert_string('captcha', $data);
				$this->db->query($query);
		// $this->agregarScript('js/' . $this->clase . '/dt.js');
		$script['js'] = $this->cssjs->generate_js();
		$this->load->view('header',$script);
		// $this->load->view('menu');
		$this->load->view('consultar/inicio',$captcha);
		$this->load->view('footer');
	}
	function verificar(){
		$this->load->model("Model_general");
		$numero = $this->input->post('numero');
		$captcha = $this->input->post('captcha');
		$periodo = $this->input->post('periodo');
		$ip = $this->input->ip_address();

		$check_expdiente = $this->Model_general->existe(array("expe_id"=>$numero,"expe_periodo"=>$periodo),"expediente");

		$expira = time() - 7200;
		$this->Model_general->borrar(array("captcha_time <"=>$expira),"captcha");
		$check_captch = $this->Model_general->check_captcha(array("word" => $captcha,"ip_address"=>$ip,"captcha_time >"=>$expira));
	
	
		if($check_captch!=TRUE):
			$json['exito'] = false;
			$json['mensaje'] = "Capcha incorrecto";
			die(json_encode($json));
		endif;

		
		
		if($check_expdiente==TRUE):
			$json['exito'] = true;
		else:
			$json['exito'] = false;
			$json['mensaje'] = "Llene correctamente los valores";
		endif;

		echo json_encode($json);
	}
	function seguir_libre(){
		$this->load->model("Model_expediente");
		$this->load->model("Model_oficina");
		$this->load->model("Model_documento");
		$this->load->model("Model_remitentes");
		$this->load->model("Model_tramite");
		$this->load->model("Model_procesos");
		$id = $this->input->post('id');
		
		$where = array("expe_id" => $id);
		$datos["expediente"] = $this->Model_expediente->getExpediente($where);
		$datos["oficina"] = $this->Model_oficina->getoficina(array("ofic_id"=>$datos["expediente"]->expe_ofic_id));
		$datos["documento"] = $this->Model_documento->getdocumento(array("docu_id"=>$datos["expediente"]->expe_docu_id));
		$datos["remitente"] = $this->Model_remitentes->getRemitentes(array("enti_id"=>$datos["expediente"]->expe_enti_id));
		$datos["tramite"] = $this->Model_tramite->expediente_tramites($where);

		$datos["suma_plazo"] = $this->Model_procesos->suma_plazo(array("deta_proc_id"=>$datos["expediente"]->expe_proc_id));

		$datos["tramite_"] = $this->Model_tramite->expediente_tramites(array("expe_id" => $id,"tram_ofic_fin"=>$this->session->userdata('authorizedofic')));
		$datos["dias_"] = $this->Model_procesos->getProcesos_detalle(array("deta_proc_id"=>$datos["expediente"]->expe_proc_id,"deta_ofic_id"=>$this->session->userdata('authorizedofic')));
		$this->load->view('consultar/seguir_expediente',$datos);
	}
	function imprimir($id){
		$datos["id"]=$id;
		$this->load->view('consultar/imprimir',$datos);
	}
	
	function generarpdf($id=0){
		$this->load->library("fpdf/Fpdf");

		$this->load->model("Model_expediente");
		$this->load->model("Model_oficina");
		$this->load->model("Model_documento");
		$this->load->model("Model_remitentes");
		$this->load->model("Model_tramite");
		$this->load->model("Model_procesos");
		$where = array("expe_id" => $id);
		$expediente = $this->Model_expediente->getExpediente($where);
		$oficina = $this->Model_oficina->getoficina(array("ofic_id"=>$expediente->expe_ofic_id));
		$documento = $this->Model_documento->getdocumento(array("docu_id"=>$expediente->expe_docu_id));
		$remitente = $this->Model_remitentes->getRemitentes(array("enti_id"=>$expediente->expe_enti_id));
		$tramite = $this->Model_tramite->expediente_tramites($where);

		$suma_plazo = $this->Model_procesos->suma_plazo(array("deta_proc_id"=>$expediente->expe_proc_id));
		$tramite_ = $this->Model_tramite->expediente_tramites(array("expe_id" => $id,"tram_ofic_fin"=>$this->session->userdata('authorizedofic')));
		$dias_ = $this->Model_procesos->getProcesos_detalle(array("deta_proc_id"=>$expediente->expe_proc_id,"deta_ofic_id"=>$this->session->userdata('authorizedofic')));

		$plazo = isset($dias_->deta_plazo)?$dias_->deta_plazo:"0";
		$dates = new DateTime(isset($tramite_[0]->tram_fechareg)?$tramite_[0]->tram_fechareg:"");
		$dates1 = new DateTime(date("Y-m-d"));
		$interval = $dates->diff($dates1);
		$dias_cont = $interval->format('%a');

		$fechareg="";
		if(isset($expediente->expe_fechareg)):
			$date = new DateTime($expediente->expe_fechareg);
			$fechareg = $date->format('j/M/Y h:i a');
		endif;

		// $pdf = new FPDF();
		$this->fpdf->AliasNbPages();
		$this->fpdf->AddPage();
		$this->fpdf->SetFont('Arial','',12);
	    $this->fpdf->Cell(50,0,"");
	    $this->fpdf->Cell(100,0,"Reporte de seguimiento de expediente");
		$this->fpdf->Ln(6);
		$this->fpdf->Line(60,35,135,35);

		$this->fpdf->SetFont('Arial','B',10);
		$this->fpdf->Cell(40,6,'Nro de expediente:');
		$this->fpdf->SetFont('Arial','',10);
		$this->fpdf->Cell(50,6,$expediente->expe_id);
			$this->fpdf->Cell(10,6,'');
		$this->fpdf->SetFont('Arial','B',10);
		$this->fpdf->Cell(40,6,'Plazo:');
		$this->fpdf->SetFont('Arial','',10);
		$this->fpdf->Cell(50,6,(isset($suma_plazo->deta_plazo)?$suma_plazo->deta_plazo." dias":'-'));
		$this->fpdf->Ln(8);

		$this->fpdf->SetFont('Arial','B',10);
		$this->fpdf->Cell(40,6,'Tipo de expdiente:');
		$this->fpdf->SetFont('Arial','',10);
		$this->fpdf->Cell(50,6,$documento->docu_nombre);
			$this->fpdf->Cell(10,6,'');
		$this->fpdf->SetFont('Arial','B',10);
		$this->fpdf->Cell(40,6,'Nro de folios:');
		$this->fpdf->SetFont('Arial','',10);
		$this->fpdf->Cell(50,6,$expediente->expe_folio);
		$this->fpdf->Ln(8);

		$this->fpdf->SetFont('Arial','B',10);
		$this->fpdf->Cell(40,6,'Fecha de registro:');
		$this->fpdf->SetFont('Arial','',10);
		$this->fpdf->Cell(50,6,$fechareg);
			$this->fpdf->Cell(10,6,'');
		$this->fpdf->SetFont('Arial','B',10);
		$this->fpdf->Cell(40,6,'Entidad:');
		$this->fpdf->SetFont('Arial','',10);
		$this->fpdf->Cell(50,6,@$remitente->enti_nombre);
		$this->fpdf->Ln(8);
		$this->fpdf->SetFont('Arial','B',10);
		$this->fpdf->Cell(40,6,'Nro de documento:');
		$this->fpdf->SetFont('Arial','',10);
		$this->fpdf->Cell(50,6,'3-2016');
			$this->fpdf->Cell(10,6,'');
		$this->fpdf->SetFont('Arial','B',10);
		//$this->fpdf->Cell(40,6,'Tiempo de tramite:');
		//$this->fpdf->SetFont('Arial','',10);
		//$this->fpdf->Cell(50,6,($plazo - $dias_cont));
		$this->fpdf->Ln(8);
		$this->fpdf->SetFont('Arial','B',10);
		$this->fpdf->Cell(40,6,'Asunto:');
		$this->fpdf->SetFont('Arial','',10);
		$this->fpdf->Cell(50,6,$expediente->expe_asunto);
			$this->fpdf->Cell(10,6,'');

		$this->fpdf->SetLineWidth(0.5);	
		$this->fpdf->Line(10,80,200,80);	
		$this->fpdf->SetLineWidth(0);

		$this->fpdf->Ln(15);

		$this->fpdf->SetFont('Arial','B',10);
		$this->fpdf->Cell(10,7,'Nro',0,0,"C");
		$this->fpdf->Cell(30,7,'Origen',0,0,"C");	
		$this->fpdf->Cell(35,7,'Destino',0,0,"C");	
		$this->fpdf->Cell(35,7,'Fecha',0,0,"C");	
		$this->fpdf->Cell(50,7,'Observacion',0,0,"C");	
		$this->fpdf->Cell(30,7,'Estado',0,0,"C");
		$this->fpdf->Ln(8);

		$this->fpdf->SetLineWidth(0.5);	
		$this->fpdf->Line(10,91,200,91);	
		$this->fpdf->SetLineWidth(0);

		$this->fpdf->SetFont('Arial','',10);
		// $this->fpdf->SetAligns(0);
		$this->fpdf->SetWidths(array(10,30,35,35,50,30));
		$i=1;
		foreach ($tramite as $value):
			if(isset($value->tram_fechaestado)):
				$date = new DateTime($value->tram_fechaestado);
				$fechaestado = $date->format('d/m/Y h:i');
			endif;
			$this->fpdf->Row(array($i,$value->origen ,$value->destino ,$fechaestado,$value->tram_observacion,$value->tram_estado));
			$i++;
		endforeach;
		$this->fpdf->Output();
	}
	function generarpdf1($id=0){
		$this->load->library("fpdf/Fpdf");

		$this->load->model("Model_expediente");
		$this->load->model("Model_oficina");
		$this->load->model("Model_documento");
		$this->load->model("Model_remitentes");
		$this->load->model("Model_tramite");
		$where = array("expe_id" => $id);
		$expediente = $this->Model_expediente->getExpediente($where);
		$oficina = $this->Model_oficina->getoficina(array("ofic_id"=>$expediente->expe_ofic_id));
		$documento = $this->Model_documento->getdocumento(array("docu_id"=>$expediente->expe_docu_id));
		$remitente = $this->Model_remitentes->getRemitentes(array("enti_id"=>$expediente->expe_enti_id));
		$tramite = $this->Model_tramite->expediente_tramites($where);

		$fechareg="";
		if(isset($expediente->expe_fechareg)):
			$date = new DateTime($expediente->expe_fechareg);
			$fechareg = $date->format('j/M/Y h:i a');
		endif;

		// $pdf = new FPDF();
		$this->fpdf->AliasNbPages();
		$this->fpdf->AddPage();
		$this->fpdf->SetFont('Arial','',12);
	    $this->fpdf->Cell(50,0,"");
	    $this->fpdf->Cell(100,0,"Reporte de seguimiento de expediente");
		$this->fpdf->Ln(6);
		$this->fpdf->Line(60,35,135,35);

		$this->fpdf->SetFont('Arial','B',10);
		$this->fpdf->Cell(40,6,'Nro de expediente:');
		$this->fpdf->SetFont('Arial','',10);
		$this->fpdf->Cell(50,6,$expediente->expe_id);
			$this->fpdf->Cell(10,6,'');
		$this->fpdf->SetFont('Arial','B',10);
		$this->fpdf->Cell(40,6,'Plazo:');
		$this->fpdf->SetFont('Arial','',10);
		$this->fpdf->Cell(50,6,'nose');
		$this->fpdf->Ln(8);

		$this->fpdf->SetFont('Arial','B',10);
		$this->fpdf->Cell(40,6,'Tipo de expdiente:');
		$this->fpdf->SetFont('Arial','',10);
		$this->fpdf->Cell(50,6,$documento->docu_nombre);
			$this->fpdf->Cell(10,6,'');
		$this->fpdf->SetFont('Arial','B',10);
		$this->fpdf->Cell(40,6,'Nro de folios:');
		$this->fpdf->SetFont('Arial','',10);
		$this->fpdf->Cell(50,6,$expediente->expe_folio);
		$this->fpdf->Ln(8);

		$this->fpdf->SetFont('Arial','B',10);
		$this->fpdf->Cell(40,6,'Fecha de registro:');
		$this->fpdf->SetFont('Arial','',10);
		$this->fpdf->Cell(50,6,$fechareg);
			$this->fpdf->Cell(10,6,'');
		$this->fpdf->SetFont('Arial','B',10);
		$this->fpdf->Cell(40,6,'Entidad:');
		$this->fpdf->SetFont('Arial','',10);
		$this->fpdf->Cell(50,6,$remitente->enti_nombre);
		$this->fpdf->Ln(8);
		$this->fpdf->SetFont('Arial','B',10);
		$this->fpdf->Cell(40,6,'Nro de documento:');
		$this->fpdf->SetFont('Arial','',10);
		$this->fpdf->Cell(50,6,'3-2016');
			$this->fpdf->Cell(10,6,'');
		$this->fpdf->SetFont('Arial','B',10);
		$this->fpdf->Cell(40,6,'Tipo de tramite:');
		$this->fpdf->SetFont('Arial','',10);
		$this->fpdf->Cell(50,6,'Nose');
		$this->fpdf->Ln(8);
		$this->fpdf->SetFont('Arial','B',10);
		$this->fpdf->Cell(40,6,'Asunto:');
		$this->fpdf->SetFont('Arial','',10);
		$this->fpdf->Cell(50,6,$expediente->expe_asunto);
			$this->fpdf->Cell(10,6,'');

		$this->fpdf->SetLineWidth(0.5);	
		$this->fpdf->Line(10,80,200,80);	
		$this->fpdf->SetLineWidth(0);

		$this->fpdf->Ln(15);

		$this->fpdf->SetFont('Arial','B',10);
		$this->fpdf->Cell(10,7,'Nro',0,0,"C");
		$this->fpdf->Cell(30,7,'Oficina',0,0,"C");	
		$this->fpdf->Cell(35,7,'Ingreso',0,0,"C");	
		$this->fpdf->Cell(35,7,'Salida',0,0,"C");	
		$this->fpdf->Cell(50,7,'Observacion',0,0,"C");	
		$this->fpdf->Cell(30,7,'Estado',0,0,"C");
		$this->fpdf->Ln(8);

		$this->fpdf->SetLineWidth(0.5);	
		$this->fpdf->Line(10,91,200,91);	
		$this->fpdf->SetLineWidth(0);

		$this->fpdf->SetFont('Arial','',10);
		// $this->fpdf->SetAligns(0);
		$this->fpdf->SetWidths(array(10,30,35,35,50,30));
		$i=1;
		foreach ($tramite as $value):
			$this->fpdf->Row(array($i,$value->ofic_nombre ,$value->tram_fechareg ,$value->tram_fechader,$value->tram_observacion,$value->tram_estado));
			$i++;
		endforeach;

		$this->fpdf->Output();
	}
	
}

?>
