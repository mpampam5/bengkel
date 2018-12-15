<?php if (!defined('BASEPATH')) exit('No direct script access allowed');



/* Admin.php */
/* HARVIACODE CRUD GENERATOR MVC/HMVC AJAX CRUD */
/* PENGEMBANG : MPAMPAM */
/* EMAIL : MPAMPAM5@GMAIL.COM */
/* FACEBOOK : https://www.facebook.com/mpampam */
/* Location: ./application/controllers/Admin.php */
/* Please DO NOT modify this information : */
/* Generated by Harviacode Codeigniter CRUD Generator 2018-11-18 02:08:08 */
/* http://harviacode.com */

 class Admin extends MY_Controller{
  function __construct(){
      parent::__construct();
      $this->_security_admin("backend");
      $this->load->library(array("Layouts"));
      $this->load->model('Admin_model','model');
      $this->load->helper('backend');
  }

 function _rules(){
		$this->form_validation->set_rules('nama', 'nama', 'trim|xss_clean|required');
		$this->form_validation->set_rules('telepon', 'telepon', 'trim|xss_clean|required|numeric');
		$this->form_validation->set_rules('username', 'username', 'trim|xss_clean|required|alpha_numeric');
		$this->form_validation->set_error_delimiters('<span class="text-danger">', '</span>');
  }

 function index(){
    $this->layouts->set_title('Admin');
    $this->layouts->view(config_item("cpanel").'content/admin/index');
  }

function json() {
    header('Content-Type: application/json');
    echo $this->model->json();
}


 function detail($id){
    if($row=$this->model->get_where($id)){
      $this->layouts->set_title('Admin');
        $data=array('layout_title' => 'Admin',
										'id_login' => $row->id_login,
										'nama' => $row->nama,
										'telepon' => $row->telepon,
										'username' => $row->username,
										'password' => $row->password,
									);
				 $this->layouts->view(config_item("cpanel").'content/admin/detail',array(),$data);
//MODAL DETAIL
//$this->layouts->view(config_item("cpanel").'content/admin/detail',array(),$data,false);
    }else {
        $this->error_404();
    }
  }

 function tambah($status=''){
    if ($status=='aksi') {
        $json = array('success'=>false ,'alert'=>array());
        if ($this->input->is_ajax_request()) {
          $this->form_validation->set_rules('password', 'password', 'trim|xss_clean|required|min_length[6]');
            $this->_rules();
            if ($this->form_validation->run()) {
                $insert = array(
																'nama' => $this->input->post('nama',TRUE),
																'telepon' => $this->input->post('telepon',TRUE),
																'username' => $this->input->post('username',TRUE),
																'password' => md5($this->input->post('password',TRUE)),
															);
                $this->model->get_insert($insert);
                $json['alert']   = 'Berhasil Menyimpan!';
                $json['success'] = true;
            }else{
                foreach ($_POST as $key => $value) {
                  $json['alert'][$key] = form_error($key);
                }
            }
            echo json_encode($json);
        }
    }else{
      $this->layouts->set_title('Admin');
      $data = array('layout_title' => 'Admin',
                      'button'=>'tambah',
                      'aksi' =>site_url(config_item("cpanel").'admin/tambah/aksi'),
											'id_login' => set_value('id_login'),
											'nama' => set_value('nama'),
											'telepon' => set_value('telepon'),
											'username' => set_value('username'),
											'password' => set_value('password'),
											);
			 $this->layouts->view(config_item("cpanel").'content/admin/form',array(),$data);
  //MODAL TAMBAH
  //$this->layouts->view(config_item("cpanel").'content/admin/form',array(),$data,false);
     }
  }

 function edit($id,$status=''){
      if ($status=='aksi') {
          $json = array('success'=>false ,'alert'=>array());
          if ($this->input->is_ajax_request()) {
              $this->_rules();
              if ($this->form_validation->run()) {
                  $update = array(
																'nama' => $this->input->post('nama',TRUE),
																'telepon' => $this->input->post('telepon',TRUE),
																'username' => $this->input->post('username',TRUE),
															);
                $this->model->get_update($id,$update);
                $json['alert']   = 'Berhasil Mengedit!';
                $json['success'] = true;
            }else{
                foreach ($_POST as $key => $value) {
                  $json['alert'][$key] = form_error($key);
                }
            }
            echo json_encode($json);
        }
    }else{
      if($row=$this->model->get_where($id)){
        $this->layouts->set_title('Admin');
        $data = array('layout_title' => 'Admin',
                      'button'=>'edit',
                      'aksi' =>site_url(config_item("cpanel").'admin/edit/'.$id.'/aksi'),
											'id_login' => set_value('id_login', $row->id_login),
											'nama' => set_value('nama', $row->nama),
											'telepon' => set_value('telepon', $row->telepon),
											'username' => set_value('username', $row->username),
											'password' => set_value('password', $row->password),
											);
			 $this->layouts->view(config_item("cpanel").'content/admin/form',array(),$data);
  //MODAL EDIT
  //$this->layouts->view(config_item("cpanel").'content/admin/form',array(),$data,false);
			}else{
      $this->error_404();
    }
  }
}

function reset_pwd($id,$status=''){
     if ($status=='aksi') {
         $json = array('success'=>false ,'alert'=>array());
         if ($this->input->is_ajax_request()) {
           $this->form_validation->set_rules('password', 'Password', 'trim|xss_clean|required|min_length[6]');
           $this->form_validation->set_error_delimiters('<span class="text-danger">', '</span>');
             if ($this->form_validation->run()) {
                 $update = array(
                               'password' => md5($this->input->post('password',TRUE)),
                             );
               $this->model->get_update($id,$update);
               $json['alert']   = 'Berhasil Mengganti Password!';
               $json['success'] = true;
           }else{
               foreach ($_POST as $key => $value) {
                 $json['alert'][$key] = form_error($key);
               }
           }
           echo json_encode($json);
       }
   }else{
     if($row=$this->model->get_where($id)){
       $this->layouts->set_title('Admin');
       $data = array('layout_title' => 'Admin',
                     'button'=>'edit',
                     'aksi' =>site_url(config_item("cpanel").'admin/reset_pwd/'.$id.'/aksi'),
                     );
      // $this->layouts->view(config_item("cpanel").'content/admin/form_reset_pwd',array(),$data);
 //MODAL EDIT
 $this->layouts->view(config_item("cpanel").'content/admin/form_reset_pwd',array(),$data,false);
     }else{
     $this->error_404();
   }
 }
}

 function hapus($id){
  if ($this->input->is_ajax_request()) {
      $this->model->get_delete($id);
      $data['alert'] = 'Berhasil menghapus!';
      echo json_encode($data);
    }
}

}
/* End Controller */