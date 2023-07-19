
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
                <?php
                echo form_hidden('procesos', $procesos->proc_id);
                ?>

                <div class="form-group">
                    <?= form_label('Nombre', 'procesos', array('class' => 'col-sm-4 control-label')); ?>
                    <div class="col-sm-8"><?= form_input(array("name" => "nombre", "value" => $procesos->proc_nombre, "class" => "form-control")); ?></div>
                </div>
                <div class="form-group">
                    <?= form_label('Activo', 'estado', array('class' => 'col-sm-4 control-label')); ?>
                    <div class="col-sm-8"><?= form_checkbox(array('name' => 'activo', 'value' => '', 'checked' => (($procesos->proc_activo == 'SI') ? TRUE : FALSE))); ?>
                        <button type="submit" class="pull-right btn btn-primary">Guardar</button></div>
                </div>

                <div class="btn-group btn-group-justified" role="group" aria-label="...">
                    <div class="btn-group" role="group">
                        <button  id="areas" type="button" class="btn btn-default active">Areas involucradas</button>
                    </div>
                    <div class="btn-group" role="group">
                        <button id="requisitos" type="button" class="btn btn-default">Requisitos para el procedimiento</button>
                    </div>
                </div>
                <div id="area_deta" class="panel panel-default">
                    <div class="panel-body">

                        <a href='<?php echo base_url() ?>procesos/form_deta?proc_id=<?= $procesos->proc_id ?>' title="Agregar detalle" class=" agregard btn btn-default text-rigth" style="margin-bottom: 10px;">Agregar</a>
                        <br>
                        <table id="add" class="table">
                            <thead>
                                <th>Oficina</th><th>Orden</th><th>Plazo</th><th>Estado</th><th></th><th></th>
                            </thead>
                            <tbody class="cuerpo">
                                <?php
                                if (!empty($detalle)) {
                                    foreach ($detalle as $deta) {
                                        ?>
                                        <tr>
                                            <td><?= $deta->ofic_nombre ?></td>
                                            <td><?= $deta->deta_orden ?></td>
                                            <td><?= $deta->deta_plazo ?></td>
                                            <td><?= ($deta->deta_activo == 'SI') ? 'activo' : 'desactivo'; ?></td>
                                            <td><a id ="<?= $deta->deta_id ?>"  class="up" href="#">Arriba</a></td>
                                            <td><a id ="<?= $deta->deta_id ?>" class="down" href="#">Abajo</a></td>
                                            <td><a class="borrard" id="<?=$deta->deta_id?>" href="#">Borrar</a></td>
                                            <td><a class="editard" href="<?php echo base_url() ?>procesos/form_deta/<?= $deta->deta_id ?>">Editar</a></td>
                                        </tr>
                                        <?php
                                    }
                                }else{
                                ?>
                                <tr class="tmp"></tr>
                                <?php
                                }
                                ?>
                            </tbody>
                        </table>
                    </div>
                </div>

                <div id="requi_deta" class="panel panel-default">
                    <div class="panel-body">
                        <a href='<?php echo base_url() ?>procesos/form_requ?proc_id=<?= $procesos->proc_id ?>' title="Agregar Requisito" class=" agregarr btn btn-default text-rigth" style="margin-bottom: 10px;">Agregar</a>
                        <br>
                        <table id="adr" class="table">
                            <thead>
                                <th>Requisito</th><th>Estado</th><th></th><th></th>
                            </thead>
                            <tbody class="cuerpo">
                                <?php
                                if (!empty($requisitos)) {
                                    foreach ($requisitos as $requ) {
                                        ?>
                                        <tr>
                                            <td><?= $requ->requ_nombre ?></td>
                                            <td><?= ($requ->requ_activo == 'SI') ? 'activo' : 'desactivo'; ?></td>
                                            <td><a class="borrarr" id="<?=$requ->requ_id?>" href="#">Borrar</a></td>
                                            <td><a class="editarr" href="<?php echo base_url() ?>procesos/form_requ/<?= $requ->requ_id ?>">Editar</a></td>
                                        </tr>
                                        <?php
                                    }
                                }else{
                                ?>
                                <tr class="tmp"></tr>
                                <?php
                                }
                                ?>
                            </tbody>
                        </table>
                    </div>
                </div>

            </div>
            <div class="modal-footer">
                <!--<button type="button" class="btn btn-default" data-dismiss="modal">Cerrar</button>-->
            </div>
        </form>
    </div>
</div>
