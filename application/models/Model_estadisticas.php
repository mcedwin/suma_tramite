<?php 
  class Model_estadisticas extends CI_Model{
    public function __construct(){
      parent::__construct();
            $this->load->database();
    }
   
    public function countTramite($where)
    {
      
          $this->db->select("COUNT(expe_id) as cont");
          $this->db->from("expediente");
          $this->db->join('tramite', 'expe_id=tram_expe_id','left');
          $this->db->where($where);
          $consulta=$this->db->get();
          if($consulta->num_rows()> 0){

            $consulta = $consulta->row();
           
            return $consulta;
          }
          else{ 
            return FALSE;
           
          }
    }
    function oficTramite($anio,$mes,$estado){
        if($estado == 'FINALIZADO')
        {
          $consulta = $this->db->query("SELECT o.ofic_id, 
                                              (SELECT COUNT(tr.tram_ofic_fin) 
                                                  FROM oficina of 
                                                  LEFT JOIN tramite tr ON of.ofic_id = tr.tram_ofic_fin
                                                  LEFT JOIN expediente e ON e.expe_id = tr.tram_expe_id 
                                                  WHERE tr.tram_ofic_fin = o.ofic_id
                                                  AND tr.tram_estado = 'CONCLUIDO' 
                                                  AND DATE_FORMAT(e.expe_fechareg,'%m') = $mes
                                                  AND e.expe_periodo = $anio) AS contador
                                        FROM oficina o
                                        LEFT JOIN tramite t ON o.ofic_id = t.tram_ofic_fin 
                                        GROUP BY o.ofic_nombre
                                        ORDER BY o.ofic_id");
          if($consulta->num_rows()> 0){

            $consulta = $consulta->result_array();
           
            return $consulta;
          }
          else{ 
            return FALSE;
           
          }
          
        }else
        {
          $consulta = $this->db->query("SELECT o.ofic_id, 
                                              (SELECT COUNT(tr.tram_ofic_fin) 
                                                  FROM oficina of 
                                                  LEFT JOIN tramite tr ON of.ofic_id = tr.tram_ofic_fin
                                                  LEFT JOIN expediente e ON e.expe_id = tr.tram_expe_id 
                                                  WHERE tr.tram_ofic_fin = o.ofic_id
                                                  AND tr.tram_estado != 'CONCLUIDO' 
                                                  AND DATE_FORMAT(e.expe_fechareg,'%m') = $mes
                                                  AND e.expe_periodo = $anio) AS contador
                                        FROM oficina o
                                        LEFT JOIN tramite t ON o.ofic_id = t.tram_ofic_fin 
                                        GROUP BY o.ofic_nombre
                                        ORDER BY o.ofic_id");
          if($consulta->num_rows()> 0){

            $consulta = $consulta->result_array();
           
            return $consulta;
          }
          else{ 
            return FALSE;
           
          }
        }
    }
    public function enti_tramite($anio)
    {
      
        $consulta = $this->db->query("SELECT e.enti_nombre AS entidad, 
                                            (SELECT count(ex.expe_enti_id) 
                                                FROM expediente ex 
                                                JOIN entidad en ON ex.expe_enti_id = en.enti_id
                                                JOIN tramite tr ON tr.tram_expe_id = ex.expe_id  
                                                WHERE ex.expe_enti_id = e.enti_id AND ex.expe_periodo = $anio) AS total,
                                                (SELECT count(ex.expe_enti_id) 
                                                FROM expediente ex 
                                                JOIN entidad en ON ex.expe_enti_id = en.enti_id
                                                JOIN tramite tr ON tr.tram_expe_id = ex.expe_id  
                                                WHERE ex.expe_enti_id = e.enti_id AND tr.tram_estado = 'CONCLUIDO' AND ex.expe_periodo = $anio) AS tramitado
                                            FROM entidad e
                                            GROUP BY e.enti_nombre"
                                          );
          if($consulta->num_rows()> 0){

            $consulta = $consulta->result_array();
           
            return $consulta;
          }
          else{ 
            return FALSE;
           
          }  
      
    }
}
