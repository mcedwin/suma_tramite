<?php 
  class Model_acciones extends CI_Model{
    public function __construct(){
      parent::__construct();
            $this->load->database();
    }
   
     function getacciones($id=0){

      if($id!=0){
        $this->db->where($id);
        $consulta=$this->db->get('acciones');
        // $consulta = $this->db->query($sql);
        if($consulta->num_rows()> 0){

          $consulta = $consulta->row();
         
          return $consulta;
        }
        else{ 
          return FALSE;
         
        }
      }else{
        $this->db->select("acci_id,acci_nombre");
        $this->db->from("acciones");
		$this->db->order_by('acci_nombre','ASC');
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
