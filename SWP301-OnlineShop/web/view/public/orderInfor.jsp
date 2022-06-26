<!DOCTYPE html>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib  prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<html lang="en">

    <head>
        <meta charset="UTF-8">
        <title>Product List</title>
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
        <!-- font Awesome -->
        <link href="../assets/css/font-awesome.min.css" rel="stylesheet" type="text/css" />
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.1/css/all.min.css" integrity="sha512-KfkfwYDsLkIlwQp6LFnl8zNdLGxu9YAA1QvwINks4PhcElQSvqcyVLLD9aMhXd13uQjoXtEKNosOWaZqXgel0g==" crossorigin="anonymous" referrerpolicy="no-referrer" />
        <link href="../../assets/public/css/style.css" rel="stylesheet">
        <link href="../../assets/css/admin/feedback.css" rel="stylesheet">
    </head>
    <!--/head-->

    <body>
        <jsp:include page="../home-template/headerProductlist.jsp"/>
        <section>
            <div class="container">
                <div class="row flex-justify">
                    <jsp:include page="../home-template/sidebarForProductList.jsp"/>
                    <!--PRODUCT LIST-->
                    <div class="col-sm-9 padding-right">
                        <div class="features_items">
                            <!--features_items-->
                            <h2 class="title text-center" style="border-bottom: solid 2px; margin-top: 10px">Order Information</h2>
                            <section class="panel">

                                <div class="panel-body">

                                    <div class="row">

                                        <div class="col-md-6 form-group">
                                            <p>
                                                <label>ID Order: </label>
                                                <span> 123</span> 
                                            </p>
                                            <p>
                                                <label> Order Date: </label>
                                                <span> xx/xx/xxxx</span> 
                                            </p>
                                            <p>
                                                <label> Total: </label>
                                                <span> 100000000d</span> 
                                            </p>
                                            <p>
                                                <label> Status: </label>
                                            <td><span class="label label-success">completed</span></td>
                                            </p>
                                        </div>

                                        <div class="col-md-6 form-group">
                                            <p>
                                                <label>Full Name: </label>
                                                <span> abc</span> 
                                            </p><p>
                                                <label> Gender: </label>
                                                <span> Male</span> 
                                            </p>
                                            <p>
                                                <label>Email: </label>
                                                <span> abc@gmail.com</span> 
                                            </p><p>
                                                <label> Mobile: </label>
                                                <span> 123 </span> 
                                            </p>
                                        </div>

                                        <div class="col-md-12 form-group">
                                            <div class="panel-body table-responsive">
                                                <table class="table table-hover">
                                                    <thead>
                                                        <tr>
                                                            <th>Thumbnail</th>
                                                            <th>Product Name</th>
                                                            <th>Category</th>
                                                            <th>Unit Price</th>
                                                            <th>Quantity</th>
                                                        </tr>
                                                    </thead>
                                                    <tbody>
                                                        <tr>
                                                            <td>1</td>
                                                            <td>Facebook</td>
                                                            <td>Mark</td>
                                                            <td>10/10/2014</td>
                                                            <td>10/10S/2014</td>
                                                        </tr>

                                                    </tbody>
                                                </table>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </section>
                        </div>
                    </div>
                </div>

            </div>

        </section>

        <jsp:include page="../home-template/footer.jsp"/>
        <script src="../../assets/js/home/productList.js"></script>
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