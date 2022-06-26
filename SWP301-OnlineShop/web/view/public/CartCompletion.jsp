<%-- 
    Document   : CartCompletion
    Created on : Jun 17, 2022, 8:54:10 AM
    Author     : DELL
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib  prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Cart Completion | E-Shopper</title>
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="../../assets/public/css/bootstrap.min.css" rel="stylesheet">
        <link href="../../assets/public/css/font-awesome.min.css" rel="stylesheet">
        <link href="../../assets/public/css/prettyPhoto.css" rel="stylesheet">
        <link href="../../assets/public/css/price-range.css" rel="stylesheet">
        <link href="../../assets/public/css/animate.css" rel="stylesheet">
        <link href="../../assets/public/css/main.css" rel="stylesheet">
        <link href="../../assets/public/css/responsive.css" rel="stylesheet">

        <link href="../../assets/public/css/style.css" rel="stylesheet">
    </head>
    <body>
        <jsp:include page="../home-template/headerProductlist.jsp"/>
        <section>
            <div class="container">
                <div class="row flex-justify">
                    <div class="col-sm-3 box-shadow height-fit-content border-radius-2" >
                        <div class="left-side"> <!-- left-sidebar -->

                            <h2 class="title text-center " style="border-bottom: solid 2px; margin-top: 10px;">Category</h2>
                            <form action="productlist" method="get">
                                <div class="panel-group category-products" id="accordian"><!--category-products-->
                                    <div class="panel panel-default">
                                        <div class="panel-heading">
                                        </div>
                                        <div class="panel-heading">
                                            <h4 class="panel-title">
                                                <a href="productlist">
                                                    <span class="badge pull-right"></span>
                                                    All Category
                                                </a>
                                            </h4>
                                        </div>
                                    </div>
                                    <c:forEach items="${requestScope.listCategorys}" var="list">
                                        <c:if test="${ not empty list.listSubCategory }"> <!-- check empty of list subcategory with that category -->
                                            <div class="panel panel-default">
                                                <div class="panel-heading">
                                                    <h4 class="panel-title">

                                                        <a data-toggle="collapse" data-parent="#accordian" href="#${list.id}">
                                                            <span class="badge pull-right"><i class="fa fa-plus"></i></span>
                                                                ${list.name}
                                                        </a>
                                                    </h4>
                                                </div>
                                                <div id="${list.id}" class="panel-collapse collapse">
                                                    <div class="panel-body">
                                                        <ul>
                                                            <c:forEach items="${list.listSubCategory}" var="listSub">
                                                                <li><a href="productlist?subCategory=${listSub.id}&searchBy=${searchBy}">${listSub.name} </a></li> 
                                                                </c:forEach>
                                                        </ul>
                                                    </div>
                                                </div>
                                            </div>
                                        </c:if>
                                    </c:forEach>
                                    <div class="search_box" style="margin-top: 10px;">
                                        <input type="text" name="searchBy" value="${requestScope.searchBy}"  placeholder="Search" style="width: 83%;
                                               margin: 0 0 0 7%;
                                               background-position: 188px;"/>
                                    </div>
                                </div><!--/category-products--> 

                            </form>

                            <div class="panel-group category-products" id="accordian"><!-- 3 least product -->
                                <h2 class="title text-center" style="border-bottom: solid 2px;">Latest Product</h2>
                                <%--<c:set var="leat" value="" />--%>
                                <c:if test="${requestScope.leastProduct != null}">
                                    <c:forEach items="${requestScope.leastProduct}" var="leastProduct">
                                        <div class="product-image-wrapper">
                                            <div class="single-products">
                                                <div class="productinfo text-center">
                                                    <a href="productdetails?productID=${leastProduct.id}">
                                                        <img src="${leastProduct.thumbnail}" alt="" />
                                                    </a>
                                                    <h2 class="break-down-line">${leastProduct.name}</h2>
                                                    <p class="break-down-line">${leastProduct.description}</p>
                                                    <p>
                                                        <span class="text-line-through">
                                                            <fmt:formatNumber  maxFractionDigits = "3" type = "currency" value = "${leastProduct.price}"/>
                                                        </span>
                                                        <span class="text-danger">
                                                            <fmt:formatNumber  maxFractionDigits = "3" type = "currency" value = "${leastProduct.priceDiscount}"/>
                                                        </span>
                                                    </p>
                                                    <a href="productdetails?productID=${leastProduct.id}" class="btn btn-default add-to-cart">More Information</a>
                                                </div>
                                            </div>
                                        </div>
                                    </c:forEach>
                                </c:if>
                            </div><!-- end two least product --> 

                        </div>                     
                    </div>
                    <!--PRODUCT LIST-->
                    <div class="col-sm-9 padding-right">
                        <div id="cart_items">
                            <h2 class="title text-center" style="margin-top: 10px;">Your order has been successfully</h2>
                            <form action="cartCompletion" method="POST">
                                <div class="table-responsive cart_info">
                                    <div class="checkout-options">
                                        <div class="register-req">
                                            <b><h4><p><i class="fa fa-location-arrow" aria-hidden="true"></i> Address</p></h4></b>
                                            <div id="info-user-id">
                                                <p id="address-id"><b>${requestScope.fullname}&nbsp;&nbsp;${requestScope.mobile}</b>&nbsp;&nbsp;&nbsp;&nbsp;${requestScope.address}</p>
                                            </div>
                                        </div>
                                    </div>
                                    <table class="table table-condensed">
                                        <thead>
                                            <tr class="cart_menu">
                                                <td class="image">Item</td>
                                                <td class="description"></td>
                                                <td class="price">Price</td>
                                                <td class="quantity">Quantity</td>
                                                <td class="total">Total</td>
                                                <td></td>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <c:forEach items="${requestScope.listProduct}" var="i">
                                                <tr>
                                                    <td class="cart_product" style="width: 180px;">
                                                        <a href="#"><img src="${i.thumbnail}" alt="" width="100px" height="auto"></a>
                                                    </td>
                                                    <td class="cart_description">
                                                        <h4 style="padding-bottom: 18px;"><a href="#" style="text-decoration: none;">${i.name}</a></h4>
                                                    </td>
                                                    <td class="cart_price">
                                                        <p><fmt:formatNumber  maxFractionDigits = "3" type = "currency" value = "${i.getPriceDiscount()}"/></p>
                                                    </td>
                                                    <td class="cart_quantity">
                                                        <input style="margin-bottom: 12px; border: none; outline: none;" class="cart_quantity_input" type="text" value="${i.quantity}" autocomplete="off" size="2" readonly>
                                                    </td>
                                                    <td class="cart_total">
                                                        <p class="cart_total_price"><fmt:formatNumber  maxFractionDigits = "3" type = "currency" value = "${i.getPriceDiscount()}"/></p>
                                                    </td>
                                                </tr>
                                            </c:forEach>
                                            <tr>
                                                <td colspan="3"><textarea name="txtNote"  placeholder="Notes about your order, Special Notes for Delivery" rows="4" disabled>${requestScope.note}</textarea></td>
                                                <td colspan="2" id="pay-id">

                                                    <span>
                                                        <label><input type="radio" name="payment" value="delivery" ${(requestScope.payment == 0)?"checked":""} disabled> Payment on delivery</label>
                                                    </span>
                                                    <br>
                                                    <span>
                                                        <label><input type="radio" name="payment" value="bank" ${(requestScope.payment == 1)?"checked":""} disabled> Payment by bank</label>
                                                    </span>

                                                </td>
                                            </tr>
                                            <tr>
                                                <td colspan="4">&nbsp;</td>
                                                <td colspan="2">
                                                    <table class="table table-condensed total-result">
                                                        <tr>
                                                            <td style="font-weight: bold;">Total</td>
                                                            <td><span><fmt:formatNumber  maxFractionDigits = "3" type = "currency" value = "${requestScope.total}"/></span></td>
                                                        </tr>
                                                    </table>
                                                </td>
                                            </tr>
                                        </tbody>
                                    </table>

                                </div>

                            </form>
                        </div>
                    </div>

                </div>
            </div>
        </section>

        <jsp:include page="../home-template/footer.jsp"/>
        <script src="../../assets/public/js/jquery.js"></script>
        <script src="../../assets/public/js/bootstrap.min.js"></script>
        <script src="../../assets/public/js/jquery.scrollUp.min.js"></script>
        <script src="../../assets/public/js/price-range.js"></script>
        <script src="../../assets/public/js/jquery.prettyPhoto.js"></script>
        <script src="../../assets/public/js/main.js"></script>
        <script src="../../assets/js/home/home.js"></script>
    </body>
</html>
