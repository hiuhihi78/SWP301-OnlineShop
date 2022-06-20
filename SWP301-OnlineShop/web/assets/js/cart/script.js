/* 
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/JavaScript.js to edit this template
 */

$(document).ready(function () {
    $("input[type='checkbox']").click(function () {
        var priceTotal = 0;
        $("#calculator input[type='checkbox']:checked").each(function () {
            priceTotal += parseInt(this.value);
        });
        $('#total').html(priceTotal);
    });
    
});

$('#checkall').change(function () {
    $('.cb-element').prop('checked', this.checked);
    var priceTotal = 0;
        $("#calculator input[type='checkbox']:checked").each(function () {
            priceTotal += parseInt(this.value);
        });
        $('#total').html(priceTotal);
});

//$('.cb-element').change(function () {
//    if ($('.cb-element:checked').length == $('.cb-element').length) {
//        $('#checkall').prop('checked', true);
//    } else {
//        $('#checkall').prop('checked', false);
//    }
//});


