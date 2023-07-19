<?php 
  class Model_general extends CI_Model{
    public function __construct(){
      parent::__construct();
            $this->load->database();
    }
   
    function guardar_edit_registro($tabla,$datas,$where){
      
      $this->db->trans_start();
      $this->db->where($where);
      $this->db->update($tabla, $datas); 
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
    function guardar_registro($tabla,$datas){
      if(isset($datas)){
            $this->db->trans_start();
            $this->db->set($datas); 
            $this->db->insert($tabla);
            $id = $this->db->insert_id();
            $this->db->trans_complete();
            if ($this->db->trans_status() === FALSE)
            {
                return FALSE;
            }
            else
            {
                return  $datos = array("id"=>$id);
            }
        }
        else{
            return FALSE;
        }
    }

    function getprocesos($id=0){

      if($id!=0){
        $this->db->where($id);
        $consulta=$this->db->get('procesos');
        // $consulta = $this->db->query($sql);
        if($consulta->num_rows()> 0){

          $consulta = $consulta->row();
         
          return $consulta;
        }
        else{ 
          return FALSE;
         
        }
      }else{
        $this->db->select("proc_id,proc_nombre");
        $this->db->from("procesos");
        $consulta=$this->db->get();
        if($consulta->num_rows()> 0){
          return $consulta->result();
        }
        else{ 
          return FALSE;
        }
      }
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
        $consulta=$this->db->get();
        if($consulta->num_rows()> 0){
          return $consulta->result();
        }
        else{ 
          return FALSE;
        }
      }
    }
    function ultimo_registro($datos,$id,$tabla,$where=0){
      $this->db->select($datos);
      $this->db->from($tabla);
      $this->db->order_by($id, "desc");
      $this->db->limit(1);
        if($where!=0):
          $this->db->where($where);
        endif;
      $consulta=$this->db->get();
      if($consulta->num_rows()> 0){
        return $consulta->row();
      }
      else{ 
        return $object = (object) array($datos=>null);
      }
    }
    function periodo(){
      $this->db->select("conf_periodo");
      $this->db->from("configuracion");
      $this->db->order_by("confi_id", "desc");
      $this->db->limit(1);
      $consulta=$this->db->get();
      if($consulta->num_rows()> 0){
        return $consulta->row();
      }
      else{ 
        return FALSE;
      }
    }

    function select2($tabla,$search){
        $this->db->select("sql_calc_found_rows *",FALSE);
            $this->db->like($search); 
        $this->db->from($tabla);
        $consulta=$this->db->get();
        if($consulta->num_rows()> 0){
          $query = $this->db->query('SELECT FOUND_ROWS() AS total_count');
          $total_count = $query->row()->total_count;
          $response = array("total_count"=>$total_count,"items"=>$consulta->result());
          return $response;
        }
        else{ 
          return FALSE;
        }
      
    }

    public function borrar($where,$tabla)
    {
      
        // $this->db->where($where);
        // // $this->db->delete($tabla); 
       
        // if (!$this->db->delete($tabla))
        // {
        //   return FALSE;
        // }
        // else
        // {
        //   return TRUE;
        // }
      // $this->db->trans_strict(FALSE);
        $this->db->trans_begin();
        $this->db->where($where);
        $this->db->delete($tabla); 
        // $id = $this->db->insert_id();
        // $this->db->trans_complete();
       if ($this->db->trans_status() === FALSE)
        {
            $this->db->trans_rollback();
            return FALSE;
        }
        else
        {
            $this->db->trans_commit();
            return TRUE;
        }
    }
    function enum_valores($tabla,$campo){
      $consulta = $this->db->query("SHOW COLUMNS FROM $tabla LIKE '$campo'");
        if($consulta->num_rows()> 0){

          $consulta = $consulta->row();

          $array = explode(",",str_replace(array("enum","'","(",")"),"",$consulta->Type));
          return $array;
        }
        else{ 
          return FALSE;
         
        }
    }
    function select_anio(){
       $consulta = $this->db->query("SELECT SUBSTRING(expe_fechareg,1,4) as anios FROM expediente group by anios");
        if($consulta->num_rows()> 0){

          $consulta = $consulta->result();
          $array=array();
          foreach ($consulta as $value) {
            $array[$value->anios]=$value->anios;
          }
          //unset($array[0]);

          return $array;
        }
        else{ 
          return FALSE;
         
        }

    }
    function usuario_oficinas($where='',$uno=false,$id=0){
      if($uno!=false){
        $this->db->select("usua_id,ofic_id,usua_nombres,usua_apellidos,usua_estado,ofic_nombre",false);
        $this->db->where($where);
        $this->db->from("usuario");
        $this->db->join('oficina', 'ofic_id=usua_ofic_id');
        // $this->db->join('mensaje mes', "usua_id = mes.mens_user_ini and mes.mens_id = (select mens_id from mensaje where usua_id=mens_user_ini AND mens_user_fin=$id order by mens_id desc limit 1)", 'left',false);
        $consulta=$this->db->get();
        if($consulta->num_rows()> 0){

          $consulta = $consulta->row();
         
          return $consulta;
        }
        else{ 
          return FALSE;
         
        }
      }else{
        $this->db->select("usua_id,ofic_id,usua_nombres,usua_apellidos,usua_estado,ofic_nombre,mes.mens_leido,mes.mens_mensaje");
        $this->db->from("usuario");
        $this->db->where($where);
        $this->db->join('oficina', 'ofic_id=usua_ofic_id');
        $this->db->join('mensaje mes', "usua_id = mes.mens_user_ini and mes.mens_id = (select mens_id from mensaje where usua_id=mens_user_ini AND mens_user_fin=$id order by mens_id desc limit 1)", 'left',false);
        $consulta=$this->db->get();
        if($consulta->num_rows()> 0){
          return $consulta->result();
        }
        else{ 
          return FALSE;
        }
      }
    }
    function check_captcha($where){

      $this->db->where($where);
      $this->db->limit(1); 
      $consulta=$this->db->get('captcha');

      if($consulta->num_rows()> 0){
        return TRUE;
      }
      else
      {
        return FALSE;
      }
    }
    function existe($where,$tabla){
      $this->db->where($where);
      // $this->db->from('usuario');
      $consulta=$this->db->get($tabla);
      // $consulta = $this->db->query($sql);
      if($consulta->num_rows()> 0){

        return TRUE;
      }
      else{ 
        return FALSE;
       
      }
    }

}
