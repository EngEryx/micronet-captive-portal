<?php if (!defined('BASEPATH')) exit('No direct script access allowed'); ?>
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
    <h3 class="box-title">PostPaid : <?=$action?></h3>
    <div class="box-tools pull-right">
      <!-- Buttons, labels, and many other things can be placed here! -->
      <!-- Here is a label for example -->
      <span class="label label-primary">About Us</span>
    </div><!-- /.box-tools -->
  </div><!-- /.box-header -->
  <div class="box-body">
			<!-- DROP PAGES HERE -->

              <div class="box">
                <div class="box-header">
                  <h3 class="box-title">PostPaid Accounts Edit</h3>
                  <div class="box-tools">
				 <?=form_open('postpaid/search')?>
                    <div class="input-group" style="width: 150px;">
                      <input type="text" name="search" class="form-control input-sm pull-right" placeholder="Search" />
                      <div class="input-group-btn">
                        <input type="submit" value="GO" class="btn btn-sm btn-default fa fa-search" />
                      </div>
					  <?=form_close()?>
                    </div>
                  </div>
                </div><!-- /.box-header -->
                <?=$this->easyhotspot_validation->error_string;?>
				<?php 
					$data=$account->row(); //fetching user information
					echo "BILL BY ".$data->bill_by." DOWNLOAD ".$data->bw_download." END";
				?>
				
				<?=form_open('postpaid/edit')?>
                    <div class="form-group">
                      <label for="inputEmail3" class="col-sm-2 control-label">Full Name</label>
                      <div class="col-sm-10">
					  <?=form_input('realname',$data->realname,'disabled')?>
                        </div>
                    </div>
                    <div class="form-group">
                      <label for="inputPassword3" class="col-sm-2 control-label">Username</label>
                      <div class="col-sm-10">
					<?=form_input('username', $data->username, '')?>
                          </div>
                    </div>
					 <div class="form-group">
                      <label for="inputPassword3" class="col-sm-2 control-label">Password</label>
                      <div class="col-sm-10">
					  <?=form_input('password',$data->password)?>
                          </div>
                    </div>
					
					 <div class="form-group">
                      <label for="inputPassword3" class="col-sm-2 control-label">Bill By</label>
                      <div class="col-sm-10">
                        <?php $options=array('time'=>'Time','packet'=>'Packet');?>
							<?=form_dropdown('bill_by',$options,$data->bill_by)?>
                      </div>
					  </div>
					  <?=form_hidden('username',$data->username)?>
					<input type="submit" value="Edit Account" />
					<?=form_close()?>
   </div><!-- /.box-body -->
              </div><!-- /.box -->

				  
                
	  <div class="box-footer">
		
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

