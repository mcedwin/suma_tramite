var baseurl = $("#baseurl").val();
$(document).ready(function() {
    var baseurl = $("#baseurl").val();
    $("#agre").click(function(){
        $("#element").show();
        $("#agre").hide();
    });

    $("#requi_deta").hide();

    $("#areas").click(function() {
        $("#requisitos").removeClass("active");
        $("#area_deta").show();
        $("#requi_deta").hide();
    });

    $("#requisitos").click(function() {
        $("#requi_deta").show();
        $("#requisitos").addClass("active");
        $("#areas").removeClass("active");
        $("#area_deta").hide();
    });


    detalleFormulario = function(dlg) {
        $(dlg).find('form').submit(function() {
            $(dlg).find('.error').addClass('hidden')
            $(this).formPost(true, function(data) {
                if (data.exito == false) {
                    $(dlg).find('.error').removeClass('hidden').html(data.mensaje);
                } else {
                    if(typeof(data.id)!="undefined"){
                        var oficina = $('#oficina option:selected').html();
                        var orden = $('#orden').val();
                        var plazo = ($('#plazo').val().length < 1) ? '0' : $('#plazo').val();
                        var activo;
                        if ($('#activo').is(':checked')) {
                            activo = 'activo';
                        } else {
                            activo = 'desactivo';
                        };
                        //$("tbody").addClass('cuerpo');
                        $(".cuerpo").append("<tr class='tmp'></tr>");
                        $('#add tr:last').after('<tr><td>' +
                                oficina + '</td><td>'
                                + orden + '</td><td>'
                                + plazo+'</td><td>'
                                + activo+ '</td><td><a id="'+data.id+
                                '" class="up" href="#">Arriba</a></td><td><a id="'+data.id+
                                '" class="down" href="#">Abajo</a></td><td><a class="borrard" id="'+data.id+
                                '" href="#">Borrar</a></td><td><a class="editard" href="'+baseurl+
                                'procesos/form_deta/'+data.id+'">Editar</a></td></tr>');
                        $(".cuerpo .tmp").remove();
                        dlg.modal('hide');
                    }else{
                        var oficina = $('#oficina option:selected').html();
                        var plazo = ($('#plazo').val().length < 1) ? '0' : $('#plazo').val();
                        var orden = $('#orden').val();
                        var activo;
                        if ($('#activo').is(':checked')) {
                            activo = 'activo';
                        } else {
                            activo = 'desactivo';
                        };
                        $('.cuerpo tr').each(function(index){

                            if ($(this).children("td:eq(1)").text() == orden) {
                                $(this).children("td:eq(0)").html(oficina);   
                                $(this).children("td:eq(2)").html(plazo);
                                $(this).children("td:eq(3)").html(activo);
                            }
                        });

                        dlg.modal('hide');
                    }
                }
            });
            return false;
        });
    };
    requisitoFormulario = function (dlg) {
        $(dlg).find('form').submit(function () {
            $(dlg).find('.error').addClass('hidden')
            $(this).formPost(true, function (data) {
                if (data.exito == false) {
                    $(dlg).find('.error').removeClass('hidden').html(data.mensaje);
                } else {
                    if(typeof(data.id)!="undefined"){
                        var nombre = $("#nombre").val();                        
                        var activo;
                        if ($('#activo').is(':checked')) {
                            activo = 'activo';
                        } else {
                            activo = 'desactivo';
                        };
                        $(".cuerpo").append("<tr class='tmp'></tr>");
                        $('#adr tr:last').after('<tr><td>' +
                                nombre + '</td><td>'
                                + activo+ '</td><td><a class="borrarr" id="'+data.id+
                                '" href="#">Borrar</a></td><td><a class="editarr" href="'+baseurl+
                                'procesos/form_requ/'+data.id+'">Editar</a></td></tr>');
                        $(".cuerpo .tmp").remove();
                        dlg.modal('hide');
                    }else{
                        var oficina = $('#oficina option:selected').html();
                        var plazo = ($('#plazo').val().length < 1) ? '0' : $('#plazo').val();
                        var orden = $('#orden').val();
                        var activo;
                        if ($('#activo').is(':checked')) {
                            activo = 'activo';
                        } else {
                            activo = 'desactivo';
                        };
                        $('.cuerpo tr').each(function(index){

                            if ($(this).children("td:eq(1)").text() == orden) {
                                $(this).children("td:eq(0)").html(oficina);   
                                $(this).children("td:eq(2)").html(plazo);
                                $(this).children("td:eq(3)").html(activo);
                            }
                        });

                        dlg.modal('hide');
                    }
                }
            });
            return false;
        });
    };
    $('.agregard').click(function() {
        $(this).load_dialog({
            title: $(this).attr('title'),
            // script: baseurl + 'assets/js/procesos/form_deta.js',
            loaded: detalleFormulario
        });
        return false;
    });
     $('.agregarr').click(function() {
        $(this).load_dialog({
            title: $(this).attr('title'),
            // script: baseurl + 'assets/js/procesos/form_requ.js',
            loaded: requisitoFormulario
        });
        return false;
    });
    $('.cuerpo').delegate(".editard","click",function() {
        $(this).load_dialog({
            title: $(this).attr('title'),
            // script: baseurl + 'assets/js/procesos/form_deta.js',
            loaded: detalleFormulario
        });
        return false;
    });
    $('.cuerpo').delegate(".editarr","click",function() {
        $(this).load_dialog({
            title: $(this).attr('title'),
            // script: baseurl + 'assets/js/procesos/form_requ.js',
            loaded: requisitoFormulario
        });
        return false;
    });
    $('.cuerpo').delegate(".borrard",'click',function() {
        id = $(this).attr("id");
        fila = $(this).closest("tr");
        $.ajax({
            url: baseurl+"procesos/borrar_detalle",
            method: "POST",
            dataType: "json",
            data: {id : id},
            success: function(data){
                if(data.exito == false){
                    alert(data.mensaje);
                }else{
                    fila.remove();
                }
            }
        });
    });
    $('.cuerpo').delegate(".borrarr",'click',function() {
        id = $(this).attr("id");
        fila = $(this).closest("tr");
        $.ajax({
            url: baseurl+"procesos/borrar_requisito",
            method: "POST",
            dataType: "json",
            data: {id : id},
            success: function(data){
                if(data.exito == false){
                    alert(data.mensaje);
                }else{
                    fila.remove();
                }
            }
        });
    });
    $(".cuerpo").delegate(".up,.down",'click' ,function() {
        var row = $(this).parents("tr:first");
        var tmp = $(this).parent().parent().children("td:eq(1)").text();
        var prev = row.prev().children("td:eq(1)").text();
        var next = row.next().children("td:eq(1)").text();
        var first = $(this).closest("tr").not(':first-child');
        var last = $(this).closest("tr").not(':last-child');
        
        if ($(this).is(".up")) {

           if (first.length > 0) {
                $(this).parent().parent().children("td:eq(1)").text((tmp-1));
                row.prev().children("td:eq(1)").text(parseInt(prev) + 1);
                var deta_id = $(this).attr("id");
                $.ajax({
                    url: baseurl+"procesos/updown",
                    method: "POST",
                    dataType: "json",
                    data: {id : deta_id,
                           tipo : "up"}
                });
                
                row.insertBefore(row.prev());
            }
        } else {
            if(last.length > 0){
            $(this).parent().parent().children("td:eq(1)").text((parseInt(tmp)+ 1));
            row.next().children("td:eq(1)").text(next - 1);
            var deta_id = $(this).attr("id");
            $.ajax({
                url: baseurl+"procesos/updown",
                method: "POST",
                dataType: "json",
                data: {id : deta_id,
                       tipo : "down"}
            });
            row.insertAfter(row.next());
            }
        }

    });
    
});