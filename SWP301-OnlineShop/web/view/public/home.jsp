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
        <!--<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">-->
        <link href="../../assets/css/bootstrap.min.css" rel="stylesheet">
        <link href="../../assets/css/font-awesome.min.css" rel="stylesheet">
        <link href="../../assets/css/prettyPhoto.css" rel="stylesheet">
        <link href="../../assets/css/price-range.css" rel="stylesheet">
        <link href="../../assets/css/animate.css" rel="stylesheet">
        <link href="../../assets/css/main.css" rel="stylesheet">
        <link href="../../assets/css/responsive.css" rel="stylesheet">
        <title>Home</title>
    </head>
    <body>
        <jsp:include page="../home-template/header.jsp"/>

        <!--slider-->
        <section id="slider"><!--slider-->
            <div class="container">
                <div class="row">
                    <div class="col-sm-12">
                        <div id="slider-carousel" class="carousel slide" data-ride="carousel">
                            <ol class="carousel-indicators">
                                <li data-target="#slider-carousel" data-slide-to="0" class="active"></li>
                                <li data-target="#slider-carousel" data-slide-to="1"></li>
                                <li data-target="#slider-carousel" data-slide-to="2"></li>
                            </ol>

                            <div class="carousel-inner">
                                <div class="item active">
                                    <div class="col-sm-6">
                                        <h1><span>E</span>-SHOPPER</h1>
                                        <h2>Free E-Commerce Template</h2>
                                        <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. </p>
                                        <button type="button" class="btn btn-default get">Get it now</button>
                                    </div>
                                    <div class="col-sm-6">
                                        <img src="../../assets/images/home/girl1.jpg" class="girl img-responsive" alt="" />
                                        <img src="../../assets/images/home/pricing.png"  class="pricing" alt="" />
                                    </div>
                                </div>
                                <div class="item">
                                    <div class="col-sm-6">
                                        <h1><span>E</span>-SHOPPER</h1>
                                        <h2>100% Responsive Design</h2>
                                        <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. </p>
                                        <button type="button" class="btn btn-default get">Get it now</button>
                                    </div>
                                    <div class="col-sm-6">
                                        <img src="../../assets/images/home/girl2.jpg" class="girl img-responsive" alt="" />
                                        <img src="../../assets/images/home/pricing.png"  class="pricing" alt="" />
                                    </div>
                                </div>

                                <div class="item">
                                    <div class="col-sm-6">
                                        <h1><span>E</span>-SHOPPER</h1>
                                        <h2>Free Ecommerce Template</h2>
                                        <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. </p>
                                        <button type="button" class="btn btn-default get">Get it now</button>
                                    </div>
                                    <div class="col-sm-6">
                                        <img src="../../assets/images/home/girl3.jpg" class="girl img-responsive" alt="" />
                                        <img src="../../assets/images/home/pricing.png" class="pricing" alt="" />
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
                        <div class="left-sidebar">
                            <h2>Hot Posts</h2>
                            <div class="panel-group category-products" id="accordian">

                                <div class="panel panel-default">

                                    <div class="col-sm-12">
                                        <div class="product-image-wrapper">
                                            <div class="single-products">
                                                <div class="productinfo text-center">
                                                    <a href="#">
                                                        <img src="../../assets/images/home/product1.jpg" alt="" />
                                                    </a>
                                                    <h2>$56</h2>
                                                    <p>Easy Polo Black Edition</p>
                                                    <a href="#" class="btn btn-default add-to-cart">
                                                        <!--                                                <i
                                                                                                            class="fa fa-shopping-cart"></i>-->
                                                        Show</a>
                                                    <!--    <a href="#" class="btn btn-default add-to-cart"><i
                                                                                                        class="fa fa-shopping-cart"></i>Add to cart</a>-->
                                                </div>

                                            </div>

                                        </div>
                                    </div>
                                </div>
                                
                                
                            </div>
                            <!--/category-products-->

                            <div class="brands_products">
                                <!--products_featured-->
                                <h2>Product Featured</h2>

                                <div class="col-sm-12">
                                    <div class="product-image-wrapper">
                                        <div class="single-products">
                                            <div class="productinfo text-center">
                                                <a href="#">
                                                    <img src="../../assets/images/home/product1.jpg" alt="" />
                                                </a>
                                                <h2>$56</h2>
                                                <p>Easy Polo Black Edition</p>
                                                <a href="#" class="btn btn-default add-to-cart">

                                                    Show</a>
                                                <a href="#" class="btn btn-default add-to-cart"><i
                                                        class="fa fa-shopping-cart"></i>Add to cart</a>
                                            </div>

                                        </div>

                                    </div>
                                </div>
                                <div class="col-sm-12">
                                    <div class="product-image-wrapper">
                                        <div class="single-products">
                                            <div class="productinfo text-center">
                                                <a href="#">
                                                    <img src="../../assets/images/home/product1.jpg" alt="" />
                                                </a>
                                                <h2>$56</h2>
                                                <p>Easy Polo Black Edition</p>
                                                <a href="#" class="btn btn-default add-to-cart">

                                                    Show</a>
                                                <a href="#" class="btn btn-default add-to-cart"><i
                                                        class="fa fa-shopping-cart"></i>Add to cart</a>
                                            </div>

                                        </div>

                                    </div>
                                </div>
                            </div>
                            <!--/brands_products-->

                            <!--                            <div class="shipping text-center">
                                                            <h2></h2>
                                                            <img src="../../assets/images/home/shipping.jpg" alt="" />
                                                        </div>-->

                        </div>
                    </div>

                    <div class="col-sm-9 padding-right">
                        <div class="features_items">
                            <!--features_items-->
                            <h2 class="title text-center">Latest Posts</h2>
                            <div class="col-sm-4">
                                <div class="product-image-wrapper">
                                    <div class="single-products">
                                        <div class="productinfo text-center">
                                            <a href="#">
                                                <img src="../../assets/images/home/product1.jpg" alt="" />
                                            </a>
                                            <h2>$56</h2>
                                            <p>Easy Polo Black Edition</p>
                                            <a href="#" class="btn btn-default add-to-cart">
                                                <!--                                                <i
                                                                                                    class="fa fa-shopping-cart"></i>-->
                                                Show</a>
                                            <!--    <a href="#" class="btn btn-default add-to-cart"><i
                                                                                                class="fa fa-shopping-cart"></i>Add to cart</a>-->
                                        </div>

                                    </div>

                                </div>
                            </div>
                            <div class="col-sm-4">
                                <div class="product-image-wrapper">
                                    <div class="single-products">
                                        <div class="productinfo text-center">
                                            <a href="#">
                                                <img src="../../assets/images/home/product2.jpg" alt="" />
                                            </a>
                                            <h2>$56</h2>
                                            <p>Easy Polo Black Edition</p>
                                            <a href="#" class="btn btn-default add-to-cart">
                                                <!-- <i
                                                     class="fa fa-shopping-cart"></i>-->
                                                Show</a>
                                            <!-- <a href="#" class="btn btn-default add-to-cart"><i
                                                class="fa fa-shopping-cart"></i>Add to cart</a>-->
                                        </div>

                                    </div>

                                </div>
                            </div>
                            <div class="col-sm-4">
                                <div class="product-image-wrapper">
                                    <div class="single-products">
                                        <div class="productinfo text-center">
                                            <a href="#">
                                                <img  src="../../assets/images/home/product3.jpg" alt="" />
                                            </a>
                                            <h2>$56</h2>
                                            <p>Easy Polo Black Edition</p>
                                            <a href="#" class="btn btn-default add-to-cart">
                                                <!--                                                <i
                                                                                                    class="fa fa-shopping-cart"></i>-->
                                                Show</a>
                                            <!--                                            <a href="#" class="btn btn-default add-to-cart"><i
                                                                                                class="fa fa-shopping-cart"></i>Add to cart</a>-->
                                        </div>

                                    </div>

                                </div>
                            </div>
                            <div class="col-sm-4">
                                <div class="product-image-wrapper">
                                    <div class="single-products">
                                        <div class="productinfo text-center">
                                            <a href="#">
                                                <img src="../../assets/images/home/product4.jpg" alt="" />
                                            </a>
                                            <h2>$56</h2>
                                            <p>Easy Polo Black Edition</p>
                                            <a href="#" class="btn btn-default add-to-cart">
                                                <!--                                                <i
                                                                                                    class="fa fa-shopping-cart"></i>-->
                                                Show</a>
                                            <!--                                            <a href="#" class="btn btn-default add-to-cart"><i
                                                                                                class="fa fa-shopping-cart"></i>Add to cart</a>-->
                                        </div>

                                        <img src="../../assets/images/home/new.png" class="new" alt="" />
                                    </div>

                                </div>
                            </div>
                            <div class="col-sm-4">
                                <div class="product-image-wrapper">
                                    <div class="single-products">
                                        <div class="productinfo text-center">
                                            <a href="#">
                                                <img src="../../assets/images/home/product5.jpg" alt="" />
                                            </a>
                                            <h2>$56</h2>
                                            <p>Easy Polo Black Edition</p>
                                            <a href="#" class="btn btn-default add-to-cart">
                                                <!--                                                <i
                                                                                                    class="fa fa-shopping-cart"></i>-->
                                                Show</a>
                                            <!--                                            <a href="#" class="btn btn-default add-to-cart"><i
                                                                                                class="fa fa-shopping-cart"></i>Add to cart</a>-->
                                        </div>

                                        <img src="../../assets/images/home/sale.png" class="new" alt="" />
                                    </div>

                                </div>
                            </div>
                            <div class="col-sm-4">
                                <div class="product-image-wrapper">
                                    <div class="single-products">
                                        <div class="productinfo text-center">
                                            <a href="3">
                                                <img src="../../assets/images/home/product6.jpg" alt="" />
                                            </a>
                                            <h2>$56</h2>
                                            <p>Easy Polo Black Edition</p>
                                            <a href="#" class="btn btn-default add-to-cart">
                                                <!--                                                <i
                                                                                                    class="fa fa-shopping-cart"></i>-->
                                                Show</a>
                                            <!--                                            <a href="#" class="btn btn-default add-to-cart"><i
                                                                                                class="fa fa-shopping-cart"></i>Add to cart</a>-->
                                        </div>

                                    </div>
                                </div>
                            </div>
                            <div class="col-sm-4">
                                <div class="product-image-wrapper">
                                    <div class="single-products">
                                        <div class="productinfo text-center">
                                            <a href="3">
                                                <img src="../../assets/images/home/product6.jpg" alt="" />
                                            </a>
                                            <h2>$56</h2>
                                            <p>Easy Polo Black Edition</p>
                                            <a href="#" class="btn btn-default add-to-cart">
                                                <!--                                                <i class="fa fa-shopping-cart"></i>-->
                                                Show</a>
                                            <!--                                            <a href="#" class="btn btn-default add-to-cart"><i
                                                                                                class="fa fa-shopping-cart"></i>Add to cart</a>-->
                                        </div>

                                    </div>
                                </div>
                            </div>
                            <div class="col-sm-4">
                                <div class="product-image-wrapper">
                                    <div class="single-products">
                                        <div class="productinfo text-center">
                                            <a href="3">
                                                <img src="../../assets/images/home/product6.jpg" alt="" />
                                            </a>
                                            <h2>$56</h2>
                                            <p>Easy Polo Black Edition</p>
                                            <a href="#" class="btn btn-default add-to-cart">
                                                <!--                                                <i
                                                                                                    class="fa fa-shopping-cart"></i>-->
                                                Show</a>
                                            <!--                                            <a href="#" class="btn btn-default add-to-cart"><i
                                                                                                class="fa fa-shopping-cart"></i>Add to cart</a>-->
                                        </div>

                                    </div>
                                </div>
                            </div>
                            <div class="col-sm-4">
                                <div class="product-image-wrapper">
                                    <div class="single-products">
                                        <div class="productinfo text-center">
                                            <a href="3">
                                                <img src="../../assets/images/home/product6.jpg" alt="" />
                                            </a>
                                            <h2>$56</h2>
                                            <p>Easy Polo Black Edition</p>
                                            <a href="#" class="btn btn-default add-to-cart">
                                                <!--                                                                                                <i
                                                                                                                                                    class="fa fa-shopping-cart"></i>-->
                                                Show</a>
                                            <!--                                            <a href="#" class="btn btn-default add-to-cart"><i
                                                                                                class="fa fa-shopping-cart"></i>Add to cart</a>-->
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
        <!--<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>-->
        <script>
            $("#search-box").on('keyup', function (e) {
                if (e.key === 'Enter' || e.keyCode === 13) {
                    window.location.href = "";
                }
            });
        </script>
    </body>
</html>
