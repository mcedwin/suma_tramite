<div id="page-wrapper">
	<div class="page-header col-md-12">
		<div class="row page-header-title">
			<div class="col-sm-6">
				<h3>Copias de seguridad</h3></div>
		</div>
	</div>
	<div class="page-content">
		<br>
		<div class="col-md-12">
			<div class="panel panel-default">
			  <div class="panel-heading">
			    <h3 class="panel-title">Realizar Backup</h3>
			  </div>
			  <div class="panel-body">
			    <form method="post" action="<?php echo base_url()?>backup/backup_data" target="_self">
				<div class="row">
					<div class="col-xs-6">Backup de los datos</div>
					<div class="col-xs-6"><input type="submit" value="Descargar" class="fb_submit btn btn-primary pull-right" /></div>
				</div>
				</form>
				<br />
				<form method="post" action="<?php echo base_url()?>backup/backup_files" target="_self">
				<div class="row">
					<div class="col-xs-6">Backup de archivos</div>
					<div class="col-xs-6"><input type="submit" value="Descargar" class="fb_submit btn btn-primary pull-right" /></div>
				</div>
				</form>

			  </div>
			</div>
			
		<!--<div class="panel panel-default">
		  <div class="panel-heading">
		    <h3 class="panel-title">Restaurar Backup</h3>
		  </div>
		  <div class="panel-body">
		    	<form method="post" action="<?php echo base_url()?>backup/backup_rdata" enctype="multipart/form-data" target="_self">
				<div class="row">
					<div class="col-xs-4">Restaurar backup de datos</div>
					<div class="col-xs-4"><input type="file" name="datafile" /></div>
					<div class="col-xs-4"><input type="submit" value="Restaurar" class="fb_submit btn btn-danger pull-right" /></div>
				</div>
				</form>
				<br />
				<form method="post" action="<?php echo base_url()?>backup/backup_rfiles" enctype="multipart/form-data" target="_self">
				<div class="row">
					<div class="col-xs-4">Restaurar backup de imagenes</div>
					<div class="col-xs-4"><input type="file" name="datafile" /></div>
					<div class="col-xs-4"><input type="submit" value="Restaurar" class="fb_submit btn btn-danger pull-right" /></div>
				</div>
				</form>
		  </div>
		</div>-->
		
		</div>
	</div>
</div>