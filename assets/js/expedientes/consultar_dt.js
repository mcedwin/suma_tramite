$(document).on('ready', function () {

	
var baseurl = $("#baseurl").val();
var url = baseurl+'expedientes/consultar';
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
					$(row).find('td:eq(0)').html("<a href="+baseurl+"expedientes/seguir/"+data.Expediente+" class='seguir btn btn-link btn-sm'>"+data.Expediente+"</a>");
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
	$table = $dt.load_simpleTable(conf);

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

	$('.excel').click(function () {
		$.fileDownload(url+'?excel=true', {
			preparingMessageHtml: "Estamos Preparando el Reporte<br/> Por Favor Espere...",
			failMessageHtml: "Hubo un Error",
			httpMethod: "POST",
			data: $table.ajax.params()
		});
		return false;
	});

	$('a.borrar').click(function () {
		$this = $(this);
		$.confirm("¿Desea borrar los expedientess?", function () {
			$.gs_loader.show();
			$.post($this.attr("href"), {data: seleccionados}, function (sdata) {
				$.gs_loader.hide();
				jsoneval_sData(sdata, function () {
					$table.draw();
				});
			}, 'html');
		});
		return false;
	});

	var q = getUrlParameter("q");
	if(q!=''){
		$('#filtro').val(q);
		$('input[name="q"]').val(q);
		$('.ocform').submit();
	}
});
