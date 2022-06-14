<!DOCTYPE html>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib  prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<html lang="en">

    <head>
        <meta charset="UTF-8">
        <title>My orders | E-shopper</title>
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
        <link rel="stylesheet" href="https://unpkg.com/bootstrap-table@1.20.2/dist/bootstrap-table.min.css">
        <link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/npm/daterangepicker/daterangepicker.css" />

    </head>
    <!--/head-->

    <body>
        <jsp:include page="../home-template/header.jsp"/>
        <section>
            <div class="container">
                <div class="row flex-justify">
                    <div class="col-sm-3 box-shadow height-fit-content border-radius-2" >
                        <div class="left-side"> <!-- left-sidebar -->
                            <h2 class="title text-center " style="border-bottom: solid 2px; margin-top: 10px;">Category</h2>
                            <div class="panel-group category-products" id="accordian"><!--category-productsr-->

                                <c:forEach items="${requestScope.listCategorys}" var="list">
                                    <c:if test="${not empty list.listSubCategory}"> <!-- check empty of list subcategory with that category -->
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
                                                            <li><a href="">${listSub.name} </a></li> 
                                                            </c:forEach>
                                                    </ul>
                                                </div>
                                            </div>
                                        </div>
                                    </c:if>
                                    <c:if test="${ empty list.listSubCategory}"> <!-- check empty of list subcategory with that category -->
                                        <div class="panel panel-default">
                                            <div class="panel-heading">
                                                <h4 class="panel-title"><a href="#">${list.name}</a></h4>
                                            </div>
                                        </div>
                                    </c:if>
                                </c:forEach>
                            </div><!--/category-products-->

                            <div class="panel-group category-products" id="accordian"><!-- 2 least product -->
                                <h2 class="title text-center" style="border-bottom: solid 2px;">Latest Product</h2>
                                <%--<c:set var="leat" value="" />--%>
                                <c:if test="${requestScope.leastProduct != null}">
                                    <c:forEach items="${requestScope.leastProduct}" var="leastProduct">
                                        <div class="product-image-wrapper">
                                            <div class="single-products">
                                                <div class="productinfo text-center">
                                                    <a href="#">
                                                        <img src="${leastProduct.thumbnail}" alt="" />
                                                    </a>
                                                    <h2 class="break-down-line">${leastProduct.name}</h2>
                                                    <!--<p class="break-down-line">${leastProduct.description}</p>-->
                                                    <p>
                                                        <span class="text-line-through">
                                                            <fmt:formatNumber  maxFractionDigits = "3" type = "currency" value = "${leastProduct.price}"/>
                                                        </span>
                                                        <span class="text-danger">
                                                            <fmt:formatNumber  maxFractionDigits = "3" type = "currency" value = "${leastProduct.priceDiscount}"/>
                                                        </span>
                                                    </p>
                                                    <a href="#" class="btn btn-default add-to-cart">More Information</a>
                                                </div>
                                            </div>
                                        </div>
                                    </c:forEach>
                                </c:if>
                            </div><!-- end two least product --> 

                        </div>                     
                    </div>
                    <div class="col-sm-9 padding-right">
                        <div class="features_items">
                            <!--features_items-->
                            <h2 class="title text-center" style="border-bottom: solid 2px; margin-top: 10px">Your orders</h2>
                            <div id ="customToolbar">
                                <span>Please set date range to view your data:</span></br>
                                <div id="reportrange" style="background: #fff; cursor: pointer; padding: 5px 10px; border: 1px solid #ccc; width: 100%">
                                    <i class="fa fa-calendar"></i>&nbsp;
                                    <span></span> <i class="fa fa-caret-down"></i>
                                </div>
                            </div>
                            <!-- Order table -->
                            <table
                                data-toggle="table"
                                data-pagination="true"
                                data-sortable="true"
                                data-search="true"
                                data-toolbar="#customToolbar"
                                data-flat="true"
                                data-method="post"
                                data-query-params="queryParams"
                                data-url="/myorders">

                                <thead>
                                    <tr>
                                        <th data-sortable="true" data-field="id">Order ID</th>
                                        <th data-sortable="true" data-field="date">Ordered Date</th>
                                        <th data-sortable="true" data-field="products.0.name">Product (First product name)</th>
                                        <th data-sortable="true" data-field="numproducts">Number of products</th>
                                        <th data-sortable="true" data-field="totalcost">Total cost</th>
                                        <th data-sortable="true" data-field="status" data-align="center">Status</th>
                                    </tr>
                                </thead>
<!--                                <tbody>
                                    <c:forEach items="${requestScope.orders}" var="o">
                                        <tr>
                                            <td>${o.id}</td>
                                            <td><fmt:formatDate pattern="dd-MM-yyyy" value="${o.date}"/></td>
                                            <td>${o.products[0].name}</td>
                                            <td>${o.numproducts}</td>
                                            <td>${o.totalcost}</td>
                                            <c:if test="${o.status == 0}">
                                                <td>
                                                    <span class="label label-default">Cancelled</span>
                                                </td>
                                            </c:if>
                                            <c:if test="${o.status == 1}">
                                                <td>
                                                    <span class="label label-info">Processing</span>
                                                </td>
                                            </c:if>
                                            <c:if test="${o.status == 2}">
                                                <td>
                                                    <span class="label label-success">Finished</span>
                                                </td>
                                            </c:if>
                                        </tr>
                                    </c:forEach> 
                                </tbody>-->
                            </table>
                            <!-- Order table -->
                        </div>

                        <!--features_items-->
                    </div>
                </div>
                <div class="pagging">
                    <ul class="pagination pull-right">
                        <li class="active"><a href="">1</a></li>
                        <li><a href="">2</a></li>
                        <li><a href="">3</a></li>
                        <li><a href="">&raquo;</a></li>
                    </ul>
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
        <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-validate/1.19.4/jquery.validate.min.js" integrity="sha512-FOhq9HThdn7ltbK8abmGn60A/EMtEzIzv1rvuh+DqzJtSGq8BRdEN0U+j0iKEIffiw/yEtVuladk6rsG4X6Uqg==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
        <script src="https://unpkg.com/bootstrap-table@1.20.2/dist/bootstrap-table.min.js"></script>
        <script type="text/javascript" src="https://cdn.jsdelivr.net/momentjs/latest/moment.min.js"></script>
        <script type="text/javascript" src="https://cdn.jsdelivr.net/npm/daterangepicker/daterangepicker.min.js"></script>
    </body>

</html>