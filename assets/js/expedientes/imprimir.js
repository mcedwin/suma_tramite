$(document).ready(function(){
	$('#imprimir').on("click",function (e) {
		$(this).load_dialog({
			title: $(this).attr('title'),
		});
		e.preventDefault();
	});
});
