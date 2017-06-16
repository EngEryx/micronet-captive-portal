<?php

class Home extends Controller {
	
	function Home(){
		parent::Controller();
	
	}
	
	function index(){
		//Disable Security.
		//$this->freakauth_light->check('user');
		
		$data['title']=$this->lang->line('home');
		$data['h1']= $this->lang->line('welcome');
		
		$data['user'] = $this->db_session->userdata('user_name');
		
		$data['company_name'] = $this->config->item('company_name');
		$data['company_address_line1'] = $this->config->item('company_address_line1');
		$data['company_address_line2'] = $this->config->item('company_address_line2');
		$data['company_address_line3'] = $this->config->item('company_address_line3');
		$data['company_phone'] = $this->config->item('company_phone');
		$data['company_tax_code'] = $this->config->item('company_tax_code');
		$shella = exec('uname -o');
		$data['os'] = (strlen($shella > 0 )) ? $shella : "UNAVAILABLE";
		$shellb =  exec('uname -n');
		$data['hostname'] = (strlen($shellb > 0)) ? $shellb : "UNAVAILABLE";
		
		$this->load->view('home/home_view',$data);
	}
	function micronet()
	{
		session_start();
		header("Content-Type:application/json;charset=utf8");
		$response = array();
		if($this->freakauth_light->login())
		{
			$response["success"] = true;
			//FIXME
			$response["username"] = $this->db_session->userdata('user_name');
			$_SESSION["micron"] = $response["username"];
				//attach previlleges to the reply.
		}else{
		 $response["success"] = false;
		 $response["error"] = "Login Failed";
		}
		
		echo json_encode($response);
	}
	function microns()
	{
		header("Content-Type:application/json; charset=utf-8");
		$response =array();
		if($this->freakauth_light->belongsToGroup())
		{
			$response["success"] = true;
			$response["username"] = $this->db_session->userdata('user_name');
			$response["error"] = "Logged bug test";
		}else{
			$response["success"] = false;
			$response["error"] = "No one is logged in.";
		}
		
		echo json_encode($response);
	}
}
