$(document).on('change', '.btn-file :file', function() {
    var input = $(this),
        numFiles = input.get(0).files ? input.get(0).files.length : 1,
        label = input.val().replace(/\\/g, '/').replace(/.*\//, '');
    input.trigger('fileselect', [numFiles, label]);
});
$(document).ready(function(){
	$(".archivo-nuevo").addClass("hidden");
	$('.btn-file :file').on('fileselect', function(event, numFiles, label) {
	    $("#archivo-adjunto").text(label);
	    $(".archivo-nuevo").removeClass("hidden");
	    $(".archivo-actual").addClass("hidden");
	});
	$(".eliminar").click(function(){
		$("input[name='archivo']").val("");
		$(".archivo-actual").removeClass("hidden");
	    $(".archivo-nuevo").addClass("hidden");
		return false;
	});
});
