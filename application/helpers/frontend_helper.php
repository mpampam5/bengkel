<?php
function profile($field)
{
  $ci = get_instance();
  $query =  $ci->db->where(array("id_profile"=>1))->get('tb_profile')->row();
  return $query->$field;
}

function cek_service($id_trans_kendaraan,$id_service)
{
  $ci = get_instance();
  $query = $ci->db->get_where('trans_cs_service',array("id_trans_kendaraan"=>$id_trans_kendaraan,"id_service"=>$id_service));
  if ($query->num_rows()>0) {
    return true;
  }else {
    return false;
  }
}

function cek_trans_service($id_trans_cs_service,$id_trans_service)
{
  $ci = get_instance();
  $query = $ci->db->get_where('trans_cs_perbaikan',array('id_trans_cs_service' => $id_trans_cs_service,'id_trans_service'=>$id_trans_service ));
  if ($query->num_rows()>0) {
      return true;
  }else {
    return false;
  }
}

 ?>
