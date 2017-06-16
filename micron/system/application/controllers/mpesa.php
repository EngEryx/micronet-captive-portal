<?php

class Mpesa extends Controller {

	function Mpesa()
	{
	parent::Controller();
	$this->load->model('billingplanmodel');
	$this->load->model('vouchermodel');
	$this->load->model('mpesamodel');
	$this->payplug;
	}
	
	public function index()
	{
		//echo "Hello Eric I can Connect";
		show_404();
		//echo $this->config->item('mpesa_url');
	}
	public function create()
	{	
	/* generateMpesaVoucher($billplan =         	"MPESA",$mpesa_user=array("username"=>"MPESA_USER","password"=>"pass") 
	 # First get amount paid from payplug
	 # then load billing plans
	 # compare amount paid with a billing plan worth
	 # insert a record into db
	 # send reply
	 # @param e.g url .. /(3)400/(4)ekirima/(5)0719393894/(6)merchant/(7)agent/(8)code/(9)fnln/
	 # 
	*/
		header("Content-Type:application/json");
		$data = array();
			$salt_alpha = array("a","b","c","d","e","f","g","h","i","j","k",
								"l","m","n","o","p","q","r","s","t","u","v",
								"w","y","z");
			$microns = array("ken","mic","ron","net","ser","ery",
							"dat","int","tra","mut","eri",
							"kir","pau","kim","nao","muk",
							"mwa","thi","omi","mut","une","ken");
							
			$temp_password = $microns[rand(0,20)]
						    .$microns[rand(0,20)]
							.$microns[rand(0,20)];

			$billingplan_detail = $this->billingplanmodel->getBillingPlan(null,
																	null,
																	array('price'=>$this->uri->segment(3))
																	);
	
		    if($billingplan_detail->num_rows()>0){		
			 
			   $billingplan=$billingplan_detail->row();
			   
				 $billplan =$billingplan->name;
				 $mpesa_user=array(
								 "username"=>$this->uri->segment(4),
								 "password"=>$temp_password,
								 "mobile"=>$this->uri->segment(5)
								 );
				 
				if($this->vouchermodel->VoucherExist($this->uri->segment(4))){
				    $mpesa_user=array(
					"username"=>$this->uri->segment(4).$salt_alpha[rand(2,24)],
					"password"=>$temp_password,
					"mobile"=>$this->uri->segment(5)
					);
				}	
				
				$this->vouchermodel->generateMpesaVoucher(1,$billplan,$mpesa_user);
				$data["client_phone"] = $this->uri->segment(5);
				$data["client_username"] = $mpesa_user["username"];
				$data["client_password"] = $mpesa_user["password"];
				$data["client_plan"] = $billplan;
				$data["client_name"] = $this->uri->segment(9)."-".$this->uri->segment(10);
				$data["client_expiry"] = $billingplan->valid_for;
				$data["client_merchant"] = $this->uri->segment(6);
				$data["client_gateway"] = $this->uri->segment(7);
				$data["client_cash"] = $this->uri->segment(3);
				$data["client_receipt"] = $this->uri->segment(8);
				$data["client_replied"] = 1;
				
				$this->mpesamodel->createMpesa_Client($data);
				
			file_get_contents($this->config->item('mpesa_url')."?json=".json_encode($data));
			//TODO reply to merchant to note credit transactions
			}
	}
    public function clients()
	{
		header("Content-Type:application/json");
		$client = array('identifier' => 'id',
						'items' => array()
						);
		$entry = 0;
			/* ($this->uri->segment(3) != null) ? $this->mpesamodel->getMpesa_Client($this->uri->segment(3)) : */ 
		$client['url'] = (isset($_REQUEST["msearch"])) ? $_REQUEST["msearch"] : null;
		
		$clientsinfo = ($this->uri->segment(3) != null) ? $this->mpesamodel->getMpesa_Client($this->uri->segment(3)) : $this->mpesamodel->getMpesa_Client();
		
		foreach($clientsinfo->result() as $info){
		 $client['items'][$entry]['id'] = $info->clientID;
		 $client['items'][$entry]['client_name'] = $info->client_name;
		 $client['items'][$entry]['client_receipt'] = $info->client_receipt;
		 $client['items'][$entry]['client_username'] = $info->client_username;
		 $client['items'][$entry]['client_password'] = $info->client_password;
		 $client['items'][$entry]['client_phone'] = $info->client_phone;
		 $client['items'][$entry]['client_gateway'] = $info->client_gateway;
		 $client['items'][$entry]['client_cash'] = $info->client_cash;
		 $client['items'][$entry]['client_expiry'] = $info->client_expiry;
		 $client['items'][$entry]['client_merchant'] = $info->client_merchant;
		 $client['items'][$entry]['client_plan'] = $info->client_plan;
		 $client['items'][$entry]['client_replied'] = $info->client_replied;
		  $entry++;
		}
		
		echo json_encode($client);
	}
	public function delete()
	{
		header("Content-Type:application/json");
		
		$reply = array('success' => false,
						'error' => ''
						);
			
		$client = ($this->uri->segment(3) != null) ? $this->uri->segment(3) : '';
		if($this->mpesamodel->deleteMpesa_Client($client))
		{
			$reply['success'] = true;
		}else{
			$reply['error'] = "Failed to delete given account";
		}
		
		echo json_encode($reply);
	}

}
