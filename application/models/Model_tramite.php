<?php 
  class Model_tramite extends CI_Model{
    public function __construct(){
      parent::__construct();
            $this->load->database();
    }
    function getTramite($id=0){
      if($id!=0){
        $this->db->where($id);
        $consulta=$this->db->get('tramite');

        if($consulta->num_rows()> 0){

          $consulta = $consulta->row();
         
          return $consulta;
        }
        else{ 
          return FALSE;
         
        }
      }else{
        $this->db->select("*");
        $this->db->from("tramite");
        $consulta=$this->db->get();
        if($consulta->num_rows()> 0){
          return $consulta->result();
        }
        else{ 
          return FALSE;
        }
      }
    }
    function expediente_tramites($where){
      $this->db->select("of1.ofic_nombre as origen,of2.ofic_nombre as destino,us2.usua_nombres as usuario,tr.tram_fechareg,tr.tram_fechaestado,tr.tram_observacion,tr.tram_estado,tr.tram_archivo AS archivo, tram_id AS id");
      $this->db->from('expediente ex');
      $this->db->join('tramite tr', 'ex.expe_id = tr.tram_expe_id');
      $this->db->join('oficina of1', 'of1.ofic_id = tr.tram_ofic_ini');
      $this->db->join('oficina of2', 'of2.ofic_id = tr.tram_ofic_fin');
      $this->db->join('usuario us2', 'us2.usua_id = tr.tram_user_fin','left');
      $this->db->order_by("tr.tram_fechaestado", "asc");
      $this->db->where($where);
      $consulta = $this->db->get(); 
      if($consulta->num_rows()> 0){

       return $consulta->result();
        
      }
      else{ 
        return FALSE;
      }
    }

    public function getNumeroDeVeCesTramitadoPorOficina($expediente_id, $oficina_id)
    {
      $this->db->select('COUNT(*) AS total');
      $this->db->from('tramite');
      $this->db->where('tram_expe_id', $expediente_id);
      $this->db->where('tram_acci_id', 1);
      $this->db->where('tram_ofic_fin', $oficina_id);
      $result = $this->db->get();
      return $result->row()->total;
    }
}
