<?php

class Model_procesos extends CI_Model {

    public function __construct() {
        parent::__construct();
        $this->load->database();
    }

    function getProcesos($id = 0) {
        if ($id != 0) {
            $this->db->where($id);
            $consulta = $this->db->get('procesos');

            if ($consulta->num_rows() > 0) {

                $consulta = $consulta->row();

                return $consulta;
            } else {
                return FALSE;
            }
        } else {
            $this->db->select("proc_id, proc_nombre");
            $this->db->from("procesos");
            $consulta = $this->db->get();
            if ($consulta->num_rows() > 0) {
                return $consulta->result();
            } else {
                return FALSE;
            }
        }
    }

    function getProcesos_detalle($where) {

        $this->db->where($where);
        $consulta = $this->db->get('proceso_detalle');

        if ($consulta->num_rows() > 0) {

            $consulta = $consulta->row();

            return $consulta;
        } else {
            return FALSE;
        }
    }
    function getProcesos_requisito($where) {

        $this->db->where($where);
        $consulta = $this->db->get('proceso_requisito');

        if ($consulta->num_rows() > 0) {

            $consulta = $consulta->row();

            return $consulta;
        } else {
            return FALSE;
        }
    }

    function Detalles_procesos_oficina($where) {
        $this->db->select("d.deta_id,o.ofic_id,o.ofic_nombre,d.deta_plazo,d.deta_orden,d.deta_activo");
        $this->db->from('proceso_detalle d');
        $this->db->join('oficina o', 'o.ofic_id= d.deta_ofic_id');
        $this->db->order_by("d.deta_orden", "asc");
        $this->db->where($where);
        $consulta = $this->db->get();
        if ($consulta->num_rows() > 0) {

            $consulta = $consulta->result();

            return $consulta;
        } else {
            return array();;
        }
    }

    function Requisitos_procesos_oficina($where) {
        $this->db->select("r.requ_id,p.proc_nombre,r.requ_nombre,r.requ_activo");
        $this->db->from('proceso_requisito r');
        $this->db->join('procesos p', 'p.proc_id= r.requ_proc_id');
        $this->db->where($where);
        $consulta = $this->db->get();
        if ($consulta->num_rows() > 0) {

            $consulta = $consulta->result();

            return $consulta;
        } else {
            return array();
        }
    }

    function Detalles_requisitos($where) {
        $this->db->select("r.requ_nombre");
        $this->db->from('proceso_requisito r');
        $this->db->order_by("r.requ_id", "asc");
        $this->db->where($where);
        $consulta = $this->db->get();
        if ($consulta->num_rows() > 0) {

            $consulta = $consulta->result();

            return $consulta;
        } else {
            return array();
        }
    }

    function deta_orden($where) {
        $this->db->select("sql_calc_found_rows *", FALSE);
        $this->db->from("proceso_detalle");
        $this->db->where($where);
        $consulta = $this->db->get();
        if ($consulta->num_rows() > 0) {
            $query = $this->db->query('SELECT FOUND_ROWS() AS total_count');
            $total_count = $query->row()->total_count;
            return $total_count;
        } else {
            return FALSE;
        }
    }
    

    function suma_plazo($where){
        $this->db->select_sum("deta_plazo");
        $this->db->from("proceso_detalle");
        $this->db->where($where);
        $consulta = $this->db->get();
         if ($consulta->num_rows() > 0) {
            $consulta = $consulta->row();
            return $consulta;
        } else {
            return FALSE;
        }
    }

}
