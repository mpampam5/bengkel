<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Maps extends MY_Controller{

  public function __construct()
  {
    parent::__construct();
    $this->_security_public();
    $this->load->helper('frontend');
    $this->load->library(array("Temp_public"));
    $this->load->model('Maps_model','model');
  }

  function index()
  {
    $this->temp_public->set_title('Set lokasi saat ini');
    $this->temp_public->view('maps/index');
  }

}
