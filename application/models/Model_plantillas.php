<?php 
  class Model_plantillas extends CI_Model{
    public function __construct(){
      parent::__construct();
            $this->load->database();
    }
   
    function getplantillas($id=0){
      if($id!=0){
        $this->db->where($id);
        $consulta=$this->db->get('recursos');
        // $consulta = $this->db->query($sql);
        if($consulta->num_rows()> 0){

          $consulta = $consulta->row();
         
          return $consulta;
        }
        else{ 
          return FALSE;
         
        }
      }else{
        $this->db->select("recu_id,recu_nombre");
        $this->db->from("recursos");
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
