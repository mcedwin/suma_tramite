<div class="mainbox col-md-6 col-md-offset-3 col-sm-8 col-sm-offset-2" style="margin-top:50px;" id="loginbox">                    
	<div class="panel panel-default">
		<div class="panel-heading">
			<div class="panel-title text-center">Acceso a Sistema</div>
		</div>     
		<div class="panel-body login">
			<?php if(isset($_GET["error"])):  ?>
			<div class="alert alert-danger error" role="alert">
				<span class="glyphicon glyphicon-exclamation-sign" aria-hidden="true"></span>
				Error: <?php echo $_GET["error"]; ?>
			</div>
			<?php endif ?>
			<form  class="form-horizontal" id="loginform" method="post" action="<?php echo base_url() ?>login/evaluate">
				<div class="input-group" style="margin-bottom: 15px">
					<span class="input-group-addon"><i class="glyphicon glyphicon-user"></i></span>
					<input type="text" placeholder="Usuario" value="" name="usuario" class="form-control" id="login-usuario">                                        
				</div>
				<div class="input-group">
					<span class="input-group-addon"><i class="glyphicon glyphicon-lock"></i></span>
					<input type="password" placeholder="Password" name="password" class="form-control" id="login-password">
				</div>
				<?php 
				if(isset($_COOKIE["captcha_count"])): 
						if($_COOKIE["captcha_count"]>3):
				?>
				<div class="input-group">
					<?php echo $cap['image']; ?>
				</div>
				<div class="input-group">
					<span class="input-group-addon"><i class="glyphicon glyphicon-lock"></i></span>
					<input type="text" placeholder="captcha" name="captcha" class="form-control" id="login-captcha">
				</div>
				<?php 
					endif;
				endif;
				 ?>
				<div class="form-group" style="margin-top:10px;margin-bottom: 0;">
					<div class="col-sm-12 controls">
						<input type="submit" class="btn btn-primary" href="#" id="btn-fblogin" value="Acceder al sistema">
					</div>
				</div>
				<hr>
					<div class="text-center"><a href="<?php echo base_url('Consultar'); ?>">Consultar documentos</a></div>
			</form>
		</div>                     
	</div>  
</div>