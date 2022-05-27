<%-- 
    Document   : home
    Created on : May 24, 2022, 10:00:48 PM
    Author     : DELL
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib  prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="../../assets/public/css/bootstrap.min.css" rel="stylesheet">
        <link href="../../assets/public/css/font-awesome.min.css" rel="stylesheet">
        <link href="../../assets/public/css/prettyPhoto.css" rel="stylesheet">
        <link href="../../assets/public/css/price-range.css" rel="stylesheet">
        <link href="../../assets/public/css/animate.css" rel="stylesheet">
        <link href="../../assets/public/css/main.css" rel="stylesheet">
        <link href="../../assets/public/css/responsive.css" rel="stylesheet">
        <title>Home | E-Shopper</title>
    </head>
    <body>
        <jsp:include page="../home-template/header.jsp"/>

        <!--slider-->
        <section id="slider">
            <div class="container">
                <div class="row">
                    <div class="col-sm-12">
                        <div id="slider-carousel" class="carousel slide" data-ride="carousel">
                            <c:set scope="request" var="count_carousel" value="${-1}"/>

                            <ol class="carousel-indicators">
                                <li data-target="#slider-carousel" data-slide-to="<c:out value = "${request.count_carousel + 1}"/>" class="active ${(request.count_carousel == 0)? "active":""}"></li>
                                <li data-target="#slider-carousel" data-slide-to="1"></li>
                                <li data-target="#slider-carousel" data-slide-to="2"></li>
                            </ol>

                            <div class="carousel-inner">
                                <c:set scope="request" var="count_item" value="${-1}"/>
                                <div class="item active ${(request.count_item == 0)?"active":""}">
                                    <div class="col-sm-6">
                                        <h1><span>E</span>-SHOPPER</h1>
                                        <h2>super sale at midnight</h2>
                                        <p>Together buy anything you like, let's go.</p>
                                        <button type="button" class="btn btn-default get">Get it now</button>
                                    </div>
                                    <div class="col-sm-6">
                                        <img src="../../assets/public/images/home/girl1.jpg" class="girl img-responsive" alt="" />
                                    </div>
                                </div>
                                <div class="item">
                                    <div class="col-sm-6">
                                        <h1><span>E</span>-SHOPPER</h1>
                                        <h2>Shop for brands with many offers.</h2>
                                        <p>Together buy anything you like, let's go. </p>
                                        <button type="button" class="btn btn-default get">Get it now</button>
                                    </div>
                                    <div class="col-sm-6">
                                        <img src="../../assets/public/images/home/girl2.jpg" class="girl img-responsive" alt="" />
                                    </div>
                                </div>

                                <div class="item">
                                    <div class="col-sm-6">
                                        <h1><span>E</span>-SHOPPER</h1>
                                        <h2>E-Commerce With more chosen</h2>
                                        <p>Together buy anything you like, let's go. </p>
                                        <button type="button" class="btn btn-default get">Get it now</button>
                                    </div>
                                    <div class="col-sm-6">
                                        <img src="../../assets/public/images/home/girl3.jpg" class="girl img-responsive" alt="" />
                                    </div>
                                </div>
                            </div>
                            <a href="#slider-carousel" class="left control-carousel hidden-xs" data-slide="prev">
                                <i class="fa fa-angle-left"></i>
                            </a>
                            <a href="#slider-carousel" class="right control-carousel hidden-xs" data-slide="next">
                                <i class="fa fa-angle-right"></i>
                            </a>
                        </div>
                    </div>
                </div>
            </div>
        </section><!--/slider-->

        <!--content-->
        <section>
            <div class="container">
                <div class="row">
                    <div class="col-sm-3">
                        <div class="left-side"> <!-- left-sidebar -->
                            <h2 class="title text-center">Hot Posts</h2>
                            <div class="panel-group category-products" id="accordian">
                                <c:if test="${requestScope.listHotPost != null}">
                                    <c:forEach items="${requestScope.listHotPost}" var="i">
                                        <div class="panel panel-default">
                                            <div class="col-sm-12">
                                                <div class="product-image-wrapper">
                                                    <div class="single-products">
                                                        <div class="productinfo text-center">
                                                            <a href="#">
                                                                <img src="${i.thumbnail}" alt="" />
                                                            </a>
                                                            <h2>${i.title}</h2>
                                                            <p>${i.briefInfo}</p>
                                                            <a href="#" class="btn btn-default add-to-cart">Show</a>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </c:forEach>
                                </c:if>
                            </div>
                            <!--/category-products-->

                            <div class="brands_product "> <!-- brands_products -->
                                <!--products_featured-->
                                <h2 class="title text-center">Product Featured</h2>
                                <c:forEach items="${requestScope.listProductFeatured}" var="i">
                                    <div class="col-sm-12">
                                        <div class="product-image-wrapper">
                                            <div class="single-products">
                                                <div class="productinfo text-center">
                                                    <a href="#${i.id}">
                                                        <img src="${i.thumbnail}" alt="" />
                                                    </a>
                                                    <h2>${i.name}</h2>
                                                    <p>
                                                        <span style="margin-right: 10px; text-decoration: line-through;">
                                                            <fmt:formatNumber  maxFractionDigits = "3" type = "currency" value = "${i.price}"/>
                                                        </span>
                                                        <span style="color: red;">
                                                            <fmt:formatNumber  maxFractionDigits = "3" type = "currency" value = "${i.price - (i.price*i.discount/100)}"/>
                                                       
                                                        </span>
                                                    </p>
                                                    <a href="#${i.id}" class="btn btn-default add-to-cart">Show</a>
                                                </div>
                                            </div>

                                        </div>
                                    </div>
                                </c:forEach>
                            </div>
                        </div>
                    </div>

                    <div class="col-sm-9 padding-right"> <!-- right-sidebar -->
                        <div class="features_items">
                            <h2 class="title text-center">Latest Posts</h2>
                            <c:forEach items="${requestScope.listLatestPost}" var="i">
                                <div class="col-sm-6">
                                    <div class="product-image-wrapper">
                                        <div class="single-products">
                                            <div class="productinfo text-center">
                                                <a href="#">
                                                    <img src="${i.thumbnail}" alt="" />
                                                </a>
                                                <h2>${i.title}</h2>
                                                <p>${i.briefInfo}</p>
                                                <a href="#" class="btn btn-default add-to-cart">Show</a>
                                            </div>

                                        </div>

                                    </div>
                                </div>
                            </c:forEach>
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
        <script>
            $("#search-box").on('keyup', function (e) {
                if (e.key === 'Enter' || e.keyCode === 13) {
                    window.location.href = "";
                }
            });
        </script>
    </body>
</html>
