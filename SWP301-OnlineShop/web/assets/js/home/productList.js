function addToCartFunction(id, quantity, customer) {
    var customerId= customer;
    var productId = id;
    var quantityOrder = 1;
    var quantityProduct = quantity;
    var divAlterQuantityOrder = document.getElementById('alter_quantityOrder');
    if (customerId === -1) {
        window.location.href = "/login";
        window.location.assign("http://localhost:8080/login");
        return ;
    }
    if(quantityOrder < 0){
        divAlterQuantityOrder.innerHTML = "<div class='alert alert-danger' style='padding: 10px;width: 75%;'>Quantity must be greater than 1! </div>";
        return ;
    }

    if(quantityOrder > quantityProduct){
        divAlterQuantityOrder.innerHTML = "<div class='alert alert-danger' style='padding: 10px;width: 75%;'>Quantity must be less than " + quantityProduct + "!"+"</div>";
        return ;
    }
    
    
    $.ajax({
        url: '/addProductToCart',
        type: 'POST',
        data: {
            customerId: customerId,
            quantityOrder: quantityOrder,
            productId: productId
        },
        success: function (data, textStatus, jqXHR) {
            var divAlter = document.getElementById('add-to-cart-alter');
            divAlter.innerHTML = "<div class='add-to-cart-show'>\n"
                    + '<div class="add-to-cart-show__icon-check"><i class="fa-solid fa-circle-check icon-check"></i></div>\n'
                    + '<div class="add-to-cart-show__content">Product was added in to Cart!</div>\n'
                    + '</div>\n';
            setTimeout(function () {
                divAlter.innerHTML = "";
            }, 3000);
            
            divAlterQuantityOrder.innerHTML="";
        },
        error: function (xhr, ajaxOptions, thrownError) {
            alert(ajaxOptions);
        }
    });

}