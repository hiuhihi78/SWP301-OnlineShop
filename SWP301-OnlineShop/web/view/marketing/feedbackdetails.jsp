<%-- 
    Document   : productList
    Created on : Jun 6, 2022, 7:48:57 AM
    Author     : Admin
--%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
    <head>  
        <meta charset="UTF-8">
        <title>Marketing | Feedback Details</title>
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
        <link href="../../assets/css/cart/main.css" rel="stylesheet" type="text/css"/>
        <link rel="stylesheet" href="https://unpkg.com/bootstrap-table@1.20.2/dist/bootstrap-table.min.css">

        <!--active button nav in sidebar-->

        <script src="https://cdn.jsdelivr.net/npm/jquery@3.6.0/dist/jquery.slim.min.js"></script>
        <link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/npm/daterangepicker/daterangepicker.css" />
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.1/css/all.min.css" integrity="sha512-KfkfwYDsLkIlwQp6LFnl8zNdLGxu9YAA1QvwINks4PhcElQSvqcyVLLD9aMhXd13uQjoXtEKNosOWaZqXgel0g==" crossorigin="anonymous" referrerpolicy="no-referrer" />
    </head>
    <body class="skin-black">

        <!-- header logo: style can be found in header.less -->
        <jsp:include page="../sale-template/header.jsp"></jsp:include>
            <div class="wrapper row-offcanvas row-offcanvas-left">
                <!-- Left side column. contains the logo and sidebar -->
            <jsp:include page="../sale-template/sideBar.jsp"></jsp:include>
                <aside class="right-side">
                <c:if test="${requestScope.alter != null}">
                    <div class="fixed float-end t-55px" id="showAlter" style="width: 21%;
                         z-index: 1024;
                         right: 36%;
                         top: 6%;
                         position: fixed;
                         ">
                        <div class="alert alert-success alert-dismissible fade in" id="alterfade">
                            <a href="#" class="close" data-dismiss="alert" aria-label="close" style="transform: rotate(90deg); top: 8%;">&times;</a>
                            ${requestScope.alter}
                        </div>
                    </div>
                </c:if>
                <!-- Main content -->
                <section class="content ">
                    <div class ="row d-flex justify-content-center">
                        <h2 class="title text-center">Feedback Details</h2>
                    </div>
                    <div class="mg-10px" id="toolBar">
                        <button type="button" class="btn btn-info" data-orderid="${orderInfor.id}" data-toggle="modal" data-target="#myModal" id="btnUpdateOrder">Update order status</button>
                    </div>
                    <section class="panel">
                        <div class="panel-body">
                            <div class="row">
                                <div class="col-md-4">
                                    <p>
                                        <label>Full name: </label>
                                        <span>${requestScope.feedback.user.fullname}</span> 
                                    </p>
                                    <p>
                                        <label>Email: </label>
                                        <span>${requestScope.feedback.user.email}</span> 
                                    </p>
                                    <p>
                                        <label>Mobile: </label>
                                        <span>${requestScope.feedback.user.mobile}</span> 
                                    </p>
                                </div>

                                <div class="col-md-4">
                                    <p>
                                        <label>Product: </label>
                                        <span>${requestScope.feedback.product.name}</span> 
                                        <span>(ID: ${requestScope.feedback.product.id} - <a id="btnShowThumbnail" href="#" data-thumbnail="${requestScope.feedback.product.thumbnail}">Click here to show product thumbnail</a>)</span> 

                                    </p>
                                    <p>
                                        <label>Rated star: </label>
                                        <span> ${requestScope.feedback.start}</span> 
                                    </p>
                                    <p>
                                        <label>Comment: </label>
                                        <span> ${requestScope.feedback.comment}</span> 
                                    </p>
                                </div>
                                <div class="col-md-4">
                                    <div>
                                        <label>Feedback Images:</label>
                                        <c:if test="${requestScope.feedback.image.size() == 0}">
                                            <span>No images given!</span>
                                        </c:if>
                                        <c:if test="${requestScope.feedback.image.size() != 0}">
                                            <span>have image</span>
                                        </c:if>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </section>
                    </div>

                    <!-- Modal -->
                    <div id="myModal" class="modal fade" role="dialog">
                        <div class="modal-dialog">
                            <!-- Modal content-->
                            <div class="modal-content">
                                <div class="modal-header">
                                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                                    <h4 class="modal-title">Product thumbnail</h4>
                                </div>
                                <div class="modal-body">
                                    <img src="" class="imagepreview" style="width: 100%;" >
                                </div>
                                <!--                                <div class="modal-footer">
                                                                    <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                                                                </div>-->
                            </div>

                        </div>
                    </div>
                </section> <!--/ Main content -->
            </aside><!-- /.right-side -->
        </div>
        <!--javascrip-->
        <script src="../../assets/js/marketing/productList.js"></script>
        <script src="../../assets/js/admin/main.js"></script>
        <!-- jQuery 2.0.2 -->
        <script src="http://ajax.googleapis.com/ajax/libs/jquery/2.0.2/jquery.min.js"></script>
        <!-- jQuery UI 1.10.3 -->
        <script src="../../assets/js/jquery-ui-1.10.3.min.js" type="text/javascript"></script>
        <!-- Bootstrap -->
        <script src="../../assets/js/bootstrap.min.js" type="text/javascript"></script>
        <!-- Director App -->
        <script src="../../assets/js/Director/app.js" type="text/javascript"></script>
        <script src="https://unpkg.com/bootstrap-table@1.20.2/dist/bootstrap-table.min.js"></script>
        <script type="text/javascript" src="https://cdn.jsdelivr.net/momentjs/latest/moment.min.js"></script>
        <script type="text/javascript" src="https://cdn.jsdelivr.net/npm/daterangepicker/daterangepicker.min.js"></script>
    </body>
</html>
