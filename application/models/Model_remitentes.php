<?php 
  class Model_remitentes extends CI_Model{
    public function __construct(){
      parent::__construct();
            $this->load->database();
    }
   
    function getRemitentes($id=0){
      if($id!=0){
        $this->db->where($id);
        $consulta=$this->db->get('entidad');

        if($consulta->num_rows()> 0){

          $consulta = $consulta->row();
         
          return $consulta;
        }
        else{ 
          return FALSE;
         
        }
      }else{
        $this->db->select("enti_id, enti_nombre, enti_tipo, enti_ruc");
        $this->db->from("entidad");
        $consulta=$this->db->get();
        if($consulta->num_rows()> 0){
          return $consulta->result();
        }
        else{ 
          return FALSE;
        }
      }
    }


  }
