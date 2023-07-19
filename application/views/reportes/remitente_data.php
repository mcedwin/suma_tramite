<div class="col-md-12">
		<br>
			<h4 class="text-center">Estadistica Anual Documentos internos <?=$anio?></h4>

</div>
		
		<div class="col-md-12">
			<br>
				<table class="table table-bordered"> 
					<thead> 
						<tr> 
							<th>Remitente</th> 
							<th>Nro de Expedientes</th> 
							<th>Tramitados</th> 
							<th>En Tramite</th> 

						</tr> 
					</thead> 
					<tbody> 

						<?php
						foreach ($remitente as $value) 
						{
						?>
							<tr> 
								<th scope="row"><?=$value['entidad']?></th> 
								<td><?=$value['total']?></td>
								<td><?=$value['tramitado']?></td>
								<td><?=$value['total']-$value['tramitado']?></td>
							</tr>
						
						<?php
						
						}
						?>
					</tbody>

		</div>