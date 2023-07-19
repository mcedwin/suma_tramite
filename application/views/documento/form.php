
<div class="modal-dialog" role="document">
    <div class="modal-content">
		<form class="form-horizontal" action="<?=base_url()?>documento/guardar" method="post">
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
				 echo form_hidden('documento',$documento->docu_id );
				?>
					
					<div class="form-group">
						<?=form_label('<strong>Nombre de documento:</strong>', 'documento',array('class' => 'col-sm-4 control-label')); ?>
						<div class="col-sm-7"><?=form_input(array("name"=>"nombre","value"=>$documento->docu_nombre,"class"=>"form-control"));?></div>
					</div>
					<div class="form-group">
						<?=form_label('<strong>Código:</strong>', 'codigo',array('class' => 'col-sm-4 control-label')); ?>
						<div class="col-sm-7"><?=form_input(array("name"=>"codigo","value"=>$documento->docu_codigo,"class"=>"form-control"));?></div>
					</div>
					<div class="form-group">
						<?=form_label('<strong>Habilitado</strong>', 'estado',array('class' => 'col-sm-4 control-label')); ?>
						<?php if($documento->docu_estado==1){$checked=true;}else{$checked=false;}
						 ?>
						<div class="col-sm-8"><?=form_checkbox(array('name'=> 'habilitado','value'=>$documento->docu_estado,'checked'=> $checked));?></div>
					</div>	

					<div class="form-group">
						<?=form_label('<strong>Interno</strong>', 'interno',array('class' => 'col-sm-4 control-label')); ?>
						<?php if($documento->docu_interno==1){$checked=true;}else{$checked=false;}
						 ?>
						<div class="col-sm-8"><?=form_checkbox(array('name'=> 'interno','value'=>$documento->docu_interno,'checked'=> $checked));?></div>
					</div>	

					<div class="form-group">
						<?=form_label('<strong>Externo</strong>', 'externo',array('class' => 'col-sm-4 control-label')); ?>
						<?php if($documento->docu_externo==1){$checked=true;}else{$checked=false;}
						 ?>
						<div class="col-sm-8"><?=form_checkbox(array('name'=> 'externo','value'=>$documento->docu_externo,'checked'=> $checked));?></div>
					</div>	
						

			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-default" data-dismiss="modal">Cerrar</button>
				<button type="submit" class="btn btn-primary">Guardar</button>
			</div>
		</form>
    </div>
</div>
