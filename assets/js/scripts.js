	var getUrlParameter = function getUrlParameter(sParam) {
	    var sPageURL = decodeURIComponent(window.location.search.substring(1)),
	        sURLVariables = sPageURL.split('&'),
	        sParameterName,
	        i;

	    for (i = 0; i < sURLVariables.length; i++) {
	        sParameterName = sURLVariables[i].split('=');

	        if (sParameterName[0] === sParam) {
	            return sParameterName[1] === undefined ? true : sParameterName[1];
	        }
	    }
	};
$(document).ready(function () {

$('.menu .nav li>a span').click(function(){
	$(location).attr('href',$(this).attr('href'));
	return false;
})

/// date range

    // function cb(start, end) {
    //     $('#reportrange span').html(start.format('D [de] MMMM YYYY') + ' - ' + end.format('D [de] MMMM YYYY'));
    // }
    // cb(moment().subtract(29, 'days'), moment());
$('#reportrange').daterangepicker();
///


var baseurl = $("#baseurl").val();

	$(".menu").removeClass("active");
	var url = $(location).attr('href');
	var m = url.substring(url.indexOf("#")+1);
	$(".menu>li").eq(m).addClass("active");
	$(".menu>li:eq("+m+")>a").addClass("active");
	$('#side-menu').metisMenu();
	var cont=0;
	$.ajax({
	       type: "POST",
	       dataType: "json",
	       url:baseurl+"mensaje/mensaje_noleidos/",
	       success: function(data)
	       {
		       	$.each(data,function(i,item){
		       		$(".mensajes_noleidos").append(
		       			"<li>"+
                            "<a href='"+baseurl+"mensaje/inicio?m=mensaje&u="+item.usua_id+"'>"+
                                "<div>"+
                                    "<strong>"+item.usua_nombres+"("+item.ofic_nombre+")"+"</strong>"+
                                    "<span class='text-muted'>"+
                                        "<em>Sin leer</em>"+
                                    "</span>"+
                                "</div>"+
                                "<div>"+item.mens_mensaje+".."+"</div>"+
                            "</a>"+
                        "</li>"+
                        "<li class='divider'></li>"
		       		);
		       		cont+= 1;
		       	});

		       	$(".mensajes_noleidos").append(
		       		"</li>"+
                        "<li>"+
                            "<a class='text-center' href='"+baseurl+"mensaje/inicio?m=mensaje'>"+
                                "<strong>Todos los mensajes</strong>"+
                                "<i class='fa fa-angle-right'></i>"+
                            "</a>"+
                        "</li>");
				$(".contador").text(cont);
	       }
	     });
	$.ajax({
	       type: "POST",
	       dataType: "json",
	       url:baseurl+"expedientes/json_alertas/",
	       success: function(data)
	       {
		       	// console.log(data);
		       	$(".a_porrecepcionar").append(data.cont_porrecepcionar+" Por recepcionar");
		       	$(".a_pendientes").append(data.cont_pendientes+" Pendientes");
				$(".a_conplazo").append(data.cont_conplazos+" Pendientes con plazo");
				$(".a_finalizados").append(data.cont_finalizados+" Finalizados");
	       }
	     });

	procesarFormularioPerfil = function (dlg) {
		$(dlg).find('form').submit(function () {
			$(dlg).find('.error').addClass('hidden')
			// $(this).formPost(true, function (data) {
				
			// });
			  $.ajax({
	             type: "POST",
	             dataType: "json",
	             url:baseurl+"usuario/guardar_perfil",
	             data: $("#perfil_form").serialize(), 
	             success: function(data)
	             {
	                if (data.exito == false) {
					$(dlg).find('.error').removeClass('hidden').html(data.mensaje);
					} else {
						dlg.modal('hide');
					}
					// $table.draw();
	             }
	        }); 
			return false;
		});
	};
	$('.perfil').click(function () {
		$(this).load_dialog({
			title: $(this).attr('title'),
			script: baseurl+'assets/js/usuario/perfil.js',
			loaded: procesarFormularioPerfil
		});
		// alert("hola");
		return false;
	});

	
});

