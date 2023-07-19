
<div class="modal-dialog" role="document">
    <div class="modal-content">
        <form class="form-horizontal" action="<?= base_url() ?>procesos/guardar" method="post">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                <h4 class="modal-title" id="gridSystemModalLabel"></h4>
            </div>
            <div class="modal-body">
                <div class="alert alert-danger error hidden" role="alert">
                    <span class="glyphicon glyphicon-exclamation-sign" aria-hidden="true"></span>
                    <span class="sr-only">Error:</span>
                </div>

                <div class="form-group">
                    <?= form_label('Nombre', 'nombre', array('class' => 'col-sm-4 control-label')); ?>
                    <div class="col-sm-8"><?= form_input(array("name" => "nombre", "value" => '', "class" => "form-control")); ?></div>
                </div>
                <div class="form-group">
                    <?= form_label('Activo', 'estado', array('class' => 'col-sm-4 control-label')); ?>
                    <div class="col-sm-8"><?= form_checkbox(array('name' => 'activo', 'value' => 'SI', 'checked' => true)); ?>
                        <button id="agre" type="submit" class="pull-right btn btn-primary">Guardar</button></div>

                </div>

            </div>
            <div class="modal-footer">

                <div id="element" style="display: none">
                    <div class="btn-group btn-group-justified" role="group" aria-label="...">
                        <div class="btn-group" role="group">
                            <button id="areas" type="button" class="btn btn-default active">Areas involucradas</button>
                        </div>
                        <div class="btn-group" role="group">
                            <button id="requisitos" type="button" class="btn btn-default">Requisitos para el procedimiento</button>
                        </div>
                    </div>

                    <div id="area_deta" class="panel panel-default">
                        <div class="panel-body">

                            <a id="refidd" href='' title="Agregar detalle" class=" agregard pull-left btn btn-default text-rigth" style="margin-bottom: 10px;">Agregar</a>


                            <table id="add" class="table">
                                <thead>
                                    <th>Oficina</th><th>Orden</th><th>Plazo</th><th>Estado</th><th></th><th></th><th></th><th></th>
                                </thead>
                                <tbody class="cuerpo">
                                    
                                </tbody>
                            </table>
                        </div>
                    </div>

                    <div id="requi_deta" class="panel panel-default">
                        <div class="panel-body">

                            <a id="refidr" href='' title="Agregar detalle" class=" agregarr pull-left btn btn-default text-rigth" style="margin-bottom: 10px;">Agregar</a>


                            <table id="adr" class="table">
                                <thead>
                                    <th>Requisito</th><th>Estado</th><th></th><th></th>
                                </thead>
                                <tbody class="cuerpo">
                                    
                                </tbody>
                            </table>
                        </div>
                    </div>

                </div>
            </div>

        </form>
    </div>
</div>