<!DOCTYPE html>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib  prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<html lang="en">

    <head>
        <meta charset="UTF-8">
        <title>Cart Details</title>
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="../../assets/public/css/bootstrap.min.css" rel="stylesheet">
        <link rel="shortcut icon" type="image/x-icon" href="assets/img/lg.png" />
        <link href="../../assets/public/css/font-awesome.min.css" rel="stylesheet">
        <link href="../../assets/public/css/prettyPhoto.css" rel="stylesheet">
        <link href="../../assets/public/css/price-range.css" rel="stylesheet">
        <link href="../../assets/public/css/animate.css" rel="stylesheet">
        <link href="../../assets/public/css/main.css" rel="stylesheet">
        <link href="../../assets/public/css/responsive.css" rel="stylesheet">
        <link href="../../assets/public/css/style.css" rel="stylesheet">

    </head>
    <!--/head-->

    <body>
        <jsp:include page="../home-template/headerProductlist.jsp"/>
        <section id="cart_items">
            <div class="container">
                <div class="breadcrumbs">
                    <ol class="breadcrumb">
                        <li><a href="#">Home</a></li>
                        <li class="active">Shopping Cart</li>
                    </ol>
                </div>

                <c:choose>
                    <c:when test="${not empty carts}">
                        <div class="table-responsive cart_info">
                            <table class="table table-condensed">

                                <tbody>
                                <thead>
                                    <tr class="cart_menu">
                                        <td><input type="checkbox"></td>
                                        <td class="image">Item</td>
                                        <td class="description"></td>
                                        <td class="price">Price</td>
                                        <td class="quantity">Quantity</td>
                                        <td class="total">Total</td>
                                        <td></td>
                                    </tr>
                                </thead>
                                <c:forEach var="i" items="${carts}">
                                    <tr>
                                        <td class="cart_description"><input type="checkbox"></td>
                                        <td class="cart_product" style="height: 100px">
                                            <a href=""><img src="${(i.product).thumbnail}" alt="" width="100px" height="auto"></a>
                                        </td>
                                        <td class="cart_description">
                                            <h4><a href="">${(i.product).name}</a></h4>
                                            <p>${(i.product).description}</p>
                                        </td>
                                        <td class="cart_price">
                                            <p>${(i.product).price}</p>
                                        </td>
                                        <td class="cart_quantity">
                                            <div class="cart_quantity_button">
                                                <a class="cart_quantity_up" href=""> + </a>
                                                <input class="cart_quantity_input" type="text" name="quantity" value="${i.quantityOrder}" autocomplete="off" size="2">
                                                <a class="cart_quantity_down" href=""> - </a>
                                            </div>
                                        </td>
                                        <td class="cart_total">
                                            <p class="cart_total_price">${i.quantityOrder * (i.product).price}</p>
                                        </td>
                                        <td class="cart_delete">
                                            <a class="cart_quantity_delete" href="#"><i class="fa fa-times"></i></a>
                                        </td>
                                    </tr>
                                </c:forEach>
                                </tbody>
                            </table>
                        </div>
                        <section id="do_action">
                            <div class="container">
                                <div class="heading">
                                    <h3>What would you like to do next?</h3>
                                    <p>Choose if you have a discount code or reward points you want to use or would like to estimate your delivery cost.</p>
                                </div>
                                <div class="row">
                                    <div class="col-sm-6">
                                        <div class="chose_area">
                                            <ul class="user_option">
                                                <li>
                                                    <input type="checkbox">
                                                    <label>Use Coupon Code</label>
                                                </li>
                                                <li>
                                                    <input type="checkbox">
                                                    <label>Use Gift Voucher</label>
                                                </li>
                                                <li>
                                                    <input type="checkbox">
                                                    <label>Estimate Shipping & Taxes</label>
                                                </li>
                                            </ul>
                                            <ul class="user_info">
                                                <li class="single_field">
                                                    <label>Country:</label>
                                                    <select>
                                                        <option>United States</option>
                                                        <option>Bangladesh</option>
                                                        <option>UK</option>
                                                        <option>India</option>
                                                        <option>Pakistan</option>
                                                        <option>Ucrane</option>
                                                        <option>Canada</option>
                                                        <option>Dubai</option>
                                                    </select>

                                                </li>
                                                <li class="single_field">
                                                    <label>Region / State:</label>
                                                    <select>
                                                        <option>Select</option>
                                                        <option>Dhaka</option>
                                                        <option>London</option>
                                                        <option>Dillih</option>
                                                        <option>Lahore</option>
                                                        <option>Alaska</option>
                                                        <option>Canada</option>
                                                        <option>Dubai</option>
                                                    </select>

                                                </li>
                                                <li class="single_field zip-field">
                                                    <label>Zip Code:</label>
                                                    <input type="text">
                                                </li>
                                            </ul>
                                            <a class="btn btn-default update" href="">Get Quotes</a>
                                            <a class="btn btn-default check_out" href="">Continue</a>
                                        </div>
                                    </div>
                                    <div class="col-sm-6">
                                        <div class="total_area">
                                            <ul>
                                                <li>Cart Sub Total <span>$59</span></li>
                                                <li>Eco Tax <span>$2</span></li>
                                                <li>Shipping Cost <span>Free</span></li>
                                                <li>Total <span>$61</span></li>
                                            </ul>
                                            <a class="btn btn-default update" href="">Update</a>
                                            <a class="btn btn-default check_out" href="">Check Out</a>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </section>

                    </c:when>
                    <c:otherwise>
                        <h1><b>OPPS!</b> There are no Products in the Cart!</h1>
                    </c:otherwise>
                </c:choose>



            </div>
        </section> <!--/#cart_items-->


        <jsp:include page="../home-template/footer.jsp"/>
        <script src="../../assets/public/js/jquery.js"></script>
        <script src="../../assets/public/js/bootstrap.min.js"></script>
        <script src="../../assets/public/js/jquery.scrollUp.min.js"></script>
        <script src="../../assets/public/js/price-range.js"></script>
        <script src="../../assets/public/js/jquery.prettyPhoto.js"></script>
        <script src="../../assets/public/js/main.js"></script>
        <script src="../../assets/js/home/home.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-validate/1.19.4/jquery.validate.min.js" integrity="sha512-FOhq9HThdn7ltbK8abmGn60A/EMtEzIzv1rvuh+DqzJtSGq8BRdEN0U+j0iKEIffiw/yEtVuladk6rsG4X6Uqg==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
    </body>

</html>