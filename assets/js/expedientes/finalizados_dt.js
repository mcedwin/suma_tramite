$(document).on('ready', function () {

	$("#reportrange").daterange();
	cb(moment().subtract(6, 'days'), moment());

var baseurl = $("#baseurl").val();
var url = baseurl+'expedientes/finalizados';
var $table;
var seleccionados;
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
					//$(row).find('td:eq(0)').html("<a href="+baseurl+"expedientes/seguir/"+data.DT_RowIdEx+" class='seguir btn btn-link btn-sm'>"+data.DT_RowIdEx+"</a>");
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

	$table = $dt.load_simpleTable(conf);
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
