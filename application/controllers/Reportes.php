<?php
defined('BASEPATH') OR exit('No direct script access allowed');
class Reportes extends MY_Controller {

	function __construct() {
		parent::__construct();
		if(!$this->session->userdata('authorized')){
			redirect(base_url()."login");
		}
		$this->load->library('Cssjs');
		$this->load->model("Model_estadisticas");
		$this->load->model("Model_general");
		$this->load->model("Model_oficina");
		$this->load->helper('Form');
	}

	function documentos_externos() {
		$this->load->helper('Funciones');
		$this->load->database();
		
		$this->cssjs->set_path_js(base_url()."assets/js/");
		$this->cssjs->add_js('reportes/documentos_externos_dt');
		$data['oficina'] = $this->Model_oficina->getoficina();
		$data["anio"] = select_enum($this->Model_general->select_anio());

		$script['js'] = $this->cssjs->generate_js();
		$this->load->view('header',$script);
		$this->load->view('menu');
		$this->load->view('reportes/documentos_externos',$data);
		$this->load->view('footer');
	}
	function externos_data()
	{
		$anio = $_POST['anio'];
		$oficina = $_POST['oficina'];		
		if ($oficina!='') {
			$where = array(
				'expe_periodo' => $anio,
				'tram_estado' => 'FINALIZADO',
				'tram_ofic_ini' => $oficina);
			$where1 = array('expe_periodo'=> $anio,
							'tram_ofic_ini' => $oficina);
			for ($i=1; $i <= 12; $i++) { 

				$wherec = array('expe_periodo' => $anio,
								'tram_estado' => 'FINALIZADO',
								'tram_ofic_ini' => $oficina,
								"DATE_FORMAT(expe_fechareg,'%m')" => $i);
				$data['mesterminado'][$i] =  $this->Model_estadisticas->countTramite($wherec);
				$terminado = $data['mesterminado'][$i];
				//var_dump($terminado->cont);
				$wheret = array('expe_periodo' => $anio,
								'tram_ofic_ini' => $oficina,
								"DATE_FORMAT(expe_fechareg,'%m')" => $i);
				$data['mestotal'][$i] =  $this->Model_estadisticas->countTramite($wheret);
				$total = $data['mesterminado'][$i];
				//var_dump($total->cont);
				if ($total->cont!=0) {
					$data['porcentaje'][$i] = (($terminado->cont*100)/($total->cont));
				}else
				{
					$data['porcentaje'][$i] = 0;
				}
			}
		}else
		{
			$where = array(
				'expe_periodo' => $anio,
				'tram_estado' => 'FINALIZADO');
			$where1 = array('expe_periodo'=> $anio);

			for ($i=1; $i <= 12; $i++) { 

				$wherec = array('expe_periodo' => $anio,
								'tram_estado' => 'FINALIZADO',
								"DATE_FORMAT(expe_fechareg,'%m')" => $i);
				$data['mesterminado'][$i] =  $this->Model_estadisticas->countTramite($wherec);
				$terminado = $data['mesterminado'][$i];
				//var_dump($terminado->cont);
				$wheret = array('expe_periodo' => $anio,
								"DATE_FORMAT(expe_fechareg,'%m')" => $i);
				$data['mestotal'][$i] =  $this->Model_estadisticas->countTramite($wheret);
				$total = $data['mesterminado'][$i];
				//var_dump($total->cont);
				if ($total->cont!=0) {
					$data['porcentaje'][$i] = (($terminado->cont*100)/($total->cont));
				}else
				{
					$data['porcentaje'][$i] = 0;
				}
			}
		}

		
		//$mesdata[''] =  
		$data['terminado'] = $this->Model_estadisticas->countTramite($where);
		$data['total'] = $this->Model_estadisticas->countTramite($where1);
		$data['anio'] = $anio;
		$script['js'] = $this->cssjs->generate_js();
		$this->load->view('reportes/externos_data',$data);
		$this->load->view('footer');
		//$this->output->enable_profiler(TRUE);
	}
	function documentos_internos() {
		$this->load->helper('Funciones');
		$this->load->database();
		
		$this->cssjs->set_path_js(base_url()."assets/js/");
		$this->cssjs->add_js('reportes/documentos_internos_dt');
		$data["anio"] = select_enum($this->Model_general->select_anio());
		

		$script['js'] = $this->cssjs->generate_js();
		$this->load->view('header',$script);
		$this->load->view('menu');
		$this->load->view('reportes/documentos_internos',$data);
		$this->load->view('footer');
	}
	function internos_data()
	{
		$anio = $_POST['anio'];
		$estado = $_POST['estado'];
		for ($i=1; $i <= 12; $i++) { 

			$data['contador'][$i] =  $this->Model_estadisticas->oficTramite($anio,$i,$estado);

		}
		
		$data['oficina'] = $this->Model_oficina->getoficina();
		$data['anio'] = $anio;
		$script['js'] = $this->cssjs->generate_js();
		$this->load->view('reportes/internos_data',$data);
		$this->load->view('footer');
		//$this->output->enable_profiler(TRUE);
	}
	function reporte_remitente(){
		$this->load->helper('Funciones');
		$this->load->database();
		
		$this->cssjs->set_path_js(base_url()."assets/js/");
		$this->cssjs->add_js('reportes/reporte_remitente_dt');
		
		$data["anio"] = select_enum($this->Model_general->select_anio());
		$script['js'] = $this->cssjs->generate_js();
		$this->load->view('header',$script);
		$this->load->view('menu');
		$this->load->view('reportes/reporte_remitente',$data);
		$this->load->view('footer');
	}
	function remitente_data()
	{
		$anio = $_POST['anio'];
		$data['remitente'] = $this->Model_estadisticas->enti_tramite($anio);

		$data['anio'] = $anio;
		$script['js'] = $this->cssjs->generate_js();
		$this->load->view('reportes/remitente_data',$data);
		$this->load->view('footer');
		//$this->output->enable_profiler(TRUE);
	}
}