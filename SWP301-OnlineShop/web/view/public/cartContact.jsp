<%-- 
    Document   : cartContact
    Created on : Jun 24, 2022, 12:58:57 PM
    Author     : ASUS
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib  prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

        <script data-require="jquery@*" data-semver="2.0.3" src="http://code.jquery.com/jquery-2.0.3.min.js"></script>
        <script data-require="bootstrap@*" data-semver="3.1.1" src="//netdna.bootstrapcdn.com/bootstrap/3.1.1/js/bootstrap.min.js"></script>
        <link data-require="bootstrap-css@3.1.1" data-semver="3.1.1" rel="stylesheet" href="//netdna.bootstrapcdn.com/bootstrap/3.1.1/css/bootstrap.min.css" />
        <meta charset="UTF-8">
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
        <link href="../../assets/css/cart/style.css" rel="stylesheet">
        <title>Cart | Contact</title>
    </head>
    <body>
        <jsp:include page="../home-template/headerProductlist.jsp"/>
        <section id="cart_items">
            <div class="container">
                <div class="row flex-justify">
                    <div class="col-sm-3 box-shadow height-fit-content border-radius-2" >
                        <div class="left-side"> <!-- left-sidebar -->
                            <h2 class="title text-center border">Category</h2>
                            <form action="productlist" method="get">
                                <div class="panel-group category-products" id="accordian"><!--category-products-->
                                    <div class="panel panel-default">
                                        <div class="panel-heading">

                                            <div class="search_box">
                                                <!--<input id="search-box" type="text" placeholder="Search..." name="searchBy" value="${requestScope.searchBy}">-->
                                                <input type="text" name="searchBy" value="${requestScope.searchBy}"  placeholder="Search"/>
                                            </div>
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


                            <div class="panel-group category-products" id="accordian"><!-- 2 least product -->
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
                        <div class="features_items">
                            <!--features_items-->
                            <h2 class="title text-center" style="border-bottom: solid 2px; margin-top: 10px">Cart Contact</h2>
                            <form action="cartCompletion" method="post">
                                <div class="table-responsive cart_info">


                                    <div class="checkout-options">
                                        <div class="register-req">
                                            <b><h4><p><i class="fa fa-location-arrow" aria-hidden="true"></i> Address</p></h4></b>
                                            <div id="info-user-id">
                                                <p id="address-id"><b>${user.fullname}&nbsp;&nbsp;${user.mobile}</b>&nbsp;&nbsp;&nbsp;&nbsp;${user.address}</p>
                                                <a id="change-id" href="#" >Change</a>
                                            </div>

                                            <input type="hidden" name="txtFullname" value="${user.fullname}"/>
                                            <input type="hidden" name="txtGender" value="${user.gender}"/>
                                            <input type="hidden" name="txtPhone" value="${user.mobile}"/>
                                            <input type="hidden" name="txtAddress" value="${user.address}"/>
                                        </div>

                                    </div><!--/checkout-options-->

                                    <table class="table table-condensed">
                                        <thead>
                                            <tr class="cart_menu">

                                                <td class="image">Item</td>
                                                <td class="description"></td>
                                                <td class="price">Price</td>
                                                <td class="quantity">Quantity</td>
                                                <td>Total</td>

                                            </tr>
                                        </thead>
                                        <tbody>

                                            <c:forEach var="i" items="${cartProduct}">
                                                <tr>
                                                    <!--Get Data product here Start-->
                                            <input type="hidden" name="pr-id" value="${(i.product).id}">
                                            <input type="hidden" name="pr-quantity" value="${i.quantity}">
                                            <input type="hidden" name="pr-price" value="${(i.product).price}">
                                            <input type="hidden" name="pr-discount" value="${(i.product).getPriceDiscount()}">
                                            <!--Get Data product here End-->
                                            <td class="cart_product" style="width: 180px">
                                                <a href=""><img src="${(i.product).thumbnail}" alt="" width="100px" height="auto"></a>
                                            </td>
                                            <td class="cart_description">
                                                <h4><a href="">${(i.product).name}</a></h4>
                                            </td>
                                            <td class="cart_price">
                                                <span class="text-danger">
                                                    <fmt:formatNumber type = "number" value = "${(i.product).getPriceDiscount()}"/> đ
                                                </span>
                                            </td>
                                            <td class="cart_quantity">
                                                <div class="cart_quantity_button">
                                                    <div id="show-quantity"><input disabled="" class="cart_quantity_input" type="text" value="${i.quantity}" autocomplete="off" size="2"></div>
                                                </div>
                                            </td>
                                            <td class="cart_total">
                                                <p class="cart_total_price"> <fmt:formatNumber type = "number" value = "${i.quantity * (i.product).getPriceDiscount()}"/> &nbsp;đ</p>

                                            </td>
                                            </tr>
                                        </c:forEach>
                                        <tr>
                                            <td colspan="3"></td>
                                            <td colspan="2" >
                                                <table class="table table-condensed total-result">

                                                    <tr>

                                                        <td></td>
                                                        <td></td>
                                                     

                                                        <td><b>Total:<p class="cart_total_price"> <fmt:formatNumber type = "number" value = "${total}"/> &nbsp;đ</p></b></td>

                                                    </tr>
                                                </table>
                                            </td>

                                        </tr>
                                        <tr>
                                            <td colspan="3"><textarea name="txtNote"  placeholder="Notes about your order, Special Notes for Delivery" rows="5"></textarea></td>
                                            <td colspan="2" id="pay-id">
                                                
                                                    <span>
                                                        <label><input type="radio" name="payment" value="delivery" checked> Payment on delivery</label>
                                                    </span>
                                                <br>
                                                    <span>
                                                        <label><input type="radio" name="payment" value="bank"> Payment by bank</label>
                                                    </span>
                                                
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>                                              
                                                <button class="btn btn-default check_out" id="btn-checkout" type="submit">Submit</button>
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

        <!--    This is start delete modal dialog-->

        <div class="modal fade" id="confirm-change" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">

                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                        <h4 class="modal-title" id="myModalLabel">Edit address</h4>
                    </div>

                    <div class="modal-body">
                        <form class="form-horizontal" role="form" action="" method="post" id="">
                            <div class="form-group">
                                <label class="col-sm-1 control-label">Email</label>
                                <div class="col-sm-12">
                                    <input type="email" placeholder="Enter email address" class="form-control" disabled="" autofocus value="${user.email}" >
                                    <input type="hidden" id="iEmail" placeholder="Enter email address" class="form-control" autofocus value="${user.email}" >
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-sm-2 control-label">Full Name</label>

                                <div class="col-sm-12">
                                    <input type="text" id="iFullName" name="" placeholder="Enter full name" class="form-control" value="${user.fullname}" autofocus required=""/>
                                </div>
                            </div>

                            <div class="form-group">
                                <label class="col-sm-1 control-label">Mobile </label>
                                <div class="col-sm-12">
                                    <input type="text" id="iMobile" name="" placeholder="Enter your mobile" class="form-control" value="${user.mobile}" >
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-sm-1 control-label">Address </label>
                                <div class="col-sm-12">
                                    <textarea id="iAddress" class="form-control" rows="2" placeholder="Enter your address" >${user.address}</textarea>
                                </div>
                            </div>

                        </form> 
                    </div>

                    <div class="modal-footer">
                        <button type="button" class="btn btn-default" data-dismiss="modal">Cancel</button>
                        <a class="btn btn-danger btn-update">Update</a>
                    </div>

                </div>
            </div>
        </div>


        <jsp:include page="../home-template/footer.jsp"/>

        <script src="../../assets/js/cart/script.js"></script>
        <script src="../../assets/public/js/jquery.js"></script>
        <script src="../../assets/public/js/bootstrap.min.js"></script>
        <script src="../../assets/public/js/jquery.scrollUp.min.js"></script>
        <script src="../../assets/public/js/price-range.js"></script>
        <script src="../../assets/public/js/jquery.prettyPhoto.js"></script>
        <script src="../../assets/public/js/main.js"></script>
        <script src="../../assets/js/home/home.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-validate/1.19.4/jquery.validate.min.js" integrity="sha512-FOhq9HThdn7ltbK8abmGn60A/EMtEzIzv1rvuh+DqzJtSGq8BRdEN0U+j0iKEIffiw/yEtVuladk6rsG4X6Uqg==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
    </body>
</html>
