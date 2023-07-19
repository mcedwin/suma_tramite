<?php
$panelcolor = $tipo == 'INTERNO' ? 'panel-primary' : 'panel-success';
?>


<div id="page-wrapper">
	<div class="page-header col-md-12">
		<div class="row page-header-title">
			<div class="col-sm-12">
				<h3>Crear expediente <?php echo $tipo; ?></h3>
			</div>
		</div>
	</div>
	<div class="page-content">
		<div class="col-md-10 col-md-offset-1">
			<form class="" action="" method="post" id="expendiente_form" enctype="multipart/form-data">
				<br>
				<div class="alert alert-danger error hidden" role="alert">
					<span class="glyphicon glyphicon-exclamation-sign" aria-hidden="true"></span>
					<span class="sr-only">Error:</span>
				</div>
				<?php
				echo form_input(array('type'  => 'hidden', 'name'  => 'tipo', 'value' => $tipo, "id" => "tipo"));
				$tipo_remitente = array("PERSONA" => "PERSONA", "EMPRESA" => "EMPRESA");
				?>
				<!--<div class="form-group">
				<?= form_label('<strong>Codigo:</strong>', 'codigo', array('class' => 'col-sm-4 text_left')); ?>
						<div class="col-sm-2"><?= form_input(array("name" => "codigo", "value" => $codigo->expe_id, "class" => "form-control")); ?></div>
					</div>-->
				<div class="panel <?php echo $panelcolor; ?>">
					<div class="panel-heading">Remitente</div>
					<div class="panel-body">


						<div class="row">
							<?php
							if ($tipo == 'EXTERNO') {
								echo mydropdown(6, 'Remitente', 'entidad', '', 'entidad pull-left', anchor(base_url() . 'remitentes/form/', '<i class="glyphicon glyphicon-plus"></i>', array('title' => 'Nuevo', 'class' => 'btn btn-default crear pull-right', 'style' => 'margin-top:23px')));
								echo '<input type="hidden" name="remitente" id="remitente" value="">';
								//echo myinput(6, 'Email', 'email', '');
							} else {
								echo mydropdown(6, 'Tipo', 'interno_tipo', $interno_tipo, 'pull-left','',$this->full_user->usua_responsable=='1'?'OFICINA':'');
								echo myinput(6, 'Oficina', 'oficina', $this->session->userdata('oficina'));
								echo myinput(6, 'Remitente', 'remitente', $remitente);
								echo myinput(6, 'Email', 'email', '');
							}
							?>
						</div>


					</div>
				</div>

				<div class="panel <?php echo $panelcolor; ?>">
					<div class="panel-heading">Datos del expediente</div>
					<div class="panel-body">
						<div class="row">
							<?php
							echo mydropdown(6, 'Tipo de documento', 'documento', $documento);


							if ($tipo == 'INTERNO') {
								echo myinput(2, 'Número', 'numero', '');
								echo myinput(3, '.', 'sigla', '');
								echo mybutton(1, 'Generar', 'generar', 'Plantilla');
							} else {
								echo myinput(4, 'Número', 'numero', '');
							}

							echo myinput(4, 'Folios', 'folio', '');
							if ($tipo == 'EXTERNO')
								echo myinput(4, 'Fecha de emisión', 'fechahora', date("d/m/Y H:i:s"));
							echo form_input(array('type'  => 'hidden', 'name'  => 'fecha', 'value' => date("Y-m-d H:i:s")));
							echo myinput(12, 'Asunto', 'asunto', '');
							echo myinput(12, 'Referencia', 'referencia', '');
							echo mytextarea(12, 'Datos adicionales', 'observacion', '');
							?>

						</div>
					</div>
				</div>



				<div class="panel <?php echo $panelcolor; ?>">
					<div class="panel-heading">Archivo</div>
					<div class="panel-body">

						<span class="file-input btn btn-success btn-file pull-left">
							Adjuntar Archivo<?= form_upload(array("name" => "archivo", "value" => '', "class" => "")); ?>
						</span>
						<div class="archivo_adjunto ml-1 mt-2 pull-left"></div>
					</div>
				</div>

				<!--
				<div class="panel <?php echo $panelcolor; ?>">
					<div class="panel-body">
						<div class="row">
							<?php
							echo mydropdown(12, 'Proceso', 'proceso', $procesos);
							?>
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
						</div>
					</div>
				</div>
				-->
				<!--
				<div class="panel <?php echo $panelcolor; ?>">
					<div class="panel-heading">Destinatario</div>
					<div class="panel-body">


						<div class="row">
							<div class="col-sm-12 oficinas">
								<div class="row">
									<div class="col-sm-6"><?= form_dropdown('oficinas[]', $oficina, 'small', array('class' => 'form-control', "id" => "oficina_destino")); ?></div>
									<div class="col-sm-5"><?= form_dropdown('acciones[]', $acciones, '', array('class' => 'form-control')); ?></div>
									<div class="col-sm-11 mt-2"><?= form_textarea(array("name" => "tramite_observaciones[]", "value" => '', "class" => "form-control", "rows" => 2)); ?></div>
								</div>
							</div>
						</div>
						<hr>
						<button class="btn btn-success" id="clonar" type="button">Nueva oficina</button>

					</div>
				</div>
						-->
				<?php
				if ($tipo == 'INTERNO') {
				?>
					<div class="checkbox">
						<label>
							<input type="checkbox" id="finExterno" name="finExterno" value="1"> Destinatario externo
						</label>
					</div>
				<?php
				}
				?>

				<div class="panel <?php echo $panelcolor; ?> showno">
					<div class="panel-heading">Destinatario</div>
					<div class="panel-body">
						<div class="d-flex form-group">
							<?= form_dropdown('selectOficinas', $oficina, 'small', array('class' => 'form-control', "id" => "selectOficinas")); ?>
						</div>

						<table class="table oficinas">
							<thead>
								<th>Oficina</th>
								<th>Personal</th>
								<th>Opciones</th>
							</thead>
							<tbody>

							</tbody>
						</table>
					</div>
				</div>

				<?php
				if ($tipo == 'INTERNO') {
				?>
					<div class="panel <?php echo $panelcolor; ?> showsi">
						<div class="panel-heading">Destinatario externo</div>
						<div class="panel-body">


							<div class="row">
								<?php
								echo mydropdown(6, 'Destinatario', 'entidad', '', 'entidad pull-left', anchor(base_url() . 'remitentes/form/', '<i class="glyphicon glyphicon-plus"></i>', array('title' => 'Nuevo', 'class' => 'btn btn-default crear pull-right', 'style' => 'margin-top:23px')));
								echo '<input type="hidden" name="remitente" id="remitente" value="">';
								?>
							</div>
						</div>
					</div>
				<?php
				}
				?>



				<div class="modal-footer">
					<!-- <button type="button" class="btn btn-default" data-dismiss="modal">Cerrar</button> -->
					<button type="submit" class="btn btn-primary">Guardar expediente</button>
				</div>
			</form>
		</div>
	</div>
</div>
<div class="hidden clon">
	<div class="clonados row">
		<hr class="mt-2 mb-2">
		<div class="col-sm-6"><?= form_dropdown('oficinas[]', $oficina, 'small', array('class' => 'form-control', "id" => "oficina_destino")); ?></div>
		<div class="col-sm-5"><?= form_dropdown('acciones[]', $acciones, '', array('class' => 'form-control')); ?></div>
		<div class="col-sm-1"><button class="delete_destino btn btn-danger" type="button"><i class="fa fa-times"></i></button></div>
		<div class="col-sm-11 mt-2"><?= form_textarea(array("name" => "tramite_observaciones[]", "value" => '', "class" => "form-control", "rows" => 2)); ?></div>
	</div>

	<div id="clon_acciones">
		<?= form_dropdown('acciones[]', $acciones, '', array('class' => 'form-control')); ?>
	</div>
</div>