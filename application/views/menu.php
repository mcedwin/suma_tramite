<nav class="navbar navbar-default navbar-fixed-top" role="navigation">
	<div class="container-fluid">
		<div class="navbar-header">
			<button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
				<span class="sr-only">Toggle navigation</span>
				<span class="icon-bar"></span>
				<span class="icon-bar"></span>
				<span class="icon-bar"></span>
			</button>

			<a class="navbar-brand" href="<?php echo base_url() ?>">
				<img class="logo" alt="Logo" src="<?php echo base_url() ?>assets/img/logo.png">
				<span>Tramite</span>
			</a>
			<div class="col-xs-6 hidden-xs">
				<form class="navbar-form pull-left" role="search" action="<?php echo base_url() ?>expedientes/consultar">
					<div class="input-group">
						<input type="text" class="form-control" placeholder="Documento" name="q">
						<div class="input-group-btn">
							<button class="btn btn-default" type="submit"><i class="glyphicon glyphicon-search"></i></button>
						</div>
					</div>
				</form>
				<h3 class="pull-left">
					<?php
					if ($this->session->userdata('authorized')) {
						echo $this->session->userdata('oficina');
						echo ' ('.$this->session->userdata('oficina_codigo').')';
						echo ' - '.$this->full_user->usua_nombres;
					}
					?>
				</h3>
			</div>
			<div class="col-xs-3 hidden-sm">
				<h3 class="pull-right">
					<span style="font-weight: 600;font-family: Arial,'Verdana'">PERIODO
						<?php
						if ($this->session->userdata('authorized')) {
							echo $this->mc_periodo;
						}
						?>
					</span>
				</h3>
			</div>
			<ul class="nav pull-right hidden-xs">
				<li class="dropdown pull-right">
					<a class="dropdown-toggle" data-toggle="dropdown" href="#">
						<i class="fa fa-user fa-fw"></i> <i class="fa fa-caret-down"></i>
					</a>
					<ul class="dropdown-menu dropdown-user">
						<li><a href="<?php echo base_url() ?>usuario/perfil" title="Editar Perfil" class="perfil"><i class="fa fa-user fa-fw"></i> Perfil del usuario</a></li>
						<!-- <li><a href="#"><i class="fa fa-gear fa-fw"></i> Configuraciones</a></li>-->
						<li class="divider"></li>
						<li><a href="<?php echo base_url() ?>login/salir"><i class="fa fa-sign-out fa-fw"></i> Salir del sistema</a></li>
					</ul>
				</li>
				<li class="dropdown pull-right">
					<a class="dropdown-toggle" data-toggle="dropdown" href="#">
						<i class="fa fa-bell fa-fw"></i> <i class="fa fa-caret-down"></i>
					</a>
					<ul class="dropdown-menu dropdown-alerts">
						<li>
							<a href="<?php echo base_url() ?>expedientes/recibidos?m=expedientes">
								<div class="a_porrecepcionar">
									<i class="fa fa-comment fa-fw"></i>
									<!-- <span class="text-muted small">4 minutes ago</span> -->
								</div>
							</a>
						</li>
						<li class="divider"></li>
						<li>
							<a href="<?php echo base_url() ?>expedientes/recibidos?m=expedientes">
								<div class="a_pendientes">
									<i class="fa fa-envelope fa-fw"></i>
									<!-- <span class="text-muted small">4 minutes ago</span> -->
								</div>
							</a>
						</li>
						<li class="divider"></li>
						<li>
							<a href="<?php echo base_url() ?>expedientes/recibidos?m=expedientes">
								<div class="a_conplazo">
									<i class="fa fa-tasks fa-fw"></i>
									<!-- <span class="text-muted small">4 minutes ago</span> -->
								</div>
							</a>
						</li>
						<li class="divider"></li>
						<li>
							<a href="<?php echo base_url() ?>expedientes/finalizados?m=expedientes">
								<div class="a_finalizados">
									<i class="fa fa-upload fa-fw"></i>
									<!-- <span class="text-muted small">4 minutes ago</span> -->
								</div>
							</a>
						</li>

					</ul>
				</li>

				<li class="dropdown pull-right">
					<a class="dropdown-toggle" data-toggle="dropdown" href="#">
						<i class="fa fa-envelope fa-fw"></i> <span class="badge badge-green contador"></span> <i class="fa fa-caret-down"></i>
					</a>
					<ul class="dropdown-menu dropdown-messages mensajes_noleidos">

					</ul>

				</li>
			</ul>
		</div>

	</div>

</nav>
<div class="sidebar">
	<div class="sidebar-nav navbar-collapse collapse">
		<ul class="menu" id="side-menu">
			<?php
			$menu = array(
				array(
					"name" => "Vista general",
					"class" => "fa fa-dashboard fa-fw",
					"url" => "",
					"menu" => array()
				),
				array(
					"name" => "Expedientes",
					"class" => "fa fa-folder-open-o fa-fw",
					"url" => "",
					"menu" => array(
						array("name" => "Internos", "module" => "expedientes", "method" => "internos", "url" => "expedientes/internos", "url2" => "expedientes/internos_form"),
						array("name" => "Externos", "module" => "expedientes", "method" => "externos", "url" => "expedientes/externos", "url2" => "expedientes/externos_form"),
						array("name" => "Recibidos", "module" => "expedientes", "method" => "recibidos", "url" => "expedientes/recibidos"),
						array("name" => "Derivados", "module" => "expedientes", "method" => "derivados", "url" => "expedientes/derivados"),
						array("name" => "Finalizados", "module" => "expedientes", "method" => "finalizados", "url" => "expedientes/finalizados"),
						array("name" => "Archivados", "module" => "expedientes", "method" => "archivados", "url" => "expedientes/archivados"),
					)
				),
				array(
					"name" => "Consultar",
					"class" => "fa fa-inbox fa-fw",
					"url" => "expedientes/consultar",
					"menu" => array()
				),
				array(
					"name" => "Reportes",
					"class" => "fa fa-bar-chart-o fa-fw",
					"url" => "",
					"menu" => array(
						array("name" => "Documentos Externos", "module" => "reportes", "method" => "documentos_externos", "url" => "reportes/documentos_externos"),
						array("name" => "Documentos Internos", "module" => "reportes", "method" => "documentos_internos", "url" => "reportes/documentos_internos"),
						array("name" => "Reporte Remitente", "module" => "reportes", "method" => "reporte_remitente", "url" => "reportes/reporte_remitente"),
					)
				),
				array(
					"name" => "Mensajes",
					"class" => "fa fa-comments-o fa-fw",
					"url" => "mensaje/inicio",
					"menu" => array()
				),
				array(
					"name" => "Plantillas",
					"class" => "fa fa-file-word-o fa-fw",
					"url" => "plantillas/inicio",
					"menu" => array()
				)

				

			);


			$extra = array(
				"name" => "Administración",
				"class" => "fa fa-wrench fa-fw",
				"url" => "",
				"menu" => array(
					array("url" => "oficina/inicio", "module" => "oficina", "method" => "inicio", "name" => "Oficinas"), array("url" => "usuario/inicio", "module" => "usuario", "method" => "inicio", "name" => "Usuarios"), array("url" => "plantillas/init", "module" => "plantillas", "method" => "init", "name" => "Plantillas Word"), array("url" => "documento/inicio", "module" => "documento", "method" => "inicio", "name" => "Tipos de documento"), array("url" => "remitentes/inicio", "module" => "remitentes", "method" => "inicio", "name" => "Remitentes"), array("url" => "procesos/inicio", "module" => "procesos", "method" => "inicio", "name" => "Procesos"), array("url" => "empresa/inicio", "module" => "empresa", "method" => "inicio", "name" => "Empresa"), array("url" => "backup/inicio", "module" => "backup", "method" => "inicio", "name" => "Backup")
				));
			if($this->session->userdata('authorizedadmin')) $menu[] = $extra;
			?>
			<?php
			foreach ($menu as $mid => $m) :
			?>
				<li>
					<a href="<?php echo base_url() . $m['url']; ?>#<?php echo $mid; ?>">
						<i class="<?php echo $m['class']; ?>"></i>
						<?php echo $m['name']; ?>
						<?php echo count($m['menu']) > 0 ? '<span class="fa arrow"></span>' : ''; ?>
					</a>
					<?php
					if (count($m['menu']) > 0) :
						echo '<ul class="nav nav-second-level collapse out">';
						foreach ($m['menu'] as $op) :

					?>
				<li>
					<a href="<?php echo base_url() . $op['url'] ?>#<?php echo $mid; ?>" class="<?php echo ($this->router->class == $op['module'] && $this->router->method == $op['method'] ? "active" : ""); ?>"><?php echo $op['name']; ?>
						<?php if (isset($op['url2'])) : ?>
							<span class="more fa fa-edit fa-fw" href="<?php echo base_url() . $op['url2'] ?>#<?php echo $mid; ?>" title="Crear"></span>
						<?php endif; ?>
					</a>
				</li>
		<?php endforeach;
						echo "</ul>";
					endif; ?>
		</li>
	<?php
			endforeach;
	?>

		</ul>
	</div>
</div>