/* 
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/JavaScript.js to edit this template
 */

$(document).ready(function () {
    $("input[type='checkbox']").click(function () {
        var priceTotal = 0;
        $("#calculator input[type='checkbox']:checked").each(function () {
            var price = $(this).attr('data-price');
            priceTotal += parseInt(price);
        });
        $('#total').html(priceTotal);
    });

});

$('#checkall').change(function () {
    $('.cb-element').prop('checked', this.checked);
    var priceTotal = 0;
    $("#calculator input[type='checkbox']:checked").each(function () {
        var price = $(this).attr('data-price');
        priceTotal += parseInt(price);
    });
    $('#total').html(priceTotal);
});

$('.cart_quantity_delete, .delete-all-product').on('click', function (e) {
    var pid = $(e.target).attr('data-programid');
    var name = $(e.target).attr('data-name');
    var isAll = $(e.target).attr('data-isAll');

    $('#app_id').val(pid);
    $('#app_isAll').val(isAll);
    if ($(e.target).attr('class') == 'delete-all-product') {
        $('#cfm').text('All products in the cart will be deleted.');
    } else {
        $('#cfm').text('The product (' + name + ') will be removed from the cart.');
    }
    jQuery.noConflict();
    $('#confirm-delete').modal('show');
});

$('.btn-ok').on('click', function () {

    var pid = $('#app_id').val();
    var cid = $('#app_cid').val();
    var isAll = $('#app_isAll').val();
//                            console.log(123);


    $.ajax({
        url: "/deleteCart",
        type: "get", //send it through get method
        data: {
            pid: pid,
            cid: cid,
            isAll: isAll
        },
        success: function (response) {
            //Do Something
            $('#confirm-delete').modal('toggle');
//                                    $('#content').html(response);
            if (isAll == 1) {
                $('.delete-all').remove();
            } else {
                $('#div-product-' + pid).remove();
            }

        },
        error: function (xhr) {
            //Do Something to handle error
            console.log("xhr");
            console.log(xhr);
        }
    });
});


$('#btn-checkout').click(function () {
    var count = 0 * 1;
    var listItem = $('.cb-element:checked');
    var url = "cartCompletion?";
    listItem.each(function () {
        if (count == listItem.length - 1) {
            url += "id=" + $(this).val();
        } else {
            url += "id=" + $(this).val() + "&";
        }
        count++;

    });
    if (listItem.length >= 1) {
        window.location.href = url;
    }

});
//$('.cb-element').change(function () {
//    if ($('.cb-element:checked').length == $('.cb-element').length) {
//        $('#checkall').prop('checked', true);
//    } else {
//        $('#checkall').prop('checked', false);
//    }
//});


