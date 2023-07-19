
	<div class="page-header col-md-12">
		<div class="row page-header-title">
			<div class="col-sm-12 text-center">
				<h1>SUMMAGOLD</h1>
			</div>
		</div>
	</div>
	<div class="page-content">
		<div class="col-md-4 col-md-offset-4">
			<div class="panel panel-primary">
				<div class="panel-heading">Consultar su expediente</div>
				<div class="panel-body">
					<form class="form-horizontal" action="" method="post" id="consultar_form" enctype="multipart/form-data">
							<div class="alert alert-danger error hidden" role="alert">
								<span class="glyphicon glyphicon-exclamation-sign" aria-hidden="true"></span>
								<span class="sr-only">Error:</span>
							</div>
							<?php
							// var_dump($empresa);
							// echo form_hidden('empresa',$empresa->conf_id);
							?>
								
							<div class="form-group">
								<?=form_label('Ingrese su Nº de expediente', 'numero',array('class' => 'col-sm-6 text_left')); ?>
								<div class="col-sm-6"><?=form_input(array("name"=>"numero","value"=>'',"class"=>"form-control","id"=>"numero"));?></div>
							</div>
							<div class="form-group">
								<div class="col-sm-6"></div>
								<div class="col-sm-6"><?php echo $cap['image']; ?></div>
							</div>
							<div class="form-group">
								<?=form_label('Copie el captcha', 'captcha',array('class' => 'col-sm-6 text_left')); ?>
								<div class="col-sm-6"><?=form_input(array("name"=>"captcha","value"=>'',"class"=>"form-control","id"=>"captcha"));?></div>
							</div>
							<div class="form-group">
								<?=form_label('Escriba periodo', 'captcha',array('class' => 'col-sm-6 text_left')); ?>
								<div class="col-sm-6"><?=form_input(array("name"=>"periodo","value"=>date('Y'),"class"=>"form-control","id"=>"periodo"));?></div>
							</div>

						<div class="modal-footer">
							<a href="<?=base_url() ?>consultar/seguir_libre/" target="_blank" class="btn btn-primary" id="ejecutar" title="Imprimir">Consultar</a>
						</div>
					</form>
					<hr>
					<div class="text-center"><a href="<?php echo base_url('login'); ?>">Ingresar al Sistema</a></div>
				</div>
			</div>
		</div>
	</div>
