$(document).on('ready', function () {

	cb(moment().subtract(6, 'days'), moment());
	$("#reportrange").daterange();


	var baseurl = $("#baseurl").val();
	var url = baseurl + 'expedientes/recibidos';
	var $table;
	var seleccionados;
	procesarFormulario = function (dlg) {
		$(dlg).find('form').submit(function () {
			$(dlg).find('.error').addClass('hidden')
			$(this).formPost(true, function (data) {
				if (data.exito == false) {
					$(dlg).find('.error').removeClass('hidden').html(data.mensaje);
				} else {
					dlg.modal('hide');
				}
				$table.draw();
			});
			return false;
		});
	};

	var $dt = $('#mitabla'),
		conf = {
			data_source: url + '?json=true',
			cactions: ".ocform",
			order: [[6, "desc"], [2, "asc"]],
			oncheck: function (row, data, selected) {
				if (selected.length > 0) {
					$('.onsel').removeClass('hidden');
					$('.nosel').addClass('hidden');
				} else {
					$('.onsel').addClass('hidden');
					$('.nosel').removeClass('hidden');
				}
				seleccionados = selected;
			},
			onrow: function (row, data) {

				//$(row).find('td:eq(1)').html("<a href=" + baseurl + "expedientes/seguir/" + data.DT_RowIdEx + " class='seguir btn btn-link btn-sm'>" + data.DT_RowIdEx + "</a>");

				if (data.Estado === 'PENDIENTE') {
					$(row).find('td .botones').html("<a href='#' class='recibir btn btn-success btn-sm'><strong>Recibir</strong></a>" +
						"<a href='#' class='rechazar btn btn-danger btn-sm'><strong>Rechazar</strong></a>");
					$(row).addClass("info");
				} else {
					$(row).find('td .botones').html("<a href=" + baseurl + "expedientes/derivar_expediente/" + data.DT_RowId + " class='derivar btn btn-primary btn-sm'><strong>Derivar</strong></a>" +
						"<a href='#' class='archivar btn btn-info btn-sm'><strong>Archivar</strong></a>" +
						"<a href=" + baseurl + "expedientes/finalizar_expediente/" + data.DT_RowId + " class='finalizar btn btn-warning btn-sm'><strong>Finalizar</strong></a>");
				}

				$(row).delegate(".recibir", "click", function (e) {
					$.confirm("Recibir expediente", function () {
						$.ajax({
							type: "POST",
							// dataType: "json",
							url: baseurl + "expedientes/recibir_expediente/" + data.DT_RowId,
							success: function (datas) {
								console.log(datas);
								$table.draw();
							}
						});
					});
					e.preventDefault();
				});
				$(row).delegate(".rechazar", "click", function (e) {
					$.confirm("Rechazar expediente", function () {
						$.ajax({
							type: "POST",
							url: baseurl + "expedientes/rechazar_expediente/" + data.DT_RowId,
							success: function (datas) {
								$table.draw();
							}
						});
					});

					e.preventDefault();
				});
				$(row).delegate(".finalizar", "click", function (e) {
					/*$.confirm("Finalizar expediente", function () {
						$.ajax({
						   type: "POST",
						   url:baseurl+"expedientes/finalizar_expediente/"+data.DT_RowId+"/"+data.DT_RowIdEx ,
						   success: function(datas)
						   {
							   $table.draw();
						   }
						 }); 
					});*/

					$(this).load_dialog({
						title: 'Finalizar expediente',
						width: 1000,
						loaded: function (dlg) {
							$(dlg).find('form').submit(function () {
								$(dlg).find('.error').addClass('hidden')
								$(this).formPost(true, function (data) {
									if (data.exito == false) {
										$(dlg).find('.error').removeClass('hidden').html(data.mensaje);
									} else {
										dlg.modal('hide');
									}
									$table.draw();
								});
								return false;
							});
						}
					});

					e.preventDefault();
				});
				$(row).delegate(".archivar", "click", function (e) {
					$.confirm("Archivar expediente", function () {
						$.ajax({
							type: "POST",
							url: baseurl + "expedientes/archivar_expediente/" + data.DT_RowId,
							success: function (datas) {
								$table.draw();
							}
						});
					});

					e.preventDefault();
				});
				$(row).delegate(".derivar", "click", function (e) {
					$(this).load_dialog({
						title: 'Derivar expediente',
						width: 1000,
						//script: baseurl + 'assets/js/procesos/form.js',
						loaded: function (dlg) {



							$('#oficina_destino').change(function () {
								$select = $(this);

								myloaddata(baseurl + 'expedientes/getUsers/' + $(this).val(), function (data) {
									
									html = '';
									$.each(data, function (oi, oitem) {
										html += '<option value="0"> + Responsable</option>';
										$.each(oitem.users, function (ui, uitem) {
											html += '<option value="' + uitem.usua_id + '">' + uitem.usua_apellidos + ' ' + uitem.usua_nombres + '</option>'
										})
										html += '<option value="-1">+ Todos los usuarios</option>';
									})

									$('#usuario_destino').html(html)
								})
							})




							$(dlg).find('form').submit(function () {
								$(dlg).find('.error').addClass('hidden')
								$(this).formPost(true, function (data) {
									if (data.exito == false) {
										$(dlg).find('.error').removeClass('hidden').html(data.mensaje);
									} else {
										dlg.modal('hide');
									}
									$table.draw();
								});
								return false;
							});
						}
					});

					e.preventDefault();
				});
				$(row).delegate(".seguir", "click", function (e) {
					$(this).load_dialog({
						title: 'Consulta de expediente',
						script: baseurl + 'assets/js/expedientes/imprimir.js',
						loaded: function (dlg) {
							$(dlg).find('form').submit(function () {
								return false;
							});
						}
					});

					e.preventDefault();
				});

			}
		};
	var buton = "<div class='botones'></div>";
	$table = $dt.load_simpleTable(conf, true, buton);
	$('.excel').click(function () {
		$.fileDownload(url + '?excel=true', {
			preparingMessageHtml: "Estamos Preparando el Reporte<br/> Por Favor Espere...",
			failMessageHtml: "Hubo un Error",
			httpMethod: "POST",
			data: $table.ajax.params()
		});
		return false;
	});
	$('.ocform').submit(function () {
		$table.draw();
		return false;
	})



});

