<%-- 
    Document   : test
    Created on : May 25, 2022, 1:09:06 AM
    Author     : Admin
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>Director | Dashboard</title>
        <meta content='width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no' name='viewport'>
        <meta name="description" content="Developed By M Abdur Rokib Promy">
        <meta name="keywords" content="Admin, Bootstrap 3, Template, Theme, Responsive">
        <!-- bootstrap 3.0.2 -->
        <link href="${pageContext.request.contextPath}/assets/css/bootstrap.min.css" rel="stylesheet" type="text/css" />
        <!-- font Awesome -->
        <link href="${pageContext.request.contextPath}/assets/css/font-awesome.min.css" rel="stylesheet" type="text/css" />
        <!-- Ionicons -->
        <link href="${pageContext.request.contextPath}/assets/css/ionicons.min.css" rel="stylesheet" type="text/css" />
        <!-- Morris chart -->
        <link href="${pageContext.request.contextPath}/assets/css/morris/morris.css" rel="stylesheet" type="text/css" />
        <!-- jvectormap -->
        <link href="${pageContext.request.contextPath}/assets/css/jvectormap/jquery-jvectormap-1.2.2.css" rel="stylesheet" type="text/css" />
        <!-- Date Picker -->
        <link href="${pageContext.request.contextPath}/assets/css/datepicker/datepicker3.css" rel="stylesheet" type="text/css" />
        <!-- fullCalendar -->
        <!-- <link href="css/fullcalendar/fullcalendar.css" rel="stylesheet" type="text/css" /> -->
        <!-- Daterange picker -->
        <link href="${pageContext.request.contextPath}/assets/css/daterangepicker/daterangepicker-bs3.css" rel="stylesheet" type="text/css" />
        <!-- iCheck for checkboxes and radio inputs -->
        <link href="${pageContext.request.contextPath}/assets/css/iCheck/all.css" rel="stylesheet" type="text/css" />
        <!-- bootstrap wysihtml5 - text editor -->
        <!-- <link href="css/bootstrap-wysihtml5/bootstrap3-wysihtml5.min.css" rel="stylesheet" type="text/css" /> -->
        <link href='http://fonts.googleapis.com/css?family=Lato' rel='stylesheet' type='text/css'>
        <!-- Theme style -->
        <link href="${pageContext.request.contextPath}/assets/css/style.css" rel="stylesheet" type="text/css" />

        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

        <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
        <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
        <!--[if lt IE 9]>
          <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
          <script src="https://oss.maxcdn.com/libs/respond.js/1.3.0/respond.min.js"></script>
          <![endif]-->

        <style type="text/css">

        </style>
    </head>
    <body class="skin-black">
        <!-- header logo: style can be found in header.less -->
        <jsp:include page="../admin-layout/header.jsp"></jsp:include>
            <div class="wrapper row-offcanvas row-offcanvas-left">
                <!-- Left side column. contains the logo and sidebar -->
            <jsp:include page="../admin-layout/sideBar.jsp"></jsp:include>
                <!-- Right side. contains main content -->
                <aside class="right-side">

                    <!-- Main content -->
                    <section class="content">
                        <section class="panel">
                            <header class="panel-heading">Orders staticstic</header>
                            <div class="row" style="margin-bottom:5px;">
                                <div class="col-md-4">
                                    <div class="sm-st clearfix">
                                        <span class="sm-st-icon st-dark"><i class="fa fa-ban"></i></span>
                                        <div class="sm-st-info">
                                            <span>${requestScope.cancelledCount}</span>
                                        Orders Cancelled
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-4">
                                <div class="sm-st clearfix">
                                    <span class="sm-st-icon st-blue"><i class="fa fa-info"></i></span>
                                    <div class="sm-st-info">
                                        <span>${requestScope.processingCount}</span>
                                        Orders Processing
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-4">
                                <div class="sm-st clearfix">
                                    <span class="sm-st-icon st-green"><i class="fa fa-check"></i></span>
                                    <div class="sm-st-info">
                                        <span>${requestScope.successCount}</span>
                                        Orders Success
                                    </div>
                                </div>
                            </div>
                        </div>
                    </section>
                    <!-- Main row -->
                    <div class="row">
                        <div class="col-md-6">
                            <!--earning graph start-->
                            <section class="panel">
                                <header class="panel-heading">
                                    Total Revenues
                                </header>
                                <div class="sm-st clearfix">
                                    <span class="sm-st-icon st-red"><i class="fa fa-money"></i></span>
                                    <div class="sm-st-info">
                                        <span><fmt:formatNumber  maxFractionDigits = "3" type = "currency" value = "${requestScope.totalRevenue}"/></span>
                                        Total revenue
                                    </div>
                                </div>
                        </div>

                        <div class="col-md-6">
                            <div id="table">
                                <!--earning graph start-->
                                <section class="panel">
                                    <header class="panel-heading">
                                        Revenues by Product categories
                                    </header>
                                    <table class="table table-hover">
                                        <thead>
                                            <tr>
                                                <th scope="col">Category ID</th>
                                                <th scope="col">Category Name</th>
                                                <th scope="col">Revenue</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <c:forEach items="${requestScope.revenueByCategory}" var='r'>
                                                <tr>
                                                    <th scope="row">${r.categoryid}</th>
                                                    <td>${r.categoryname}</td>
                                                    <td><fmt:formatNumber  maxFractionDigits = "3" type = "currency" value = "${r.revenue}"/></td>
                                                </tr>
                                            </c:forEach>
                                        </tbody>
                                    </table>
                                </section>
                            </div>
                        </div>
                    </div>

                    <section class="content">
                        <section class="panel">
                            <header class="panel-heading">Customer staticstic in the last 24-hour</header>
                            <div class="row" style="margin-bottom:5px;">
                                <div class="col-md-6">
                                    <div class="sm-st clearfix">
                                        <span class="sm-st-icon st-blue"><i class="fa fa-user-plus"></i></span>
                                        <div class="sm-st-info">
                                            <span>${requestScope.newCustomer}</span>
                                            New Registered Customers
                                        </div>
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="sm-st clearfix">
                                        <span class="sm-st-icon st-green"><i class="fa fa-shopping-bag"></i></span>
                                        <div class="sm-st-info">
                                            <span>${requestScope.newBought}</span>
                                            New Orders
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </section>
                    </section>
                    <section class="content">
                        <section class="panel">
                            <header class="panel-heading">Trend of new orders</header>
                        </section>
                        <div class="panel-body">
                            <!--                            <canvas id="linechart" width="600" height="330"></canvas>-->
                            <canvas id="myChart" width="300" height="150"></canvas>
                        </div>
                    </section>
                    <!--earning graph end-->

                    </div>
                    </div>
                    <!-- row end -->
                </section><!-- /.content -->
                <div class="footer-main">
                    Copyright &copy Director, 2014
                </div>
            </aside><!-- /.right-side -->

        </div><!-- ./wrapper -->


        <!-- jQuery 2.0.2 -->
        <script src="http://ajax.googleapis.com/ajax/libs/jquery/2.0.2/jquery.min.js"></script>
        <script src="${pageContext.request.contextPath}/assets/js/jquery.min.js" type="text/javascript"></script>

        <!-- jQuery UI 1.10.3 -->
        <script src="${pageContext.request.contextPath}/assets/js/jquery-ui-1.10.3.min.js" type="text/javascript"></script>
        <!-- Bootstrap -->
        <script src="${pageContext.request.contextPath}/assets/js/bootstrap.min.js" type="text/javascript"></script>
        <!-- daterangepicker -->
<!--        <script src="${pageContext.request.contextPath}/assets/js/plugins/daterangepicker/daterangepicker.js" type="text/javascript"></script>

        <script src="${pageContext.request.contextPath}/assets/js/plugins/chart.js" type="text/javascript"></script>-->

        <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
        <!-- datepicker
        <script src="js/plugins/datepicker/bootstrap-datepicker.js" type="text/javascript"></script>-->
        <!-- Bootstrap WYSIHTML5
        <script src="js/plugins/bootstrap-wysihtml5/bootstrap3-wysihtml5.all.min.js" type="text/javascript"></script>-->
        <!-- iCheck -->
        <script src="${pageContext.request.contextPath}/assets/js/plugins/iCheck/icheck.min.js" type="text/javascript"></script>
        <!-- calendar -->
        <script src="${pageContext.request.contextPath}/assets/js/plugins/fullcalendar/fullcalendar.js" type="text/javascript"></script>

        <!-- Director App -->
        <script src="${pageContext.request.contextPath}/assets/js/Director/app.js" type="text/javascript"></script>

        <!-- Director dashboard demo (This is only for demo purposes) -->
        <script src="${pageContext.request.contextPath}/assets/js/Director/dashboard.js" type="text/javascript"></script>

        <!--        <script type="text/javascript">
                    $(function () {
                        "use strict";
                        //BAR CHART
                        var data = {
                            labels: ["Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday", "Sunday"],
                            datasets: [
                                {
                                    label: "My First dataset",
                                    fillColor: "rgba(220,220,220,0.2)",
                                    strokeColor: "rgba(220,220,220,1)",
                                    pointColor: "rgba(220,220,220,1)",
                                    pointStrokeColor: "#fff",
                                    pointHighlightFill: "#fff",
                                    pointHighlightStroke: "rgba(220,220,220,1)",
                                    data: [65, 59, 80, 81, 56, 55, 40]
                                },
                                {
                                    label: "My Second dataset",
                                    fillColor: "rgba(151,187,205,0.2)",
                                    strokeColor: "rgba(151,187,205,1)",
                                    pointColor: "rgba(151,187,205,1)",
                                    pointStrokeColor: "#fff",
                                    pointHighlightFill: "#fff",
                                    pointHighlightStroke: "rgba(151,187,205,1)",
                                    data: [28, 48, 40, 19, 86, 27, 90]
                                }
                            ]
                        };
                        new Chart(document.getElementById("linechart").getContext("2d")).Line(data, {
                            responsive: true,
                            maintainAspectRatio: false,
                        });
        
                    });
                    // Chart.defaults.global.responsive = true;
                </script>-->

        <script>
            const labels = [
                'January',
                'February',
                'March',
                'April',
                'May',
                'June',
            ];

            const data = {
                labels: labels,
                datasets: [{
                        label: 'My First dataset',
                        backgroundColor: 'rgb(255, 99, 132)',
                        borderColor: 'rgb(255, 99, 132)',
                        data: [0, 10, 5, 2, 20, 30, 45],
                    }]
            };

            const config = {
                type: 'line',
                data: data,
                options: {}
            };
        </script>
        <script>
            const myChart = new Chart(
                    document.getElementById('myChart'),
                    config
                    );
        </script>
    </body>
</html>
