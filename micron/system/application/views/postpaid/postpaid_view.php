<?php 
	/*
	* @author Eric Kirima, 2015, 1542hrs, EAT.
	* Eryx Labs, MicroNet Project.
	*/
	header('Content-Type: application/json, charset=utf-8');
	$data = array(
		'identifier' =>'id',
		'items' => array()
		);
		$entry = 0;
	foreach ($account->result() as $row)
	{
		$data['items'][$entry]['id'] = $row->id;
		$data['items'][$entry]['username'] = $row->username;
		$data['items'][$entry]['password'] = $row->password;
		$data['items'][$entry]['realname'] = $row->realname;
		$data['items'][$entry]['smsmobile'] = $row->smsmobile;
		$data['items'][$entry]['used'] = ($row->bill_by=='time') ? number_format($row->time_used,$this->config->item('decimal_places'),$this->config->item('decimal_separator'),$this->config->item('thousands_separator')) : number_format($row->packet_used,$this->config->item('decimal_places'),$this->config->item('decimal_separator'),$this->config->item('thousands_separator'));
		$data['items'][$entry]['bill_by'] = $row->bill_by;
		$data['items'][$entry]['current_total'] = ($row->bill_by=='time') ? number_format($row->time_price,$this->config->item('decimal_places'),$this->config->item('decimal_separator'),$this->config->item('thousands_separator')):number_format($row->packet_price,$this->config->item('decimal_places'),$this->config->item('decimal_separator'),$this->config->item('thousands_separator'));
		//$data['items'][$entry]['time_packet_price'] = ($row->bill_by == 'time') ? $row->time_price : $row->packet_price;
		$data['items'][$entry]['valid_until'] = str_replace('24:00:00','',($row->valid_until));
		$entry++;
	}
	//var_dump($account->result());
	echo json_encode($data);
?>
