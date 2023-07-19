$(document).on('ready', function () {
	var baseurl = $("#baseurl").val();
	var url = baseurl + 'oficina/inicio';
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

	function verOpciones(bool) {
		if (bool > 0) {
			$('.onsel').removeClass('hidden');
			$('.nosel').addClass('hidden');
		} else {
			$('.onsel').addClass('hidden');
			$('.nosel').removeClass('hidden');
		}
	}

	var $dt = $('#mitabla'),
		conf = {
			data_source: url + '?json=true',
			cactions: ".ocform",
			order: [[1, "desc"]],
			oncheck: function (row, data, selected) {
				verOpciones(selected.length > 0);
				seleccionados = selected;
			},
			onrow: function (row, data, selected) {
				verOpciones(selected.length > 0);
				$(row).find('td.edit').addClass('hand')
				$(row).find('td.edit').click(function () {
					$(this).load_dialog({
						title: 'Editar oficina',
						custom_url: baseurl + 'oficina/form/' + data.DT_RowId,
						loaded: procesarFormulario
					});
				})


			}
		};


	

	$table = $dt.load_simpleTable(conf, true);
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

	$('.crear').click(function () {
		$(this).load_dialog({
			title: $(this).attr('title'),
			loaded: procesarFormulario
		});
		return false;
	});

	$('a.borrar').click(function () {
		$this = $(this);
		$.confirm("¿Desea borrar las oficinas?", function () {
			$.gs_loader.show();
			$.post($this.attr("href"), { data: seleccionados }, function (sdata) {
				$.gs_loader.hide();
				datos = jQuery.parseJSON(sdata);
				// console.log(datos);
				// console.log(datos.exito);
				if (datos.mensaje == false) {
					jsoneval_sData(sdata, function () {
						seleccionados.splice(0, seleccionados.length)
						$table.draw();
					});
				} else {
					$.confirm(datos.mensaje, function () {
						seleccionados.splice(0, seleccionados.length)
						$table.draw();
					});
				}
			}, 'html');
		});
		return false;
		$table.draw();
	});
});
