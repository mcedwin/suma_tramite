<div class="col-md-12">
		<br>
			<h4 class="text-center">Estadistica Anual Documentos internos <?=$anio?></h4>

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

						<?php
						//var_dump($oficina);
						$i=0;
						foreach ($oficina as $ofic) {
						?>
							<tr> 
								<th scope="row"><?=$ofic->ofic_nombre?></th> 
								<?php
								foreach ($contador as $cont) {
									if ($ofic->ofic_id = $cont[$i]["ofic_id"]) {
										?>
										<td><?=$cont[$i]["contador"]?></td>
										<?php //var_dump($cont);
									}
									
								}
						
								?>
							
							 
							</tr> 
						
						<?php
						$i++;
						}
						
						?>
					</tbody>

		</div>