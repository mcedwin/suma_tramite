<div class="modal-dialog" role="document">
    <div class="modal-content">
		<form class="form-horizontal" action="<?=base_url()?>expedientes/guardar_derivar" method="post" id="derivar_form" enctype="multipart/form-data">
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
					
					<!--<div class="form-group">
						<?=form_label('<strong>Proceso:</strong>', 'proceso',array('class' => 'col-sm-3 text-right')); ?>
						<div class="col-sm-8"><?=form_input(array("name"=>"proceso","value"=>isset($proceso->proc_nombre)?$proceso->proc_nombre:"","class"=>"form-control","disabled"=>"disabled"));?></div>
					</div>
					<div class="form-group">
						<div class="col-sm-1">
						</div>	
						<div class="col-sm-11">
							<?php if(isset($proceso->proc_nombre)): ?>
							<div class="col-sm-6">
								<h5>Oficinas</h5>
								<ul id="procesos_oficinas">
									<?php if(count($procesos_detalle)>0)foreach ($procesos_detalle as $value): ?>
										<?php if($value->deta_id==$sig_proceso): ?>
											<li><strong><?=$value->ofic_nombre." (".$value->deta_plazo."días)";?></strong></li>
										<?php else: ?>
											<li><?=$value->ofic_nombre." (".$value->deta_plazo."días)";?></li>
									<?php 
										endif;
									endforeach;
									 ?>
								</ul>
							</div>
							<div class="col-sm-6">
								<h5>Requisitos</h5>
								<ul id="procesos_requisitos">
									<?php if(count($procesos_requisito)>0)foreach ($procesos_requisito as $value): ?>
										<li><?=$value->requ_nombre?></li>
									<?php endforeach; ?>
								</ul>
							</div>
						<?php endif; ?>
						</div>
					</div>
					<hr>
					<div class="form-group">
					<?=form_label('<strong>- DESTINO -</strong>', 'oficina',array('class' => 'col-sm-12 text-center')); ?>
					</div>
					<hr>

					-->
					<div class="form-group">
						<?=form_label('<strong>Oficina:</strong>', 'oficina',array('class' => 'col-sm-12 ')); ?>
						<div class="col-sm-12 mb-2"><?=form_dropdown('oficina', $oficina,$sig_oficina,array('class' => 'form-control',"id"=>"oficina_destino"));?></div>
						<?=form_label('<strong>Personal:</strong>', 'usuario',array('class' => 'col-sm-12 ')); ?>
						<div class="col-sm-12 mb-2"><?=form_dropdown('usuario', [''=>' - Personal - '],'',array('class' => 'form-control',"id"=>"usuario_destino"));?></div>
						<?=form_label('<strong>Accion:</strong>', 'accion',array('class' => 'col-sm-12 ')); ?>
						<div class="col-sm-12"><?=form_dropdown('accion', $acciones,"",array('class' => 'form-control',"id"=>"accion_destino"));?></div>
					</div>

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
						<div class="col-sm-10"><?=form_textarea(array("name"=>"observacion","value"=>'',"class"=>"form-control","rows"=>2));?></div>
					</div>

			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-default" data-dismiss="modal">Cerrar</button>
				<button type="submit" class="btn btn-primary">Guardar</button>
			</div>
		</form>
    </div>
</div>
