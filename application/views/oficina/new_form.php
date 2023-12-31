<div class="modal-dialog" role="document">
	<div class="modal-content">
		<form class="form-horizontal" action="<?= base_url() ?>oficina/guardar" method="post">
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
					<?= form_label('<strong>Nombre de Oficina:</strong>', 'oficina', array('class' => 'col-sm-4 control-label')); ?>
					<div class="col-sm-7"><?= form_input(array("name" => "nombre", "value" => '', "class" => "form-control")); ?></div>
				</div>
				<div class="form-group">
					<?= form_label('<strong>Código:</strong>', 'codigo', array('class' => 'col-sm-4 control-label')); ?>
					<div class="col-sm-7"><?= form_input(array("name" => "codigo", "value" => '', "class" => "form-control")); ?></div>
				</div>


			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-default" data-dismiss="modal">Cerrar</button>
				<button type="submit" class="btn btn-primary">Guardar</button>
			</div>
		</form>
	</div>
</div>