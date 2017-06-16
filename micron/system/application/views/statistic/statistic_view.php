<link href="/sampledojo/css/billing.css" rel="stylesheet"  type="text/css"/>
<link href="/sampledojo/css/admin.css" rel="stylesheet" type="text/css" />
<link href="/sampledojo/css/hotspot.css" rel="stylesheet" type="text/css"/>
<script type="text/javascript" src="/sampledojo/js/jquery.js"></script> 
<script type="javascript" src="/sampledojo/js/flash.js" ></script>
				<div id='voucher_info' >
					<div id='graph'>
						<?=$this->graph->render()?>
					</div>
				<h3 class='info'><?=$this->lang->line('voucher_info')?></h3>
				<ul>
					<li><label><?=$this->lang->line('voucher_created')?></label><?=$voucher['created']?></li>
					<li><label><?=$this->lang->line('used')?></label><?=$voucher['used']?></li>
					<li><label><?=$this->lang->line('expired')?></label><?=$voucher['expired']?></li>
				</ul>
				<h3 class='info'><?=$this->lang->line('billing_plans')?></h3>
				<ul>
					<?php foreach($billingplans->result() as $row):?>
					<li><label><?=$row->billingplan?></label><?=$row->qty?></li>
					<?php endforeach; ?>
				</ul>
						
				</div>
				<div id='postpaid_info'>
				<h3 class='info'>PostPaid Accounts</h3>
				<ul>
					<li><label><?=$this->lang->line('account_created')?></label><?=$postpaid['created']?></li>
					<li><label><?=$this->lang->line('used')?></label><?=$postpaid['used']?></li>
				</ul>
				</div>
