<?php if (!defined('BASEPATH')) exit('No direct script access allowed');

class Voucher extends Controller {
	
	function Voucher(){
		parent::Controller();
		//load models and libraries
		$this->load->model('billingplanmodel');
		$this->load->model('vouchermodel');
		$this->load->library('validation');
		$this->load->library('pagination');
	}
	
	function index(){
		//$this->freakauth_light->check('user');
		
		
		//lets paginate our voucher
		//pagination initialization
		/*
		$pagination['base_url']=base_url().$this->config->item('index_page').'/'.'voucher';
		$pagination['per_page'] = '10';
		$pagination['uri_segment'] = '2';
		$total_rows = $this->vouchermodel->getVoucher();
		$pagination['total_rows'] = $total_rows->num_rows();

		$this->pagination->initialize($pagination);
		
		$data['pagination_links'] = $this->pagination->create_links();
		//endof pagination
		
		
		//limiting our result
		$page = $this->uri->segment(2, 0);
		$limit = array('start'=>$pagination['per_page'],'end'=>$page);
		*/
		$data['vouchers']=$this->vouchermodel->getVoucher();
		
		//Rules for vouchers generation
		//$rules['numberofvoucher']='required|numeric';
		//$rules['billingplan'] = 'required';
		//$this->validation->set_rules($rules);
		
		//get billing plan
		$data['billingplans']=$this->billingplanmodel->getBillingPlan('id,name');
		$data['action'] = $this->lang->line('voucher_management');
		$data['title'] = $this->lang->line('voucher_management');;

		//$this->output->enable_profiler(TRUE);
		//if($this->validation->run()==false){	
			$this->load->view('voucher/voucher_view',$data);
		/*}else{
			$this->vouchermodel->generateVoucher();
			redirect('voucher');
			
		}
		*/
	}
	
	function delete(){
		//$this->freakauth_light->check('user');
		header('Content-Type: application/json; charset=utf8');
		$this->load->model('vouchermodel');
		$response = array();
		if($this->vouchermodel->deleteVoucher())
			{
			$response["success"] = true;
			}else{
			$response["success"] = false;
			$response["error"] = "Error: could not Delete voucher in database";
			}
			echo json_encode($response);
		//redirect('voucher','location');
	}
	
	function edit(){
		//security check
		//$this->freakauth_light->check('user');
		
		//set rules for the fields
		//$rules['password']='required';
		//$rules['billingplan']='required';
		//$this->validation->set_rules($rules);
		
		//get billingplan
		//$data['billingplans']=$this->billingplanmodel->getBillingPlan('id,name');
		
		//get current data
		//$where = array('username'=>$this->uri->segment(3));
		//$data['account'] = $this->vouchermodel->getVoucher('',$where,'');
		
		//$data['title']= $this->lang->line('voucher_management');
		//$data['action']= $this->lang->line('edit_account');
		//$this->output->enable_profiler(TRUE);
		//if($this->validation->run() == FALSE){
			//$this->load->view('voucher/voucher_edit', $data);

		//}else{
		 
		 header('Content-Type: application/json; charset=utf8');
		     $response = array();
			 if(strlen($_POST['username']) > 0){
							$this->vouchermodel->editVoucher();
							$response["success"] = true;
					}else{
						$response["success"] = false;
						$response["error"] = "Username transmission failed, cannot save changes.";
			   }
			echo json_encode($response);
		//}
	}
	
	function print_voucher(){
		//security check
		//$this->freakauth_light->check('user');
		
		//load dompdf plugin
		$this->load->plugin('to_pdf');
		
		//get the voucher data
		$data['voucher'] = $this->vouchermodel->getVoucher(null,array('username'=>$this->uri->segment(3)),null);
		
		$html = $this->load->view('voucher/voucher_print',$data, true);
		
		//$this->output->enable_profiler(TRUE);
		$this->vouchermodel->setPrintedVoucher();
		pdf_create($html , 'Micronet_voucher'.$this->uri->segment(3));
		
		/* header('Content-Type: application/json; charset=utf8');
		     $response = array();
			$response["success"] = true;
			echo json_encode($response);
			*/
	}
	
	function search(){
		session_start();
		//Security check please		
		$this->freakauth_light->check('user');
		
		//store the keyword to session
		$this->load->library('Db_session');
		if(isset($_POST['search']))
		$_SESSION["voucherquery"] = $_POST['search'];
			$this->db_session->set_userdata('search',$_SESSION["voucherquery"]);
		
		//paginate our pages
		$this->load->library('pagination');
		$pagination['base_url']=base_url().$this->config->item('index_page').'/'.'voucher/search';
		$pagination['per_page'] = '10';
		$pagination['uri_segment'] = '3';
		$total_rows = $this->vouchermodel->searchVoucher();
		$pagination['total_rows'] = $total_rows->num_rows();
		$this->pagination->initialize($pagination);
		
		//limit our result
		$page = $this->uri->segment(3, 0);
		$limit =array('start'=>$pagination['per_page'],'end'=>$page);
		
		$data['vouchers']=$this->vouchermodel->searchVoucher($limit);
		
		
		$data['title']=$this->lang->line('voucher_search_result');
		$data['action']=$this->lang->line('voucher_search_result');

		$this->load->view('voucher/voucher_search',$data);
		
	}
	function create()
	{
		 header('Content-Type:application/json; charset=utf8');
		     $response = array();
			if($this->vouchermodel->generateVoucher())
			{
			$response["success"] = true;
			}else{
			$response["success"] = false;
			$response["error"] = "Error: Could not generate voucher(s).";
			}
			echo json_encode($response);
	}
}
