<div id="page-wrapper" class="page-filter">
	<div class="page-header col-md-12">
		<div class="row page-header-title">
			<div class="col-sm-6">
				<h3>Reporte - Documentos internos</h3></div>
		</div>
		<div class="row page-header-content">
			<div class="nosel">
				<div class="col-sm-9">
					<form class="tform form-inline" >
						<div class="col-md-2">
							<label>AÑO</label>
							<?php
							echo form_dropdown('anio', $anio,'',array('class' => 'form-control'));
							?>
			                <!-- <select class="form-control" name="anio">
			                	<option value="2015">2015</option>
			                	<option value="2016">2016</option>
			                	<option value="2016">2017</option>
			                	<option value="2016">2018</option>
			                </select> -->
						</div>
						<div class="col-md-2">
							<button type="submit" class="btn btn-default">
								Generar
							</button>
						</div>
					</form>
				</div>
				
			</div>
		</div>
	</div>
	<div class="page-content">
		<div class="cuerpo">
			
		</div>
	</div>
</div>