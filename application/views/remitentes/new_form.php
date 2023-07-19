
<div class="modal-dialog" role="document">
    <div class="modal-content">
		<form class="form-horizontal" action="<?=base_url()?>remitentes/guardar" method="post" >
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
				<h4 class="modal-title" id="gridSystemModalLabel"></h4>
			</div>
			<div class="modal-body">
				<div class="alert alert-danger error hidden" role="alert">
					<span class="glyphicon glyphicon-exclamation-sign" aria-hidden="true"></span>
					<span class="sr-only">Error:</span>
				</div>
				<?php
				?>
					<div class="form-group">
						<?=form_label('<strong>Nombre:</strong>', 'remitentes',array('class' => 'col-sm-2 control-label')); ?>
						<div class="col-sm-5"><?=form_input(array("name"=>"nombre","value"=>"","class"=>"form-control"));?></div>
						<?=form_label('<strong>Tipo:</strong>', 'tipo',array('class' => 'col-sm-1 control-label')); ?>
						<div class="col-sm-3"><?=form_dropdown('tipo', $options,"",array('class' => 'form-control'));?></div>
					</div>
					<div class="form-group">
						<?=form_label('<strong>Siglas:</strong>', 'siglas',array('class' => 'col-sm-2 control-label')); ?>
						<div class="col-sm-2"><?=form_input(array("name"=>"siglas","value"=>"","class"=>"form-control"));?></div>
						<?=form_label('<strong>RUC:</strong>', 'ruc',array('class' => 'col-sm-1 control-label')); ?>
						<div class="col-sm-4"><?=form_input(array("name"=>"ruc","value"=>"","class"=>"form-control"));?></div>
					</div>
					<div class="form-group">
						<?=form_label('<strong>E-mail:</strong>', 'email',array('class' => 'col-sm-2 control-label')); ?>
						<div class="col-sm-5"><?=form_input(array("name"=>"email","value"=>"","class"=>"form-control"));?></div>
					</div>

			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-default" data-dismiss="modal">Cerrar</button>
				<button type="submit" class="btn btn-primary">Guardar</button>
			</div>
		</form>
    </div>
</div>
