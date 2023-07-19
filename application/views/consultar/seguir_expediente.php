<div class="modal-dialog modal-lg" role="document">
    <div class="modal-content">
		<form class="form-horizontal" action="<?php echo base_url()?>expedientes/guardar_derivar" method="post">
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

				$plazo = isset($dias_->deta_plazo)?$dias_->deta_plazo:"0";
				$dates = new DateTime(isset($tramite_[0]->tram_fechareg)?$tramite_[0]->tram_fechareg:"");
				$dates1 = new DateTime(date("Y-m-d"));
				$interval = $dates->diff($dates1);
				$dias_cont = $interval->format('%a');

				?>	
					<div class="form-group">
						<div class="col-sm-6">
							<div class="form-group">
								<label class="col-sm-6"><strong>Nº de expediente</strong></label>
								<span><?php echo $expediente->expe_id ?></span>
							</div>
							<div class="form-group">
								<label class="col-sm-6"><strong>Tipo de expediente</strong></label>
								<span><?php echo $documento->docu_nombre ?></span>
							</div>
							<div class="form-group">
								<label class="col-sm-6"><strong>Fecha de Registro</strong></label>
								<span><?php
									if(isset($expediente->expe_fechareg)):
										$date = new DateTime($expediente->expe_fechareg);
										echo $date->format('j/M/Y h:i a');
									endif;
								?></span>
							</div>
							<div class="form-group">
								<label class="col-sm-6"><strong>Nº de documento</strong></label>
								<span><?php echo $expediente->expe_numero."-".$expediente->expe_periodo ?></span>
							</div>
							<div class="form-group">
								<label class="col-sm-6"><strong>Asunto</strong></label>
								<span><?php echo $expediente->expe_asunto?></span>
							</div>
							
							
						</div>
						<div class="col-sm-6">
							<div class="form-group">
								<label class="col-sm-6"><strong>Plazo</strong></label>
								<span><?php echo isset($suma_plazo->deta_plazo)?$suma_plazo->deta_plazo." días":'-' ?></span>
							</div>
							<div class="form-group">
								<label class="col-sm-6"><strong>Nº de folios</strong></label>
								<span><?php echo $expediente->expe_folio?></span>
							</div>
							<div class="form-group">
								<label class="col-sm-6"><strong>Entidad</strong></label>
									<?php echo $expediente->expe_remitente; ?>
									(<small><?php echo @$remitente->enti_nombre?></small>)
								
							</div>
							<!--<div class="form-group">
								<label class="col-sm-6"><strong>Tiempo de tramite</strong></label>
								<span><?php echo ($plazo-$dias_cont)?></span>
							</div>
							<div class="form-group">
								<label class="col-sm-6"><strong>Expediente</strong></label>
								<span>
								<?php if(isset($expediente->expe_archivo)): ?>
									<a href="<?php echo base_url() ?>archivos/expedientes/<?php echo strtolower($expediente->expe_tipo) ?>/<?php echo $expediente->expe_archivo ?>" download='<?php echo $expediente->expe_asunto?>'><i class="fa fa-download"></i> Descargar</a>
								<?php endif; ?>
								</span>
							</div>-->
							<div class="form-group">
								<label class="col-sm-6"><strong>Archivo</strong></label>
								<span><a href="<?php echo base_url() ?>archivos/expedientes/<?php echo strtolower($expediente->expe_tipo) ?>/<?php echo $expediente->expe_archivo ?>" download='<?php echo $expediente->expe_asunto?>'><i class="fa fa-download"></i> Descargar</a></span>
							</div>
						</div>
					</div>
					<div class="form-group table-responsive">
						<table class="table">
							<thead>
								<tr>
									<th>Nº</th>
									<th>Origen</th>
									<th>Destino</th>
									<th>Fecha</th>
									<th>Observacion</th>
									<th>Estado</th>
									<th style="width: 90px;">Archivo</th>
								</tr>
							</thead>
							<tbody>
								<?php 
								$i=1;
								if(!empty($tramite)):
									foreach ($tramite as $value): ?>
									<tr>
										<td><?php echo $i?></td>
										<td><?php echo $value->origen ?></td>
										<td><?php echo $value->destino ?></td>
										<td>
											<?php
												if(isset($value->tram_fechaestado)):
													$date = new DateTime($value->tram_fechaestado);
													echo $date->format('d/m/Y h:i');
												endif;
											?>
										</td>
										<td><?php echo $value->tram_observacion ?></td>
										<td><?php echo $value->tram_estado ?></td>
										<td>
											<?php
											if(!empty($value->archivo)&&!empty($value->archivo))
											{
											?>
											<a href="<?php echo base_url() ?>archivos/expedientes/<?php echo strtolower($expediente->expe_tipo) ?>/<?php echo $value->archivo ?>" download='<?php echo $expediente->expe_asunto . '_' . $value->id?>'><i class="fa fa-download"></i> Descargar</a>
											<?php
											}
											else
											{
												
												?>
													-
											<?php
											
											}
											?>
										</td>
									</tr>
									<?php 
										$i++;
									endforeach;
								endif; ?>
								
							</tbody>
						</table>
					</div>
			</div>
			<div class="modal-footer">
				<a href="<?php echo base_url() ?>consultar/imprimir/<?php echo $expediente->expe_id ?>" target="_blank" class="btn btn-primary" id="imprimir" title="Imprimir">Imprimir</a>
				<button type="button" class="btn btn-default" data-dismiss="modal">Cerrar</button>
			</div>
		</form>
    </div>
</div>
