<?php
class MY_Controller extends CI_Controller
{
    var $mc_user;
    var $mc_ofic;

    var $full_user;
    var $full_ofic;

    var $mc_periodo;
    public function __construct()
    {
        parent::__construct();
        $this->mc_user = $this->session->userdata('authorized');
        $this->mc_ofic = $this->session->userdata('authorizedofic');
        
        $conf = $this->db->query("SELECT * FROM configuracion WHERE conf_id=1")->row();
        $this->full_user = $this->db->query("SELECT * FROM usuario WHERE usua_id='{$this->mc_user}'")->row();

       /* print_r($this->full_user);
        die(0);*/

        $this->full_ofic = $this->db->query("SELECT * FROM oficina WHERE ofic_id='{$this->mc_ofic}'")->row();
        
        $this->mc_periodo = $conf->conf_periodo;
        
        //die($this->mc_periodo);
    }
}