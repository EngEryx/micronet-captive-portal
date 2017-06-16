<?php
	header("Content-Type:application/json; charset=utf-8");
	$data = array(
					'identifier'=>'id',
					'items'=>array()
				);
			$entry = 0;
			foreach($query->result() as $row){
			$data['items'][$entry]['id'] = $row->id;
			$data['items'][$entry]['name'] = $row->name;
			$data['items'][$entry]['type'] = $row->type;
			$data['items'][$entry]['amount'] = $row->amount;
			$data['items'][$entry]['price'] = $this->config->item('currency_symbol').number_format($row->price,2);
			$data['items'][$entry]['valid_for'] = $row->valid_for;
			$data['items'][$entry]['bw_upload'] = $row->bw_upload;
			$data['items'][$entry]['bw_download'] = $row->bw_download;
			$data['items'][$entry]['created_by'] = $row->created_by;
			$data['items'][$entry]['idletimeout'] = $row->IdleTimeout;
			$entry++;
			}
		echo json_encode($data);
?>

