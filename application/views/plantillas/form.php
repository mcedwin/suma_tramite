
<div class="modal-dialog" role="document">
    <div class="modal-content">
		<form class="form-horizontal" action="<?=base_url()?>plantillas/guardar" method="post" enctype="multipart/form-data" id="recurso_form">
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
				// var_dump($recursos);
				 echo form_hidden('recursos',$recursos->recu_id );
				?>
					
					<div class="form-group">
						<?=form_label('<strong>Nombre: </strong>', 'recursos',array('class' => 'col-sm-3 control-label')); ?>
						<div class="col-sm-9"><?=form_input(array("name"=>"nombre","value"=>$recursos->recu_nombre,"class"=>"form-control"));?></div>
					</div>
					<div class="form-group">
						<?=form_label('<strong>Archivo: </strong>', 'archivo',array('class' => 'col-sm-3 control-label')); ?>
						<div class="col-sm-6 archivo-actual"><?=form_label($recursos->recu_archivo, '',array('class' => 'control-label')); ?></div>
						<div class="col-sm-6 archivo-nuevo">
							<?=form_label("", 'archivo',array('class' => 'control-label','id'=>"archivo-adjunto")); ?>
							<a href="#" class="eliminar"><i class="fa fa-times"></i></a>
						</div>
						<span class="col-sm-2 btn btn-default btn-file">
                            Archivo<input type="file" name="archivo">
                        </span>
					</div>

					<!-- <input type="file" name="hola" value="http://localhost/MCTramite/gsDocumentario/archivos/mensajes/2016/4/15/ejemolio-173151.pdf"> -->
						

			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-default" data-dismiss="modal">Cerrar</button>
				<button type="submit" class="btn btn-primary">Guardar</button>
			</div>
		</form>
    </div>
</div>
