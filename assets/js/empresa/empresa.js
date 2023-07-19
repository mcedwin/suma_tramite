$(document).ready(function(){
    var baseurl = $("#baseurl").val();
    if($("#act_e-mail").is(':checked')) {  
            $(".e-mail").attr('disabled', false); 
        } else {  
            $(".e-mail").attr('disabled', true); 
        }
  $("#act_e-mail").click(function() {  
        if($("#act_e-mail").is(':checked')) {  
            $(".e-mail").attr('disabled', false); 
        } else {  
            $(".e-mail").attr('disabled', true); 
        }  
    });

    if($("#env_e-mail").is(':checked')) {  
            $(".email-form").removeClass("hidden");  
        } else {  
            $(".email-form").addClass("hidden"); 
        }
    $("#env_e-mail").click(function() {  
       if($("#env_e-mail").is(':checked')) {  
            $(".email-form").removeClass("hidden");  
        } else {  
            $(".email-form").addClass("hidden"); 
        }  
    });
    $("#empresa_form").submit(function(){
            $.gs_loader.show();
             $.ajax({
               type: "POST",
               dataType: "json",
               url:baseurl+"empresa/guardar" ,
               data: $("#empresa_form").serialize(), 
               success: function(data)
               {
                   if(data.exito == false ){

                      $("#empresa_form").find('.error').removeClass('hidden').html(data.mensaje);
                      $.gs_loader.hide();
                   }
                   else
                    {
                      $("#empresa_form").find('.error').addClass('hidden').html(data.mensaje);
                      $.gs_loader.hide();
                    }
               }
             });  
        
    return false;
  }); 


});

