<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

/**
 *
 * @Clase Framework "framework.php"
 * @versión: 1.0.0	@modificado: 11/01/2012
 * @autor: Alain - alain@gruposistemas.com
 *
 */
class framework {

	// public $meta_titulo = META_TITULO;
	// public $meta_descripcion = META_DESCRIPCION;
	private $estilos = array();
	private $scripts = array();
	private $footscripts = array();

	/**
	 * @var mysql
	 * */
	// public $db;
	/**
	 * @var ClassEvaluaFormulario
	 * */
	// public $eval;
	// protected $clase;
	// protected $metodo;
	// protected $slogin;
	// protected $sid;
	// protected $sgrupo;
	// protected $snombres;
	// protected $sqltabla;
	// public $fecha;
	// public $time;
	// public $conf_empresa;
	// public $conf_usuario;
	// public $conf_usua_tipo;
	// public $conf_usua_id;

	function __construct() {
		// obtenemos el nombre de la clase y el metodo actual invocados desde index.php
		// $this->clase = $GLOBALS['clase'];
		// $this->metodo = $GLOBALS['metodo'];
		// $this->menuid = $GLOBALS['menuid'];

		// if (class_exists('mysql')) {
		// 	$this->db = new mysql();
		// 	$this->db->Connect(DB_HOST, DB_USER, DB_PASS, DB_NAME);
		// 	// utf8 para mysql

		// 	$this->db->Query('SET NAMES utf8', true);
		// 	$this->db->Query('SET CHARACTER SET utf8', true);

		// 	// localización
		// 	$this->db->Query("SET time_zone = '-5:00'", true);
		// 	$this->db->Query("SET lc_time_names = 'es_PE'", true);
		// }

		// if (class_exists('evalForm')) {
		// 	$this->eval = new evalForm();
		// }

		// $_SESSION["SESS_ACCESO"] = isset($_SESSION["SESS_ACCESO"]) ? $_SESSION["SESS_ACCESO"] : '';

		// if ($this->clase != 'login' && $_SESSION["SESS_ACCESO"] != md5("SISTEMA" . date("Ymd"))) {
		// 	header("location:index.php?c=login&m=inicio");
		// 	exit(0);
		// } else if ($this->clase != 'login') {
		// 	$this->sid = $_SESSION["SESS_USUA_ID"];
		// 	$this->slogin = $_SESSION["SESS_LOGIN"];
		// 	$this->snombres = $_SESSION["SESS_USUA_NOMBRES"];
		// }
		// if(isset($_SESSION["SESS_USUA_ID"])){
		// 	$this->sid = $_SESSION["SESS_USUA_ID"];
		// 	$this->slogin = $_SESSION["SESS_LOGIN"];
		// 	$this->snombres = $_SESSION["SESS_USUA_NOMBRES"];
			
		// 	$this->db->Query("SET @var_sid='{$this->sid}'",true);
		// 	$this->db->Query("SET @var_snombres='{$this->snombres}'",true);
		// }

		// $sql = "SELECT * FROM configuracion";
		// $this->db->Query($sql, true);
		// $reg = $this->db->FetchArray();
		// $this->conf_empresa = $reg['conf_rsocial'];

		// $sql = "SELECT usua_id,usua_nombres,usua_tipo FROM usuario WHERE usua_id='{$_SESSION["SESS_USUA_ID"]}'";
		// $this->db->Query($sql, true);
		// $reg = $this->db->FetchArray();
		// $this->conf_usuario = $reg['usua_nombres'];
		// $this->conf_usua_id = $reg['usua_id'];
		// $this->conf_usua_tipo = $reg['usua_tipo'];

	}


	// function QueryDie() {
	// 	if ($this->db->IsError()) {
	// 		$json['exito'] = false;
	// 		$json['mensaje'] = $this->db->m_sql . $this->db->GetError();
	// 		$out = json_encode($json);
	// 		echo $out;
	// 		exit(0);
	// 	}
	// }

	// function EvalDie() {
	// 	if ($this->eval->EsError()) {
	// 		$json['exito'] = false;
	// 		$json['mensaje'] = $this->eval->MensajesSimple();
	// 		$out = json_encode($json);
	// 		echo $out;
	// 		exit(0);
	// 	}
	// }

	// function MsgDie($exito = false, $mensaje = '', $redireccion = '') {
	// 	$json['exito'] = $exito;
	// 	$json['mensaje'] = $mensaje;
	// 	$json['redireccion'] = $redireccion;
	// 	$out = json_encode($json);
	// 	echo $out;
	// 	exit(0);
	// }

	function arrayOptions($cols, $sel = -1) {
		$html = "";
		foreach ($cols as $key => $val) {
			$html .= '<option value="' . $key . '"' . ($key == $sel ? ' selected' : '') . '>' . ($val) . '</opcion>';
		}
		return $html;
	}

	function agregarEstilo($estilo) {
		array_push($this->estilos, $estilo);
	}

	function agregarScript($script) {
		array_push($this->scripts, $script);
	}
        function agregarFootScript($script) {
		array_push($this->footscripts, $script);
	}
	function masEstilos() {
		foreach ($this->estilos as $estilo) {
			echo '<link rel="stylesheet" href="' . $estilo . '">' . "\n";
		}
	}
	function masScripts($footer = FALSE) {
		$scripts = $this->scripts;
		foreach ($scripts as $script) {
			echo '<script type="text/javascript" src="' . $script . '"></script>', "\n";
		}
	}
	// function pagina404($mensaje = '') {
	// 	$this->header();
	// 	include('vista/404.php');
	// 	$this->footer();
	// 	exit(0);
	// }
	// function vista($metodo = '') {
	// 	if (empty($metodo)) {
	// 		include ('vista/' . $this->clase . '/' . $this->metodo . '.php');
	// 	} else if (preg_match("/\//i", $metodo)) {
	// 		include ($metodo);
	// 	} else {
	// 		include ('vista/' . $this->clase . '/' . $metodo . '.php');
	// 	}
	// }
	// function header() {
	// 	include('vista/header.php');
	// }
	// function footer() {
	// 	include('vista/footer.php');
	// }
	// function menu() {
	// 	include('vista/menu.php');
	// }
	function THS($arr) {
		$str = "";
		foreach ($arr as $cod => $val) {
			if(!preg_match('/DT_/',$val['dt']))
			$str .= '<th class="ths">' . $val['dt'] . '</th>';
		}
		return $str;
	}
	function genDataTable($id,$columns,$withcheck=false,$responsive=false){
		if($responsive) $class = "table table-striped table-bordered dt-responsive nowrap";
		else $class = "table table-striped table-bordered";
		return '<div class="mt-3"></div><table id="'.$id.'" wch="'.$withcheck.'" cellpadding="0" cellspacing="0" border="0" width="100%" class="'.$class.'">
				<thead>
					<tr>
						'.($withcheck?'<th></th>':'').$this->THS($columns).'
					</tr>
				</thead>
			</table>';
	}
	// function formComponente($reg, $input = "") {
	// 	$html = "";
	// 	if (isset($reg['id']))	$id = $reg['id'];
	// 	else $reg['id'] = "id-" . $reg['name'] . microtime(false)*100000000;

	// 	if($reg['type']=='checkbox'){
	// 		$html .= '<div class="form-group"><div class="col-sm-offset-4 col-sm-8"><div class="checkbox"><label>';
	// 		$html .= $this->formInput($reg);
	// 		$html .= $reg['text'].'</label></div></div></div>';
	// 	}else if($reg['type']!='hidden'){
	// 		$html .= '<div class="form-group">'
	// 			. '<label for=" ' . $reg['id'] . '" class="col-sm-4 control-label">' . $reg['text'] . '</label>'
	// 			. '<div class="col-sm-8">';
	// 		$html .= $this->formInput($reg);
	// 		$html .= '</div></div>';
	// 	}else{
	// 		$html .= $this->formInput($reg);
	// 	}

	// 	return $html;
	// }

	function formInput($reg) {
		$reg['class'] = 'class="form-control ' . $reg['class'] . '"';
		if (!isset($reg['param']))
			$reg['param'] = '';
		if (!isset($reg['add']))
			$reg['add'] = '';
		$html='';
		if ($reg['type'] == "select") {
			$html .= '<select id="' . $reg['id'] . '" name="' . $reg['name'] . '" ' . $reg['class'] . ' ' . $reg['param'] . '>' . $reg['value'] . '</select>' . $reg['add'];
		} else if ($reg['type'] == "textarea") {
			$html .= '<textarea id="' . $reg['id'] . '" name="' . $reg['name'] . '" ' . $reg['class'] . ' ' . $reg['param'] . '>' . $reg['value'] . '</textarea>' . $reg['add'];
		} else if ($reg['type'] == "checkbox") {
			$html .= '<input id="' . $reg['id'] . '" name="' . $reg['name'] . '" type="' . $reg['type'] . '" ' . ($reg['value'] == 'SI' ? 'checked' : '') . ' ' . $reg['param'] . ' />' . $reg['add'];
		} else if($reg['type'] == "cedit") {
			$html .= '<div class="input-group">
					<span class="input-group-addon">
						<input type="checkbox" aria-label="...">
					</span>
					<input id="' . $reg['id'] . '" name="' . $reg['name'] . '" type="' . $reg['type'] . '" ' . ($reg['value'] == 'SI' ? 'checked' : '') . ' ' . $reg['class'] . ' ' . $reg['param'] . ' />
				</div>';
		} else if ($reg['type'] == "picker") {
			$cp = "";
			if (!preg_match("/full/", $reg['class']))
				$cp = "left";
			$html .= '<div class="picker ' . $cp . '"><div style="margin-right: 26px;">';
			$html .= '<input name="' . $reg['name'] . '" type="hidden" value="' . $reg['value'] . '" />';
			$html .= '<input type="text" id="' . $reg['id'] . '" ' . $reg['class'] . ' value="' . $reg['text-value'] . '" name="' . (empty($reg['name']) ? '' : 'text_' . $reg['name']) . '" />';
			$html .= '</div><input type="button" class="right curva ml5 add" value="" /></div>';
		}else if ($reg['type'] == "selectpick") {
			$cp = "";
			if (!preg_match("/full/", $reg['class']))
				$cp = "left";
			$html .= '<div class="picker ' . $cp . '"><div style="margin-right: 26px;">';
			$html .= '<select id="' . $reg['id'] . '" ' . $reg['class'] . ' name="' . $reg['name'] . '" ' . $reg['class'] . ' ' . $reg['param'] . '>' . $reg['value'] . '</select>';
			$html .= '</div><input type="button" class="right curva ml5 add" value="" /></div>';
		}else if ($reg['type'] == "inputpick") {
			$cp = "";
			if (!preg_match("/full/", $reg['class']))
				$cp = "left";
			$html .= '<div class="picker ' . $cp . '"><div style="margin-right: 26px;">';
			$html .= '<input id="' . $reg['id'] . '" name="' . $reg['name'] . '" type="text" value="' . $reg['value'] . '" ' . $reg['class'] . ' ' . $reg['param'] . ' />';
			$html .= '</div><input type="button" class="right curva ml5 add" value="" /></div>';
		}else {
			$html .= '<input id="' . $reg['id'] . '" name="' . $reg['name'] . '" placeholder="' . $reg['text'] . '" type="' . $reg['type'] . '" value="' . $reg['value'] . '" ' . $reg['class'] . ' ' . $reg['param'] . ' />' . $reg['add'];
		}
		return $html;
	}

	function formHorizontal($comps) {
		$cont = count($comps);
		$html = '';
		foreach ($comps as $comp) {
			if (!is_string($comp))
				$html .= $this->formComponente($comp);
			else
				$html .= $comp;
		}
		return $html;
	}

	function formVertical($comps) {
		$cont = count($comps);
		$html = "";
		foreach ($comps as $comp) {
			$html .= '<div class="row">';
			if (!is_string($comp))
				$html .= $this->formComponente($comp);
			else
				$html .= $comp;
			$html .= '</div>';
		}
		return $html;
	}

	function formHSection($titulo, $ss) {
		return $this->formH($titulo) . $this->formSection($ss);
	}

	function formH($titulo) {
		return "<h3>{$titulo}</h3>";
	}

	function formSection($ss) {
		$cont = count($ss);
		$eq = array(1=>12,2=>6,3=>4,4=>3);		
		$html = '<div class="row">';
		foreach ($ss as $s) {
		$html .= '<div class="col-xs-'.$eq[$cont].'">' . $s . '</div>';
		}
		$html .= '</div>';
		return $html;
	}


	function js_jsonvar($jsvar, $phpvar) {
		$html = '<script type="text/javascript">
                        var ' . $jsvar . ' = {};
                        $(document).ready(function(){
                            ' . $jsvar . ' = $.parseJSON(\'' . json_encode($phpvar) . '\');
                        });
                        
                    </script>';
		return $html;
	}

}
