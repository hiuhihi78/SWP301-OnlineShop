<%-- 
    Document   : home
    Created on : May 24, 2022, 10:00:48 PM
    Author     : DELL
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib  prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="../../assets/css/bootstrap.min.css" rel="stylesheet">
        <link href="../../assets/css/font-awesome.min.css" rel="stylesheet">
        <link href="../../assets/css/prettyPhoto.css" rel="stylesheet">
        <link href="../../assets/css/price-range.css" rel="stylesheet">
        <link href="../../assets/css/animate.css" rel="stylesheet">
        <link href="../../assets/css/main.css" rel="stylesheet">
        <link href="../../assets/css/responsive.css" rel="stylesheet">
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
                                        <img src="../../assets/images/home/girl1.jpg" class="girl img-responsive" alt="" />
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
                                        <img src="../../assets/images/home/girl2.jpg" class="girl img-responsive" alt="" />
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
                                        <img src="../../assets/images/home/girl3.jpg" class="girl img-responsive" alt="" />
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

                                <div class="panel panel-default">

                                    <div class="col-sm-12">
                                        <div class="product-image-wrapper">
                                            <div class="single-products">
                                                <div class="productinfo text-center">
                                                    <a href="#">
                                                        <img src="https://d1csarkz8obe9u.cloudfront.net/posterpreviews/white-shopping-sale-design-template-5b11d9057a21db3ec45d740893304461_screen.jpg?ts=1626343557" alt="" />
                                                    </a>
                                                    <h2>Supper Sale</h2>
                                                    <p>Super sale up to 50%</p>
                                                    <a href="#" class="btn btn-default add-to-cart">Show</a>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <!--/category-products-->

                            <div class="brands_product "> <!-- brands_products -->
                                <!--products_featured-->
                                <h2 class="title text-center">Product Featured</h2>

                                <div class="col-sm-12">
                                    <div class="product-image-wrapper">
                                        <div class="single-products">
                                            <div class="productinfo text-center">
                                                <a href="#">
                                                    <img src="https://lzd-img-global.slatic.net/g/p/045a22591978a1a859a38c113d2121de.jpg_720x720q80.jpg_.webp" alt="" />
                                                </a>
                                                <h2>Balo đi học</h2>
                                                <p>
                                                    <span style="margin-right: 10px; text-decoration: line-through;">200.000đ</span>
                                                    <span style="color: red;">120.000đ</span>
                                                </p>
                                                <a href="#" class="btn btn-default add-to-cart">Show</a>
                                                <a href="#" class="btn btn-default add-to-cart"><i class="fa fa-shopping-cart"></i>Add to cart</a>
                                            </div>
                                        </div>

                                    </div>
                                </div>
                                <div class="col-sm-12">
                                    <div class="product-image-wrapper">
                                        <div class="single-products">
                                            <div class="productinfo text-center">
                                                <a href="#">
                                                    <img src="https://cf.shopee.vn/file/2e7c463a4bc62e1d74226434317fea88" alt="" />
                                                </a>
                                                <h2>Giày Nike</h2>
                                                <p>
                                                    <span style="margin-right: 10px; text-decoration: line-through;">600.000đ</span>
                                                    <span style="color: red;">500.000đ</span>
                                                </p>
                                                <a href="#" class="btn btn-default add-to-cart">Show</a>
                                                <a href="#" class="btn btn-default add-to-cart"><i
                                                        class="fa fa-shopping-cart"></i>Add to cart</a>
                                            </div>

                                        </div>

                                    </div>
                                </div>
                            </div>

                        </div>
                    </div>

                    <div class="col-sm-9 padding-right"> <!-- right-sidebar -->
                        <div class="features_items">
                            <h2 class="title text-center">Latest Posts</h2>
                            <div class="col-sm-6">
                                <div class="product-image-wrapper">
                                    <div class="single-products">
                                        <div class="productinfo text-center">
                                            <a href="#">
                                                <img src="https://sellcanva.vn/wp-content/uploads/2022/02/Gold-design-for-1212-clothing-store-sale-on-Instagram-album-post-template-32.png" alt="" />
                                            </a>
                                            <h2>Shopping day 12.12</h2>
                                            <p>Shopping day 12.12 sale discount up to 70%</p>
                                            <a href="#" class="btn btn-default add-to-cart">Show</a>
                                        </div>

                                    </div>

                                </div>
                            </div>
                            <div class="col-sm-6">
                                <div class="product-image-wrapper">
                                    <div class="single-products">
                                        <div class="productinfo text-center">
                                            <a href="#">
                                                <img src="https://images.squarespace-cdn.com/content/v1/5811b29bb8a79b740e329a5c/1610012795959-1O02WXNV49RB3LJ9Y9HK/animated-online-sale-instagram-post-template.png?format=1500w" alt="" />
                                            </a>
                                            <h2>Hot sale welcome summer</h2>
                                            <p>Super sale come to summer season</p>
                                            <a href="#" class="btn btn-default add-to-cart">
                                                Show</a>
                                        </div>

                                    </div>

                                </div>
                            </div>
                            <div class="col-sm-6">
                                <div class="product-image-wrapper">
                                    <div class="single-products">
                                        <div class="productinfo text-center">
                                            <a href="#">
                                                <img src="https://sellcanva.vn/wp-content/uploads/2022/02/Gold-design-for-1212-clothing-store-sale-on-Instagram-album-post-template-32.png" alt="" />
                                            </a>
                                            <h2>Shopping day 12.12</h2>
                                            <p>Shopping day 12.12 sale discount up to 70%</p>
                                            <a href="#" class="btn btn-default add-to-cart">

                                                Show</a>

                                        </div>

                                    </div>

                                </div>
                            </div>
                            <div class="col-sm-6">
                                <div class="product-image-wrapper">
                                    <div class="single-products">
                                        <div class="productinfo text-center">
                                            <a href="#">
                                                <img src="https://images.squarespace-cdn.com/content/v1/5811b29bb8a79b740e329a5c/1610012795959-1O02WXNV49RB3LJ9Y9HK/animated-online-sale-instagram-post-template.png?format=1500w" alt="" />
                                            </a>
                                            <h2>Hot sale welcome summer</h2>
                                            <p>Super sale come to summer season</p>
                                            <a href="#" class="btn btn-default add-to-cart">
                                                Show</a>
                                        </div>

                                    </div>

                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <jsp:include page="../home-template/footer.jsp"/>
        <script src="../../assets/js/jquery.js"></script>
        <script src="../../assets/js/bootstrap.min.js"></script>
        <script src="../../assets/js/jquery.scrollUp.min.js"></script>
        <script src="../../assets/js/price-range.js"></script>
        <script src="../../assets/js/jquery.prettyPhoto.js"></script>
        <script src="../../assets/js/main.js"></script>
        <script>
            $("#search-box").on('keyup', function (e) {
                if (e.key === 'Enter' || e.keyCode === 13) {
                    window.location.href = "";
                }
            });
        </script>
    </body>
</html>
