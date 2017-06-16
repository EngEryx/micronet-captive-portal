<?php session_start(); ?>
<!doctype html>
<html lang="en">
	<head>
		<meta charset="utf-8">
		<title>Micronet | Dashboard</title>
		
		<link rel="stylesheet" href="../dijit/themes/flat/flat.css">
		<link rel="stylesheet" href="../dojox/grid/resources/Grid.css">
		<link rel="stylesheet" href="../dojox/grid/resources/claroGrid.css">
		<link rel="stylesheet" href="css/style.css">
	</head>
	<body class="flat">
	<div id="preLoader"><p>Loading...</p></div>
		<div dojoType="dijit.layout.BorderContainer" design="header" gutters="false" liveSplitters="false" id="borderContainer">
			<div dojoType="dijit.layout.ContentPane" region="top" id="topBar">
				<h1>MicroNet System | Server</h1>
				<div dojoType="dijit.MenuBar" id="navMenu">
					<div dojoType="dijit.PopupMenuBarItem">
						<span>Server Session</span>
						<div dojoType="dijit.Menu" id="sessionMenu">
							<div dojoType="dijit.MenuItem" jsId="mnuLock">Profile View</div>
							<div dojoType="dijit.MenuItem" jsId="signOut" onClick="signOut">Lock/Logout - <?php if(isset($_SESSION["micron"])){ echo $_SESSION["micron"]; }?> </div>
							
						</div>
					</div>
					<div dojoType="dijit.PopupMenuBarItem">
						<span>Emergency</span>
						<div dojoType="dijit.Menu" id="dangerMenu">
							<div dojoType="dijit.MenuItem" jsId="mnuSecure">Secure Server</div>
							<div dojoType="dijit.MenuItem" jsId="mnuReboot">Reboot System</div>
							<div dojoType="dijit.MenuItem" jsId="mnuBlockip">Block Me</div>

							<div dojoType="dijit.MenuSeparator"></div>
							<div dojoType="dijit.MenuItem" jsId="mnuChillispot">Restart Chilli</div>
							<div dojoType="dijit.MenuItem" jsId="mnuRadius">Restart Radius</div>
							<div dojoType="dijit.MenuItem" jsId="mnuMysql">Restart MySQL</div>
						</div>
					</div>
					
					
				</div>
			</div>

			<div dojoType="dijit.layout.BorderContainer" region="center" gutters="true" liveSplitters="false" id="mainSection">
				<div dojoType="dijit.layout.AccordionContainer" splitter="false" region="left" id="treeSection">
					<!-- Content to go here-->
					<div dojoType="dijit.layout.AccordionPane" title="Server Dashboard" href="views/menu/dashboard.html">
					</div>
					<div dojoType="dijit.layout.AccordionPane" title="Voucher Accounts" href="views/menu/voucher.html">
					</div>
					<div dojoType="dijit.layout.AccordionPane" title="Postpay Accounts" href="views/menu/postpaid.html">
					</div>
					<div dojoType="dijit.layout.AccordionPane" title="Server Statistics" href="views/menu/statistic.html">
					</div>
					<div dojoType="dijit.layout.AccordionPane" title="Billing & Plans" href="views/menu/billingplans.html">
					</div>
					<div dojoType="dijit.layout.AccordionPane" title="Invoice Management" href="views/menu/invoice.html">
					</div>
					<div dojoType="dijit.layout.AccordionPane" title="Search System" href="views/menu/search.html">
					</div>
					<div dojoType="dijit.layout.AccordionPane" title="Online Users" href="views/menu/onlineuser.html">
					</div>
					<div dojoType="dijit.layout.AccordionPane" title="MPESA Users" href="views/menu/mpesa.html">
					</div>
					<div dojoType="dijit.layout.AccordionPane" title="Settings & Maintainance" href="views/menu/maintainance.html">
					</div>
				</div>
				<div dojoType="dijit.layout.TabContainer" id="tabsPanel" region="center" design="sidebar">
				<div dojoType="dijit.layout.ContentPane" id="tabWelcome" title="MicroNet" href="micron/index.php/home/index">
				</div>
				</div>
			</div>

			<!-- foot section -->
		<div dojoType="dijit.layout.ContentPane" region="bottom" id="footer" align="left">
			<span style="float:right;">MicroNet Version 1.0. &copy; Eric Kirima 2015.</span>
		</div>
		</div>

		<div id="newGroupDialog" jsId="newGroupDialog" dojoType="dijit.Dialog" title="Create New Group" draggable="false">
			<div dojoType="dijit.form.Form" id="newGroupForm" jsId="newGroupForm" action="data/new_group.php" method="post">
				<input type="hidden" name="new_group_ajax" id="new_group_ajax" value="0">
				<label for="new_group_name">Group Name:</label>
				<input type="text" name="new_group_name" id="new_group_name" required="true" dojoType="dijit.form.ValidationTextBox" />
				<button dojoType="dijit.form.Button" type="submit">Submit</button>
				<button dojoType="dijit.form.Button" jsId="newGroupCancel" type="button">Cancel</button>
			</div>
		</div>

		<div id="editGroupDialog" jsId="editGroupDialog" dojoType="dijit.Dialog" title="Rename Group" draggable="false">
			<div dojoType="dijit.form.Form" id="editGroupForm" jsId="editGroupForm" action="data/edit_group.php" method="post">
				<input type="hidden" name="edit_group_ajax" id="edit_group_ajax" value="0">
				<input type="hidden" name="edit_group_id" id="edit_group_id">
				<table cellspacing="4" cellpadding="4">
					<tr>
						<td><label for="edit_group_old">Old Group Name:</label></td>
						<td><input type="text" name="edit_group_old" id="edit_group_old" disabled="true" dojoType="dijit.form.TextBox" /></td>
					</tr>
					<tr>
						<td><label for="edit_group_name">New Group Name:</label></td>
						<td><input type="text" name="edit_group_name" id="edit_group_name" required="true" dojoType="dijit.form.ValidationTextBox" style="margin-bottom: 6px" /></td>
					</tr>
					<tr>
						<td colspan="2" align="center">
							<button dojoType="dijit.form.Button" type="submit">Submit</button>
							<button dojoType="dijit.form.Button" jsId="editGroupCancel" type="button">Cancel</button>
						</td>
					</tr>
				</table>
			</div>
		</div>

		<div id="moveContactDialog" jsId="moveContactDialog" dojoType="dijit.Dialog" title="Move Contact" draggable="false">
			<div dojoType="dijit.form.Form" id="moveContactForm" jsId="moveContactForm" action="data/move_contact.php" method="post">
				<input type="hidden" name="move_contact_ajax" id="move_contact_ajax" value="0">
				<input type="hidden" name="move_contact_id" id="move_contact_id">
				<table cellspacing="4" cellpadding="4">
					<tr>
						<td><label for="move_contact_name">Contact Name:</label></td>
						<td><input type="text" name="move_contact_name" id="move_contact_name" disabled="true" dojoType="dijit.form.TextBox" /></td>
					</tr>
					<tr>
						<td><label for="move_contact_old">Current Group:</label></td>
						<td><input type="text" name="move_contact_old" id="move_contact_old" disabled="true" dojoType="dijit.form.TextBox" /></td>
					</tr>
					<tr>
						<td><label for="move_contact_new">New Group:</label></td>
						<td><input dojoType="dijit.form.FilteringSelect" name="move_contact_new" store="groupsStore" searchAttr="name" query="{type:'node'}" id="move_contact_new" required="true" style="margin-bottom: 6px" /></td>
					</tr>
					<tr>
						<td colspan="2" align="center">
							<button dojoType="dijit.form.Button" type="submit">Submit</button>
							<button dojoType="dijit.form.Button" jsId="moveContactCancel" type="button">Cancel</button>
						</td>
					</tr>
				</table>
			</div>
		</div>

		<div id="editVoucherDialog" jsId="editVoucherDialog" dojoType="dijit.Dialog" title="Edit Voucher" draggable="false">
		<form action="micron/index.php/voucher/edit" method="post" id="adds">
			<table cellspacing="4" cellpadding="4">
				<tr>
						<td><label for="edit_voucher_username">User Name:</label></td>
						<td><input type="text" name="username" id="username" dojoType="dijit.form.TextBox" /></td>
					</tr>
					<tr>
						<td><label for="edit_voucher_plan">Billing Plan:</label></td>
						<td><input type="text" name="vbillingplan" id="vbillingplan" dojoType="dijit.form.TextBox" /></td>
					</tr>
					<tr>
						<td><label for="edit_voucher_pass">Password:</label></td>
			<td><input type="text" name="vpassword" id="vpassword" required="true" dojoType="dijit.form.ValidationTextBox" style="margin-bottom: 6px" /></td>
					</tr>
					<tr>
						<td colspan="2" align="center">
							<button dojoType="dijit.form.Button"  type="button" onClick="saveVoucher">Save</button>
							<button dojoType="dijit.form.Button" type="button" onClick="cancelThisedit">Cancel</button>
						</td>
					</tr>
				</table>
		</form>

		</div>
		<div id="genVoucherDialog" jsId="genVoucherDialog" dojoType="dijit.Dialog" title="Generate Voucher" draggable="false">
				<form action="micron/index.php/voucher/create" method="post" id="generates">
						<table cellspacing="4" cellpadding="4">
						<tr>
								<td><label for="edit_voucher_number">No. Of Voucher:</label></td>
								<td><input type="text" name="numberofvoucher" id="numberofvoucher" dojoType="dijit.form.TextBox" /></td>
							</tr>
							<tr>
								<td><label for="edit_voucher_plan">Billing Plan:</label></td>
								<td><input type="text" name="billingplan" id="billingplan" dojoType="dijit.form.TextBox" /></td>
							</tr>
							<tr>
								<td colspan="2" align="center">
									<button dojoType="dijit.form.Button" type="button" onClick="generateVoucher">Generate</button>
									<button dojoType="dijit.form.Button" type="button" onClick="closeVgen">Cancel</button>
								</td>
							</tr>
						</table>
				</form>
		</div>
		<div id="addPostpaidDialog" jsId="addPostpaidDialog" dojoType="dijit.Dialog" title="Create Postpaid Account" draggable="false">
				<form action="micron/index.php/postpaid/create.html" method="post" id="createspostpaid">
						<table cellspacing="4" cellpadding="4">
						<tr>
								<td><label for="edit_realname">Full Name:</label></td>
								<td><input type="text" name="realname" id="realnames" required="true" dojoType="dijit.form.ValidationTextBox" /></td>
							</tr>
							<tr>
								<td><label for="edit_username">User Name:</label></td>
								<td><input type="text" name="username" id="usernames" required="true" dojoType="dijit.form.ValidationTextBox" /></td>
							</tr>
							<tr>
								<td><label for="edit_password">Password:</label></td>
								<td><input type="text" name="password" id="passwords" required="true" dojoType="dijit.form.ValidationTextBox" /></td>
							</tr>
							<tr>
								<td><label for="edit_billingplan">Bill by:</label></td>
								<td><input type="text" name="bill_by" id="billbys" required="true" dojoType="dijit.form.ValidationTextBox"  /></td>
							</tr>
							<tr>
								<td><label for="edit_validity">Valid Until (days e.g 2):</label></td>
								<td><input type="text" name="valid_until" id="validuntils" required="true" dojoType="dijit.form.ValidationTextBox"  /></td>
							</tr>
							<tr>
								<td><label for="edit_validity">Created By:</label></td>
								<td><input type="text" name="created_by" id="createdby" required="true" dojoType="dijit.form.ValidationTextBox"  /></td>
							</tr>
							<tr>
								<td><label for="edit_billingplan">Mobile Number:</label></td>
								<td><input type="text" name="smsmobile" id="mobiles" required="true" dojoType="dijit.form.ValidationTextBox"  /></td>
							</tr>
							<tr>
						<div align="center">
							<button dojoType="dijit.form.Button" jsId="postpaidok" type="button" onClick="processnewPostpaid">Create Account</button>
							<button dojoType="dijit.form.Button" jsId="postpaidx" type="button" onClick="cancelPostpaid">Cancel</button>
						</div>
						</tr>
						</table>
				</form>
		</div>
		<div id="editPostpaidDialog" jsId="editPostpaidDialog" dojoType="dijit.Dialog" title="Edit Postpaid Account" draggable="false">
			<form action="micron/index.php/postpaid/edit" method="post" id="editpostpaid">
						<table cellspacing="4" cellpadding="4">
						<tr>
								<td><label for="ppedit_realname">Full Name:</label></td>
								<td><input type="text" name="fullname" id="fullname" dojoType="dijit.form.TextBox" /></td>
							</tr>
							<tr>
								<td><label for="ppedit_username">User Name:</label></td>
								<td><input type="text" name="postuser" id="postuser" dojoType="dijit.form.TextBox" /></td>
							</tr>
							<tr>
								<td><label for="ppedit_password">Password:</label></td>
								<td><input type="text" name="postpass" id="postpass" dojoType="dijit.form.TextBox" /></td>
							</tr>
							<tr>
								<td><label for="ppedit_billingplan">Upload Rate:</label></td>
								<td><input type="text" name="bw_upload" id="bw_uploads" dojoType="dijit.form.TextBox" /></td>
							</tr>
							<tr>
								<td><label for="ppedit_billingplan">Download Rate:</label></td>
								<td><input type="text" name="bw_download" id="bw_downloads" dojoType="dijit.form.TextBox" /></td>
							</tr>
							<tr>
								<td><label for="ppedit_billingplan">Bill by:</label></td>
								<td><input type="text" name="postbillby" id="postbillby" dojoType="dijit.form.TextBox" /></td>
							</tr>
							<tr>
								<td><label for="ppedit_billingplan">Mobile Number:</label></td>
								<td><input type="text" name="postmobile" id="postmobile" dojoType="dijit.form.TextBox"  /></td>
							</tr>
						<div align="center">
							<button dojoType="dijit.form.Button" jsId="postpaidok" type="button" onClick="savePostpaid">Save Changes</button>
							<button dojoType="dijit.form.Button" jsId="postpaidx" type="button" onClick="cancelPostpaidedit">Cancel</button>
						</div>
						</table>
				</form>
		</div>

		<div id="okDialog" jsId="okDialog" dojoType="dijit.Dialog" title="Title" draggable="false">
			<p id="okDialogMessage" style="margin-top: 5px">Message</p>
			<div align="center">
				<button dojoType="dijit.form.Button" jsId="okDialogOK" type="button" onClick="cancelThisok">OK</button>
			</div>
		</div>
		
		<div id="loginDialog" jsId="loginDialog" dojoType="dijit.Dialog" title="Cashier Login Only" draggable="false" closable="false">
		<p id="loginMsg" style="margin-top: 5px; margin-bottom:5px;"> </p>
			<form action="micron/index.php/home/micronet" method="post" id="cashierauth">
				<table cellpadding="5" cellspacing="5" >
				<tr>
				<td><label for="userName">User Name:</label></td>
				<td><input type="text" name="user_name" placeholder="User ID" id="userName" dojoType="dijit.form.TextBox" /></td>
				</tr>
				<tr>
				<td><label for="userPwd">Password:</label></td>
				<td><input type="password" name="password" id="userPwd" placeholder="Password" dojoType="dijit.form.TextBox" /></td>
				</tr>
				<div align="center">
				<button dojoType="dijit.form.Button" jsId="loginProcess" type="button" onClick="loginProcess">Login</button>
				<button dojoType="dijit.form.Button" jsId="loginCancel" type="button" onClick="adminLogin">Switch Login > </button>
				</div>
			</table>
			</form>
		</div>
		
		<div id="billPlanDialog" jsId="billPlanDialog" dojoType="dijit.Dialog" title="Bill Plan" draggable="false" closable="true">
			<form action="micron/index.php/admin/billingplan/addbillingplan" method="post" id="abillingplan">
				<table cellpadding="5" cellspacing="5" >
				<tr>
				<td><label for="planName">Plan Name:</label></td>
				<td><input type="text" name="name" placeholder="Plan Name" id="planname" dojoType="dijit.form.TextBox" /></td>
				</tr>
				<tr>
				<td><label for="type">Bill By :</label></td>
				<td><input type="text" name="type" id="plantype" placeholder="Time or packet" dojoType="dijit.form.TextBox" /></td>
				</tr>
				<tr>
				<td><label for="amount">Amount :</label></td>
				<td><input type="text" name="amount" id="planamount" placeholder="Amount" dojoType="dijit.form.TextBox" /></td>
				</tr>
				<tr>
				<td><label for="valid_for">Valid for:</label></td>
				<td><input type="text" name="valid_for" id="planvalid" placeholder="e.g 2 days" dojoType="dijit.form.TextBox" /></td>
				</tr>
				<tr>
				<td><label for="price">Price :</label></td>
				<td><input type="text" name="price" id="planprice" placeholder="e.g Price" dojoType="dijit.form.TextBox" /></td>
				</tr>
				<tr>
				<td><label for="bw_upload">Upload Rate :</label></td>
				<td><input type="text" name="bw_upload" id="planuprate" placeholder="128,512,2048" dojoType="dijit.form.TextBox" /></td>
				</tr>
				<tr>
				<td><label for="bw_download">Download Rate :</label></td>
				<td><input type="text" name="bw_download" id="plandownrate" placeholder="128,512,2048" dojoType="dijit.form.TextBox" /></td>
				</tr>
				<tr>
				<td><label for="idleTimeout">Idle Timeout (mins):</label></td>
				<td><input type="text" name="IdleTimeout" id="plantimeout" placeholder="e.g 10" dojoType="dijit.form.TextBox" /></td>
				</tr>
				<tr>
				<td><label for="simulatenous">Simultaneous :</label></td>
				<td><input type="text" name="simultaneous" id="plansimula" placeholder="0" dojoType="dijit.form.TextBox" /></td>
				</tr>
				<tr>
				<td><label for="redirecturl">Redirect Url :</label></td>
				<td><input type="text" name="redirect_url" id="planredirect" placeholder="http://" dojoType="dijit.form.TextBox" /></td>
				</tr>
				<tr>
				<td><label for="creator">Created By :</label></td>
				<td><input type="text" name="created_by" id="plancreator" placeholder="Your Name" dojoType="dijit.form.TextBox" /></td>
				</tr>
				<div align="center">
				<button dojoType="dijit.form.Button" jsId="savethisPlan" type="button" onClick="savethisPlan">Save</button>
				<button dojoType="dijit.form.Button" jsId="billingwinx" type="button" onClick="billingwinx">Cancel > </button>
				</div>
			</table>
			</form>
		</div>
		<!-- Search Section -->
		<div id="postpaySearch" jsId="postpaySearch" dojoType="dijit.Dialog" title="Search Post Paid Acc." draggable="true">
			<form action="micron/index.php/postpaid/search" method="post" id="searchacc">
			<table cellpadding="5" cellspacing="5" >
			<tr>
			<td><label for="accName">Account Name:</label></td>
			<td><input type="text" name="search" placeholder="User/Acc. Name" id="search" dojoType="dijit.form.TextBox" /></td>
			</tr>
			<div align="center">
				<button dojoType="dijit.form.Button" jsId="searchPostpay" type="button" onClick="searchPostpay">Search</button>
				</div>
			</table>
			</form>
		</div>
		
		<div id="voucherSearch" jsId="voucherSearch" dojoType="dijit.Dialog" title="Search Voucher Acc." draggable="true">
			<form action="micron/index.php/voucher/search" method="post" id="searchvoucher">
			<table cellpadding="5" cellspacing="5" >
			<tr>
			<td><label for="accName">Voucher Name:</label></td>
			<td><input type="text" name="search" placeholder="Voucher/Acc. Name" id="searchs" dojoType="dijit.form.TextBox" /></td>
			</tr>
			<div align="center">
				<button dojoType="dijit.form.Button" jsId="searchVoucher" type="button" onClick="searchVoucher">Search</button>
				</div>
			</table>
			</form>
		</div>
		
		<div id="mpesaSearch" jsId="mpesaSearch" dojoType="dijit.Dialog" title="Search MPESA Acc." draggable="true">
			<form action="micron/index.php/mpesa/clients" method="post" id="msearch">
			<table cellpadding="5" cellspacing="5" >
			<tr>
			<td><label for="maccName">MPESA Account Name:</label></td>
			<td><input type="text" name="msearch" placeholder="User/Acc. Name" id="msearch" dojoType="dijit.form.TextBox" /></td>
			</tr>
			<div align="center">
				<button dojoType="dijit.form.Button" jsId="searchMpesa" type="button" onClick="searchMpesa">Search</button>
				</div>
			</table>
			</form>
		</div>
			<!-- end lower border container section -->
		<script type="text/javascript" src="../dojo/dojo.js" djConfig="parseOnLoad: true"></script>
		<script type="text/javascript" src="js/script.js"></script>
		<script type="text/javascript" src="js/micronet1.js"></script>
	</body>
</html>
