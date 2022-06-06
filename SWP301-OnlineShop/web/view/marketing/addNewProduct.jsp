<%-- 
    Document   : productList
    Created on : Jun 6, 2022, 7:48:57 AM
    Author     : Admin
--%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>  
        <meta charset="UTF-8">
        <title>Marketing | Produt list</title>
        <meta content='width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no' name='viewport'>
        <meta name="description" content="Developed By M Abdur Rokib Promy">
        <meta name="keywords" content="Admin, Bootstrap 3, Template, Theme, Responsive">
        <!-- bootstrap 3.0.2 -->
        <link href="../assets/css/bootstrap.min.css" rel="stylesheet" type="text/css" />
        <!-- font Awesome -->
        <link href="../assets/css/font-awesome.min.css" rel="stylesheet" type="text/css" />

        <!-- Theme style -->
        <link href="../assets/css/style.css" rel="stylesheet" type="text/css" />
        <!--css-->
        <link href="../../assets/css/admin/userList.css" rel="stylesheet" type="text/css"/>
        <link href="../../assets/css/admin/main.css" rel="stylesheet" type="text/css"/>

        <!--active button nav in sidebar-->

        <script src="https://cdn.jsdelivr.net/npm/jquery@3.6.0/dist/jquery.slim.min.js"></script>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.1/css/all.min.css" integrity="sha512-KfkfwYDsLkIlwQp6LFnl8zNdLGxu9YAA1QvwINks4PhcElQSvqcyVLLD9aMhXd13uQjoXtEKNosOWaZqXgel0g==" crossorigin="anonymous" referrerpolicy="no-referrer" />
    </head>
    <body class="skin-black">
        <!-- header logo: style can be found in header.less -->
        <jsp:include page="../marketing-template/header.jsp"></jsp:include>
            <div class="wrapper row-offcanvas row-offcanvas-left">
                <!-- Left side column. contains the logo and sidebar -->
            <jsp:include page="../marketing-template/sideBar.jsp"></jsp:include>
                <!-- Right side. contains main content -->
            <aside class="right-side">
                <!-- Main content -->
                <section class="content ">
                    <div class="mb-10" >
                        <form action="#" method="POST">
                            <div class="form-group w-70-percent">
                                <label for="name">Name</label>
                                <input type="text" class="form-control" name="name" id="name" placeholder="Enter name of product" required="">
                            </div>
                            <div class="form-group w-70-percent">
                                <label for="description">Description</label>
                                <textarea type="text" class="form-control" name="description" id="description" placeholder="Enter description of product" required="" rows="3"></textarea>
                            </div>


                            <div class="form-group w-70-percent">
                                <label for="seller">Seller</label>
                                <input type="text" class="form-control" name="seller" id="seller"  placeholder="Enter seller email or mobile">
                            </div>
                            <div class="form-group w-70-percent">
                                <label for="category">Category</label>
                                <div class="display-flex">
                                    <select class="form-control" name="category" id="category" onchange="">
                                        <c:forEach items="${requestScope.categorys}" var="c">
                                            <option value="${c.id}">${c.name}</option>
                                        </c:forEach>
                                    </select>
                                    <button type="button" class="btn btn-primary ml-2percent">Add new Category</button>
                                </div>
                            </div>

                            <div class="form-group w-70-percent" >
                                <label for="subCategory">SubCategory</label>
                                <div class="display-flex">
                                    <select class="form-control" name="subCategory" id="subCategory">
                                        <c:forEach items="${requestScope.subCategorys}" var="c">
                                            <option value="${c.id}">${c.name}</option>
                                        </c:forEach>
                                    </select>
                                    <button type="button" class="btn btn-primary ml-2percent">Add new SubCategory</button>
                                </div>
                            </div>

                            <div class="form-group w-70-percent">
                                <label for="price">Price</label>
                                <input type="number" class="form-control" name="price" id="price" min="0" placeholder="Enter price of product" required="">
                            </div>

                            <div class="form-group w-70-percent">
                                <label for="discount">Discount</label>
                                <input type="number" class="form-control" name="discount" id="discount" min="0" max="100" placeholder="Enter discount of product" required="">
                            </div>

                            <div class="form-group w-70-percent">
                                <label for="quantity">Quantity</label>
                                <input type="number" class="form-control" name="quantity" id="discount" min="0"  placeholder="Enter quantity of product" required="">
                            </div>

                            <!--feature-->
                            <div>
                                <label class="form-check-label" for="featureActivate">Feattured</label>
                                <div class="display-flex">
                                    <div class="form-check form-check-inline mr-5percent">
                                        <input class="form-check-input" type="radio" name="featured" id="featureActivate"  value="activate"> Active
                                    </div>
                                    <div class="form-check form-check-inline">
                                        <input class="form-check-input" type="radio" name="featured" id="featureDeactivate"  value="deactivate" checked="checked"> Deactivate
                                    </div>
                                </div>
                            </div>
                            <!-- / feature-->

                            <!--Status-->
                            <div>
                                <label class="form-check-label" for="statusActivate">Status</label>
                                <div class="display-flex">
                                    <div class="form-check form-check-inline mr-5percent">
                                        <input class="form-check-input" type="radio" name="status" id="statusActivate"  value="activate"> Active
                                    </div>
                                    <div class="form-check form-check-inline">
                                        <input class="form-check-input" type="radio" name="status" id="statusDeactivate"  value="deactivate" checked="checked"> Deactivate
                                    </div>
                                </div>
                            </div>
                            <!-- / Status-->
                            <input type="submit" value="Save">
                        </form>
                    </div>
                </section> <!--/ Main content -->
            </aside><!-- /.right-side -->
        </div>

        <!--javascrip-->
        <script src="../../assets/js/marketing/productList.js"></script>
        <!-- jQuery 2.0.2 -->
        <script src="http://ajax.googleapis.com/ajax/libs/jquery/2.0.2/jquery.min.js"></script>
        <script src="../../js/jquery.min.js" type="text/javascript"></script>
        <!-- jQuery UI 1.10.3 -->
        <script src="../../assets/js/jquery-ui-1.10.3.min.js" type="text/javascript"></script>
        <!-- Bootstrap -->
        <script src="../../assets/js/bootstrap.min.js" type="text/javascript"></script>
        <!-- Director App -->
        <script src="../../assets/js/Director/app.js" type="text/javascript"></script>
    </body>
</html>
