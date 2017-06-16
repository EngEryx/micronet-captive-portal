<?php if(!defined('BASEPATH')) exit("No direct Access Allowed"); ?>
<?php
 /* 
 * @author Eric Kirima 
 * @param data[] transaction details captured from payment gateway.
 * INSERT THEM INTO A DABASE FOR RECORD KEEPING AND ACCOUNTING PURPOSES
 */
 class Mpesamodel extends Model {
 
	  function Mpesamodel(){
	    parent::Model();
	    $this->_client_table = "mpesa_clients";
	  }
	  
	  function createMpesa_Client($data = array()){
		   //if(count($data) == 11 && $data["success"]){
			$this->db->insert($this->_client_table,$data);
			$this->db->trans_complete();
		  // }
	  }
	  function getMpesa_Client($client = null){
		//($client != null) ? $this->db->where(array('client_username'=>$client)) : '';
		($client != null) ? $this->db->like('client_username',$client) : '';
	   return $this->db->get($this->_client_table);
	  }
	  function deleteMpesa_Client($client = null){
		($client != null) ? $this->db->where(array('client_username'=>$client)) : '';
		return $this->db->delete($this->_client_table);
	  }
 }