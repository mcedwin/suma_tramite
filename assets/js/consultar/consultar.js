$(document).ready(function(){
    var baseurl = $("#baseurl").val();
    $("#ejecutar").click(function(){
      var numero = $("#numero").val();
      var captcha = $("#captcha").val();
      var periodo = $("#periodo").val();
      $this = $(this);
       $.ajax({
           type: "POST",
           dataType: "json",
           url:baseurl+"consultar/verificar" ,
           data:{"numero":numero,"captcha":captcha,"periodo":periodo}, 
           success: function(data)
           {
               if(data.exito == false ){

                  alert(data.mensaje);
               }
               else
                {
                $this.load_dialog({
                      title:'Consulta de expediente',
                      data: {id:numero},
                      script: baseurl + 'assets/js/expedientes/imprimir.js',
                      loaded: function(dlg) {
                        $(dlg).find('form').submit(function() {
                            return false;
                        });
                    }
                });
                }
           }
         });  
      return false;
    });
});

