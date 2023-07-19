<div id="page-wrapper" >
	<div class="page-header col-md-12">
		<div class="row page-header-title">
			<div class="col-sm-6">
				<h3>Mensajes</h3>
			</div>
		</div>
	</div>
	<?php //var_dump($usuarios); ?>
	<div class="col-sm-4">
		<div class="panel panel-default">
            <div class="panel-heading">
                <i class="fa fa-bell fa-fw"></i> Usuario(oficina)
            </div>
            <div class="panel-body">
                <div class="list-group">
                	<?php foreach ($usuarios as $value):
                        $icon = "fa-envelope-o";
                        if($value->mens_leido=="NO"){
                           $icon = "fa-envelope"; 
                        }
                        $habilitado="habilitado";
                        if($value->usua_estado==0){
                            $habilitado="deshabilitado";
                        }
                	?> 
                        <a href="<?=$value->usua_id?>" class="list-group-item usuario usuario-<?=$value->usua_id?>">
                                <i class="fa <?=$icon ?> fa-fw"></i><?=$value->usua_nombres." ".$value->usua_apellidos."(".$value->ofic_nombre.")"; ?>
                                <span class="pull-right  small"><em><?=$habilitado ?></em>
                                </span>
                        </a>
					<?php endforeach;?>
                </div>
            </div>
        </div>
	</div>

	<!-- <div class="col-sm-6">
		<div class="panel panel-default">
            <div class="panel-heading">
                <i class="fa fa-comments fa-fw"></i>
                Mensajes
                <div class="btn-group pull-right">
                 <span id="mens_dest"></span>
                </div>
            </div>
            <div class="panel-footer">
                <form id="mensaje_form" enctype="multipart/form-data" method="post">
                    <div class="input-group">
                             <span class="input-group-btn">
                                <span class="file-input btn btn-default btn-file">
                                    Archivo<input type="file" name="archivo">
                                </span>
                            </span>
                                <input type="text" name="mensaje" class="form-control" placeholder="Escribir mensaje ...">
                                <input type="hidden" name="oficina" id="ofic" value="">
                                <input type="hidden" name="usuario" id="usua" value="">
                            <span class="input-group-btn">
                                <button class="btn btn-primary btn-sm" type="submit">
                                    Enviar
                                </button>
                            </span>
                    </div>
                    <div class="input-group" id="archivo-adjunto">
                    </div>
                </form>
            </div>
            <div class="panel-body">
                <ul class="chat" id="mensajes" style="list-style: none">
                </ul>
            </div>
           
        </div>
	</div> -->

    <div class="col-sm-8">
    <style>
        .msg_container_base{
          background: #e5e5e5;
          margin: 0;
          padding: 0 10px 10px;
          max-height:300px;
          overflow-x:hidden;
        }
        .top-bar {
          background: #666;
          color: white;
          padding: 10px;
          position: relative;
          overflow: hidden;
        }
        .msg_receive{
            padding-left:0;
            margin-left:0;
        }
        .msg_sent{
            padding-bottom:20px !important;
            margin-right:0;
        }
        .messages {
          background: white;
          padding: 10px;
          border-radius: 2px;
          box-shadow: 0 1px 2px rgba(0, 0, 0, 0.2);
          max-width:100%;
        }
        .messages > p {
            font-size: 13px;
            margin: 0 0 0.2rem 0;
          }
        .messages > time {
            font-size: 11px;
            color: #ccc;
        }
        .msg_container {
            padding: 10px;
            overflow: hidden;
            display: flex;
        }
        .avatar {
            position: relative;
        }
        .base_receive > .avatar:after {
            content: "";
            position: absolute;
            top: 0;
            right: 0;
            width: 0;
            height: 0;
            border: 5px solid #FFF;
            border-left-color: rgba(0, 0, 0, 0);
            border-bottom-color: rgba(0, 0, 0, 0);
        }

        .base_sent {
          justify-content: flex-end;
          align-items: flex-end;
        }
        .base_sent > .avatar:after {
            content: "";
            position: absolute;
            bottom: 0;
            left: 0;
            width: 0;
            height: 0;
            border: 5px solid white;
            border-right-color: transparent;
            border-top-color: transparent;
            box-shadow: 1px 1px 2px rgba(black, 0.2); // not quite perfect but close
        }

        .msg_sent > time{
            float: right;
        }



        .msg_container_base::-webkit-scrollbar-track
        {
            -webkit-box-shadow: inset 0 0 6px rgba(0,0,0,0.3);
            background-color: #F5F5F5;
        }

        .msg_container_base::-webkit-scrollbar
        {
            width: 12px;
            background-color: #F5F5F5;
        }

        .msg_container_base::-webkit-scrollbar-thumb
        {
            -webkit-box-shadow: inset 0 0 6px rgba(0,0,0,.3);
            background-color: #555;
        }

        div.nombre{
            background: #a0c3ff;
            width: 50px !important;
            height: 50px !important;
            border-radius: 50%;
           /* border-top-right-radius: 50%;
            border-top-left-radius: 50%;
            border-bottom-right-radius: 50%;*/
            position: relative;
            font-size: 25px;
        }
        .nombre span{
            color:white;
            position:absolute;
            right: 8px;
            bottom: 6px;
           /* left: 0;
            top:0;*/
        }

    </style>
            <div class="row">
                <div class="col-xs-12 col-md-12">
                    <div class="panel panel-default">
                        <div class="panel-heading top-bar">
                             <i class="fa fa-comments fa-fw"></i>
                                Mensajes
                                <div class="btn-group pull-right">
                                 <span id="mens_dest"></span>
                                </div>
                        </div>
                         <div class="panel-footer">
                            <form id="mensaje_form" enctype="multipart/form-data" method="post">
                                <div class="input-group">
                                    <span class="input-group-btn">
                                        <span class="file-input btn btn-danger btn-file btn-sm">
                                        <i class="fa fa-paperclip"></i><input type="file" name="archivo" alt="archivo adjunto">
                                        </span>
                                    </span>

                                    <input type="text" name="mensaje" class="form-control chat_input" placeholder="Escribe tu mensaje..." />
                                    <input type="hidden" name="oficina" id="ofic" value="">
                                    <input type="hidden" name="usuario" id="usua" value="">
                                    <span class="input-group-btn">
                                        <button class="btn btn-primary btn-sm"  type="submit">Enviar</button>
                                    </span>
                                </div>
                            </form>
                            <div class="input-group" id="archivo-adjunto">
                            </div>
                        </div>
                        <div class="panel-body msg_container_base" id="mensajes">
                        </div>
                       
                    </div>
                </div>
            </div>
            
    </div>
</div>
