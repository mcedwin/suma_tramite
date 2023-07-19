$(document).on('change', '.btn-file :file', function() {
    var input = $(this),
        numFiles = input.get(0).files ? input.get(0).files.length : 1,
        label = input.val().replace(/\\/g, '/').replace(/.*\//, '');
    input.trigger('fileselect', [numFiles, label]);
});
$(document).on('ready', function () {
	var baseurl = $("#baseurl").val();
	// alert("hola");
	function actulizar_mensajes(usuario){
		$("#mensajes").text("");
		$.ajax({
	       type: "POST",
	       dataType: "json",
	       url:baseurl+"mensaje/info_mensaje/"+usuario ,
	       success: function(data)
	       {
	           console.log(data.destino);

	            $("#mens_dest").html("<strong>"+data.destino.ofic_nombre+"-"+data.destino.usua_nombres+"</strong>");
				$("#usua").val(data.destino.usua_id);
				$("#ofic").val(data.destino.ofic_id);

	           $.each(data.mensajes,function(i,item){
	           		// posicion = "left";
	           		// parrafo = "";
	           		console.log(item);
	           		if(item.mens_user_ini!=usuario){
	           			// posicion = "right";
	           			// parrafo = "col-sm-offset-1";
	           			$("#mensajes").append(
	           			'<div class="row msg_container base_sent">'+
                            '<div class="col-md-10 col-xs-10">'+
                                '<div class="messages msg_sent">'+
                                    '<p>'+item['mens_mensaje']+'</p>'+
                                    '<p><a href="'+baseurl+'archivos/mensajes/'+item["mens_archivo"]+'" download="'+item["nomb_archivo"]+'">'+item["nomb_archivo"]+'</a></p>'+
                                    '<time>'+item["mens_fechareg"]+'</time>'+
                                '</div>'+
                            '</div>'+
                            '<div class="col-md-2 col-xs-2 avatar">'+
                                '<div class="nombre"><span>'+item["nomb_usua_ini"]+'</span></div>'+
                            '</div>'+
                        '</div>'
	           			);
	           		}
	           		else{
	           			$("#mensajes").append(
	           			'<div class="row msg_container base_receive">'+
                            '<div class="col-md-2 col-xs-2 avatar">'+
                                '<div class="nombre"><span>'+item["nomb_usua_ini"]+'</span></div>'+
                            '</div>'+
                            '<div class="col-md-10 col-xs-10">'+
                                '<div class="messages msg_receive">'+
                                	'<p><a href="'+baseurl+'archivos/mensajes/'+item["mens_archivo"]+'" download="'+item["nomb_archivo"]+'">'+item["nomb_archivo"]+'</a></p>'+
                                    '<p>'+item['mens_mensaje']+'</p>'+
                                    '<time>'+item["mens_fechareg"]+'</time>'+
                                '</div>'+
                            '</div>'+
                        '</div>'
	           			);

	           		}
		           	// $("#mensajes").append(
	             //        "<li class='clearfix'>"+
              //               "<div class='header col-sm-12'>"+
              //                   "<strong class='primary-font pull-"+posicion+"'>"+item['usuario_ini']+"</strong>"+
              //               "</div>"+
              //               "<div class='col-sm-11 "+parrafo+"'>"+
	             //                "<p class='pull-"+posicion+"'>"+item['mens_mensaje']+"</p>"+
              //               "</div>"+
              //               "<div class='col-sm-11 "+parrafo+"'>"+
	             //                "<p class='pull-"+posicion+"'><a href='"+baseurl+"archivos/mensajes/"+item['mens_archivo']+"' download='"+item['nomb_archivo']+"'>"+item['nomb_archivo']+"</a></p>"+
              //               "</div>"+
              //           "</li><hr style='margin:0'>"
		           	// 	);

	           });
	       }
	     });
	}
	var usuario=null;
	$(".usuario").on("click",function(e){
		// $this = $(this);
		// addClass("info")
		// $(this).addClass("alert alert-info");
		$(".usuario").removeClass("active");
		$(this).addClass("active");
		
		$(this).children("i").removeClass("fa-envelope");
		$(this).children("i").addClass("fa-envelope-o");
		usuario = $(this).attr('href');
         $('input[name="mensaje"]').val("");
         $('input[name="archivo"]').val("");
         $("#archivo-adjunto").text("");
        actulizar_mensajes(usuario);
		e.preventDefault();
	});

	// ***************Enviar mensaje**************
	$("#mensaje_form").submit(function(){
		var validate = true;
        var usuario =$('input[name="usuario"]').val();

        var archivo =$('input[name="archivo"]').val();
        if(archivo!=""){
	        if(archivo.match(/\.(php)|(js)|(html)|(css)|(sql)$/) ){
		        alert("Archivo adjunto no permitido");  
		       validate = false;
		    }
		}
        // alert(usuario);
        var formData = new FormData(document.getElementById("mensaje_form"));
         if(validate){
	        $.ajax({
	                url: baseurl+"mensaje/nuevo_mensaje",
	                type: "post",
	                dataType: "json",
	                data: formData,
	                cache: false,
	                contentType: false,
	                processData: false,
	              	success: function(data)
	               {
	               		$('input[name="mensaje"]').val("");
				         $('input[name="archivo"]').val("");
				         $("#archivo-adjunto").text("");
	               		actulizar_mensajes(usuario);
	                  	// console.log(data);

	               }
	         });
        }
    return false;
  });
    $('.btn-file :file').on('fileselect', function(event, numFiles, label) {
    	$("#archivo-adjunto").html(label+"<a href='#' class='eliminar'><i class='fa fa-times'></i></a>");
	});
    $("#archivo-adjunto").on("click",".eliminar",function(e){
	    $("input[name='archivo']").val("");
	    $("#archivo-adjunto").html("");
	    e.preventDefault();
	  });
	var u = getUrlParameter("u");
	if (u !== undefined&&u!='') {
		$(".usuario-"+u).click();
	}
});
