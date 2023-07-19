<div class="col-md-12">
		<br>
			<h4>Estadistica Anual <?=$anio?></h4>
			<div class="col-md-4">
				<table class="table">
					<tr>
						<td>Total de Expedientes</td>
						<td><?=$total->cont?></td>
					</tr>
					<tr>
						<td>Expedientes Finalizados</td>
						<td><?=$terminado->cont?></td>
					</tr>
					<tr>
						<td>Expedientes en tramite</td>
						<td><?=($total->cont)-($terminado->cont)?></td>
					</tr>
				</table>
			</div>

		</div>
		
		<div class="col-md-12">
			<br>
				<table class="table table-bordered"> 
					<thead> 
						<tr> 
							<th></th> 
							<th>Enero</th> 
							<th>Febrero</th> 
							<th>Marzo</th> 
							<th>Abril</th> 
							<th>Mayo</th> 
							<th>Junio</th> 
							<th>Julio</th> 
							<th>Agosto</th> 
							<th>Setiembre</th> 
							<th>Octubre</th> 
							<th>Noviembre</th> 
							<th>Diciembre</th> 
						</tr> 
					</thead> 
					<tbody> 

						<tr> 
							<th scope="row">Total de Expedientes</th> 
							<?php
							$i=1;
							foreach ($mestotal as $valtotal) {
							?>
							<td><?=$valtotal->cont?></td> 
							<?php
							$i++;
							}
							?>
							 
						</tr> 
						<tr> 
							<th scope="row">Expedientes finalizados</th> 
							<?php
							$i=1;
							foreach ($mesterminado as $valterm) {
							?>
							<td><?=$valterm->cont?></td> 
							<?php
							$i++;
							}
							?>
							
						</tr> 
						<tr> 
							<th scope="row">Expedientes en tramite</th> 
							<?php
							for($i=1 ; $i<=12 ; $i++){
							?>
							<td><?=($mestotal[$i]->cont-$mesterminado[$i]->cont)?></td> 
							<?php
							
							}
							?>
							
						</tr> 
						<tr> 
							<th scope="row">Porcentaje tramitado</th> 
							<?php
							$i=1;
							foreach ($porcentaje as $valpor) {
							?>
							<td><?=$valpor?>%</td> 
							<?php
							$i++;
							}
							?>
							 
						</tr> 
					</tbody>

		</div>