
<div class="modal-dialog" role="document">
    <div class="modal-content">

        <form class="form-horizontal" action="<?= base_url() ?>procesos/guardar_detalle" method="post">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                <h4 class="modal-title" id="gridSystemModalLabel"></h4>
            </div>
            <div class="modal-body">
                <div class="alert alert-danger error hidden" role="alert">
                    <span class="glyphicon glyphicon-exclamation-sign" aria-hidden="true"></span>
                    <span class="sr-only">Error:</span>
                </div>
                
                <input type="hidden" name="detalle" id="deta_id" value="<?=$deta_proc->deta_id?>">
                <input type="hidden" name="orden" id="orden" value="<?=$deta_proc->deta_orden?>">        
                <div class="form-group">
                    <?= form_label('Oficina', 'oficina', array('class' => 'col-sm-4 control-label')); ?>
                    <div class="col-sm-8"><?= form_dropdown('oficina', $oficina, $deta_proc->deta_ofic_id, array('class' => 'form-control', "id" => "oficina")); ?></div>
                </div>
                <div class="form-group">
                    <?= form_label('Plazo', 'plazo', array('class' => 'col-sm-4 control-label')); ?>
                    <div class="col-sm-8"><?= form_input(array("type" => "number","name" => "plazo", "value" => $deta_proc->deta_plazo, "class" => "form-control", "id" => "plazo")); ?></div>
                </div>  
                <div class="form-group">
                    <?= form_label('Activo', 'estado', array('class' => 'col-sm-4 control-label')); ?>
                    <div class="col-sm-8"><?= form_checkbox(array('name' => 'activo', 'value' => "", 'checked' => (($deta_proc->deta_activo == 'SI') ? TRUE : FALSE), 'id' => 'activo')); ?></div>
                </div>      
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">Cerrar</button>
                <button type="submit" class="btn btn-primary">Guardar</button>
            </div>
        </form>
    </div>
</div>

