<?php 
	/*
	* @author Eric Kirima, 2015, 1542hrs, EAT.
	* Eryx Labs, MicroNet Project.
	*/
	$ids = 0;
	$data = array(
			'identifier' => 'id',
			   'items' => array()
					);
	foreach ($vouchers->result() as $row)
	{
	  $data['items'][$ids]['id'] = $row->id;
	  $data['items'][$ids]['valid_until'] = preg_replace('/24:00:00/', '', $row->valid_until);
	  $data['items'][$ids]['time_used'] = ($row->time_used == '' || $row->time_used == 'null') ? '---' : intval($row->time_used);
	  $data['items'][$ids]['username'] = $row->username;
	  $data['items'][$ids]['password'] = $row->password;
	  $data['items'][$ids]['billingplan'] = $row->billingplan;
	  $data['items'][$ids]['isprinted'] = ($row->isprinted == false ) ? 'no' : 'yes';
	  $data['items'][$ids]['time_remain'] = ($row->time_remain == '' || $row->time_remain == 'null') ? '---' : intval($row->time_remain);
	  $data['items'][$ids]['packet_remain'] = ($row->packet_remain == '' || $row->packet_remain == 'null') ? '---' : intval($row->packet_remain);
	  $data['items'][$ids]['packet_used'] = ($row->packet_used == '' || $row->packet_used == 'null') ? '---' : intval($row->packet_used);
	  $ids++;
	}

	header('Content-Type: application/json; charset=utf8');

	echo json_encode($data);
?>
