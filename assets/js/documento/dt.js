$(document).on('ready', function () {
var baseurl = $("#baseurl").val();
var url = baseurl+'documento/inicio';
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
					$(row).find('td.edit').addClass('hand')
					$(row).find('td.edit').click(function () {
						$(this).load_dialog({
							title: 'Editar documento',
							custom_url: baseurl+'documento/form/' + data.DT_RowId,
							script: baseurl+'assets/js/documento/form.js',
							loaded: procesarFormulario
						});
					})
				}
			};

	$table = $dt.load_simpleTable(conf,true);
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

	$('.crear').click(function () {
		$(this).load_dialog({
			title: $(this).attr('title'),
			script: baseurl+'assets/js/documento/form.js',
			loaded: procesarFormulario
		});
		// alert("hola");
		return false;
	});

	$('a.borrar').click(function () {
		$this = $(this);
		$.confirm("¿Desea borrar los oficinas?", function () {
			$.gs_loader.show();
			$.post($this.attr("href"), {data: seleccionados}, function (sdata) {
				$.gs_loader.hide();
				datos = jQuery.parseJSON(sdata);
				// console.log(datos);
				// console.log(datos.exito);
				if(datos.mensaje==false){
					jsoneval_sData(sdata, function () {
						$table.draw();
					});
				}else{
					$.confirm(datos.mensaje, function () {
						$table.draw();
					});
				}
			}, 'html');
		});
		return false;
		$table.draw();
	});
});
