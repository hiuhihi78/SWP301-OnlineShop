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
        var output = parseInt(priceTotal).toLocaleString();
        $('#total').html(output);
        
    });

});

$('#checkall').change(function () {
    $('.cb-element').prop('checked', this.checked);
    var priceTotal = 0;
    $("#calculator input[type='checkbox']:checked").each(function () {
        var price = $(this).attr('data-price');
        priceTotal += parseInt(price);
    });
     var output = parseInt(priceTotal).toLocaleString();
    $('#total').html(output);
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
                location.reload();
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


$('.cart_quantity_up, .cart_quantity_down').on('click', function (e) {
    var pid = $(e.target).attr('id-product-quantity');
    var isUp = $(e.target).attr('is-up');
    var cartId = $(e.target).attr('cart-id');
    var currentQ = $('#input-' + pid).val();
    var price = parseFloat($('#input-' + pid).attr('data-price-1'));
    var priceTotal = parseFloat($('.cart_total_price_' + pid).text());

    if ($(e.target).attr('class') == 'cart_quantity_up') {
        changeQ = parseInt(currentQ) + 1;
        priceTotal += price;
        if (changeQ == $('#id-up-' + pid).data('max')) {
            $('#id-up-' + pid).prop('disabled', true);
        } else {
            $('#id-down-' + pid).prop('disabled', false);
            $('#id-up-' + pid).prop('disabled', false);
        }
    } else {
        changeQ = parseInt(currentQ) - 1;
        priceTotal -= price;
        if (changeQ == $('#id-down-' + pid).data('min')) {
            $('#id-down-' + pid).prop('disabled', true);
        } else {
            $('#id-up-' + pid).prop('disabled', false);
            $('#id-down-' + pid).prop('disabled', false);
        }
    }
    
    //Set value for input hidden
    $('#input-' + pid).val(changeQ);
    
    //Set value total price
    var output = parseInt(priceTotal).toLocaleString();
    $('.cart_total_price_' + pid).text(priceTotal);
    
    $('#cbo-'+ pid).attr('data-price', priceTotal);
    

    $.ajax({
        url: "/cartDetails",
        type: "post", //send it through get method
        data: {
            pid: pid,
            isUp: isUp,
            cartId: cartId
        },
        success: function (response) {
            //Do Something
            $('#show-quantity-' + pid).html(response);
        },
        error: function (xhr) {
            //Do Something to handle error
            console.log("xhr");
        }
    });

});


$('#change-id').click(function () {
    jQuery.noConflict();
    $('#confirm-change').modal('show');

});

$('.btn-update').on('click', function () {

    var fullName = $('#iFullName').val();
    var email = $('#iEmail').val();
    var mobile = $('#iMobile').val();
    var address = $('#iAddress').val();
    


    $.ajax({
        url: "/cartContact",
        type: "post", //send it through get method
        data: {
            fullName: fullName,
            email: email,
            mobile: mobile,
            address: address
        },
        success: function (response) {
            //Do Something
            $('#confirm-change').modal('toggle');
            $('#address-id').html(response);

        },
        error: function (xhr) {
          
        }
    });
});


