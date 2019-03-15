 <?php defined('BASEPATH') OR exit('No direct script access allowed');  
 class Send_email extends CI_Controller {  
  public function index()  
  {  
   $config = Array(  
    'protocol' => 'smtp',  
    'smtp_host' => 'ssl://smtp.googlemail.com',  
    'smtp_port' => 465,  
    'smtp_user' => 'dedyindra120@gmail.com',   
    'smtp_pass' => '20121997',   
    'mailtype' => 'html',   
    'charset' => 'iso-8859-1'  
   );  
   $this->load->library('email', $config);  
   $this->email->set_newline("\r\n");  
   $this->email->from('dedyindra120@gmail.com', 'Admin ');   
   $this->email->to('dedyindra351@gmail.com');   
   $this->email->subject('Percobaan email');   
   $this->email->message('Peringatan !! ');  
   if (!$this->email->send()) {  
    show_error($this->email->print_debugger());   
   }else{  
    echo 'Success to send email';   
   }  
  }  
 }  