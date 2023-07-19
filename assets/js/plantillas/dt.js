$(document).on('ready', function () {
var baseurl = $("#baseurl").val();
var url = baseurl+'plantillas/inicio?json=true';
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
				data_source: url,
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
					$(row).delegate(".seguir","click",function(e){
						$(this).load_dialog({
				            title:'Consulta de expediente',
				            //script: baseurl + 'assets/js/procesos/form.js',
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

	$table = $dt.load_simpleTable(conf);
	$('.ocform').submit(function () {
		$table.draw();
		return false;
	})

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
