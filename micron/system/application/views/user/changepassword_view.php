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
            <li><a href="#"><i class="fa fa-dashboard"></i> Configurations</a></li>
            <li class="active">Change Password</li>
          </ol>
        </section>

        <!-- Main content -->
        <section class="content">

          <!-- Your Page Content Here -->
		  <div class="info-box">
           <div class="box">
  <div class="box-header with-border">
    <h3 class="box-title">Configurations: <?=$h1?></h3>
    <div class="box-tools pull-right">
      <!-- Buttons, labels, and many other things can be placed here! -->
      <!-- Here is a label for example -->
      <span class="label label-primary">Passwords(s)</span>
    </div><!-- /.box-tools -->
  </div><!-- /.box-header -->
  <div class="box-body">
			<!-- DROP PAGES HERE -->

              <div class="box">
                <div class="box-header">
                  <h3 class="box-title">Passwords Selected</h3>
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
             <div id="changePassword">
<fieldset>
<legend><?=$heading?></legend>
<?=form_open($this->uri->uri_string(), array('id' => 'change_password_form'))?>
      <p><label for="user_name"><?=$this->lang->line('FAL_user_name_label');?>:</label>

      <?=form_input(array('name'=>'user_name', 
	                       'id'=>'user_name',
	                       'maxlength'=>'30', 
	                       'size'=>'30',
	                       'value'=>(isset($this->fal_validation) ? $this->fal_validation->{'user_name'} : '')))?>
     <?=(isset($this->fal_validation) ? $this->fal_validation->{'user_name'.'_error'} : '')?>
	</p>

      <p><label for="password"><?=$this->lang->line('FAL_old_password_label');?>:</label>
      <?=form_password(array('name'=>'old_password', 
	                       'id'=>'old_password',
	                       'maxlength'=>'16', 
	                       'size'=>'16',
	                       'value'=>''))?>
    	<?=(isset($this->fal_validation) ? $this->fal_validation->{'old_password'.'_error'} : '')?>
      </p>
    <p><label for="new_password"><?=$this->lang->line('FAL_new_password_label');?>:</label>
    <?=form_password(array('name'=>'password', 
	                       'id'=>'password',
	                       'maxlength'=>'16', 
	                       'size'=>'16',
	                       'value'=>''))?>
    	<?=(isset($this->fal_validation) ? $this->fal_validation->{'password'.'_error'} : '')?>
    </p>
      <p><label for="password_confirm"><?=$this->lang->line('FAL_retype_new_password_label');?>:</label>
      <?=form_password(array('name'=>'password_confirm', 
	                       'id'=>'password_confirm',
	                       'maxlength'=>'16', 
	                       'size'=>'16',
	                       'value'=>''))?>
    <?=(isset($this->fal_validation) ? $this->fal_validation->{'password_confirm'.'_error'} : '')?>
      </p>
	    	<input type="submit" name="Submit" value="<?=$this->lang->line('FAL_submit')?>" class="submit"/>
	        <input type="reset" name="Reset" value="<?=$this->lang->line('FAL_reset')?>" class="submit"/>
</form>
</fieldset>
</div><!--END CHANGEPASSWORD DIV-->
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