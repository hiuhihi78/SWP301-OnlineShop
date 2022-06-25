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
        <title>Sale | Orders list</title>
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
                    <div id ="customToolbar">
                        <span>Please set date range to view your data:</span></br>
                        <div id="reportrange" style="background: #fff; cursor: pointer; padding: 5px 10px; border: 1px solid #ccc; width: 100%">
                            <i class="fa fa-calendar"></i>&nbsp;
                            <span></span> <i class="fa fa-caret-down"></i>
                        </div>
                    </div>
                    <!-- Main content -->
                    <section class="content ">
                        <table
                            data-toggle="table"
                            data-pagination="true"
                            data-sortable="true"
                            data-search="true"
                            data-toolbar="#customToolbar">

                            <thead>
                                <tr>
                                    <th data-sortable="false">Order ID</th>
                                    <th data-sortable="true">Ordered Date</th>
                                    <th data-sortable="true">Customer name</th>
                                    <th data-sortable="false">Product (First product name)</th>
                                    <th data-sortable="false">Number of products</th>
                                    <th data-sortable="true">Total cost</th>
                                    <th data-sortable="true"data-align="center">Status</th>
                                </tr>
                            </thead>
                            <tbody>
                            <c:forEach items="${requestScope.orders}" var="o">
                                <tr>
                                    <td>${o.id}</td>
                                    <td><fmt:formatDate pattern="yyyy-MM-dd" value="${o.date}"/></td>
                                    <td>${o.buyer}</td>
                                    <td>${o.products[0].name}</td>
                                    <td>${o.numproducts}</td>
                                    <td><fmt:formatNumber  maxFractionDigits = "3" type = "currency" value = "${o.totalcost}"/></td>
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
                        </tbody>
                    </table>

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
