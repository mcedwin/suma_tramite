$(document).ready(function() {
var baseurl = $("#baseurl").val();
var url = baseurl + 'reportes/externos_data?m=reportes';
    $.post(
       	url,
       	$('.tform').serialize(),
       	function(data){
           $('.cuerpo').html(data);
       }); 
    $('.tform').submit(function(){
        
       $.post(
       	url,
       	$('.tform').serialize(),
       	function(data){
           $('.cuerpo').html(data);
       }); 
       return false;
    });
    $('.tform select').change();
});