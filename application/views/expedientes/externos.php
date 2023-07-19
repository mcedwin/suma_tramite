<div id="page-wrapper" class="page-filter">
	<div class="page-header col-md-12">
		<div class="row page-header-title">
			<div class="col-sm-6">
				<h3>Todos los expedientes externos</h3>
			</div>
			<div class="col-sm-6 text-right" role="group" aria-label="...">
					<a href="<?=base_url()?>expedientes/externos_form?m=expedientes#1" title="Crear expedientes" class="btn btn-danger btn-sm">
					<i class="fa fa-plus fa-fw"></i>
					Expediente externo
				</a>
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
						<!--<div class="form-group">
							<?=form_dropdown('oficina', $oficina,'',array('class' => 'form-control'));?>
						</div>-->
						<div class="form-group">
							<div id="reportrange" class="pull-right" style="background: #fff; cursor: pointer; padding: 5px 10px; border: 1px solid #ccc; width: 100%">
							    <i class="glyphicon glyphicon-calendar fa fa-calendar"></i>&nbsp;
							    <span></span> <b class="caret"></b>
							</div>
						</div>
						<input type="hidden" name="fecha_ini">
						<input type="hidden" name="fecha_fin">
						<div class="form-group">
						<button type="submit" class="btn btn-primary btn-sm filtar">
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
					<a class="btn btn-success btn-sm procesar" href="<?=base_url() ?>expedientes/dlgprocesar_externo" title="Procesar expedientes">
						<i class="fa fa-retweet fa-fw"></i>
						Procesar
					</a>
				</div>
			</div>
		</div>
	</div>
	<div class="page-content">
		<div class="col-md-12">
		<?php  echo $this->framework->genDataTable('mitabla', $columns, true,true); ?>
		</div>
	</div>
</div>