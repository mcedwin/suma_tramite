<div id="page-wrapper">
	<div class="page-header col-md-12">
		<div class="row page-header-title">
			<div class="col-sm-12">
				<h3>Datos de su empresa</h3>
			</div>
		</div>
	</div>
	<div class="page-content">
		<div class="col-md-10 col-md-offset-1">
		<form class="form-horizontal" action="" method="post" id="empresa_form" enctype="multipart/form-data">
				<div class="alert alert-danger error hidden" role="alert">
					<span class="glyphicon glyphicon-exclamation-sign" aria-hidden="true"></span>
					<span class="sr-only">Error:</span>
				</div>
				<?php
				// var_dump($empresa);
				echo form_hidden('empresa',$empresa->conf_id);
				?>
					<br>
					<div class="form-group">
						<?=form_label('<strong>Nombre:</strong>', 'nombre',array('class' => 'col-sm-1 text_right')); ?>
						<div class="col-sm-4"><?=form_input(array("name"=>"nombre","value"=>$empresa->conf_nombres,"class"=>"form-control"));?></div>
						<?=form_label('<strong>Siglas:</strong>', 'siglas',array('class' => 'col-sm-1 text_right')); ?>
						<div class="col-sm-1"><?=form_input(array("name"=>"siglas","value"=>$empresa->conf_siglas,"class"=>"form-control"));?></div>
						<?=form_label('<strong>Ruc:</strong>', 'ruc',array('class' => 'col-sm-1 text_right')); ?>
						<div class="col-sm-4"><?=form_input(array("name"=>"ruc","value"=>$empresa->conf_ruc,"class"=>"form-control"));?></div>
					</div>
					<div class="form-group">
						<?=form_label('<strong>E-mail:</strong>', 'email',array('class' => 'col-sm-1 text_right')); ?>
						<div class="col-sm-3"><?=form_input(array("name"=>"email","value"=>$empresa->conf_email,"class"=>"form-control"));?></div>
						<?=form_label('<strong>Telefono:</strong>', 'telefono',array('class' => 'col-sm-1 text_right')); ?>
						<div class="col-sm-3"><?=form_input(array("name"=>"telefono","value"=>$empresa->conf_telefono,"class"=>"form-control"));?></div>
						<?=form_label('<strong>Direccion:</strong>', 'direccion',array('class' => 'col-sm-1 text_right')); ?>
						<div class="col-sm-3"><?=form_input(array("name"=>"direccion","value"=>$empresa->conf_direccion,"class"=>"form-control"));?></div>
					</div>
					<div class="form-group">
						<?=form_label('<strong>Periodo:</strong>', 'periodo',array('class' => 'col-sm-1 text_right')); ?>
						<div class="col-sm-2"><?=form_input(array("name"=>"periodo","value"=>$empresa->conf_periodo,"class"=>"form-control"));?></div>
					</div>
					<hr>
					<div class="form-group">
						<?=form_label('<strong>Enviar E-mails:</strong>', 'enviar',array('class' => 'col-sm-3 text_right')); ?>
						<?php
							$checked = FALSE;
							if($empresa->conf_enviaremail=="SI"):
								$checked = TRUE;
							endif;
						  ?>
						<div class="col-sm-2"><?php  echo form_checkbox(array('name'=> 'enviar','id'=> 'env_e-mail','value'=> 'SI','checked'=> $checked));?></div>
					</div>
					<hr>
					<div class="form-group email-form">
						<?=form_label('<strong>Editar datos de configuracion email:</strong>', 'active',array('class' => 'col-sm-3 text_right')); ?>
						<?php
							$checked1 = FALSE;
							if($empresa->conf_smtp=="SI"):
								$checked1 = TRUE;
							endif;
						  ?>
						<div class="col-sm-2"><?php  echo form_checkbox(array('name'=> 'active','id'=> 'act_e-mail','value'=> 'SI','checked'=> $checked1));?></div>
					</div>
					
					<div class="form-group email-form">
						<?=form_label('<strong>Host:</strong>', 'host',array('class' => 'col-sm-1 text_right')); ?>
						<div class="col-sm-2"><?=form_input(array("name"=>"host","value"=>$empresa->conf_email_host,"class"=>"form-control e-mail"));?></div>
						<?=form_label('<strong>User:</strong>', 'user',array('class' => 'col-sm-1 text_right')); ?>
						<div class="col-sm-2"><?=form_input(array("name"=>"user","value"=>$empresa->conf_email_user,"class"=>"form-control e-mail"));?></div>
						<?=form_label('<strong>Password:</strong>', 'password',array('class' => 'col-sm-1 text_right')); ?>
						<div class="col-sm-2"><?=form_input(array("name"=>"password","value"=>$empresa->conf_email_password,"type"=>"password","class"=>"form-control e-mail"));?></div>
						<?=form_label('<strong>Puerto:</strong>', 'puerto',array('class' => 'col-sm-1 text_right')); ?>
						<div class="col-sm-2"><?=form_input(array("name"=>"puerto","value"=>$empresa->conf_email_puerto,"class"=>"form-control e-mail"));?></div>
					</div>

			<div class="modal-footer">
				<button type="submit" class="btn btn-primary">Guardar</button>
			</div>
		</form>
		</div>
	</div>
</div>
