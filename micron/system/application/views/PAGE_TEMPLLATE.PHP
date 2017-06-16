<?php $this->load->view('header')?>
   <!-- Content Wrapper. Contains page content -->
      <div class="content-wrapper">
        <!-- Content Header (Page header) -->
        <section class="content-header">
          <h1>
            Dashboard
            <small>Network Management System</small>
          </h1>
          <ol class="breadcrumb">
            <li><a href="#"><i class="fa fa-dashboard"></i> Cashier</a></li>
            <li class="active">Dashboard</li>
          </ol>
        </section>

        <!-- Main content -->
        <section class="content">

          <!-- Your Page Content Here -->
		  <div class="info-box">
           <div class="box">
  <div class="box-header with-border">
    <h3 class="box-title"><?=$h1?></h3>
    <div class="box-tools pull-right">
      <!-- Buttons, labels, and many other things can be placed here! -->
      <!-- Here is a label for example -->
      <span class="label label-primary">About Us</span>
    </div><!-- /.box-tools -->
  </div><!-- /.box-header -->
  <div class="box-body">
			<!-- DROP PAGES HERE -->
	 </div><!-- /.box-body -->
	  <div class="box-footer">
		<p><?=$this->lang->line('you_logged_in_as')?> <?=$user?></p>
	  </div><!-- box-footer -->
	</div><!-- /.box -->
        </section><!-- /.content -->
		
		<!-- position of sidebar -->
      </div><!-- /.content-wrapper -->

      <!-- Main Footer -->
      <footer class="main-footer">
        <!-- To the right -->
        <div class="pull-right hidden-xs">
          Eryx Labs Network Management System
        </div>
        <!-- Default to the left -->
        <strong>Copyright &copy; 2015 <a href="#">Eryx Labs</a>.</strong> All rights reserved.
      </footer>
 </div><!-- ./wrapper -->

    <!-- REQUIRED JS SCRIPTS -->

    <!-- jQuery 2.1.4 -->
    <script src="/easyhotspot/plugins/jQuery/jQuery-2.1.4.min.js" type="text/javascript"></script>
    <!-- Bootstrap 3.3.2 JS -->
    <script src="/easyhotspot/bootstrap/js/bootstrap.min.js" type="text/javascript"></script>
    <!-- AdminLTE App -->
    <script src="/easyhotspot/js/app.min.js" type="text/javascript"></script>

    <!-- Optionally, you can add Slimscroll and FastClick plugins.
          Both of these plugins are recommended to enhance the
          user experience. Slimscroll is required when using the
          fixed layout. -->
  </body>
</html>
