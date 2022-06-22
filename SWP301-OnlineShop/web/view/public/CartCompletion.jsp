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
                            <div class="search_box" style="margin-top: 10px;">
                                <input type="text" name="searchBy" value="${requestScope.searchBy}"  placeholder="Search" style="width:100%; background-position: 188px;"/>
                            </div>
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
                        <section id="cart_items">
                            <h2 class="title text-center" style="border-bottom: solid 3px;">Cart Completion</h2>

                            <div class="table-responsive cart_info">
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
                                        <tr>
                                            <td class="cart_product">
                                                <a href=""><img src="images/cart/one.png" alt=""></a>
                                            </td>
                                            <td class="cart_description">
                                                <h4><a href="">Colorblock Scuba</a></h4>
                                                <p>Web ID: 1089772</p>
                                            </td>
                                            <td class="cart_price">
                                                <p>$59</p>
                                            </td>
                                            <td class="cart_quantity">
                                                <div class="cart_quantity_button">
                                                    <a class="cart_quantity_up" href=""> + </a>
                                                    <input class="cart_quantity_input" type="text" name="quantity" value="1" autocomplete="off" size="2">
                                                    <a class="cart_quantity_down" href=""> - </a>
                                                </div>
                                            </td>
                                            <td class="cart_total">
                                                <p class="cart_total_price">$59</p>
                                            </td>
                                            <td class="cart_delete">
                                                <a class="cart_quantity_delete" href=""><i class="fa fa-times"></i></a>
                                            </td>
                                        </tr>

                                        <tr>
                                            <td class="cart_product">
                                                <a href=""><img src="images/cart/two.png" alt=""></a>
                                            </td>
                                            <td class="cart_description">
                                                <h4><a href="">Colorblock Scuba</a></h4>
                                                <p>Web ID: 1089772</p>
                                            </td>
                                            <td class="cart_price">
                                                <p>$59</p>
                                            </td>
                                            <td class="cart_quantity">
                                                <div class="cart_quantity_button">
                                                    <a class="cart_quantity_up" href=""> + </a>
                                                    <input class="cart_quantity_input" type="text" name="quantity" value="1" autocomplete="off" size="2">
                                                    <a class="cart_quantity_down" href=""> - </a>
                                                </div>
                                            </td>
                                            <td class="cart_total">
                                                <p class="cart_total_price">$59</p>
                                            </td>
                                            <td class="cart_delete">
                                                <a class="cart_quantity_delete" href=""><i class="fa fa-times"></i></a>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="cart_product">
                                                <a href=""><img src="images/cart/three.png" alt=""></a>
                                            </td>
                                            <td class="cart_description">
                                                <h4><a href="">Colorblock Scuba</a></h4>
                                                <p>Web ID: 1089772</p>
                                            </td>
                                            <td class="cart_price">
                                                <p>$59</p>
                                            </td>
                                            <td class="cart_quantity">
                                                <div class="cart_quantity_button">
                                                    <a class="cart_quantity_up" href=""> + </a>
                                                    <input class="cart_quantity_input" type="text" name="quantity" value="1" autocomplete="off" size="2">
                                                    <a class="cart_quantity_down" href=""> - </a>
                                                </div>
                                            </td>
                                            <td class="cart_total">
                                                <p class="cart_total_price">$59</p>
                                            </td>
                                            <td class="cart_delete">
                                                <a class="cart_quantity_delete" href=""><i class="fa fa-times"></i></a>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td colspan="4">&nbsp;</td>
                                            <td colspan="2">
                                                <table class="table table-condensed total-result">
                                                    <tr>
                                                        <td>Cart Sub Total</td>
                                                        <td>$59</td>
                                                    </tr>
                                                    <tr>
                                                        <td>Exo Tax</td>
                                                        <td>$2</td>
                                                    </tr>
                                                    <tr class="shipping-cost">
                                                        <td>Shipping Cost</td>
                                                        <td>Free</td>										
                                                    </tr>
                                                    <tr>
                                                        <td>Total</td>
                                                        <td><span>$61</span></td>
                                                    </tr>
                                                </table>
                                            </td>
                                        </tr>
                                    </tbody>
                                </table>
                            </div>
                            <div class="payment-options">
                                <span>
                                    <label><input type="checkbox"> Direct Bank Transfer</label>
                                </span>
                                <span>
                                    <label><input type="checkbox"> Check Payment</label>
                                </span>
                                <span>
                                    <label><input type="checkbox"> Paypal</label>
                                </span> 
                            </div>
                            <div class="col-sm-8 clearfix">
                                <div class="bill-to">
                                    <p>Ship Information</p>
                                    <div class="form-one">
                                        <form>
                                            <input type="text" placeholder="Company Name">
                                            <input type="text" placeholder="Email*">
                                            <input type="text" placeholder="Title">
                                            <input type="text" placeholder="First Name *">
                                            <input type="text" placeholder="Middle Name">
                                            <input type="text" placeholder="Last Name *">
                                            <input type="text" placeholder="Address 1 *">
                                            <input type="text" placeholder="Address 2">
                                        </form>
                                    </div>
                                    <div class="form-two">
                                        <form>
                                            <input type="text" placeholder="Zip / Postal Code *">
                                            <select>
                                                <option>-- Country --</option>
                                                <option>United States</option>
                                                <option>Bangladesh</option>
                                                <option>UK</option>
                                                <option>India</option>
                                                <option>Pakistan</option>
                                                <option>Ucrane</option>
                                                <option>Canada</option>
                                                <option>Dubai</option>
                                            </select>
                                            <select>
                                                <option>-- State / Province / Region --</option>
                                                <option>United States</option>
                                                <option>Bangladesh</option>
                                                <option>UK</option>
                                                <option>India</option>
                                                <option>Pakistan</option>
                                                <option>Ucrane</option>
                                                <option>Canada</option>
                                                <option>Dubai</option>
                                            </select>
                                            <input type="text" placeholder="Phone *">
                                            <input type="text" placeholder="Mobile Phone">
                                            <input type="text" placeholder="Fax">
                                        </form>
                                    </div>
                                </div>
                            </div>
                            <div class="col-sm-4">
                                <div class="order-message">
                                    <p>Note</p>
                                    <textarea name="message"  placeholder="Notes about your order, Special Notes for Delivery" rows="16"></textarea>
                                </div>	
                            </div>	
                        </section>
                    </div>
                    <!--END PRODCUT LIST-->
                    <form action="/cartCompletion" method="POST">
                        <button class="btn btn-primary">Complete</button>
                    </form>
                    
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
