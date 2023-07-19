
<div class="modal-dialog" role="document">
    <div class="modal-content">

        <form class="form-horizontal" action="<?= base_url() ?>procesos/guardar_requisito" method="post">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                <h4 class="modal-title" id="gridSystemModalLabel"></h4>
            </div>
            <div class="modal-body">
                <div class="alert alert-danger error hidden" role="alert">
                    <span class="glyphicon glyphicon-exclamation-sign" aria-hidden="true"></span>
                    <span class="sr-only">Error:</span>
                </div>
                
                <input type="hidden" name="requisito" id="requ_id" value="<?=$requisitos->requ_id?>">
                <div class="form-group">
                    <?= form_label('Requisito nombre', 'nombre', array('class' => 'col-sm-4 control-label')); ?>
                    <div class="col-sm-8"><?= form_input(array("type" => "","name" => "nombre", "value" => $requisitos->requ_nombre, "class" => "form-control", "id" => "nombre")); ?></div>
                </div>  
                <div class="form-group">
                    <?= form_label('Activo', 'estado', array('class' => 'col-sm-4 control-label')); ?>
                    <div class="col-sm-8"><?= form_checkbox(array('name' => 'activo', 'value' => "", 'checked' => (($requisitos->requ_activo == 'SI') ? TRUE : FALSE), 'id' => 'activo')); ?></div>
                </div>      
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">Cerrar</button>
                <button type="submit" class="btn btn-primary">Guardar</button>
            </div>
        </form>
    </div>
</div>

