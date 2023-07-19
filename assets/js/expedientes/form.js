$(document).on('change', '.btn-file :file', function () {
  var input = $(this),
    numFiles = input.get(0).files ? input.get(0).files.length : 1,
    label = input.val().replace(/\\/g, '/').replace(/.*\//, '');
  input.trigger('fileselect', [numFiles, label]);
});
$(document).ready(function () {
  var baseurl = $("#baseurl").val();
  // NUMERO DE DOCUMENTO
  /* datos = $("#documento").val();
   $.ajax({
     type: "POST",
     dataType: "json",
     url: baseurl + "expedientes/numero_expediente",
     data: { "documento": datos, "tipo": $('#interno_tipo').val() },
     success: function (data) {
       // console.log(data.siglas);
       $("#numero").val(data.numero);
       $("#sigla").val(data.siglas);
     }
   });*/

  $("#documento").on("change", function () {
    datos = $("#documento").val();
    if (datos == '') {
      $("#numero").val('');
      $("#sigla").val('');
      return;
    }
    $.ajax({
      type: "POST",
      dataType: "json",
      url: baseurl + "expedientes/numero_expediente",
      data: { "documento": datos, "tipo": $('#interno_tipo').val() },
      success: function (data) {
        console.log(data.siglas);
        $("#numero").val(data.numero);
        $("#sigla").val(data.siglas);
      }
    });
  });

  // SELECT2 
  $(".entidad").select2({
    allowClear: true,
    language: "es",
    ajax: {
      url: baseurl + "remitentes/select2remitente",
      dataType: 'json',
      delay: 250,
      data: function (params) {
        return {
          q: params.term
        };
      },
      processResults: function (data) {
        return {
          results: data.items
        };
      },

      cache: true
    },
    minimumInputLength: -1
  }).on("select2:select", function (e) {
    $("#remitente").val(e.params.data.text);
    $("#email").val(e.params.data.email);
  });

  procesarFormulario = function (dlg) {
    $(dlg).find('form').submit(function () {
      $(dlg).find('.error').addClass('hidden');
      var form = $(dlg).find('form:first'),
        remitente = form.find('input[name="nombre"]').val(),
        siglas = form.find('input[name="siglas"]').val();
      email = form.find('input[name="email"]').val();
      $(this).formPost(true, function (data) {
        if (data.exito == false) {

          $(dlg).find('.error').removeClass('hidden').html(data.mensaje);
        } else {
          $("#remitente").val(remitente);
          $("#email").val(email);
          var o = $("<option/>", { value: data.id, text: remitente });
          $('#entidad').append(o);
          $('#entidad option[value="' + data.id + '"]').prop('selected', true);
          $('#entidad').trigger('change');
          dlg.modal('hide');

        }
      });
      return false;
    });
  };

  $('.crear').click(function () {
    $(this).load_dialog({
      title: $(this).attr('title'),
      loaded: procesarFormulario
    });
    // alert("hola");
    return false;
  });
  // *****************************************
  $('.btn-file :file').on('fileselect', function (event, numFiles, label) {
    // console.log(numFiles);
    // console.log(label);
    $(".archivo_adjunto").html(label + "<a href='#' class='btn btn-sm btn-danger eliminar ml-2'><i class='fa fa-times'></i></a>");
  });
  $(".archivo_adjunto").on("click", ".eliminar", function (e) {
    $("input[name='archivo']").val("");
    $(".archivo_adjunto").html("");
    e.preventDefault();
  });
  // GUARDAR EXPEDIENTE
  $("#expendiente_form").submit(function () {
    var validate = true;
    var codigo = $('input[name="codigo"]').val();
    var archivo = $('input[name="archivo"]').val();
    if (archivo != "") {
      if (archivo.match(/\.(php)|(js)|(html)|(css)|(sql)$/)) {
        alert("Archivo adjunto no permitido");
        validate = false;
      }
    }
    var formData = new FormData(document.getElementById("expendiente_form"));
    formData.append("codigo", codigo);
    if (validate) {
      $.gs_loader.show();
      $.ajax({
        url: baseurl + "expedientes/guardar",
        type: "post",
        dataType: "json",
        data: formData,
        cache: false,
        contentType: false,
        processData: false,
        success: function (data) {
          $.gs_loader.hide();
          var urld = $('#tipo').val().toLowerCase()
          if (data.exito == true) {
            $(location).attr('href', baseurl + 'expedientes/' + urld + 's#1')

          }
          else {
            $("#expendiente_form").find('.error').removeClass('hidden').html(data.mensaje);
            $('.page-content').animate({
              scrollTop: $('#expendiente_form .error').offset().top
            }, 'slow');
            console.log("Dola");
          }
        }
      });
    }
    return false;
  });
  // SELECCIONAR PROCESO
  $("#proceso").on("change", function () {
    var datos = $("#proceso").val();
    console.log($(this).on("change"));
    $("#procesos_oficinas").html("");
    $("#procesos_requisitos").html("");
    $.ajax({
      type: "POST",
      dataType: "json",
      url: baseurl + "procesos/firts_oficina",
      data: { "proceso": datos },
      success: function (data) {
        $('#oficina_destino option[value="' + data['oficina'] + '"]').prop('selected', true);
        $('#oficina_destino').trigger('change');

        $("#procesos_requisitos").html("<h5><strong>Requisitos</strong></h5><ul></ul>");
        $("#procesos_oficinas").html("<h5><strong>Oficinas</strong></h5><ul></ul>");

        jQuery.each(data['procesos_detalle'], function (i, val) {

          $("#procesos_oficinas ul").append("<li>" + val["oficina"] + " (" + val["plazo"] + " dias)" + "</li>");
        });
        jQuery.each(data['procesos_requisito'], function (i, val) {

          $("#procesos_requisitos ul").append("<li>" + val + "</li>");
        });

      }
    });
  });
  // ***********clonar oficinas**********+
  $("#clonar").on("click", function () {
    $(".clon div:eq(0)").clone().appendTo(".oficinas");
    $('#proceso option[value=""]').prop('selected', true);
    $('#proceso').trigger('change');
  });
  $(".oficinas").delegate(".delete_destino", "click", function () {
    $(this).parent().parent().remove();
  });
  //*************fecha**************
  $('input[name="fechahora"]').daterangepicker({
    singleDatePicker: true,
    // showDropdowns: true,
    //timePicker24Hour: true,
    //timePickerSeconds: true,
    //timePicker: true,
    //timePickerIncrement: 1,
    locale: {
      format: 'DD/MM/YYYY'
    }
  },
    function (start, end, label) {
      // var years = moment().diff(start, 'years');
      // alert("You are " + years + " years old.");
      //$('input[name="fechahora"]').val(moment().format('YYYY-MM-DD h:mm:ss'));
      $('input[name="fecha"]').val(start.format('YYYY-MM-DD h:mm:ss'));
      // console.log("New date range selected: " + start.format('YYYY-MM-DD h:mm A') +  " (predefined range: " + label + ")");
    });



  $('#oficina').data('nom', $('#oficina').val())
  $('#remitente').data('nom', $('#remitente').val())
  $('#email').data('nom', $('#email').val())

  $('#interno_tipo').change(function () {
    if ($(this).val() == 'PERSONAL' || $(this).val() == 'OFICINA') {
      $('#oficina').prop('readonly', true).val($('#oficina').data('nom'));
      $('#remitente').prop('readonly', true).val($('#remitente').data('nom'));
      $('#email').prop('readonly', true).val($('#email').data('nom'));
    } else {
      $('#oficina').prop('readonly', true).val('');
      $('#remitente').prop('readonly', false).val('');
      $('#email').prop('readonly', false).val('');
    }

    $('#documento').change();
  })

  $('#interno_tipo').change();

  $('#generar').click(function () {
    if ($('#numero').val() == '' || $('#sigla').val() == '') return false;

    window.location.href = baseurl + 'expedientes/get/' + $('#documento').val() + '/' + $('#numero').val() + '-' + $('#sigla').val();
  })




  $('#selectOficinas').change(function () {
    console.log("sdf")
    $select = $(this);

    myloaddata(baseurl + 'expedientes/getUsers/' + $(this).val(), function (data) {
      $select.val('')
      html = '';
      $.each(data, function (oi, oitem) {
        html += '<tr><input type="hidden" name="tram_ofic_fin[]" value="' + oitem.id + '"><td class="align-middle">' + oitem.name + '</td><td>';

        html += '<select class="form-control" name="tram_user_fin[]"><option value="0"> + Responsable</option>';
        $.each(oitem.users, function (ui, uitem) {
          html += '<option value="' + uitem.usua_id + '">' + uitem.usua_apellidos + ' ' + uitem.usua_nombres + '</option>'
        })
        html += '<option value="-1">+ Todos los usuarios</option></select>';
        html += '</td><td>' + $('#clon_acciones').html()
        html += '</td><td class="text-end"><a href="#" class="btn btn-danger quitar">Quitar</a></td></tr>';
      })

      console.log(html);
      $('.oficinas tbody').append($(html))
    })
  })
  $(document).on('click', '.quitar', function () {
    $(this).closest('tr').fadeOut(300, function () { $(this).remove(); });
    return false;
  })



  $('#finExterno').change(function () {
    if (this.checked) {
      $('.showno').hide();
      $('.showsi').show();
      $('.showno').find('input,select').prop("disabled", true);
      $('.showsi').find('input,select').prop("disabled", false);
    } else {
      $('.showno').show();
      $('.showsi').hide();
      $('.showno').find('input,select').prop("disabled", false);
      $('.showsi').find('input,select').prop("disabled", true);
    }
  });

  $('#finExterno').change();

});

