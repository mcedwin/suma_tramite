<div class="modal-dialog" role="document">
    <div class="modal-content">
		<form class="form-horizontal" action="<?=base_url()?>expedientes/guardar_enviar" method="post">
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
					echo form_input(array('type'  => 'hidden','name'  => 'expediente','value' => $expediente));
				?>
					<div class="form-group">
						<?=form_label('<strong>Oficina:</strong>', 'oficina',array('class' => 'col-sm-12 text_left')); ?>
						<div class="col-sm-12 mb-2"><?=form_dropdown('oficina', $oficina,"",array('class' => 'form-control',"id"=>"oficina_destino"));?></div>
						
						<?=form_label('<strong>Personal:</strong>', 'usuario',array('class' => 'col-sm-12 ')); ?>
						<div class="col-sm-12 mb-2"><?=form_dropdown('usuario', [''=>' - Personal - '],'',array('class' => 'form-control',"id"=>"usuario_destino"));?></div>
						<?=form_label('<strong>Accion:</strong>', 'accion',array('class' => 'col-sm-12 ')); ?>
						<div class="col-sm-12"><?=form_dropdown('accion', $acciones,"",array('class' => 'form-control',"id"=>"accion_destino"));?></div>
					</div>
					<hr>
					<div class="form-group">
						<?=form_label('<strong>Observacion:</strong>', 'observacion',array('class' => 'col-sm-2 text_left')); ?>
						<div class="col-sm-9"><?=form_textarea(array("name"=>"observacion","value"=>'',"class"=>"form-control","rows"=>2));?></div>
					</div>

			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-default" data-dismiss="modal">Cerrar</button>
				<button type="submit" class="btn btn-primary">Guardar</button>
			</div>
		</form>
    </div>
</div>
