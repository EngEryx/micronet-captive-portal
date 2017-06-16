<?php
			
			header("Content-Type:application/json;charset=utf8");
			$entry = 0;
			$data  =array(
							'identifier' => 'id',
							'items' => array()
							);
							
			foreach($onlineusers->result() as $row){
					$data['items'][$entry]['id'] = $row->id;
					$data['items'][$entry]['username'] = $row->username;
					$data['items'][$entry]['start'] = $row->start;
					$data['items'][$entry]['time'] = $row->time;
					$data['items'][$entry]['packet'] = $row->packet;
			}
			
			echo json_encode($data);
			
?>
			
			
			
			
			
			
			
			