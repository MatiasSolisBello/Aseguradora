$(document).ready(function () {
    $('#entradafilter').keyup(function () {
       var rex = new RegExp($(this).val(), 'i');
         $('.contenidobusqueda tr').hide();
         $('.contenidobusqueda tr').filter(function () {
             return rex.test($(this).text());
         }).show();
 
         })
 
 });

