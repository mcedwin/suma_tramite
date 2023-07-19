<div id="page-wrapper" class="page-filter">
<?php 

// var_dump($anio);
?>
	<div class="page-header col-md-12">
		<div class="row page-header-title">
			<div class="col-sm-12">
				<h3>Consultar Expedientes</h3>
			</div>
		</div>
		<div class="row page-header-content">
			<div class="onsel form-inline col-xs-12 hidden">
				<a class="btn btn-default btn-sm borrar" href="?c=expedientes&m=borrar">
					<i class="fa fa-trash fa-fw"></i>
					Borrar
				</a>
			</div>
			<div class="nosel">
				<div class="col-sm-9">
					<form class="ocform form-inline">
						<div class="form-group">
						<input type="text" class="form-control" name="search[value]" id="filtro" placeholder="Filtro" value="">
						</div>
						<div class="form-group">
						<?=form_dropdown('estado', $estado,'',array('class' => 'form-control'));?>
						</div>
						<div class="form-group">
						<?=form_dropdown('tipo', $tipo,'',array('class' => 'form-control'));?>
						</div>
						<div class="form-group">
						<?php
							// $actual = date("Y");
						echo form_dropdown('anio', $anio,'',array('class' => 'form-control'));?>
						</div>
						<div class="form-group">
						<button type="submit" class="btn btn-primary btn-sm">
							<i class="fa fa-search fa-fw"></i>
							Filtrar
						</button>
						</div>
					</form>
				</div>
				<div class="col-sm-3 text-right" role="group" aria-label="...">
					<a class="btn btn-default btn-sm excel" href="#">
						<i class="fa fa-file-excel-o fa-fw"></i>
						Reporte Excel
					</a>
				</div>
			</div>
		</div>
	</div>
	<div class="page-content">
		<div class="col-md-12">
		<?php  echo $this->framework->genDataTable('mitabla', $columns, false,true); ?>
		</div>
	</div>
</div>