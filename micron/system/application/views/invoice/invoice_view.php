<?php
	header("Content-Type:application/json; charset=utf-8");
	$data = array(
					'identifier' => 'id',
					'items' => array()
					);
	$entry = 0;
	
		foreach($invoice->result() as $row)
		{
		   $data['items'][$entry]['id'] = $row->id;
		   $data['items'][$entry]['realname'] = $row->realname;
		   $data['items'][$entry]['username'] = $row->username;
		   $data['items'][$entry]['used'] = $row->used;
		   $data['items'][$entry]['bill_by'] = $row->bill_by;
		   $data['items'][$entry]['date'] = $row->date;
		   $data['items'][$entry]['total'] = number_format($row->current_total,$this->config->item('decimal_places'),$this->config->item('decimal_separator'),$this->config->item('thousands_separator'));
		}
		
		echo json_encode($data);
?>