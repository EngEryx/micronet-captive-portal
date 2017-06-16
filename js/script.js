	//Micronet
	//Load Dojo, Dijit and DojoX components
	dojo.require("dojo.data.ItemFileWriteStore");
	dojo.require("dijit.dijit");
	dojo.require("dijit.layout.BorderContainer");
	dojo.require("dijit.layout.ContentPane");
	dojo.require("dijit.layout.BorderContainer");
	dojo.require("dijit.layout.AccordionContainer");
	dojo.require("dijit.layout.TabContainer");
	dojo.require("dijit.MenuBar");
	dojo.require("dijit.PopupMenuBarItem");
	dojo.require("dijit.Menu");
	dojo.require("dijit.MenuItem");
	dojo.require("dijit.Tree");
	dojo.require("dojox.grid.DataGrid");
	dojo.require("dijit.Dialog");
	dojo.require("dijit.form.Form");
	dojo.require("dijit.form.ValidationTextBox");
	dojo.require("dijit.form.TextBox");
	dojo.require("dijit.form.FilteringSelect");
	dojo.require("dijit.form.Button");
	dojo.require("dijit.form.ComboButton");
	
	dojo.require("dijit.form.ComboBox");
	dojo.require("dijit.form.CheckBox");
	dojo.require("dijit.form.Textarea");
	dojo.require("dijit.form.ComboBox");
	dojo.require("dijit.form.FilteringSelect");

	dojo.require("dojox.grid.DataGrid");
	dojo.require("dojox.widget.FisheyeLite");
	dojo.require("dojox.analytics.Urchin");
	//Boot Strapper function
	dojo.addOnLoad(function(){
			//okDialog.show();
			//loginDialog.show();
			var n = dojo.byId("preLoader");
			isLoggedin();
			dojo.fadeOut({
				node:n,
				duration:720,
				onEnd:function(){
					// dojo._destroyElement(n);
					dojo.style(n,"display","none");
					
				}
			}).play();
			
	});
	//loginDialog.onHide(function(){alert("hello");});
	//Declarition of dialog windows and various reapeatedly used tools
	var okDialogMsg = dojo.byId("okDialogMessage");
	var genVoucherDialog = dojo.byId("genVoucherDialog");
	//var genForm = dojo.byId("generates");
	//var vurl = voucherStore.url;
	//var vnewStore = new dojo.data.ItemFileReadStore({url:vurl});
	//var okDialog = dojo.byId("okDialog");
	//This function creates a confirm dialog box which calls a given callback
	//function with a true or false argument when OK or Cancel is pressed.
	function confirmDialog(title, body, callbackFn) {
		var theDialog = new dijit.Dialog({
			id: 'confirmDialog',
			title: title,
			draggable: false,
			onHide: function() {
				theDialog.destroyRecursive();
			}
		});

		var callback = function(mouseEvent) {
			theDialog.hide();
			theDialog.destroyRecursive(false);

			var srcEl = mouseEvent.srcElement ? mouseEvent.srcElement : mouseEvent.target;

			if(srcEl.innerHTML == "OK") callbackFn(true);
			else callbackFn(false);
		};

		var message = dojo.create("p", {
			style: {
				marginTop: "5px"
			},
			innerHTML: body
		});

		var btnsDiv = dojo.create("div", {
			style: {
				textAlign: "center"
			}
		});

		var okBtn = new dijit.form.Button({label: "OK", id: "confirmDialogOKButton", onClick: callback });
		var cancelBtn = new dijit.form.Button({label: "Cancel", id: "confirmDialogCancelButton", onClick: callback });

		theDialog.containerNode.appendChild(message);
		theDialog.containerNode.appendChild(btnsDiv);

		btnsDiv.appendChild(okBtn.domNode);
		btnsDiv.appendChild(cancelBtn.domNode);

		theDialog.show();
	}
	/*
	* The functions below facilitate the workability of the voucher mangement plugin.
	* Coded by Eric Kirima, Eryx Labs. 2015
	* For MicroNet., MUST Project, November, 2015.
	*@contact ekirima(dot)gmail(dot)com
	*/
	//Delete function, confirm and delete
	var deleteVoucher = function(){
	var usrname = voucherGrid.selection.getSelected()[0];
	confirmDialog("Confirm Deletion!","Are you sure you want to delete this Voucher?<BR /> ",function(btn){
			dojo.xhrPost({
			url:"micron/index.php/voucher/delete/"+usrname.username,
			content:{"username":usrname.username},
			handlAs:"json",
			load:function(data){
					//alert("Hi");
					okDialog.set("title","Voucher Deleted Successfully.");
					okDialogMsg.innerHTML = "Voucher for user<b> "+ usrname.username + "</b> deleted successfully.";
					
					voucherGrid.setStore(new dojo.data.ItemFileReadStore({url:voucherStore.url}));
					voucherGrid.selection.clear;
					
					okDialog.show();
			},
			error:function(data){
				//alert("failed");
				okDialog.set("title","Voucher Deleted Failed.");
				okDialogMsg.innerHTML = data;
				okDialog.show();
			}
			});
	});
	//alert("delete");
	};
	//For refreshing purposes
	var listVoucher = function(){
	 //alert("refreshing");
	 var url = voucherStore.url;
	var newStore = new dojo.data.ItemFileReadStore({url:url});
						voucherGrid.setStore(newStore);
						//clear selection
						 voucherGrid.selection.clear;
	};
	//For creating/ generating voucher
	var createVoucher=function(){
	 //alert("refreshing");
		genVoucherDialog.show();
	};
	//Editing voucher
	var editVoucher=function(){
	 //alert("refreshing");
	 var voucher = voucherGrid.selection.getSelected()[0];
	 
	 dojo.byId("username").value = voucher.username;
	 dojo.byId("vbillingplan").value = voucher.billingplan;
	 dojo.byId("vpassword").value = voucher.password;
	 
	 dijit.byId("editVoucherDialog").show();
	};
	//print voucher
	var printVoucher=function(){
	 //alert("refreshing");
	 var usrname = voucherGrid.selection.getSelected()[0];
	 
	 dojo.xhrPost({
					url: "micron/index.php/voucher/print_voucher/"+usrname.username,
					handleAs: "text",
					content: {
						"voucher": usrname.username
					},
					load: function(data) {
							okDialog.set("title","Voucher printed successfully");
							okDialogMsg.innerHTML ="Printing Successful, click the link below to download the voucher in PDF.<BR /><a href='micron/index.php/voucher/print_voucher/"+usrname.username+".html'> Download PDF</a>";
							voucherGrid.setStore(new dojo.data.ItemFileReadStore({url:voucherStore.url}));
							okDialog.show();
					},
					error: function(data) {
						okDialog.set("title","Error printing voucher");
						okDialogMsg.innerHTML = data;
						okDialog.show();
					}
				});
	};
	var saveVoucher = function(){
	   var edits = dojo.byId("adds");
	 //alert("refreshing");
	 	dojo.xhrPost({
				form: edits,
				handleAs: "json",
				load: function(data) {
					if(data.success) {
							okDialog.set("title","voucher edited successfully");
							okDialogMsg.innerHTML = "The voucher was edited successfully.";
						
						var url = voucherStore.url;
						var newStore = new dojo.data.ItemFileReadStore({url:url});
						voucherGrid.setStore(newStore);
						//refreshGrid();
						voucherGrid.selection.clear;
						editVoucherDialog.hide();
						okDialog.show();
					}
					else {
							okDialog.set("title","Error editing Voucher");
							okDialogMsg.innerHTML = data.error;
						    okDialog.show();
					}
				},
				error: function(error) {
					okDialog.set("title","Error editing Voucher");
					okDialogMsg.innerHTML = error;
					okDialog.show();
				}
			});
	};
	var generateVoucher = function(){
	//alert("generating");
	var me = dojo.byId("generates");

		dojo.xhrPost({
				form: me,
				handleAs: "json",
				load: function(data) {
					if(data.success) {
							okDialog.set("title","voucher edited successfully");
							okDialogMsg.innerHTML = "Voucher(s) generated successfully.";
						
						var url = voucherStore.url;
						var newStore = new dojo.data.ItemFileReadStore({url:url});
						voucherGrid.setStore(newStore);
						//refreshGrid();
						voucherGrid.selection.clear;
						genVoucherDialog.hide();
						okDialog.show();
					}
					else {
							okDialog.set("title","Error generating Voucher");
							okDialogMsg.innerHTML = data.error;
						    okDialog.show();
					}
				},
				error: function(error) {
					okDialog.set("title","Error generating Voucher");
					okDialogMsg.innerHTML = error;
					okDialog.show();
				}
			});

	};
	var closeVgen = function(){
	 genVoucherDialog.hide();
	};
	var cancelThisok = function(){
	okDialog.hide();
	};
	var cancelThisedit = function(){
	editVoucherDialog.hide();
	};
	
	var smsVoucher = function(){
			var sms = voucherGrid.selection.getSelected()[0];
	confirmDialog("Enter Mobile number", "This Voucher will be logged on sent messages and set as printed!", function(btn){
		if(btn){
		 //launchSms(sms);
		 alert("hi");
		}else{
		 okDialog.set("title","SMS Loader");
		 okDialogMsg.innerHTML = "SMS message sending aborted.";
		}
	});
	};
	
	/* POSTPAID ACCOUNTS PLUGIN
	* The section below deals with Postpaid accounts plugin.
	* 
	*
	*/
	
	var refreshPost = function(){
	    //alert("postpaid refresh");
		 var url = postpaidStore.url;
	      var newStore = new dojo.data.ItemFileReadStore({url:url});
						postpaidGrid.selection.clear;
						postpaidGrid.setStore(newStore);
	};
	var createPostpaid = function(){
	//alert("create");
	dijit.byId("addPostpaidDialog").show();
	};
	var editPostpaid = function(){
	//alert("edit postpaid");
	 var postpaid = postpaidGrid.selection.getSelected()[0];
		dojo.byId("fullname").value = postpaid.realname;
		dojo.byId("postuser").value  = postpaid.username;
		dojo.byId("postpass").value = postpaid.password;
		dojo.byId("postbillby").value = postpaid.bill_by;
		dojo.byId("postmobile").value = postpaid.smsmobile;
		dijit.byId("editPostpaidDialog").show();
	};
	var savePostpaid = function(){
			var mead = dojo.byId("editpostpaid");
			dojo.xhrPost({
						form:mead,
						handleAs:"json",
						load: function(data){
							if(data.success){
								okDialog.set("title", "Account Updated");
								okDialogMsg.innerHTML = "Account Successfully Updated ";
								 var url = postpaidStore.url;
									var newStore = new dojo.data.ItemFileReadStore({url:url});
									postpaidGrid.selection.clear;
									postpaidGrid.setStore(newStore);
								
								editPostpaidDialog.hide();
								okDialog.show();
							}else{
								okDialog.set("title", "Update Failed");
								okDialogMsg.innerHTML = data.error;
								okDialog.show();
							}
						},
						error: function(data){
								okDialog.set("title", "An Error Occurred.");
								okDialogMsg.innerHTML = data;
								okDialog.show();
						}
			});
	};
	
	var printPostpaid = function(){
			//alert("printing");
			var postacc = postpaidGrid.selection.getSelected()[0];
			printPostpaidbill(postacc.username);
	};
	
	var printPvoucher = function(){
	        alert("Hello");
			var postacc = postpaidGrid.selection.getSelected()[0];
			printPostpaidbill(postacc.username);
	};
	
	var remPostpaid = function(){
	//alert("deleting");
			confirmDialog("Delete Account", "Are you sure you want to delete this postpaid account? If otherwise, close this window using (x)", function(btn){
			
			var postacc = postpaidGrid.selection.getSelected()[0];
			dojo.xhrPost({
								url: "micron/index.php/postpaid/delete/"+postacc.username+".html",
								handleAs:"json",
								load: function(data){
									if(data.success){
										okDialog.set("title", "Account Deletion");
										okDialogMsg.innerHTML = "Account Successfully Deleted. ";
										 var url = postpaidStore.url;
											var newStore = new dojo.data.ItemFileReadStore({url:url});
											postpaidGrid.selection.clear;
											postpaidGrid.setStore(newStore);
										
										addPostpaidDialog.hide();
										okDialog.show();
									}else{
										okDialog.set("title", "Deletion Failed");
										okDialogMsg.innerHTML = data.error;
										okDialog.show();
									}
								},
								error: function(data){
										okDialog.set("title", "An Error Occurred.");
										okDialogMsg.innerHTML = data;
										okDialog.show();
								}
					});
					
					});
	
	};
	
	var viewPostpaid = function(){
	//alert("viewing");
			var postacc = postpaidGrid.selection.getSelected()[0];
				var addtab = new dijit.layout.ContentPane({id:postacc.username,title:postacc.realname,href:'micron/index.php/postpaid/bill/'+postacc.username+'.html',closable:true});
			   dijit.byId("tabsPanel").addChild(addtab);
			   dijit.byId("tabsPanel").selectChild(addtab);
	};
	var processnewPostpaid = function(){
				var fpost = dojo.byId("createspostpaid");
						dojo.xhrPost({
									form:fpost,
									handleAs:"json",
									load: function(data){
										if(data.success){
											okDialog.set("title", "Account Added");
											okDialogMsg.innerHTML = "Account Successfully Created. ";
											 var url = postpaidStore.url;
												var newStore = new dojo.data.ItemFileReadStore({url:url});
												postpaidGrid.selection.clear;
												postpaidGrid.setStore(newStore);
											
											addPostpaidDialog.hide();
											okDialog.show();
										}else{
											okDialog.set("title", "Failed");
											okDialogMsg.innerHTML = data.error;
											okDialog.show();
										}
									},
									error: function(data){
											okDialog.set("title", "An Error Occurred.");
											okDialogMsg.innerHTML = data;
											okDialog.show();
									}
						});
	};
	
	var cancelPostpaid = function(){
		dijit.byId("addPostpaidDialog").hide();
	};
	
	var cancelPostpaidedit = function(){
		dijit.byId("editPostpaidDialog").hide();
	};
	
	function printPostpaidbill(data){
				dojo.xhrPost({
								url: "micron/index.php/invoice/create/"+data,
								handleAs: "text",
								content: {
									"invoice": data
								},
								load: function(datar) {
										okDialog.set("title","Invoice printed successfully");
										okDialogMsg.innerHTML ="Printing Successful, click the link below to download the invoice in PDF.<BR /><a href='micron/index.php/invoice/create/"+data+"' onClick='cancelThisok'> <button type='dijit.form.Button'>Download PDF</button></a>";
										postpaidGrid.setStore(new dojo.data.ItemFileReadStore({url:postpaidStore.url}));
										okDialog.show();
								},
								error: function(datar) {
									okDialog.set("title","Error printing Invoice");
									okDialogMsg.innerHTML = datar;
									okDialog.show();
								}
							});
	}
		function printPostpaidvoucher(data){
		        dojo.xhrPost({
						url: "micron/index.php/postpaid/print_voucher/"+data,
						handleAs: "text",
						content: {
							"invoice": data
						},
						load: function(datar) {
								okDialog.set("title","Voucher Generated");
								okDialogMsg.innerHTML =" Generated Successfully, click the link below to download the voucher in PDF.<BR /><a href='micron/index.php/postpaid/print_voucher/"+data+"' onClick='cancelThisok'> <button type='dijit.form.Button'>Download PDF</button></a>";
								postpaidGrid.setStore(new dojo.data.ItemFileReadStore({url:postpaidStore.url}));
								okDialog.show();
						},
						error: function(datar) {
							okDialog.set("title","Error generating Voucher");
							okDialogMsg.innerHTML = datar;
							okDialog.show();
						}
					});
	}
	/* MICRONET , Eryx Labs Project
	 * Users online function
	 *
	 */
	 
	var listOnline = function(){
		//alert("hello buddy");
		var newlist = new dojo.data.ItemFileReadStore({url:onlineStore.url});
		onlineGrid.setStore(newlist);
		onlineGrid.selection.clear;
	};
	var smsOnline = function(){
		//alert("hello sms");
		//TODO, send sms to selected clientInformation
		alert("plugin disabled");
	};
	var disconnectUser = function(){
		//alert("Disconnecting");
		var client = onlineGrid.selection.getSelected()[0];
			dojo.xhrPost({
				url:"/easyhotspot/index.php/onlineuser/disconnect/"+client.username,
				content:{ 'username':client.username},
				handleAs:"text",
				load: function(data){
					//if(data.success){
							okDialog.set("title", "Client Disconnected");
							okDialogMsg.innerHTML = "Client "+client.username+" disconnected.";
							//var knockOut = listOnline;
							okDialog.show();
							
					/*}else{
							okDialog.set("title", "Disconnect Failed");
							okDialogMsg.innerHTML = data.error + "Client <"+client.username+"> disconnect Failed.";
							okDialog.show();
					} 
*/
				},
				error: function(data){
						okDialog.set("title", "Error during disconnect");
						okDialogMsg.innerHTML = data+"Client "+client.username+" not disconnected.";
						okDialog.show();
				}
		});
	};	
	
	/*
	 * BOOTSTRAPPER HELPER
	 * AAA - FREAK_AUTH_EXTENDER_USER
	 */
	 
	var mnuLogin = function(){
	   loginDialog.show();
	};
	var mnuLogout = function(){
	alert("session terminated");
	};
	var loginProcess = function(){
		var loginMsg = dojo.byId("loginMsg");
		var login = dojo.byId("cashierauth");
		dojo.xhrPost({
					form:login,
					handleAs:"json",
					load: function(data){
						if(data.success){
							loginDialog.set("title", "Login Success");
							loginMsg.innerHTML = "Authentication Successful. ";
							loggedIn();
						}else{
							loginDialog.set("title", "Login Failed");
							loginMsg.innerHTML = data.error;
						} 
					},
					error: function(data){
							loginDialog.set("title", "An Error Occurred.");
							loginMsg.innerHTML = data;
							
					}
		});
	};
	
	function loggedIn()
	{
	  var main = dojo.byId("mainSection");
	  dojo.style(main,"display","");
	  loginDialog.hide();
	}
	 function isLoggedin(){

		dojo.xhrPost({
		url:"micron/index.php/home/microns",
		handleAs:"json",
		load: function(data){
				if(data.success)
				{
					loggedIn();
					
				}else{
					loggedOff();
					loginDialog.set("title", "Please Login to Continue !!!");
					loginMsg.innerHTML = data.error;
					loginDialog.show();
				}
		},
		error: function(data){
			loggedOff();
			loginDialog.set("title","Login Detection failed");
			loginMsg.innerHTML = data;
			loginDialog.show();
		}
		});
		
	  };
	  
	  function loggedOff(){
			var main = dojo.byId("mainSection");
			dojo.style(main,"display","none");
	  }
	  function signOut(){
	    dojo.xhrPost({
					url:"micron/index.php/auth/logout",
					handleAs:"text",
					load: function(data){
							loginDialog.set("title", "Logged Off Now");
							loginMsg.innerHTML = "Signout Successful. ";
							loggedOff();
							loginDialog.show(); 
					},
					error: function(data){
							loginDialog.set("title", "An Error Occurred.");
							loginMsg.innerHTML = data;
							loggedOff();
							loginDialog.show();
					}
		});
	  
	  }
	  
	  /* 
	  
		BILLING PLANS SECTOR, ADD, DELETE, UPDATE
	  */
	  var createPlan = function(){
		//alert("hi");
		billPlanDialog.show();
	  };
	  var refreshPlan = function(){
		var stores  = new dojo.data.ItemFileReadStore({url:billingplanStore.url});
		billingplanGrid.setStore(stores);
		billingplan.selection.clear;
	  };
	  var editPlan = function(){
	  alert("Plugin Disabled.");
	  };
	  var billingwinx = function(){
			billPlanDialog.hide();
	  };
	  var deletePlan = function(){
		//alert("hi");
		var plan = billingplanGrid.selection.getSelected()[0];
		dojo.xhrPost({
		url:"micron/index.php/admin/billingplan/delete/"+plan.id+"/"+plan.name,
		handleAs:"json",
		load: function(data){
				if(data.success)
				{
					okDialog.set("title", "Billing Plan");
					okDialogMsg.innerHTML = "Billing Plan Deleted Successfully.";
					var stores  = new dojo.data.ItemFileReadStore({url:billingplanStore.url});
						billingplanGrid.setStore(stores);
						billingplan.selection.clear;
					billPlanDialog.hide();
					okDialog.show();
				}else{
					okDialog.set("title", "Error Deleting");
					okDialogMsg.innerHTML = data.error;
					okDialog.show();
				}
		},
		error: function(data){
			okDialog.set("title","Error Occurred!");
			okDialogMsg.innerHTML = data;
			okDialog.show();
		}
		});
	  };
	  var savethisPlan = function(){
		var me = dojo.byId("abillingplan");
		dojo.xhrPost({
		form:me,
		handleAs:"json",
		load: function(data){
				if(data.success)
				{
					okDialog.set("title", "Billing Plan");
					okDialogMsg.innerHTML = "Billing Plan Added Successfully.";
					
					var stores  = new dojo.data.ItemFileReadStore({url:billingplanStore.url});
						billingplanGrid.setStore(stores);
						billingplanGrid.selection.clear;

					billPlanDialog.hide();
					okDialog.show();
				}else{
					okDialog.set("title", "Error Processing");
					okDialogMsg.innerHTML = data.error;
					okDialog.show();
				}
		},
		error: function(data){
			okDialog.set("title","Error failed!");
			okDialogMsg.innerHTML = data;
			okDialog.show();
		}
		});
	  };
		
	/*
	 # Invoice helper methods below, 
	 # Eric Fri. 5th Nov. 2015;
	 #
	 */
	 
	 var refreshInvoice = function(){
		var invoice = dojo.data.ItemFileReadStore({url:invoiceStore.url});
		invoiceGrid.setStore(invoice);
		invoiceGrid.selection.clear;
	 };
	 var deleteInvoice = function(){
	   var inv = invoiceGrid.selection.getSelected()[0];
		dojo.xhrPost({
		url:"micron/index.php/invoice/delete/"+inv.username,
		handleAs:"json",
		load: function(data){
				if(data.success)
				{
					okDialog.set("title", "Invoice Manager");
					okDialogMsg.innerHTML = "Invoice deleted successfully.";
					
					var stores  = new dojo.data.ItemFileReadStore({url:invoiceStore.url});
						invoiceGrid.setStore(stores);
						invoiceGrid.selection.clear;

					okDialog.show();
				}else{
					okDialog.set("title", "Error Deleting");
					okDialogMsg.innerHTML = data.error;
					okDialog.show();
				}
		},
		error: function(data){
			okDialog.set("title","Error failed!");
			okDialogMsg.innerHTML = data;
			okDialog.show();
		}
		});
	 };
	 var smsInvoice = function(){
		alert("Plugin disabled");
	 };
	 var viewInvoice = function(){
		var inv = invoiceGrid.selection.getSelected()[0];
		var invurl = "micron/index.php/invoice/detail/"+inv.username;
		var tabpane = new dijit.layout.ContentPane({id:inv.username, title:inv.username, href:invurl, closable: true});
		 dijit.byId("tabsPanel").addChild(tabpane);
		 dijit.byId("tabsPanel").selectChild(tabpane);
	 };
	 var emailInvoice = function(){
		alert("Plugin disabled");
	 };
	 
	 /*
	  * SEARCH SYSTEM FUCNTIONS
	  *
	  */
	var searchPostpay = function(){
	 //alert("Search Records");
	 var srcpost = dojo.byId("searchacc");
	 dojo.xhrPost({
		form:srcpost,
		handleAs:"json",
		load: function(data){
			if(data){
				//okDialogMsg.set("title","Search Results");
				//alert("Search Records");
				var resurl = "micron/index.php/postpaid/search";
				var grishd = new dojo.data.ItemFileReadStore({url:resurl});
				postpaidGrid.setStore(grishd);
				postpaidGrid.selection.clear;
				
			//}else{
				postpaySearch.hide();
			}
		},
		error: function(data){
			okDialogMsg.set("title","Search Results");
			okDialog.innerHTML = data;
		}
	 });
	};
	var searchPost = function(){
		postpaySearch.show();
	};
	/* 
	 * Search voucher System
	 */
	var searchVoucher = function(){
	 //alert("Search Records");
	 var srcpost = dojo.byId("searchvoucher");
	 dojo.xhrPost({
		form:srcpost,
		handleAs:"json",
		load: function(data){
			if(data){
				//okDialogMsg.set("title","Search Results");
				//alert("Search Records");
				var resurl = "micron/index.php/voucher/search";
				var grishd = new dojo.data.ItemFileReadStore({url:resurl});
				voucherGrid.setStore(grishd);
				voucherGrid.selection.clear;
				
			//}else{
				voucherSearch.hide();
			}
		},
		error: function(data){
			okDialogMsg.set("title","Search Results");
			okDialog.innerHTML = data;
		}
	 });
	};
	var searchVou = function(){
		voucherSearch.show();
	};
	/* 
	# MPESA VOUCHERS FUNCTIONS BELOW
	# ERIC FOR MUST
	# 2015
	*/
	
	var listMpesa = function(){
	    var lists = new dojo.data.ItemFileReadStore({url:mpesaStore.url});
		mpesaGrid.setStore(lists);
		mpesaGrid.selection.clear;
	};
	var deleteMpesa = function(){
	
	   var client = mpesaGrid.selection.getSelected()[0];
	   //alert("Are you sure you want to delete this account for: " +client.client_username);
		dojo.xhrPost({
		url:"micron/index.php/mpesa/delete/"+client.client_username,
		handleAs:"json",
		load: function(data){
			if(data.success){
				okDialog.set("title","Delete Account");
				okDialogMsg.innerHTML = "Account for "+client.client_name +" deleted Successfully";
				
				 var lists = new dojo.data.ItemFileReadStore({url:mpesaStore.url});
					mpesaGrid.setStore(lists);
					mpesaGrid.selection.clear;
				
				okDialog.show();
			}else{
				okDialog.set("title","Delete Account Failed");
				okDialogMsg.innerHTML = data.error;
				
				okDialog.show();
			}
		},
		error: function(data){
			okDialog.set("title","Delete Account");
			okDialogMsg.innerHTML = data;
			
			okDialog.show();
			
		}
	 });
	};
	var searchMpesa = function(){
		var srcpost = dojo.byId("msearch");
	 dojo.xhrPost({
		form:srcpost,
		handleAs:"json",
		load: function(data){
			if(data){
				//okDialogMsg.set("title","Search Results");
				//alert("Search Records");
				var resurl = "micron/index.php/mpesa/clients/"+data.url;
				alert(data.url);
				var grishd = new dojo.data.ItemFileReadStore({url:resurl});
				mpesaGrid.setStore(grishd);
				mpesaGrid.selection.clear;
				
			//}else{
				mpesaSearch.hide();
			}
		},
		error: function(data){
			okDialogMsg.set("title","Search Results");
			okDialog.innerHTML = data;
		}
	 });
	};
	var ssearchMpesa = function(){
		mpesaSearch.show();
	};
	
	
	
	
	
	
	
	
