<div id="page-wrapper">

	<div class="page-header col-md-12">
		<div class="row page-header-title">
			<div class="col-sm-12">
				<h3>Vista general</h3>
			</div>
		</div>
	</div>
<div class="page-content">
	<div class="col-md-12">
		<br>
	<div class="panel panel-default">
        <div class="panel-heading">
            Expedientes con plazo
        </div>
        <div class="panel-body">
            <?php  echo $this->framework->genDataTable('mitabla', $columns, false,true); ?>
        </div>
    </div>
		<div class="row">
			<!-- <div class="col-lg-3 col-md-6">
				<div class="panel panel-primary">
					<div class="panel-heading">
						<div class="row">
							<div class="col-xs-3">
								<i class="fa fa-comments fa-5x"></i>
							</div>
							<div class="col-xs-9 text-right">
								<div class="huge">26</div>
								<div>New Comments!</div>
							</div>
						</div>
					</div>
					<a href="#">
						<div class="panel-footer">
							<span class="pull-left">View Details</span>
							<span class="pull-right"><i class="fa fa-arrow-circle-right"></i></span>
							<div class="clearfix"></div>
						</div>
					</a>
				</div>
			</div>
			<div class="col-lg-3 col-md-6">
				<div class="panel panel-success">
					<div class="panel-heading">
						<div class="row">
							<div class="col-xs-3">
								<i class="fa fa-tasks fa-5x"></i>
							</div>
							<div class="col-xs-9 text-right">
								<div class="huge">12</div>
								<div>New Tasks!</div>
							</div>
						</div>
					</div>
					<a href="#">
						<div class="panel-footer">
							<span class="pull-left">View Details</span>
							<span class="pull-right"><i class="fa fa-arrow-circle-right"></i></span>
							<div class="clearfix"></div>
						</div>
					</a>
				</div>
			</div>
			<div class="col-lg-3 col-md-6">
				<div class="panel panel-warning">
					<div class="panel-heading">
						<div class="row">
							<div class="col-xs-3">
								<i class="fa fa-shopping-cart fa-5x"></i>
							</div>
							<div class="col-xs-9 text-right">
								<div class="huge">124</div>
								<div>New Orders!</div>
							</div>
						</div>
					</div>
					<a href="#">
						<div class="panel-footer">
							<span class="pull-left">View Details</span>
							<span class="pull-right"><i class="fa fa-arrow-circle-right"></i></span>
							<div class="clearfix"></div>
						</div>
					</a>
				</div>
			</div>
			<div class="col-lg-3 col-md-6">
				<div class="panel panel-danger">
					<div class="panel-heading">
						<div class="row">
							<div class="col-xs-3">
								<i class="fa fa-support fa-5x"></i>
							</div>
							<div class="col-xs-9 text-right">
								<div class="huge">13</div>
								<div>Support Tickets!</div>
							</div>
						</div>
					</div>
					<a href="#">
						<div class="panel-footer">
							<span class="pull-left">View Details</span>
							<span class="pull-right"><i class="fa fa-arrow-circle-right"></i></span>
							<div class="clearfix"></div>
						</div>
					</a>
				</div>
			</div> -->

			<div class="col-lg-6">
                <div class="panel panel-default">
                    <div class="panel-heading">
                        Expedientes Externos Hoy
                    </div>
                    <div class="panel-body">
                        <div class="flot-chart">
                            <div class="flot-chart-content" id="expedientes-externos-hoy"></div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-lg-6">
                <div class="panel panel-default">
                    <div class="panel-heading">
                        Expedientes internos Hoy
                    </div>
                    <div class="panel-body">
                        <div class="flot-chart">
                            <div class="flot-chart-content" id="expedientes-internos-hoy"></div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-lg-6">
                <div class="panel panel-default">
                    <div class="panel-heading">
                        Expedientes Externos Todo
                    </div>
                    <div class="panel-body">
                        <div class="flot-chart">
                            <div class="flot-chart-content" id="expedientes-externos-todo"></div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-lg-6">
                <div class="panel panel-default">
                    <div class="panel-heading">
                        Expedientes Internos Todo
                    </div>
                    <div class="panel-body">
                        <div class="flot-chart">
                            <div class="flot-chart-content" id="expedientes-internos-todo"></div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-lg-6">
                <div class="panel panel-default">
                    <div class="panel-heading">
                        Expedientes Internos
                    </div>
                    <div class="panel-body">
                        <div class="flot-chart">
                            <div class="flot-chart-content" id="expedientes-internos"></div>
                        </div>
                    </div>
                </div>
            </div>


		</div>
</div>
</div>
</div>