<?php

if (!defined('BASEPATH'))exit('No direct script access allowed');



/* */
/* HARVIACODE CRUD GENERATOR MVC/HMVC AJAX CRUD */
/* PENGEMBANG : MPAMPAM */
/* EMAIL : MPAMPAM5@GMAIL.COM */
/* FACEBOOK : https://www.facebook.com/mpampam */
/* Please DO NOT modify this information : */
/* Generated by Harviacode Codeigniter CRUD Generator 2018-12-07 23:56:24 */
/* http://harviacode.com */

 class Cs_service_model extends CI_Model{
  var $table = 'trans_cs_service';
  var $id    = 'id_trans_cs_service';

    // datatables
      function json() {
          $this->datatables->select("trans_cs_service.id_trans_cs_service,
                                      trans_cs_service.id_trans_kendaraan,
                                      trans_cs_service.id_service,
                                      trans_cs_service.keterangan,
                                      DATE_FORMAT(trans_cs_service.waktu_service,'%d/%m/%Y') as waktu_service,
                                      trans_kendaraan.no_registrasi,
                                      trans_kendaraan.aktif,
                                      trans_kendaraan.id_pemilik,
                                      tb_pemilik.nama_pemilik,
                                      tb_service.nama_service");


          $this->datatables->from('trans_cs_service');
          //add this line for join
          $this->datatables->join('trans_kendaraan', 'trans_cs_service.id_trans_kendaraan = trans_kendaraan.id_trans_kendaraan');
          $this->datatables->join('tb_pemilik', 'trans_kendaraan.id_pemilik = tb_pemilik.id_pemilik');
          $this->datatables->join('tb_service', 'trans_cs_service.id_service = tb_service.id_service');
          $this->datatables->where('trans_kendaraan.aktif','y');
          $this->datatables->add_column('action',
          '<a href="'.site_url(config_item("cpanel")."cs_service/detail/$1").'" id="detail" data-toggle="tooltip" data-placement="top" title="Detail" class="text-primary"><i class="fa fa-file"></i></a>&nbsp;
           <a href="'.site_url(config_item("cpanel")."cs_service/edit/$1").'" id="edit" data-toggle="tooltip" data-placement="top" title="Edit" class="text-warning "><i class="fa fa-pencil"></i></a>&nbsp;
           <a href="'.site_url(config_item("cpanel")."cs_service/hapus/$1").'" id="hapus" data-toggle="tooltip" data-placement="top" title="Hapus" class="text-danger "><i class="fa fa-trash"></i></a>',
           'id_trans_cs_service');
          return $this->datatables->generate();
      }


      function get_join_cs($where)
      {
        return $this->db->query(" SELECT
                                  trans_kendaraan.id_trans_kendaraan,
                                  trans_kendaraan.no_registrasi,
                                  trans_kendaraan.id_pemilik,
                                  trans_kendaraan.id_kendaraan,
                                  trans_kendaraan.aktif,
                                  trans_kendaraan.tgl_registrasi,
                                  tb_pemilik.nama_pemilik,
                                  tb_kendaraan.no_kendaraan,
                                  tb_kendaraan.merek_kendaraan,
                                  tb_kendaraan.kilometer,
                                  tb_kendaraan.kilometer_skrg,
                                  tb_kendaraan.waktu_pembelian
                                  FROM
                                  trans_kendaraan
                                  INNER JOIN tb_pemilik ON tb_pemilik.id_pemilik = trans_kendaraan.id_pemilik
                                  INNER JOIN tb_kendaraan ON tb_kendaraan.id_kendaraan = trans_kendaraan.id_kendaraan
                                  WHERE trans_kendaraan.id_trans_kendaraan = $where AND trans_kendaraan.aktif='y'"
                                  )
                          ->row();
      }

      function get_join_cs_edit($where)
      {
        return $this->db->query("SELECT
                                  trans_cs_service.id_trans_cs_service,
                                  trans_cs_service.id_trans_kendaraan,
                                  trans_cs_service.id_service,
                                  trans_cs_service.keterangan,
                                  trans_cs_service.waktu_service,
                                  trans_cs_service.waktu_tempuh AS wkt_tempuh,
                                  trans_cs_service.jarak_tempuh AS jrk_tempuh,
                                  trans_kendaraan.no_registrasi,
                                  tb_pemilik.nama_pemilik,
                                  tb_kendaraan.no_kendaraan,
                                  tb_kendaraan.merek_kendaraan,
                                  trans_kendaraan.aktif,
                                  tb_service.nama_service,
                                  tb_service.jarak_tempuh,
                                  tb_service.s_jarak_tempuh,
                                  tb_service.waktu,
                                  tb_service.s_waktu
                                  FROM
                                  trans_cs_service
                                  INNER JOIN trans_kendaraan ON trans_cs_service.id_trans_kendaraan = trans_kendaraan.id_trans_kendaraan
                                  INNER JOIN tb_pemilik ON trans_kendaraan.id_pemilik = tb_pemilik.id_pemilik
                                  INNER JOIN tb_service ON trans_cs_service.id_service = tb_service.id_service
                                  INNER JOIN tb_kendaraan ON trans_kendaraan.id_kendaraan = tb_kendaraan.id_kendaraan
                                  WHERE
                                  trans_cs_service.id_trans_cs_service = $where AND
                                  trans_kendaraan.aktif = 'y'")
                          ->row();
      }

      function cek_service($jarak,$waktu)
      {
        return $this->db->query('SELECT * FROM tb_service WHERE '.$jarak.' >= jarak_tempuh AND '.$jarak.' < s_jarak_tempuh OR '.$waktu.' >= waktu AND '.$waktu.' < s_waktu')->row();

      }

      function cek_service_edit($id_service)
      {
        return $this->db->query("SELECT * FROM tb_service WHERE id_service=$id_service")->row();

      }


      function get_where_join($id)
      {
      $query = $this->db->select("trans_cs_service.id_trans_cs_service,
                                    trans_cs_service.id_trans_kendaraan,
                                    trans_cs_service.id_service,
                                    trans_cs_service.keterangan,
                                    trans_cs_service.waktu_service,
                                    trans_cs_service.waktu_tempuh,
                                    trans_cs_service.jarak_tempuh,
                                    trans_kendaraan.no_registrasi,
                                    trans_kendaraan.aktif,
                                    trans_kendaraan.id_pemilik,
                                    tb_pemilik.nama_pemilik,
                                    tb_service.nama_service")
                 ->join('trans_kendaraan', 'trans_cs_service.id_trans_kendaraan = trans_kendaraan.id_trans_kendaraan')
                 ->join('tb_pemilik', 'trans_kendaraan.id_pemilik = tb_pemilik.id_pemilik')
                 ->join('tb_service', 'trans_cs_service.id_service = tb_service.id_service')
                 ->where(array('id_trans_cs_service'=>$id,'trans_kendaraan.aktif'=>'y'))
                 ->get('trans_cs_service');
                 return $query->row();
      }

     function get_data()
      {
        return $this->db->query("SELECT * FROM $this->table ORDER BY $this->id DESC");
      }


      function get_insert($table,$data)
        {
          return $this->db->insert($table,$data);
        }


      function get_where($where)
        {
          return $this->db->where($this->id,$where)
                          ->get($this->table)
                          ->row();
        }


      function get_update($table,$where,$data)
        {
          return $this->db
                ->where($where)
                ->update($table,$data);
        }


      function get_delete($where)
        {
          return $this->db->where($this->id,$where)
                          ->delete($this->table);
        }

        function join_trans_service($where)
        {
          return $this->db->query("SELECT
                                    trans_service.id_trans_service,
                                    trans_service.id_service,
                                    trans_service.id_perbaikan,
                                    tb_jenis_perbaikan.jenis_perbaikan
                                    FROM
                                    trans_service
                                    INNER JOIN tb_jenis_perbaikan ON tb_jenis_perbaikan.id_jenis_perbaikan = trans_service.id_perbaikan
                                    WHERE
                                    trans_service.id_service = $where"
                                  )
                            ->result();
        }

}
  /* End Model */
