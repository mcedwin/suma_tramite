<?php
class Model_documento extends CI_Model
{
  public function __construct()
  {
    parent::__construct();
    $this->load->database();
  }

  function getdocumento($id = 0,$origen=0)
  {

    if ($id != 0) {
      $this->db->where($id);
      $consulta = $this->db->get('documento');
      // $consulta = $this->db->query($sql);
      if ($consulta->num_rows() > 0) {

        $consulta = $consulta->row();

        return $consulta;
      } else {
        return FALSE;
      }
    } else {
      $this->db->select("docu_id,docu_nombre");
      $this->db->from("documento");
      $this->db->where(['docu_estado'=>1,'docu_'.$origen=>1]);
      $this->db->order_by('docu_nombre', 'ASC');
      $consulta = $this->db->get();
      if ($consulta->num_rows() > 0) {
        return $consulta->result();
      } else {
        return FALSE;
      }
    }
  }
}
