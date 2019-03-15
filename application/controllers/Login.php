<?php
 
require APPPATH . '/libraries/REST_Controller.php';
 header('Access-Control-Allow-Origin: *');

if($_SERVER['REQUEST_METHOD'] === 'OPTIONS') {
    header('Access-Control-Allow-Methods: GET, PUT, POST, DELETE, OPTIONS');
    header('Access-Control-Allow-Headers: Content-Type');
    exit;
}
class Login extends REST_Controller {
 
  public function __construct($config = 'rest') {
        
        parent::__construct($config);
       
    }
 
    // show data mahasiswa
    function index_get() {
        $nim = $this->get('nim');
        if ($nim == '') {
            $mahasiswa = $this->db->get('mahasiswa')->result();
        } else {
            $this->db->where('nim', $nim);
            $mahasiswa = $this->db->get('mahasiswa')->result();
        }
        $this->response($mahasiswa, 200);
    }
 
    // insert new data to mahasiswa
    function index_post() {



    $email    = $this->post('email',TRUE);
    $password = md5($this->post('password',TRUE));
    $validate = $this->login_model->validate($email,$password);
    if($validate->num_rows() > 0){
        $data  = $validate->row_array();
        $name  = $data['username'];
        $email = $data['email'];
        $level = $data['lv_user'];
        $sesdata = array(
            'username'  => $name,
            'email'     => $email,
            'level'     => $level,
            'logged_in' => TRUE
        );
        $this->session->set_userdata($sesdata);

        // access login for admin
       
    }else{
          $this->response(array('status' => 'fail', 502));
  
    }



    }
 
    // update data mahasiswa
    function index_put() {
        $nim = $this->put('nim');
        $data = array(
                    'nim'       => $this->put('nim'),
                    'nama'      => $this->put('nama'),
                    'id_jurusan'=> $this->put('id_jurusan'),
                    'alamat'    => $this->put('alamat'));
        $this->db->where('nim', $nim);
        $update = $this->db->update('mahasiswa', $data);
        if ($update) {
            $this->response($data, 200);
        } else {
            $this->response(array('status' => 'fail', 502));
        }
    }
 

 // function index_delete() {
 //        $id = $this->delete('id');
 //        $this->db->where('nim', $id);
 //        $delete = $this->db->delete('mahasiswa');
 //        if ($delete) {
 //            $this->response(array('status' => 'success'), 201);
 //        } else {
 //            $this->response(array('status' => 'fail', 502));
 //        }
   


        function index_delete($id ='') {
       
        $this->db->where('nim', $id);
        $delete = $this->db->delete('mahasiswa');
        if ($delete) {
            $this->response(array('status' => 'success'), 201);
        } else {
            $this->response(array('status' => 'fail', 502));
        }
    }
 
}





