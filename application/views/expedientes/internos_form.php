<div id="page-wrapper">
	<div class="page-header col-md-12">
		<div class="row page-header-title">
			<div class="col-sm-12">
				<h3>Crear expediente interno</h3>
			</div>
		</div>
	</div>
	<div class="page-content">
		<div class="col-md-8 col-md-offset-2">
			<form class="form-horizontal" action="" method="post" id="expendiente_form" enctype="multipart/form-data">
				<br>
				<div class="alert alert-danger error hidden" role="alert">
					<span class="glyphicon glyphicon-exclamation-sign" aria-hidden="true"></span>
					<span class="sr-only">Error:</span>
				</div>
				<?php
				echo form_input(array('type'  => 'hidden', 'name'  => 'tipo', 'value' => 'INTERNO', "id" => "tipo"));
				$tipo_remitente = array("PERSONA" => "PERSONA", "EMPRESA" => "EMPRESA");
				?>
				<!--<div class="form-group">
						<?= form_label('<strong>Codigo:</strong>', 'codigo', array('class' => 'col-sm-4 text_left')); ?>
						<div class="col-sm-2"><?= form_input(array("name" => "codigo", "value" => $codigo->expe_id, "class" => "form-control", "disabled" => "disabled")); ?></div>
					</div>-->
				<div class="form-group">
					<?= form_label('<strong>Tipo de documento:</strong>', 'documento', array('class' => 'col-sm-4 text_left')); ?>
					<div class="col-sm-2"><?= form_dropdown('documento', $documento, 'small', array('class' => 'form-control', 'id' => "documento")); ?></div>
					<?= form_label('<strong>Número:</strong>', 'numero', array('class' => 'col-sm-1 text_left')); ?>
					<div class="col-sm-1"><?= form_input(array("name" => "numero", "value" => '', "class" => "form-control", "id" => "numero")); ?></div>
					<?= form_label('', 'detalle', array('class' => 'col-sm-4 text_left text-left', "id" => "sigla")); ?>
				</div>
				<div class="form-group">
					<?= form_label('<strong>Folios:</strong>', 'folio', array('class' => 'col-sm-4 text_left')); ?>
					<div class="col-sm-2"><?= form_input(array("name" => "folio", "value" => '', "class" => "form-control")); ?></div>
				</div>
				<div class="form-group">
					<?= form_label('<strong>Fecha y hora de registro:</strong>', 'fecha', array('class' => 'col-sm-4 text_left')); ?>
					<div class="col-sm-4"><?= form_input(array("name" => "fechahora", "value" => date("d/m/Y H:i:s"), "class" => "form-control")); ?></div>
					<?= form_input(array('type'  => 'hidden', 'name'  => 'fecha', 'value' => date("Y-m-d H:i:s"))); ?>
				</div>
				<div class="form-group">
					<?= form_label('<strong>Seleccione Remitente:</strong>', 'remitente', array('class' => 'col-sm-4 text_left', 'required' => 'true')); ?>
					<div class="col-sm-6">
						<?= form_dropdown('entidad', '', 'small', array('class' => 'entidad col-sm-10', "id" => "entidad")); ?>
						<?= anchor(base_url() . 'remitentes/form/', '<i class="glyphicon glyphicon-plus"></i>', array('title' => 'Nuevo', 'class' => 'btn btn-default crear')); ?>
					</div>

				</div>
				<div class="form-group">
					<?= form_label('<strong>Remitente:</strong>', 'remitente', array('class' => 'col-sm-4 text_left')); ?>
					<div class="col-sm-4">
						<?= form_input(array("name" => "remitente", "value" => $remitente, "class" => "form-control", "id" => "remitente")); ?>
					</div>
					<?= form_label('<strong>E-mail:</strong>', 'email', array('class' => 'col-sm-1 text_left')); ?>
					<div class="col-sm-3">
						<?= form_input(array("name" => "email", "value" => '', "class" => "form-control", "id" => "email")); ?>
					</div>
				</div>

				<div class="form-group">
					<?= form_label('<strong>Asunto:</strong>', 'asunto', array('class' => 'col-sm-4 text_left')); ?>
					<div class="col-sm-8"><?= form_input(array("name" => "asunto", "value" => '', "class" => "form-control")); ?></div>
				</div>
				<div class="form-group">
					<?= form_label('<strong>Achivo digital:</strong>', 'archivo', array('class' => 'col-sm-4 text_left')); ?>
					<div class="col-sm-2">
						<span class="input-group-btn">
							<span class="file-input btn btn-default btn-file">
								Adjuntar Archivo<?= form_upload(array("name" => "archivo", "value" => '', "class" => "")); ?>
							</span>
						</span>
					</div>
					<div class="archivo_adjunto col-sm-4"></div>
				</div>
				<div class="form-group">
					<?= form_label('<strong>Proceso:</strong>', 'proceso', array('class' => 'col-sm-4 text_left')); ?>
					<div class="col-sm-8"><?= form_dropdown('proceso', $procesos, 'small', array('class' => 'form-control', "id" => "proceso")); ?></div>
				</div>
				<div class="form-group">
					<div class="col-sm-4">
					</div>
					<div class="col-sm-8">
						<div class="col-sm-6" id="procesos_requisitos">
						</div>
						<div class="col-sm-6" id="procesos_oficinas">
						</div>
					</div>
				</div>
				<div class="form-group">
					<?= form_label('<strong>Observacion:</strong>', 'observacion', array('class' => 'col-sm-4 text_left')); ?>
					<div class="col-sm-8"><?= form_textarea(array("name" => "observacion", "value" => '', "class" => "form-control", "rows" => 2)); ?></div>
				</div>
				<hr>
				<div class="form-group">
					<?= form_label('<strong>Oficina destino:</strong>', 'oficina', array('class' => 'col-sm-4 text_left')); ?>
					<div class="col-sm-8 oficinas">
						<div class="row">
							<div class="col-sm-6"><?= form_dropdown('oficinas[]', $oficina, 'small', array('class' => 'form-control', "id" => "oficina_destino")); ?></div>
							<div class="col-sm-5"><?= form_dropdown('acciones[]', $acciones, '', array('class' => 'form-control')); ?></div>
							<?= form_label('<strong>Observacion:</strong>', 'observaciones', array('class' => 'col-sm-4 text_left')); ?>
							<div class="col-sm-11"><?= form_textarea(array("name" => "tramite_observaciones[]", "value" => '', "class" => "form-control", "rows" => 2)); ?></div>
						</div>
					</div>
				</div>
				<hr>
				<div class="form-group">
					<div class="col-sm-4"></div>
					<div class="col-sm-3">
						<button class="btn btn-success" id="clonar" type="button">Agregar Nuevo Destino</button>
					</div>
				</div>
				<div class="modal-footer">
					<!-- <button type="button" class="btn btn-default" data-dismiss="modal">Cerrar</button> -->
					<button type="submit" class="btn btn-primary"> Guardar </button>
				</div>
			</form>
		</div>
	</div>
</div>
<div class="hidden clon">
	<div class="clonados row">
		<hr class="col-sm-12">
		<div class="col-sm-6"><?= form_dropdown('oficinas[]', $oficina, 'small', array('class' => 'form-control', "id" => "oficina_destino")); ?></div>
		<div class="col-sm-5"><?= form_dropdown('acciones[]', $acciones, '', array('class' => 'form-control')); ?></div>
		<div class="col-sm-1"><button class="delete_destino btn btn-danger" type="button"><i class="fa fa-times"></i></button></div>
		<?= form_label('<strong>Observacion:</strong>', 'observaciones', array('class' => 'col-sm-4 text_left')); ?>
		<div class="col-sm-11"><?= form_textarea(array("name" => "tramite_observaciones[]", "value" => '', "class" => "form-control", "rows" => 2)); ?></div>
	</div>
</div>