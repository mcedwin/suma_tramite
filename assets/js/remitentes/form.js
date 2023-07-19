$(document).ready(function(){
	 var estado = $('input[name="idingreso"]').val();
    if(estado == ''){
        $('input[name="password"]').prev().find("input").prop('disabled', true);
        $('input[name="password"]').prop('disabled',false);
    }else{
        $('input[name="password"]').prop('disabled',true);
    }
    $('input[name="password"]').prev().find("input").change(function(){
        $('input[name="password"]').prop('disabled',(this.checked == true) ? false : true);
    });
});