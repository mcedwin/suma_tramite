<div class="modal-dialog" role="document">
    <div class="modal-content">
		<form class="form-horizontal" action="<?=base_url()?>expedientes/procesar" method="post">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
				<h4 class="modal-title" id="gridSystemModalLabel"></h4>
			</div>
			<div class="modal-body">
				<div class="alert alert-danger error hidden" role="alert">
					<span class="glyphicon glyphicon-exclamation-sign" aria-hidden="true"></span>
					<span class="sr-only">Error:</span>
				</div>
				<div class="form-group">
					<div class="btn-group col-sm-10 col-sm-offset-2" data-toggle="buttons">
						  <label class="btn btn-default active opciones">
						    <input type="radio" name="options" id="option1" value="1" autocomplete="off" checked> Hoja de Ruta
						  </label>
						  <label class="btn btn-default opciones">
						    <input type="radio" name="options" id="option2" value="2" autocomplete="off"> Hoja de cargo
						  </label>
						  <label class="btn btn-default opciones">
						    <input type="radio" name="options" id="option3" value="3" autocomplete="off"> Hoja de ruta y cargo
						  </label>
					</div>
				</div>
				<?php echo form_input(array('type'  => 'hidden','name'  => 'tipo','value' => 'EXTERNO',"id"=>"tipo")); ?>
				<div class="form-group">
					<?=form_label('<strong>Desde</strong>', 'desde',array('class' => 'col-sm-6 text_left')); ?>
					<?=form_label('<strong>Hasta</strong>', 'hasta',array('class' => 'col-sm-6 text_left')); ?>
					<div class="col-sm-6"><?=form_input(array("name"=>"desde","value"=>isset($valores->desde)?$valores->desde:"","class"=>"form-control","id"=>"desde"));?></div>
					<div class="col-sm-6"><?=form_input(array("name"=>"hasta","value"=>isset($valores->hasta)?$valores->hasta:"","class"=>"form-control","id"=>"hasta"));?></div>
				</div>
				<div class="form-group">
				</div>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-default" data-dismiss="modal">Cerrar</button>
				<a href="<?=base_url() ?>expedientes/procesar/1" target="_blank" class="btn btn-primary" id="ejecutar" title="Imprimir">Ejecutar</a>
			</div>
		</form>
    </div>
</div>
