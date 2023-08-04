<?php 
  class Model_oficina extends CI_Model{
    public function __construct(){
      parent::__construct();
            $this->load->database();
    }
   
    function getoficina($id=0){
      if($id!=0){
        $this->db->where($id);
        $consulta=$this->db->get('oficina');
        // $consulta = $this->db->query($sql);
        if($consulta->num_rows()> 0){

          $consulta = $consulta->row();
         
          return $consulta;
        }
        else{ 
          return FALSE;
         
        }
      }else{
        $this->db->select("ofic_id,ofic_nombre");
        $this->db->from("oficina");
        $this->db->where('ofic_estado=', 1);
		$this->db->order_by('ofic_nombre','ASC');
        $consulta=$this->db->get();
        if($consulta->num_rows()> 0){
          return $consulta->result();
        }
        else{ 
          return FALSE;
        }
      }
    }
	
	function getoficinaex($id=0){
      
        $this->db->select("ofic_id,ofic_nombre");
        $this->db->from("oficina");
		$this->db->where('ofic_estado=1 and ofic_id !=', $id);
		$this->db->order_by('ofic_nombre','ASC');
        $consulta=$this->db->get();
		return $consulta->result();

    }
   

}
