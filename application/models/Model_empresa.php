<?php 
  class Model_empresa extends CI_Model{
    public function __construct(){
      parent::__construct();
            $this->load->database();
    }
   
     function getempresa($id=0){

      if($id!=0){
        $this->db->where($id);
        $consulta=$this->db->get('configuracion');
        // $consulta = $this->db->query($sql);
        if($consulta->num_rows()> 0){

          $consulta = $consulta->row();
         
          return $consulta;
        }
        else{ 
          return FALSE;
         
        }
      }else{
        $this->db->select("conf_id,conf_nombre");
        $this->db->from("configuracion");
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
