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
        <meta charset="utf-8">
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
        <title>Home | E-Shopper</title>
    </head>
    <body>
        <jsp:include page="../home-template/header.jsp"/>

        <!--slider-->
        <section id="slider">
            <c:if test="${(requestScope.numberOfSliders != 0)}">
                <div class="container">
                    <div class="row">
                        <div class="col-sm-12">
                            <div id="slider-carousel" class="carousel slide" data-ride="carousel">
                                <ol class="carousel-indicators">
                                    <c:forEach begin="0" end="${requestScope.numberOfSliders - 1}" step="1" var="i">
                                        <li data-target="#slider-carousel" data-slide-to="${i}" class="${(i == 0)?"active":""}"></li>
                                    </c:forEach>
                                </ol>
                                <div class="carousel-inner">
                                    <c:set scope="request" var="count_item" value="0"/>
                                    <c:forEach items="${requestScope.listSliderActive}" var="i">
                                        <div class="item ${(count_item == 0) ? "active":""}">
                                            <div class="col-sm-6">
                                                <h1 class="text-size-35"><span>${i.title}</span></h1>
                                                <!--<h2>super sale at midnight</h2>-->
                                                <p>${i.note}</p>
                                                <!--<button type="button" class="btn btn-default get">-->
                                                <a href="#${i.backlink}" class="btn btn-default get">Get it now</a>
                                                <!--</button>-->
                                            </div>
                                            <div class="col-sm-6">
                                                <img src="${i.image}" class="girl img-responsive" alt="image" />
                                            </div>
                                        </div>
                                        <c:set scope="request" var="count_item" value="1"/>
                                    </c:forEach>
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
            </c:if>
        </section><!--/slider-->

        <!--content-->
        <section>
            <div class="container">
                <div class="row">
                    <div class="col-sm-3">
                        <div class="left-side"> <!-- left-sidebar -->
                            <h2 class="title text-center">Latest Posts</h2>
                            <div class="panel-group category-products" id="accordian">
                                <c:if test="${requestScope.listLatestPost != null}">
                                    <c:forEach items="${requestScope.listLatestPost}" var="i">
                                        <div class="panel panel-default">
                                            <div class="col-sm-12">
                                                <div class="product-image-wrapper">
                                                    <div class="single-products">
                                                        <div class="productinfo text-center">
                                                            <a href="#">
                                                                <img src="${i.thumbnail}" alt="" />
                                                            </a>
                                                            <h2 class="break-down-line">${i.title}</h2>
                                                            <p class="break-down-line">${i.briefInfo}</p>
                                                            <a href="#" class="btn btn-default add-to-cart">Read more</a>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </c:forEach>
                                </c:if>
                            </div>
                            <!--/latest-posts-->
                        </div>
                    </div>

                    <div class="col-sm-9 padding-right"> <!-- right-sidebar -->
                        <div class="features_items">
                            <h2 class="title text-center">Hot Posts</h2>

                            <c:forEach items="${requestScope.listHotPost}" var="i">
                                <div class="col-sm-4">
                                    <div class="product-image-wrapper">
                                        <div class="single-products">
                                            <div class="productinfo text-center">
                                                <a href="#">
                                                    <img class="img-height-255" src="${i.thumbnail}" alt="" />
                                                </a>
                                                <h2 class="break-down-line">${i.title}</h2>
                                                <p class="break-down-line" >${i.briefInfo}</p>
                                                <a  href="#" class="btn btn-default add-to-cart">Read more</a>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </c:forEach>
                        </div><!-- hot-posts -->
                        <div class="brands_product "> 
                            <!--products_featured-->
                            <h2 class="title text-center">Product Featured</h2>
                            <c:forEach items="${requestScope.listProductFeatured}" var="i">
                                <div class="col-sm-4">
                                    <div class="product-image-wrapper">
                                        <div class="single-products">
                                            <div class="productinfo text-center">
                                                <a href="#${i.id}">
                                                    <img class="img-height-255" src="${i.thumbnail}" alt="" />
                                                </a>
                                                <h2 class="break-down-line">${i.name}</h2>
                                                <p>
                                                    <span class="text-line-through">
                                                        <fmt:formatNumber  maxFractionDigits = "3" type = "currency" value = "${i.price}"/>
                                                    </span>
                                                    <span class="text-danger">
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

    <jsp:include page="login.jsp"/>

    <script>
        document.getElementById('button').addEventListener('click',
                function () {
                    document.querySelector('.bg-modal').style.display = 'flex';
                });

        document.querySelector('.close').addEventListener('click',
                function () {
                    document.querySelector('.bg-modal').style.display = 'none';
                });
    </script>
</html>