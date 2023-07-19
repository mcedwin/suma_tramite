<?php 
  class Model_login extends CI_Model{
    public function __construct(){
      parent::__construct();
            $this->load->database();
    }
   
    function login($datas,$init=FALSE){
      $this->load->model("Model_oficina");
      $this->db->where($datas);
      // $this->db->from('usuario');
      $consulta=$this->db->get('usuario');
      // $consulta = $this->db->query($sql);
      if($consulta->num_rows()> 0){

        $consulta = $consulta->row();
        $response = array("id" => $consulta->usua_id,
                          "intento" => $consulta->usua_intento
                          );
        if($init==TRUE){
	$periodo = $this->Model_general->ultimo_registro("conf_periodo","conf_id","configuracion");
          $periodo = $periodo->conf_periodo;
          $oficina = $this->Model_oficina->getoficina(array("ofic_id"=>$consulta->usua_ofic_id));
          $datos_usa = array(
            "authorized" => $consulta->usua_id,
            "authorizedofic" => $consulta->usua_ofic_id,
            "oficina" => $oficina->ofic_nombre,
            "oficina_codigo" => $oficina->ofic_codigo,
            "periodo" => $periodo
            );
          if($consulta->usua_tipo=="ADMINISTRADOR")
            $datos_usa=array_merge($datos_usa,array("authorizedadmin"=>true));

          $this->session->set_userdata($datos_usa);
          return $response;
        }
        return $response;
      }
      else{ 
        return FALSE;
       
      }
    }
    // function check_captcha($where){

    //   $this->db->where($where);
    //   $this->db->limit(1); 
    //   $consulta=$this->db->get('captcha');

    //   if($consulta->num_rows()> 0){
    //     return TRUE;
    //   }
    //   else
    //   {
    //     return FALSE;
    //   }
    // }
    
    function guargar_registro($datas){
      if(isset($datas)){
            $this->db->trans_start();
            $this->db->set($datas); 
            $this->db->insert('usuario');
            // $id = $this->db->insert_id();
            $this->db->trans_complete();
            if ($this->db->trans_status() === FALSE)
            {
                return FALSE;
            }
            else
            {
                return TRUE;
            }
        }
        else{
            return FALSE;
        }
    }
     function guargar_edit_registro($datas,$id){
      
      $this->db->trans_start();
      $this->db->where('usua_id', $id);
      $this->db->update('usuario', $datas); 
      // $id = $this->db->insert_id();
      $this->db->trans_complete();
      if ($this->db->trans_status() === FALSE)
      {
          return FALSE;
      }
      else
      {
          return TRUE;
      }
       
    }
    
   


  }
