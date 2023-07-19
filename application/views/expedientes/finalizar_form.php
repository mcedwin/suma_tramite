<div class="modal-dialog" role="document">
    <div class="modal-content">
		<form class="form-horizontal" action="<?=base_url()?>expedientes/finalizar_expediente_guardar" method="post" id="derivar_form" enctype="multipart/form-data">
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
					echo form_input(array('type'  => 'hidden','name'  => 'tramite','value' => $tramite));
					echo form_input(array('type' => 'hidden', 'name' => 'tipo', 'value' => $tipo));
				?>
					
					<div class="form-group">
						<?=form_label('<strong>Achivo digital:</strong>', 'archivo',array('class' => 'col-sm-2 text_left')); ?>
						<div class="col-sm-4">
							<span class="input-group-btn">
	                            <span class="file-input btn btn-default btn-file">
	                                Adjuntar Archivo<?=form_upload(array("name"=>"archivo","value"=>'',"class"=>""));?>
	                            </span>
	                        </span>
                        </div>
	                    <div class="archivo_adjunto col-sm-4"></div>
					</div>
					
					<div class="form-group">
						<?=form_label('<strong>Observacion:</strong>', 'observacion',array('class' => 'col-sm-2 ')); ?>
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
