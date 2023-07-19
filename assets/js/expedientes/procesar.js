$(document).ready(function(){
	var baseurl = $("#baseurl").val();
	$(".opciones").on("click",function(){
		option = $(this).children().val();
		$("#ejecutar").attr("href", baseurl+"expedientes/procesar/"+option)
	});
	$('#ejecutar').on("click",function (e) {
		var desde = $("#desde").val();
		var hasta = $("#hasta").val();
		var tipo = $("#tipo").val();
		console.log(desde);
		console.log(hasta);
		console.log(tipo);
		if(desde!=''&&hasta!=''){
			// alert("correcto");
			$('.error').addClass('hidden').html("llene los datos");
			$(this).load_dialog({
				title: $(this).attr('title'),
				data:{"desde":desde,"hasta":hasta,"tipo":tipo}
			});
		}else{
			// alert("incorrecto");
			$('.error').removeClass('hidden').html("Llene los campos");

		}
		e.preventDefault();
	});
		$(".cerrar").on("click",function(e){
			alert("hola");
			e.preventDefault();
		});

});