<style type="text/css">
.tabWelcome {
	text-align: center;
}
.tabWelcome h1 {
	font-size: 24px;
}
</style>
<div class="tabWelcome">
	<div class="info">
		<h3><?=$this->lang->line('hotspot_info')?> | <?=$this->lang->line('system_info')?></h3>
		<hr />
		<table cellpadding="4" cellspacing="5" id="serverInfo">
			<colgroup>
					<col width="140" />
					<col />
				</colgroup>
			<tr>
			<th><?=$this->lang->line('company_name')?>: </th>
			<td><?=$company_name?></td>
			</tr>
			<tr>
			<th><?=$this->lang->line('company_address')?>: </th>
			<td><?=$company_address_line1?><br />
				<?=$company_address_line2?><br />
				<?=$company_address_line3?>.</td>
			</tr>
			<tr>
			<th><?=$this->lang->line('phone')?>: </th>
			<td><?=$company_phone?>.</td>
			</tr>
			<tr>
			<th><?=$this->lang->line('hostname')?>: </th>
			<td><?=$hostname?></td>
			</tr>
			<tr>
			<th><?php echo $this->lang->line('operating_system'); ?>: </th>
			<td><?=$os?></td>
			</tr>
			</table>
	</div>
	<div class="info">
	<p>Welcome back User <?=$user?>, All rights Reserved. &copy; 2015. </p>
	</div>
</div>


	 