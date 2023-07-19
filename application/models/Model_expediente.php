<?php 
  class Model_expediente extends CI_Model{
    public function __construct(){
      parent::__construct();
            $this->load->database();
    }
    function getExpediente($id=0){
      if($id!=0){
        //$this->db->where(array('expe_id', $id));
        $this->db->from('expediente');
        $this->db->where($id);
        $consulta=$this->db->get();

        if($consulta->num_rows()> 0){

          $consulta = $consulta->row();
          return $consulta;
        }
        else{ 

          return FALSE;
         
        }
      }else{
        $this->db->select("*");
        $this->db->from("expediente");
        $consulta=$this->db->get();
        if($consulta->num_rows()> 0){
          return $consulta->result();
        }
        else{ 
          return FALSE;
        }
      }
    }
    function expediente_proceso($where){
        $this->db->select("expe_id,expe_asunto,expe_proc_id,proc_nombre");
        $this->db->from('expediente');
        $this->db->join('procesos', 'expe_proc_id=proc_id');
        // $this->db->order_by("d.deta_orden", "asc");
        $this->db->where($where);
        $consulta = $this->db->get(); 
      if($consulta->num_rows()> 0){

        $consulta =$consulta->row();
       
        return $consulta;
      }
      else{ 
        return FALSE;
      }
    }
    function cont_expedientes($where){
        // $this->db->select("*");
        $this->db->from('expediente');
        $this->db->join('tramite', 'tram_expe_id=expe_id');
        $this->db->join('procesos', 'expe_proc_id=proc_id','left');
        // $this->db->order_by("d.deta_orden", "asc");
        $this->db->where($where);
        $consulta = $this->db->get(); 
      if($consulta->num_rows()> 0){

        // $q->num_rows()
        $consulta =$consulta->num_rows();
       
        return $consulta;
      }
      else{ 
        return FALSE;
      }
    }
    function menor_mayor($where){
        $this->db->select("MIN(expe_id) as desde, MAX(expe_id) as hasta");
        $this->db->from('expediente');
        $this->db->where($where);
        $consulta = $this->db->get(); 
        if($consulta->num_rows()> 0){

          $consulta = $consulta->row();

          return $consulta;
        }
        else{ 

          return FALSE;
         
        }
    }
    function expedientes($where){
        $this->db->select("expe_id,expe_numero,docu_nombre,expe_asunto,expe_folio,expe_remitente,tram_id,ofic_nombre,expe_folio,expe_fechareg,tram_acci_id,expe_remitente");
        $this->db->from('expediente');
        $this->db->join('tramite', 'tram_expe_id=expe_id');
        $this->db->join('oficina', 'tram_ofic_fin = ofic_id','left');
        $this->db->join('documento', 'expe_docu_id = docu_id','left');
        //$this->db->join('acciones', 'tram_acci_id = acci_id','left');
        $this->db->where($where);
        //$this->db->group_by('expe_id');
        $consulta = $this->db->get();
        if($consulta->num_rows()> 0){

          $consulta = $consulta->result();

          return $consulta;
        }
        else{

          return FALSE;
         
        }
    }
    function expedienteRuta($where){
        $this->db->select("expe_id,tram_id,ofic_nombre,expe_folio,expe_fechareg,tram_acci_id,expe_remitente");
        $this->db->from('expediente');
        $this->db->join('tramite', 'tram_expe_id=expe_id');
        $this->db->join('oficina', 'tram_ofic_fin = ofic_id','left');
        // $this->db->join('acciones', 'tram_acci_id = acci_id','left');
        $this->db->where($where);

        $consulta = $this->db->get(); 
        if($consulta->num_rows()> 0){

          $consulta = $consulta->result();

          return $consulta;
        }
        else{ 

          return FALSE;
         
        }
    }
    function oficinas_destino($where,$oficina){
        $this->db->select("ofic_nombre");
        $this->db->from('expediente');
        $this->db->join('tramite', "expe_id = tram_expe_id AND tram_ofic_ini='".$oficina."'",'inner',false);
        $this->db->join('oficina', 'tram_ofic_fin = ofic_id','left');
        // $this->db->join('acciones', 'tram_acci_id = acci_id','left');
        $this->db->where($where);

        $consulta = $this->db->get(); 
        if($consulta->num_rows()> 0){
          $array="";
          $consulta = $consulta->result();
          foreach ($consulta as $value) {
            $array.="(".$value->ofic_nombre.")";
          }

          return $array;
        }
        else{ 

          return FALSE;
         
        }
    }

    public function getUltimaOficinaDeTramite($expe_id)
    {
      $this->db->select('tram_ofic_fin AS oficina, count(*) AS total');
      $this->db->from('tramite');
      $this->db->where('tram_expe_id', $expe_id);
      $this->db->where('tram_acci_id', 1);
      $this->db->order_by('MAX(tram_id)', 'desc');
      $this->db->group_by('tram_ofic_fin');
      $this->db->limit(1);
      $query = $this->db->get();
      if($query->num_rows() > 0) { return $query->row(); }
      else { return false; }
    }
    
}
