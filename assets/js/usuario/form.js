$(document).ready(function(){

    $(".password").attr('disabled', true); 
    $(".activar").on("click",function() {  
        if($(".activar").is(':checked')) {  
            // alert("Está activado"); 
            $(".password").attr('disabled', false); 
        } else {  
            $(".password").attr('disabled', true); 
            $(".password").val(""); 
            // alert("No está activado"); 
        }  
        // alert("hola");
    });  

});