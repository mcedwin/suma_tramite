$.ajaxSetup({
	cache: true
});
$(function () {
	$.gs_loader = $('<div>').hide();
	$.gs_loader.append($('<div>', {
		'class': 'ui-widget-overlay',
		'style': 'z-index:9998'
	})).append = ($('<div>').html('<img src="'+baseurl.value+'assets/img/cubo-loader.gif"/>').css({
		'position': 'fixed',
		'font': 'bold 12px Verdana, Arial, Helvetica, sans-serif',
		'left': '50%',
		'top': '50%',
		'z-index': '9999',
		'margin-left': '-32px',
		'margin-top': '-32px'
	})).appendTo($.gs_loader);
	$.gs_loader.appendTo($('body'));
});

var inLoad = function () {
	var $loader = $(document.createElement('div'));
	$loader.attr('id', 'divLI').text('Cargando...').css({
		'position': 'fixed',
		'padding': '4px 8px',
		'background': '#F9FBB3',
		'color': '#034E85',
		'font': 'bold 12px Verdana, Arial, Helvetica, sans-serif',
		'left': '50%',
		'left': ($(window).width() - 138) / 2 + 'px',
				'top': 0,
		'z-index': '9999'
	});
	$(window).resize(function () {
		$loader.css({
			'left': ($(window).width() - 138) / 2 + 'px'
		});
	});
	$('body').append($loader);
	$loader.hide();

	this.mostrar = function () {
		$loader.show();
		$("body").append('<div id="overlayy" class="ui-widget-overlay" style="z-index: 9998;"></div>');
	}
	this.ocultar = function () {
		$loader.hide();
		$("#overlayy").remove();
	}
}
var loading = new inLoad();

(function ($) {
	$.fn.inputInt = function () {
		$(this).css('text-align', 'right').keypress(function (e) {
			var key = e.which;
			if (key != 8 && key != 0 && !(key >= 48 && key <= 57))
				e.preventDefault();
		});
	}
	$.fn.inputFloat = function () {
		$(this).css('text-align', 'right').keypress(function (e) {

			var key = e.which;
			if (key == 46) {
				if ($(this).val().indexOf('.') != -1)
					e.preventDefault();
			} else if (key != 8 && key != 45 && key != 0 && !(key >= 48 && key <= 57))
				e.preventDefault();
		}).blur(function () {
			if ($(this).val() != '') {
				$(this).val((Math.round(parseFloat($(this).val()) * 100) / 100).toFixed(2));
			}
		});
	}
})(jQuery);


function IsJsonStr(str) {
	try {
		var result = $.parseJSON(str);
	} catch (e) {
		return false;
	}
	return result;
}

function jsoneval_sData(data, callbackfn, eval) {
	if (!(data && (data = IsJsonStr(data)))) {
		data = {};
		data.mensaje = 'Error al recuperar datos del servidor';
		data.exito = false;
	}
	if (typeof callbackfn == 'function') {
		callbackfn.call(this, data);
	}
}

var getScript = jQuery.getScript;
jQuery.getScriptA = function( resources, callback ){
	var scripts = [];
	
	if(typeof(resources) === 'string') {scripts.push(resources)}
	else {scripts = resources;}
	
    var length = scripts.length,
		handler = function() {counter++;},
		deferreds = [],
		counter = 0,
		idx = 0;

	$.ajaxSetup({async:false});
    for ( ; idx < length; idx++ ) {
        deferreds.push(
            getScript( scripts[ idx ], handler )
        );
    }

    jQuery.when.apply( null, deferreds ).then(function() {
        callback();
    });
};

(function ($) {
	$.fn.serializeJSON = function (obj) {
		var json = {};
		if (typeof (obj) != 'undefined')
			for (var k in obj)
				json[obj[k]] = [];
		$.each($(this).serializeArray(), function () {
			if (typeof (json[this.name]) == 'undefined')
				json[this.name] = this.value;
			else if (typeof (json[this.name]) == 'object')
				json[this.name].push(this.value);
		});
		return json;
	};

	$.fn.nextFocus = function () {
		$(this).bind("keydown", function (e) {
			var key = e.charCode ? e.charCode : e.keyCode ? e.keyCode : 0;
			if (key == 13) {
				e.preventDefault();
				var inputs = $(this).closest('form').find(':input[type=text]:visible');
				inputs.eq(inputs.index(this) + 1).focus();
			}
		});
	}
})(jQuery);

(function ($) {
	$.fn.load_dialog = function (config) {
		var $contenedor;
		if (config.content !== undefined)
			$contenedor = config.content.appendTo($('body'));
		else
			$contenedor = $('<div class="modal fade" tabindex="-1">').appendTo($('body'));
		var set_dialog = function () {
			var ftmp = config.close;
			config.close = function () {
				if (ftmp !== undefined)
					ftmp();
				$contenedor.remove();
			}
			$contenedor.find('.modal-title').text(config.title);
			$contenedor.modal({'show':true,backdrop: 'static'});
			$contenedor.on('hidden.bs.modal', function (e) {
				$contenedor.remove();
			})
			$.gs_loader.hide();
			if (config.loaded !== undefined)
				config.loaded($contenedor);
		}
		$.gs_loader.show();
		var url = $(this).attr('href');
		if (config.custom_url !== undefined)
			url = config.custom_url;
		if (url !== undefined) {
			$contenedor.load(url, config.data, function () {
				if (typeof (config.script) != 'undefined')
					$.getScriptA(config.script, set_dialog);
				else
					set_dialog();
			});
		} else {
			if (typeof (config.script) != 'undefined')
				$.getScriptA(config.script, set_dialog);
			else
				set_dialog();
		}
		return $contenedor;
	}
})(jQuery);

(function ($) {
	$.fn.getSerial = function (diselse, array) {
		var serial;
		if (diselse) {
			var backup = [];
			$(':disabled[name]', this).each(function () {
				$(this).attr("disabled", false);
				backup.push($(this));
			});
			if (typeof (array) == 'undefined')
				serial = this.serialize();  //serializar form
			else
				serial = this.serializeArray();

			$.each(backup, function () {
				this.attr("disabled", true);
			});
		} else {
			if (typeof (array) == 'undefined')
				serial = this.serialize();
			else
				serial = this.serializeArray();
		}
		return serial;
	}
	$.fn.formPost = function (diselse, objdata, callbackfn) {
		if (typeof (objdata) == 'function') {
			callbackfn = objdata;
			objdata = {};
		}
		$.gs_loader.show();
		var serial = $(this).getSerial(diselse);
		serial = serial + '&' + $.param(objdata);
		var formData = new FormData($(this)[0]);
		/*$.post(this.attr('action'), formData, function (data) {
			$.gs_loader.hide();
			jsoneval_sData(data, callbackfn);
		}, 'html');*/
		
		$.ajax({
                url: this.attr('action'),
                type: "post",
                dataType: "html",
                data: formData,
                cache: false,
                contentType: false,
                processData: false,
                success: function(data)
                {
					$.gs_loader.hide();
					jsoneval_sData(data, callbackfn);
                }
              });
		
		return false;
	}
})(jQuery);

(function ($) {
	jQuery.fn.evalLink = function (pregunta, callbackfn) {
		$this = $(this);
		$.confirm(pregunta, function () {
			$.gs_loader.show();
			$.post($this.attr("href"), function (sdata) {
				$.gs_loader.hide();
				jsoneval_sData(sdata, function () {
					if (typeof callbackfn == 'function') {
						callbackfn.call(this, sdata);
					}
				});
			}, 'html');
		});
	}
})(jQuery);




(function ($) {
	var selected = [];
	$.fn.load_simpleTable = function (config,buton=false,bot='') {
		var $table = $(this);
		var wch = $table.attr('wch');

		var cols = Array();
		if(buton==true){
			if (wch) {
				cols.push({
					"data": null,
					"orderable": false,
					"width": "30",
					'render': function (data, type, full, meta) {
						if(bot!=''){
							return bot;
						}else{
							return '<input type="checkbox">';
						}
					}
				})
			}
		}

		
		$table.find('tr .ths').each(function (i, item) {
			cols.push({"data": $(item).text(),className: "edit"});
		})

		var table_config = {
			"processing": true,
			"serverSide": true,
			"order": config.order,
			"ajax": {
				"url": config.data_source,
				"type": "POST",
				"data":function(data) {
					return $.extend(data,$(''+config.cactions).serializeJSON());
				}
			},
			"rowCallback": function (row, data) {
				if (wch) {
					/*var no = false;
					$(row).find('td:first-child input[type=checkbox]').on("mouseover focus",function(e){
						no = true;
					});
					$(row).find('td:first-child input[type=checkbox]').on("mouseout blur",function(e){
						no = false;
					});
					$(row).find('td:first-child').on("click",function(e){
						if(no==true) e.stopPropagation();
					})*/
					$(row).find('input[type=checkbox]').change(function (e,a) {
						var index = $.inArray(data.DT_RowId, selected);
						if (index === -1) {
							selected.push(data.DT_RowId);
						} else {
							selected.splice(index, 1);
						}
						$(row).toggleClass('selected');
						config.oncheck.call(this,row, data,selected);
						e.preventDefault();
						e.stopPropagation();
					})
					if ($.inArray(data.DT_RowId, selected) !== -1) {
						$(row).addClass('selected').find('input[type=checkbox]').prop("checked", true);
					}
				}
				if (typeof config.onrow == 'function') {
					config.onrow.call(this,row, data, selected);
				}
			},
			"lengthChange": false,
			"searching": false,
			"columns": cols,
		};
		var table = $table.DataTable(table_config)
		return table;
	};

})(jQuery);
function cb(start, end,id) {
	$('#reportrange span').html(start.format('D/MM/YYYY') + ' - ' + end.format('D/MM/YYYY'));
	//console.log($("#reportrange").data('daterangepicker'))
  	$("input[name='fecha_ini']").val($("#reportrange").data('daterangepicker').startDate.format('YYYY-MM-DD')+" 00:00:00");
	$("input[name='fecha_fin']").val($("#reportrange").data('daterangepicker').endDate.format('YYYY-MM-DD')+" 23:59:59");
}
// cb(moment(), moment());

(function ($) {
	$.fn.daterange = function () {

		var $date = $(this);

		var date_config = {
			"startDate": moment().subtract(6, 'days'),
    		"endDate": moment(),
			locale: { cancelLabel: 'Cancelar',applyLabel: 'Aplicar' },
	        ranges: {
	           'Hoy': [moment(), moment()],
	           'Ayer': [moment().subtract(1, 'days'), moment().subtract(1, 'days')],
	           'Anteriores 7 Dias': [moment().subtract(6, 'days'), moment()],
	           'Anteriores 30 Dias': [moment().subtract(29, 'days'), moment()],
	           'Este Mes': [moment().startOf('month'), moment().endOf('month')],
	           'Anterior Mes': [moment().subtract(1, 'month').startOf('month'), moment().subtract(1, 'month').endOf('month')],
	           'Este Año': [moment().subtract('year').startOf('year'), moment()]
	        }
	    };
		var date = $date.daterangepicker(date_config,cb);
		return date;
	};

})(jQuery);


var diag = '<div class="modal fade" tabindex="-1">'
	+'<div class="modal-dialog modal-sm" role="document">'
	+'	<div class="modal-content">'
	+'		<div class="modal-header">'
	+'			<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>'
	+'			<h4 class="modal-title" id="myModalLabel">Reporte</h4>'
	+'		</div>'
	+'		<div class="modal-body">'
	+'			...'
	+'		</div>'
	+'	</div>'
	+'</div>'
	+'</div>';


(function ($) {
	
	var aa = '<div class="modal fade" tabindex="-1">'
	+'<div class="modal-dialog modal-sm" role="document">'
	+'	<div class="modal-content">'
	+'		<div class="modal-header">'
	+'			<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>'
	+'			<h4 class="modal-title" id="myModalLabel">Alerta</h4>'
	+'		</div>'
	+'		<div class="modal-body">'
	+'			...'
	+'		</div>'
	+'		<div class="modal-footer">'
	+'			<button type="button" class="btn btn-default" data-dismiss="modal">Cerrar</button>'
	+'		</div>'
	+'	</div>'
	+'</div>'
	+'</div>';
	
	var ab = '<div class="modal fade" tabindex="-1">'
	+'<div class="modal-dialog modal-sm" role="document">'
	+'	<div class="modal-content">'
	+'		<div class="modal-header">'
	+'			<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>'
	+'			<h4 class="modal-title" id="myModalLabel">Confirmar</h4>'
	+'		</div>'
	+'		<div class="modal-body">'
	+'			...'
	+'		</div>'
	+'		<div class="modal-footer">'
	+'			<button type="button" class="btn btn-default" data-dismiss="modal">Cancelar</button>'
	+'			<button type="button" class="btn btn-primary">Aceptar</button>'
	+'		</div>'
	+'	</div>'
	+'</div>'
	+'</div>';
	
	
	$.alert = function (content) {
		var $container = $(aa);
		$container.find('.modal-body').html(content);
		$container.appendTo($('body')).find('.modal-body').html(content);
		$container.modal({'show':true,backdrop: 'static'});
		$container.on('hidden.bs.modal', function (e) {
			$container.remove();
		})
	}
	$.confirm = function (content, accept, cancel) {
		var $container = $(ab);
		$container.find('.modal-body').html(content);
		$container.appendTo($('body')).find('.modal-body').html(content);
		$container.modal({'show':true,backdrop: 'static'});
		$container.on('hidden.bs.modal', function (e) {
			$container.remove();
		})
		
		$container.find('.btn-primary').click(function(){
			$container.on('hidden.bs.modal', function (e) {
				if (typeof (accept) == 'function')
				accept();
			})
			$container.modal('hide');
		});
	}
})(jQuery);


(function ($) {
	jQuery.fn.dialog = function (options) {
		
		var $contdiag = $(this);
		if(options=="close"){
			$contdiag.modal('hide');
			console.log($contdiag)
			return false;
		}
		$html = $contdiag.html();
		$contdiag = $(diag);
		$contdiag.appendTo($('body')).find('.modal-body').html($html);
		$contdiag.modal({'show':true,backdrop: 'static'});
		$contdiag.on('hidden.bs.modal', function (e) {
			$contdiag.remove();
		});
		return $contdiag;
	}
})(jQuery);

$.extend({
	fileDownload: function (fileUrl, options) {
		var defaultFailCallback = function (responseHtml, url) {
			alert("A file download error has occurred, please try again.");
		};
		var settings = $.extend({
			preparingMessageHtml: null,
			failMessageHtml: null,
			androidPostUnsupportedMessageHtml: "Unfortunately your Android browser doesn't support this type of file download. Please try again with a different browser.",
			dialogOptions: {
				show: true,
				title:'Reporte',
				backdrop:'static'
			},
			successCallback: function (url) { },
			failCallback: defaultFailCallback,
			httpMethod: "GET",
			data: null,
			checkInterval: 100,
			cookieName: "fileDownload",
			cookieValue: "true",
			cookiePath: "/",
			popupWindowTitle: "Initiating file download...",
			encodeHTMLEntities: true
		}, options);
		var userAgent = (navigator.userAgent || navigator.vendor || window.opera).toLowerCase();
		var isIos = false; //has full support of features in iOS 4.0+, uses a new window to accomplish this.
		var isAndroid = false; //has full support of GET features in 4.0+ by using a new window. POST will resort to a POST on the current window.
		var isOtherMobileBrowser = false; //there is no way to reliably guess here so all other mobile devices will GET and POST to the current window.
		if (/ip(ad|hone|od)/.test(userAgent)) {
			isIos = true;
		} else if (userAgent.indexOf('android') != -1) {
			isAndroid = true;
		} else {
			isOtherMobileBrowser = /avantgo|bada\/|blackberry|blazer|compal|elaine|fennec|hiptop|playbook|silk|iemobile|iris|kindle|lge |maemo|midp|mmp|netfront|opera m(ob|in)i|palm( os)?|phone|p(ixi|re)\/|plucker|pocket|psp|symbian|treo|up\.(browser|link)|vodafone|wap|windows (ce|phone)|xda|xiino/i.test(userAgent) || /1207|6310|6590|3gso|4thp|50[1-6]i|770s|802s|a wa|abac|ac(er|oo|s\-)|ai(ko|rn)|al(av|ca|co)|amoi|an(ex|ny|yw)|aptu|ar(ch|go)|as(te|us)|attw|au(di|\-m|r |s )|avan|be(ck|ll|nq)|bi(lb|rd)|bl(ac|az)|br(e|v)w|bumb|bw\-(n|u)|c55\/|capi|ccwa|cdm\-|cell|chtm|cldc|cmd\-|co(mp|nd)|craw|da(it|ll|ng)|dbte|dc\-s|devi|dica|dmob|do(c|p)o|ds(12|\-d)|el(49|ai)|em(l2|ul)|er(ic|k0)|esl8|ez([4-7]0|os|wa|ze)|fetc|fly(\-|_)|g1 u|g560|gene|gf\-5|g\-mo|go(\.w|od)|gr(ad|un)|haie|hcit|hd\-(m|p|t)|hei\-|hi(pt|ta)|hp( i|ip)|hs\-c|ht(c(\-| |_|a|g|p|s|t)|tp)|hu(aw|tc)|i\-(20|go|ma)|i230|iac( |\-|\/)|ibro|idea|ig01|ikom|im1k|inno|ipaq|iris|ja(t|v)a|jbro|jemu|jigs|kddi|keji|kgt( |\/)|klon|kpt |kwc\-|kyo(c|k)|le(no|xi)|lg( g|\/(k|l|u)|50|54|e\-|e\/|\-[a-w])|libw|lynx|m1\-w|m3ga|m50\/|ma(te|ui|xo)|mc(01|21|ca)|m\-cr|me(di|rc|ri)|mi(o8|oa|ts)|mmef|mo(01|02|bi|de|do|t(\-| |o|v)|zz)|mt(50|p1|v )|mwbp|mywa|n10[0-2]|n20[2-3]|n30(0|2)|n50(0|2|5)|n7(0(0|1)|10)|ne((c|m)\-|on|tf|wf|wg|wt)|nok(6|i)|nzph|o2im|op(ti|wv)|oran|owg1|p800|pan(a|d|t)|pdxg|pg(13|\-([1-8]|c))|phil|pire|pl(ay|uc)|pn\-2|po(ck|rt|se)|prox|psio|pt\-g|qa\-a|qc(07|12|21|32|60|\-[2-7]|i\-)|qtek|r380|r600|raks|rim9|ro(ve|zo)|s55\/|sa(ge|ma|mm|ms|ny|va)|sc(01|h\-|oo|p\-)|sdk\/|se(c(\-|0|1)|47|mc|nd|ri)|sgh\-|shar|sie(\-|m)|sk\-0|sl(45|id)|sm(al|ar|b3|it|t5)|so(ft|ny)|sp(01|h\-|v\-|v )|sy(01|mb)|t2(18|50)|t6(00|10|18)|ta(gt|lk)|tcl\-|tdg\-|tel(i|m)|tim\-|t\-mo|to(pl|sh)|ts(70|m\-|m3|m5)|tx\-9|up(\.b|g1|si)|utst|v400|v750|veri|vi(rg|te)|vk(40|5[0-3]|\-v)|vm40|voda|vulc|vx(52|53|60|61|70|80|81|83|85|98)|w3c(\-| )|webc|whit|wi(g |nc|nw)|wmlb|wonu|x700|xda(\-|2|g)|yas\-|your|zeto|zte\-/i.test(userAgent.substr(0, 4));
		}
		var httpMethodUpper = settings.httpMethod.toUpperCase();
		if (isAndroid && httpMethodUpper != "GET") {
			if ($().dialog) {
				$("<div>").html(settings.androidPostUnsupportedMessageHtml).dialog(settings.dialogOptions);
			} else {
				alert(settings.androidPostUnsupportedMessageHtml);
			}
			return;
		}
		var $preparingDialog = null;
		if (settings.preparingMessageHtml) {
			$preparingDialog = $("<div>").html(settings.preparingMessageHtml).dialog(settings.dialogOptions);
		}
		var internalCallbacks = {
			onSuccess: function (url) {
				if ($preparingDialog) {
					$preparingDialog.dialog('close');
				};
				settings.successCallback(url);

			},
			onFail: function (responseHtml, url) {
				if ($preparingDialog) {
					$preparingDialog.dialog('close');
				};
				if (settings.failMessageHtml) {
					$("<div>").html(settings.failMessageHtml).dialog(settings.dialogOptions);
					if (settings.failCallback != defaultFailCallback) {
						settings.failCallback(responseHtml, url);
					}
				} else {
					settings.failCallback(responseHtml, url);
				}
			}
		};
		if (settings.data !== null && typeof settings.data !== "string") {
			settings.data = $.param(settings.data);
		}
		var $iframe,
		downloadWindow,
		formDoc,
		$form;
		if (httpMethodUpper === "GET") {
			if (settings.data !== null) {
				var qsStart = fileUrl.indexOf('?');

				if (qsStart != -1) {
					if (fileUrl.substring(fileUrl.length - 1) !== "&") {
						fileUrl = fileUrl + "&";
					}
				} else {
					fileUrl = fileUrl + "?";
				}
				fileUrl = fileUrl + settings.data;
			}
			if (isIos || isAndroid) {
				downloadWindow = window.open(fileUrl);
				downloadWindow.document.title = settings.popupWindowTitle;
				window.focus();
			} else if (isOtherMobileBrowser) {
				window.location(fileUrl);
			} else {
				$iframe = $("<iframe>")
				.hide()
				.attr("src", fileUrl)
				.appendTo("body");
			}
		} else {
			var formInnerHtml = "";
			if (settings.data !== null) {
				$.each(settings.data.replace(/\+/g, ' ').split("&"), function () {
					var kvp = this.split("=");
					var key = settings.encodeHTMLEntities ? htmlSpecialCharsEntityEncode(decodeURIComponent(kvp[0])) : decodeURIComponent(kvp[0]);
					if (!key) return;
					var value = kvp[1] || '';
					value = settings.encodeHTMLEntities ? htmlSpecialCharsEntityEncode(decodeURIComponent(kvp[1])) : decodeURIComponent(kvp[1]);
					formInnerHtml += '<input type="hidden" name="' + key + '" value="' + value + '" />';
				});
			}
			if (isOtherMobileBrowser) {
				$form = $("<form>").appendTo("body");
				$form.hide()
				.attr('method', settings.httpMethod)
				.attr('action', fileUrl)
				.html(formInnerHtml);
			} else {
				if (isIos) {
					downloadWindow = window.open("about:blank");
					downloadWindow.document.title = settings.popupWindowTitle;
					formDoc = downloadWindow.document;
					window.focus();
				} else {
					$iframe = $("<iframe style='display: none' src='about:blank'></iframe>").appendTo("body");
					formDoc = getiframeDocument($iframe);
				}
				formDoc.write("<html><head></head><body><form method='" + settings.httpMethod + "' action='" + fileUrl + "'>" + formInnerHtml + "</form>" + settings.popupWindowTitle + "</body></html>");
				$form = $(formDoc).find('form');
			}
			$form.submit();
		}
		var checkFileDownloadComplete=function() {
			if (document.cookie.indexOf(settings.cookieName + "=" + settings.cookieValue) != -1) {
				internalCallbacks.onSuccess(fileUrl);
				document.cookie = settings.cookieName + "=;";
				cleanUp(false);
				return;
			}
			if (downloadWindow || $iframe) {
				try {
					var formDoc;
					if (downloadWindow) {
						formDoc = downloadWindow.document;
					} else {
						formDoc = getiframeDocument($iframe);
					}
					if (formDoc && formDoc.body != null && formDoc.body.innerHTML.length > 0) {
						var isFailure = true;
						if ($form && $form.length > 0) {
							var $contents = $(formDoc.body).contents().first();
							if ($contents.length > 0 && $contents[0] === $form[0]) {
								isFailure = false;
							}
						}
						if (isFailure) {
							internalCallbacks.onFail(formDoc.body.innerHTML, fileUrl);
							cleanUp(true);
							return;
						}
					}
				}
				catch (err) {
					internalCallbacks.onFail('', fileUrl);
					cleanUp(true);
					return;
				}
			}
			setTimeout(checkFileDownloadComplete, settings.checkInterval);
		}
		setTimeout(checkFileDownloadComplete, settings.checkInterval);
		function getiframeDocument($iframe) {
			var iframeDoc = $iframe[0].contentWindow || $iframe[0].contentDocument;
			if (iframeDoc.document) {
				iframeDoc = iframeDoc.document;
			}
			return iframeDoc;
		}
		function cleanUp(isFailure) {
			setTimeout(function() {
				if (downloadWindow) {
					if (isAndroid) {
						downloadWindow.close();
					}
					if (isIos) {
						if (isFailure) {
							downloadWindow.focus(); //ios safari bug doesn't allow a window to be closed unless it is focused
							downloadWindow.close();
						} else {
							downloadWindow.focus();
						}
					}
				}
			}, 0);
		}
		function htmlSpecialCharsEntityEncode(str) {
			return str.replace(/&/gm, '&amp;')
			.replace(/\n/gm, "&#10;")
			.replace(/\r/gm, "&#13;")
			.replace(/</gm, '&lt;')
			.replace(/>/gm, '&gt;')
			.replace(/"/gm, '&quot;')
			.replace(/'/gm, '&apos;'); //single quotes just to be safe
		}
	}
});


function myloaddata(url, onsucces) {
	$.gs_loader.show();
	$.ajax({
	  type: "GET",
	  dataType: "json",
	  url: url,
	})
	  .done(function (data) {
		$.gs_loader.hide();
		onsucces(data);
	  })
	  .fail(function (data) {
		$.gs_loader.hide();
		alert("Error en respuesta :" + data.statusText);
	  });
  }