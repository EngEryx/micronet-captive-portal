 <!-- Left side column. contains the logo and sidebar -->
      <aside class="main-sidebar">

        <!-- sidebar: style can be found in sidebar.less -->
        <section class="sidebar">

          <!-- Sidebar user panel (optional) -->
          <div class="user-panel">
            <div class="pull-left image">
              <img src="/easyhotspot/img/user2-160x160.jpg" class="img-circle" alt="User Image" />
            </div>
            <div class="pull-left info">
              <p>Eng Eryx</p>
              <!-- Status -->
              <a href="#"><i class="fa fa-circle text-success"></i> Online</a>
            </div>
          </div>

          <!-- search form (Optional) -->
          <form action="#" method="get" class="sidebar-form">
            <div class="input-group">
              <input type="text" name="q" class="form-control" placeholder="Search..." />
              <span class="input-group-btn">
                <button type="submit" name="search" id="search-btn" class="btn btn-flat"><i class="fa fa-search"></i></button>
              </span>
            </div>
          </form>
          <!-- /.search form -->

          <!-- Sidebar Menu -->
		   <ul class="sidebar-menu">
                <li class="active">
				
                    <a href="home.html">
                        <i class="fa fa-dashboardj"></i> <span>Dashboard Tools</span>
                    </a>
				</li>
					<!-- ?=anchor('home','<i class="fa fa-dashboard"></i> <span> Dashboard </span></a>','class="home"')?>
                </li>
                <li>
                    <a href="postpaid">
                        <i class="glyphicon glyphicon-book"></i> <span>PostPaid Accounts</span>
                    </a>
                </li>
                <!--li class="active">
                    <a href="prepaid">
                        <i class="glyphicon glyphicon-user"></i> <span>Prepaid Accounts</span>
                    </a>
                </li>
                <li class="active">
                    <a href="voucher">
                        <i class="glyphicon glyphicon-hd-video"></i> <span>Voucher System</span>
                    </a>
                </li>
				<li class="active">
                    <a href="onlineuser">
                        <i class="ion ion-document-text"></i> <span>Billing Plans</span>
                    </a>
                </li>
                <li class="active">
                    <a href="invoice">
                        <i class="fa fa-instagram"></i> <span>Invoice Management</span>
                    </a>
                </li>
				 <li class="active">
                    <a href="statistic">
                        <i class="ion ion-document-text"></i> <span>Statistics</span>
                    </a>
                </li>
				<li class="active">
                    <a href="changepassword">
                        <i class="ion ion-document-text"></i> <span>Configurations</span>
                    </a>
                </li   -->
				<li class="home"><?=anchor('home','&nbsp;&nbsp;&nbsp; Home','class="fa fa-home"')?></li>
			<li class="account"><?=anchor('postpaid','&nbsp;&nbsp;&nbsp; Postpaid Acc\'s Management','class="fa fa-dashboard"')?></li>
			<li class="voucher"><?=anchor('voucher','&nbsp;&nbsp;&nbsp; Voucher Management','class="fa fa-files-o"')?></li>
			<li class="invoice"><?=anchor('invoice','&nbsp;&nbsp;&nbsp; Invoice Management','class="ion ion-document-text"')?></li>
			<li class="statistic"><?=anchor('statistic','&nbsp;&nbsp;&nbsp; Statistics','class="fa fa-table"')?></li>
			<li class="onlineuser"><?=anchor('onlineuser','&nbsp;&nbsp;&nbsp; Online Users','class="fa fa-laptop"')?></li>
			<li class="changepassword"><?=anchor('auth/changepassword','&nbsp;&nbsp;&nbsp; Change Password','class="fa fa-edit"')?></li>
			<li class="logout"><?=anchor('auth/logout','&nbsp;&nbsp;&nbsp; Logout','class="fa fa-share"')?></li>
            </ul>
		  <!-- /.sidebar-menu -->
        </section>
        <!-- /.sidebar -->
      </aside>