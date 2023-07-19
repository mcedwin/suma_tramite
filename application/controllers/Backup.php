<?php
defined('BASEPATH') OR exit('No direct script access allowed');
class Backup extends MY_Controller {

	function __construct() {
		parent::__construct();
		if(!$this->session->userdata('authorized')){
			redirect(base_url()."login");
		}
	}

	function inicio() {
		$this->load->library('framework');
		$this->load->helper('funciones');
		$this->load->database();
		
		$this->load->view('header');
		$this->load->view('menu');

		$this->load->view('backup/inicio');
		$this->load->view('footer');
	}
	function backup_data(){

		$this->load->dbutil();
		  $prefs = array(     
		                'format'      => 'zip',             
		                'filename'    => 'my_db_backup.sql'
		              );
		  $backup =$this->dbutil->backup($prefs); 
		  $db_name = 'backup-data-on-'. date("Y-m-d-H-i-s") .'.zip';
		  $save = 'pathtobkfolder/'.$db_name;

		  $this->load->helper('file');
		  write_file($save, $backup); 
		  $this->load->helper('download');
		  force_download($db_name, $backup);
	}
	function backup_files(){
		$this->load->library('zip');
		$path=dirname(__FILE__)."/../../archivos/";
		$this->zip->read_dir($path,false); 
		$this->zip->download('backup-files-on-'. date("Y-m-d-H-i-s") .'.zip');
	}

	function backup_rdata(){
		//hapus dulu database jika proses restore gagal.
		//$this->Edit_model->hapus_db();
		//upload dulu filenya
		$fupload = $_FILES['datafile'];
		$nama = $_FILES['datafile']['name'];
		if(isset($fupload)){
			//$lokasi_file = $fupload['tmp_name'];
			//$direktori="backupdb/$nama";
			//move_uploaded_file($lokasi_file,"$direktori");
			$direktori=$fupload['tmp_name'];
		}
		//restore database
		$isi_file=file_get_contents($direktori);
		$string_query=rtrim($isi_file, "\n;" );
		$array_query=explode(";", $string_query);
		foreach($array_query as $query){
			$this->db->query($query);
		}
		$data['page']='restore';
		$this->load->view('home',$data);
	}

	function backup_rfiles(){
		//hapus dulu database jika proses restore gagal.
		//$this->Edit_model->hapus_db();
		//upload dulu filenya
		$fupload = $_FILES['datafile'];
		$nama = $_FILES['datafile']['name'];
		if(isset($fupload)){
			//$lokasi_file = $fupload['tmp_name'];
			//$direktori="backupdb/$nama";
			//move_uploaded_file($lokasi_file,"$direktori");
			$direktori=$fupload['tmp_name'];
		}
		$this->load->library('zip');
		$path=dirname(__FILE__)."/../../archivos/";
		$this->zip->extractTo($direktori,$path);
	}
}