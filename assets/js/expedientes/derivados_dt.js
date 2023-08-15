$(document).on('ready', function () {

	$("#reportrange").daterange();
	cb(moment().subtract(6, 'days'), moment());
	
var baseurl = $("#baseurl").val();
var url = baseurl+'expedientes/derivados';
var $table;
var seleccionados;

	var $dt = $('#mitabla'),
			conf = {
				data_source: url+'?json=true',
				cactions: ".ocform",
				order: [[ 1, "desc" ]],
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
					//$(row).find('td:eq(1)').html("<a href="+baseurl+"expedientes/seguir/"+data.DT_RowIdEx+" class='seguir btn btn-link btn-sm'>"+data.DT_RowIdEx+"</a>");
					$(row).find('td .botones').html("<a href='"+baseurl+"expedientes/derivar_expediente/"+data.DT_RowId+"' class='derivar btn btn-primary btn-sm'>Derivar</a>");

					/*$(row).delegate(".enviar","click",function(e){
						$(this).load_dialog({
				            title:'Enviar expediente',
				            width:1000,
				            //script: baseurl + 'assets/js/procesos/form.js',
				            loaded: function(dlg) {
							        $(dlg).find('form').submit(function() {
							            $(dlg).find('.error').addClass('hidden')
							            $(this).formPost(true, function(data) {
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
					});*/

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
											html += '';
											$.each(oitem.users, function (ui, uitem) {
												html += '<option value="' + uitem.usua_id + '">' + uitem.usua_apellidos + ' ' + uitem.usua_nombres + ' '+ uitem.responsable  +  '</option>'
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

					$(row).delegate(".seguir","click",function(e){
						$(this).load_dialog({
				            title:'Consulta de expediente',
				            script: baseurl + 'assets/js/expedientes/imprimir.js',
				            loaded: function(dlg) {
							        $(dlg).find('form').submit(function() {
							            return false;
							        });
							    }
				        });
						
						e.preventDefault();
					})
				}
			};

	var buton = "<div class='botones'></div>";
	$table = $dt.load_simpleTable(conf,true,buton);
        $('.excel').click(function () {
		$.fileDownload(url+'?excel=true', {
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
