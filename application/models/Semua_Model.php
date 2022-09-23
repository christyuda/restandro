<?php
defined("BASEPATH") or exit('No direct script access allowed');

class Semua_model extends CI_Model
{
    private $_table_siswa = 't_siswa';

    



    //fungsi untuk menampilkan data
    public function getDataSiswa($idsiswa)
    {
        if ($idsiswa) {
            $this->db->from($this->_table_siswa);
            $this->db->where('id_siswa', $idsiswa);
            $query = $this->db->get()->row_array();
            return $query;
        } else {
            $this->db->from($this->_table_siswa);
            $query = $this->db->get()->result_array();
            return $query;
        }
    }

    //fungsi untuk menambahkan data
    public function insertsiswa($data)
    {
        //Menggunakan Query Builder
        $this->db->insert($this->_table_siswa, $data);
        return $this->db->affected_rows();
        // return $query;
    }

    //fungsi untuk mengubah data
    public function updatesiswa($data, $idsiswa)
    {
        //Menggunakan Query Builder
        $this->db->update($this->_table_siswa, $data, ['id_siswa' => $idsiswa]);
        return $this->db->affected_rows();
        // return $query;
    }

    //fungsi untuk menghapus data
    public function deletesiswa($idsiswa)
    {
        //Menggunakan Query Builder
        $this->db->delete($this->_table_siswa, ['id_siswa' => $idsiswa]);
        return $this->db->affected_rows();
        // return $query;
    }



    ## model pendamping

    public function getDataPendamping($idpendamping)
    {
        if ($idpendamping) {
            $this->db->from($this->_table_pendamping);
            $this->db->where('id_pendamping', $idpendamping);
            $query = $this->db->get()->row_array();
            return $query;
        } else {
            $this->db->from($this->_table_pendamping);
            $query = $this->db->get()->result_array();
            return $query;
        }
    }

    //fungsi untuk menambahkan data
    public function insertpendamping($data)
    {
        //Menggunakan Query Builder
        $this->db->insert($this->_table_pendamping, $data);
        return $this->db->affected_rows();
        // return $query;
    }

    //fungsi untuk mengubah data
    public function updatependamping($data, $idpendamping)
    {
        //Menggunakan Query Builder
        $this->db->update($this->_table_pendamping, $data, ['id_pendamping' => $idpendamping]);
        return $this->db->affected_rows();
        // return $query;
    }

    //fungsi untuk menghapus data
    public function deletependamping($idpendamping)
    {
        //Menggunakan Query Builder
        $this->db->delete($this->_table_pendamping, ['id_pendamping' => $idpendamping]);
        return $this->db->affected_rows();
        // return $query;
    }

    #### model user
    public function getDataUser($iduser)
    {
        if ($iduser) {
            $this->db->from($this->_t_user);
            $this->db->where('id_user', $iduser);
            $query = $this->db->get()->row_array();
            return $query;
        } else {
            $this->db->from($this->_t_user);
            $query = $this->db->get()->result_array();
            return $query;
        }
    }

    //fungsi untuk menambahkan data
    public function insertuser($data)
    {
        //Menggunakan Query Builder
        $this->db->insert($this->_t_user, $data);
        return $this->db->affected_rows();
        // return $query;
    }

    //fungsi untuk mengubah data
    public function updateuser($data, $iduser)
    {
        //Menggunakan Query Builder
        $this->db->update($this->_t_user, $data, ['id_user' => $iduser]);
        return $this->db->affected_rows();
        // return $query;
    }

    //fungsi untuk menghapus data
    public function deleteuser($iduser)
    {
        //Menggunakan Query Builder
        $this->db->delete($this->_t_user, ['id_user' => $iduser]);
        return $this->db->affected_rows();
        // return $query;
    }


    #### Model Ekskul #####


    public function getDataEkskul($id_ekskul)
    {
        if ($id_ekskul) {
            $this->db->from($this->_t_ekskul);
            $this->db->where('id_ekskul', $id_ekskul);
            $query = $this->db->get()->row_array();
            return $query;
        } else {
            $this->db->from($this->_t_ekskul);
            $query = $this->db->get()->result_array();
            return $query;
        }
    }

    //fungsi untuk menambahkan data
    public function insertekskul($data)
    {
        //Menggunakan Query Builder
        $this->db->insert($this->_t_ekskul, $data);
        return $this->db->affected_rows();
        // return $query;
    }

    //fungsi untuk mengubah data
    public function updateekskul($data, $id_ekskul)
    {
        //Menggunakan Query Builder
        $this->db->update($this->_t_ekskul, $data, ['id_ekskul' => $id_ekskul]);
        return $this->db->affected_rows();
        // return $query;
    }

    //fungsi untuk menghapus data
    public function deleteekskul($id_ekskul)
    {
        //Menggunakan Query Builder
        $this->db->delete($this->_t_ekskul, ['id_ekskul' => $id_ekskul]);
        return $this->db->affected_rows();
        // return $query;
    }

     #### Model Nilai #####


    public function getDataNilai($idnilai)
    {
        if ($idnilai) {
            $this->db->from($this->_t_nilai);
            $this->db->where('id_nilai', $idnilai);
            $query = $this->db->get()->row_array();
            return $query;
        } else {
            $this->db->from($this->_t_nilai);
            $query = $this->db->get()->result_array();
            return $query;
        }
    }

    //fungsi untuk menambahkan data
    public function insertnilai($data)
    {
        //Menggunakan Query Builder
        $this->db->insert($this->_t_nilai, $data);
        return $this->db->affected_rows();
        // return $query;
    }

    //fungsi untuk mengubah data
    public function updatenilai($data, $idnilai)
    {
        //Menggunakan Query Builder
        $this->db->update($this->_t_nilai, $data, ['id_nilai' => $idnilai]);
        return $this->db->affected_rows();
        // return $query;
    }

    //fungsi untuk menghapus data
    public function deletenilai($idnilai)
    {
        //Menggunakan Query Builder
        $this->db->delete($this->_t_nilai, ['id_nilai' => $idnilai]);
        return $this->db->affected_rows();
        // return $query;
    }






     #### Model Registrasi #####


    public function getDataRegistrasi($id_registrasi)
    {
        if ($id_registrasi) {
            $this->db->from($this->_t_registrasi);
            $this->db->where('id_registrasi', $id_registrasi);
            $query = $this->db->get()->row_array();
            return $query;
        } else {
            $this->db->from($this->_t_registrasi);
            $query = $this->db->get()->result_array();
            return $query;
        }
    }

    //fungsi untuk menambahkan data
    public function insertregistrasi($data)
    {
        //Menggunakan Query Builder
        $this->db->insert($this->_t_registrasi, $data);
        return $this->db->affected_rows();
        // return $query;
    }

    //fungsi untuk mengubah data
    public function updateregistrasi($data, $id_registrasi)
    {
        //Menggunakan Query Builder
        $this->db->update($this->_t_registrasi, $data, ['id_registrasi' => $id_registrasi]);
        return $this->db->affected_rows();
        // return $query;
    }

    //fungsi untuk menghapus data
    public function deleteregistrasi($id_registrasi)
    {
        //Menggunakan Query Builder
        $this->db->delete($this->_t_registrasi, ['id_registrasi' => $id_registrasi]);
        return $this->db->affected_rows();
        // return $query;
    }




     #### Model Registrasi #####


    public function getDataturnamen($id_turnamen)
    {
        if ($id_turnamen) {
            $this->db->from($this->_t_turnamen);
            $this->db->where('id_turnamen', $id_turnamen);
            $query = $this->db->get()->row_array();
            return $query;
        } else {
            $this->db->from($this->_t_turnamen);
            $query = $this->db->get()->result_array();
            return $query;
        }
    }

    //fungsi untuk menambahkan data
    public function insertturnamen($data)
    {
        //Menggunakan Query Builder
        $this->db->insert($this->_t_turnamen, $data);
        return $this->db->affected_rows();
        // return $query;
    }

    //fungsi untuk mengubah data
    public function updateturnamen($data, $id_turnamen)
    {
        //Menggunakan Query Builder
        $this->db->update($this->_t_turnamen, $data, ['id_turnamen' => $id_turnamen]);
        return $this->db->affected_rows();
        // return $query;
    }

    //fungsi untuk menghapus data
    public function deleteturnamen($id_turnamen)
    {
        //Menggunakan Query Builder
        $this->db->delete($this->_t_turnamen, ['id_turnamen' => $id_turnamen]);
        return $this->db->affected_rows();
        // return $query;
    }

}
