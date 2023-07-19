<div class="modal-dialog modal-lg" role="document">
    <div class="modal-content">
		<form class="form-horizontal" action="" method="post" id="perfil_form" enctype="multipart/form-data">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
				<h4 class="modal-title" id="gridSystemModalLabel"></h4>
			</div>
			<div class="modal-body">
						
						<!-- <div class="form-group"> -->
							<iframe src="<?=base_url(); ?>consultar/generarpdf/<?=$id ?>" class="" style="height: 500px; width:100%; "></iframe>
						<!-- </div> -->

								
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-default" data-dismiss="modal">Cerrar</button>
				<!-- <button type="submit" class="btn btn-primary">Guardar</button> -->
			</div>
		</form>
  </div>
</div>
