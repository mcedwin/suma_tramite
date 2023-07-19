$(document).on("ready",function(){
    var baseurl = $("#baseurl").val();
    var url = baseurl+'inicio/index?json=true';
    var $table;
    var seleccionados;
    procesarFormulario = function (dlg) {
        $(dlg).find('form').submit(function () {
            $(dlg).find('.error').addClass('hidden')
            $(this).formPost(true, function (data) {
                if (data.exito == false) {
                    $(dlg).find('.error').removeClass('hidden').html(data.mensaje);
                } else {
                    dlg.modal('hide');
                }
                $table.draw();
            });
            return false;
        });
    };

    var $dt = $('#mitabla'),
            conf = {
                data_source: url,
                cactions: ".ocform",
                oncheck: function (row, data, selected) {
                    if (selected.length > 0) {
                        $('.onsel').removeClass('hidden');
                        $('.nosel').addClass('hidden');
                    } else {
                        $('.onsel').addClass('hidden');
                        $('.nosel').removeClass('hidden');
                    }
                    seleccionados = selected;
                },
                onrow: function (row, data) {
                    $(row).find('td').removeClass("edit");
                    $(row).find('td:eq(1),td:eq(2),td:eq(3),td:eq(4),td:eq(5)').addClass("redirec");
                    $(row).find('td.redirec').click(function () {
                        window.location.href = baseurl+'expedientes/recibidos?m=expedientes';
                    })
                    $(row).find('td:eq(0)').html("<a href="+baseurl+"expedientes/seguir/"+data.Expediente+" class='seguir btn btn-link btn-sm'>"+data.Expediente+"</a>");
                    plazo =parseInt(data.Plazo);
                    var hoy = new Date();
                    $(row).delegate(".seguir","click",function(e){
                        $(this).load_dialog({
                            title:'Consulta de expediente',
                            loaded: function(dlg) {
                                    $(dlg).find('form').submit(function() {
                                        return false;
                                    });
                                }
                        });
                        
                        e.preventDefault();
                    });


                }
            };
    $table = $dt.load_simpleTable(conf);
    $('.ocform').submit(function () {
        $table.draw();
        return false;
    })
    function plot_expedientes(id,data){
        var plotObj = $.plot(id, data, {
                series: {
                    pie: {
                        show: true
                    }
                },
                grid: {
                    hoverable: true,
                    clickable: true
                },
                tooltip: true,
                tooltipOpts: {
                    content: "%p.0%, %s",
                    shifts: {
                        x: 10,
                        y: 0
                    },
                    defaultTheme: false
                },
            });
    }

    $.ajax({
       type: "POST",
       dataType: "json",
       url:baseurl+"expedientes/json_expedientes_externos_hoy" ,
       success: function(data)
       {
			console.log(data);
            var data_externos_hoy = [{
                label: "Por recepcionar",
                data: data.cont_externos_hoy[0]
            }, {
                label: "Recepcionados",
                data: data.cont_externos_hoy[1]
            }, {
                label: "Tramitados",
                data: data.cont_externos_hoy[2]
            }, {
                label: "Finalizados",
                data: data.cont_externos_hoy[3]
            }];

            plot_expedientes("#expedientes-externos-hoy",data_externos_hoy);

            var data_internos_hoy = [{
                label: "Por recepcionar",
                data: data.cont_internos_hoy[0]
            }, {
                label: "Recepcionados",
                data: data.cont_internos_hoy[1]
            }, {
                label: "Tramitados",
                data: data.cont_internos_hoy[2]
            }, {
                label: "Finalizados",
                data: data.cont_internos_hoy[3]
            }];

            plot_expedientes("#expedientes-internos-hoy",data_internos_hoy);

            var data_externos_todo = [{
                label: "Por recepcionar",
                data: data.cont_externos_todo[0]
            }, {
                label: "Recepcionados",
                data: data.cont_externos_todo[1]
            }, {
                label: "Tramitados",
                data: data.cont_externos_todo[2]
            }, {
                label: "Finalizados",
                data: data.cont_externos_todo[3]
            }];

            plot_expedientes("#expedientes-externos-todo",data_externos_todo);

            var data_internos_todo = [{
                label: "Por recepcionar",
                data: data.cont_internos_todo[0]
            }, {
                label: "Recepcionados",
                data: data.cont_internos_todo[1]
            }, {
                label: "Tramitados",
                data: data.cont_internos_todo[2]
            }, {
                label: "Finalizados",
                data: data.cont_internos_todo[3]
            }];

            plot_expedientes("#expedientes-internos-todo",data_internos_todo);

            var data_internos = [{
                label: "En tramite",
                data: data.cont_internos[0]
            }, {
                label: "Finalizados",
                data: data.cont_internos[1]
            }];

            plot_expedientes("#expedientes-internos",data_internos);
       }
     });

    $("#expedientes-externos-hoy").bind("plotclick", function (event, pos, item) {
        if (item) { 
            if(item.series.label=="Por recepcionar")window.location.href = baseurl+"expedientes/recibidos?m=expedientes";
            if(item.series.label=="Recepcionados")window.location.href = baseurl+"expedientes/externos?m=expedientes";
            if(item.series.label=="Tramitados")window.location.href = baseurl+"expedientes/derivados?m=expedientes";
            if(item.series.label=="Finalizados")window.location.href = baseurl+"expedientes/finalizados?m=expedientes";
        }
    });
    $("#expedientes-internos-hoy").bind("plotclick", function (event, pos, item) {
        if (item) { 
            if(item.series.label=="Por recepcionar")window.location.href = baseurl+"expedientes/recibidos?m=expedientes";
            if(item.series.label=="Recepcionados")window.location.href = baseurl+"expedientes/internos?m=expedientes";
            if(item.series.label=="Tramitados")window.location.href = baseurl+"expedientes/derivados?m=expedientes";
            if(item.series.label=="Finalizados")window.location.href = baseurl+"expedientes/finalizados?m=expedientes";
        }
    });
    $("#expedientes-externos-todo").bind("plotclick", function (event, pos, item) {
        if (item) { 
            if(item.series.label=="Por recepcionar")window.location.href = baseurl+"expedientes/recibidos?m=expedientes";
            if(item.series.label=="Recepcionados")window.location.href = baseurl+"expedientes/externos?m=expedientes";
            if(item.series.label=="Tramitados")window.location.href = baseurl+"expedientes/derivados?m=expedientes";
            if(item.series.label=="Finalizados")window.location.href = baseurl+"expedientes/finalizados?m=expedientes";
        }
    });
    $("#expedientes-internos-todo").bind("plotclick", function (event, pos, item) {
        if (item) { 
            if(item.series.label=="Por recepcionar")window.location.href = baseurl+"expedientes/recibidos?m=expedientes";
            if(item.series.label=="Recepcionados")window.location.href = baseurl+"expedientes/internos?m=expedientes";
            if(item.series.label=="Tramitados")window.location.href = baseurl+"expedientes/derivados?m=expedientes";
            if(item.series.label=="Finalizados")window.location.href = baseurl+"expedientes/finalizados?m=expedientes";
        }
    });
    $("#expedientes-internos").bind("plotclick", function (event, pos, item) {
        if (item) { 
            if(item.series.label=="En tramite")window.location.href = baseurl+"expedientes/recibidos?m=expedientes";
            if(item.series.label=="Finalizados")window.location.href = baseurl+"expedientes/finalizados?m=expedientes";
        }
    });
})