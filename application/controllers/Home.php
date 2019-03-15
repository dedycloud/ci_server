<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Home extends CI_Controller {
	function __construct(){
		parent::__construct();		
		$this->load->model('Bank');
		
        $this->load->helper('url');
      
	}
	/**
	 * Index Page for this controller.
	 *
	 * Maps to the following URL
	 * 		http://example.com/index.php/welcome
	 *	- or -
	 * 		http://example.com/index.php/welcome/index
	 *	- or -
	 * Since this controller is set as the default controller in
	 * config/routes.php, it's displayed at http://example.com/
	 *
	 * So any other public methods not prefixed with an underscore will
	 * map to /index.php/welcome/<method_name>
	 * @see https://codeigniter.com/user_guide/general/urls.html
	 */


	
	public function index()
	{
		$keo='http://localhost/cijson/index.php/Home/ini';
		$eko=file_get_contents($keo);
		$data=json_decode($eko,true);
		print_r( $data);
 
	}
	public function ini()
	{
		
		$list = $this->Bank->pimpinan();
		$sek= json_encode($list);
		print_r($sek);
	}
}
