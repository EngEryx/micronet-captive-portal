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
            <li><a href="#"><i class="fa fa-dashboard"></i> Voucher</a></li>
            <li class="active">Dashboard</li>
          </ol>
        </section>

        <!-- Main content -->
        <section class="content">

          <!-- Your Page Content Here -->
		  <div class="info-box">
           <div class="box">
  <div class="box-header with-border">
    <h3 class="box-title">Voucher Accounts System : <?=$action?></h3>
    <div class="box-tools pull-right">
      <!-- Buttons, labels, and many other things can be placed here! -->
      <!-- Here is a label for example -->
      <span class="label label-primary">Vouchers</span>
    </div><!-- /.box-tools -->
  </div><!-- /.box-header -->
  <div class="box-body">
			<!-- DROP PAGES HERE -->

              <div class="box">
                <div class="box-header">
                  <h3 class="box-title">Voucher Accounts Table</h3>
                  <div class="box-tools">
				 <?=form_open('voucher/search')?>
                    <div class="input-group" style="width: 150px;">
                      <input type="text" name="search" class="form-control input-sm pull-right" placeholder="Search" />
                      <div class="input-group-btn">
                        <input type="submit" value="GO" class="btn btn-sm btn-default fa fa-search" />
                      </div>
					  <?=form_close()?>
                    </div>
                  </div>
                </div><!-- /.box-header -->
                <div class="box-body table-responsive no-padding">
              <?=$this->validation->error_string;?>

<?php 
	$data=$account->row(); //fetching user information
?>

<?=form_open('voucher/edit')?>
<ul>
	<li>
		<label><?=$this->lang->line('username')?></label>
		<?=$data->username?>
	</li>	
	<li>
		<label><?=$this->lang->line('password')?></label>
		<?=form_input('password',$data->password)?>
	</li>
	<li>
		<label><?=$this->lang->line('billing_plan')?></label>
		<select name="billingplan">
		<?php foreach($billingplans->result_array() as $option):?>
		<option value="<?=$option['name']?>"><?=$option['name']?></option>
		<?php endforeach;?>
		</select>
	</li>
</ul>
<?=form_hidden('username',$data->username)?>
<input type="submit" value="Edit Account" class="submit"  />
<?=form_close()?>  
	</div>
   </div><!-- /.box-body -->
              </div><!-- /.box -->
	 </div><!-- /.box-body -->
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



