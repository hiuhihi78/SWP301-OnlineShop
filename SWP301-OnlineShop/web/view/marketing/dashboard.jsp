<%-- 
    Document   : productList
    Created on : Jun 6, 2022, 7:48:57 AM
    Author     : Admin
--%>
<%@page import="configs.KeyValuePair"%>
<%@page import="java.util.ArrayList"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>  
        <meta charset="UTF-8">
        <title>Marketing | Dashboard</title>
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
        <!--active button nav in sidebar-->

        <script src="https://cdn.jsdelivr.net/npm/jquery@3.6.0/dist/jquery.slim.min.js"></script>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.1/css/all.min.css" integrity="sha512-KfkfwYDsLkIlwQp6LFnl8zNdLGxu9YAA1QvwINks4PhcElQSvqcyVLLD9aMhXd13uQjoXtEKNosOWaZqXgel0g==" crossorigin="anonymous" referrerpolicy="no-referrer" />


        <!--        body-->
        <link rel="stylesheet" type="text/css" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" >
        <link rel="stylesheet" type="text/css" href="../../assets/css/marketing/main.css"/>
        <!--        end body-->



    </head>
    <%
        ArrayList<KeyValuePair> list = (ArrayList<KeyValuePair>)request.getAttribute("list");
    %>
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
                    <div class="app-title">
                        <div>
                            <h1><i class="fa fa-dashboard"></i> Dashboard</h1>
                            <p></p>
                        </div>
                        <ul class="app-breadcrumb breadcrumb">
                            <li class="breadcrumb-item"><i class="fa fa-home fa-lg"></i></li>
                            <li class="breadcrumb-item"><a href="/marketing/dashboard">Dashboard</a></li>
                        </ul>
                    </div>
                    <div class="row">
                        <div class="col-md-6 col-lg-3">
                            <div class="widget-small primary coloured-icon"><i class="icon fa fa-users fa-3x"></i>
                                <div class="info">
                                    <h4>Customers</h4>
                                    <p><b>${customerNumber}</b></p>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-6 col-lg-3">
                            <div class="widget-small info coloured-icon"><i class="icon fa fa-product-hunt fa-3x"></i>
                                <div class="info">
                                    <h4>Products</h4>
                                    <p><b>${productNumber}</b></p>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-6 col-lg-3">
                            <div class="widget-small warning coloured-icon"><i class="icon fa fa-files-o fa-3x"></i>
                                <div class="info">
                                    <h4>Post</h4>
                                    <p><b>${postNumber}</b></p>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-6 col-lg-3">
                            <div class="widget-small danger coloured-icon"><i class="icon fa fa-commenting fa-3x"></i>
                                <div class="info">
                                    <h4>Feedbacks</h4>
                                    <p><b>${feedbackNumber}</b></p>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-12 text-align">
                        <div class="tile display">
                            <div class="row" id="row1">
                                <form action="/marketing/dashboard" method="post" id="dateForm">
                                    <input placeholder="Start Date" class="textbox-n height" type="text" onfocus="(this.type='date')" id="dt" style="height: 25px;" name="txtStart" onchange="checkDate2()" required="">
                                &nbsp;&nbsp;&nbsp;&nbsp;
                                <input placeholder="End Date" class="textbox-n height" type="text" onfocus="(this.type='date')" id="dt1" style="height: 25px;" name="txtEnd" onchange="checkDate2()" required="">
                                &nbsp;&nbsp;&nbsp;&nbsp;
                                <button class="btn btn-primary" type="submit" >Search</button>
                                </form>
                            </div>
                        </div>
                    </div>
                    <div class="row" >
                        <div class="col-md-12">
                            <div class="tile">
                                <h3 class="tile-title">Trend Of New Customers</h3>
                                <table class="table">
                                    <thead>
                                        <tr>
                                            <th id="width">#</th>
                                            <th>Product name</th>
                                            <th>Product number</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <%
                                            for (int i = 0; i < list.size(); i++) {
                                        %>
                                        <tr class="table-info">
                                            <td><%=i%></td>
                                            <td><%=list.get(i).getKey().getName()%></td>
                                            <td><%=list.get(i).getValue()%></td>
                                        </tr>
                                        <%
                                            }
                                        %>

                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                </section> <!--/ Main content -->
            </aside><!-- /.right-side -->
        </div>
                                      
        <script type="text/javascript">
            document.getElementById('dt').max = new Date(new Date().getTime() - new Date().getTimezoneOffset() * 60000).toISOString().split("T")[0];
            document.getElementById('dt1').max = new Date(new Date().getTime() - new Date().getTimezoneOffset() * 60000).toISOString().split("T")[0];
        function checkDate2() {
            var stringDate = document.getElementById('dt').value;
            var stringDate1 = document.getElementById('dt1').value;
            var myDate = new Date(stringDate);
            var myDate1 = new Date(stringDate1);
            if ( myDate > myDate1) {
                $('#row1').after('<p style="color:red;">The start date must be less than the end date!</p>');

                 document.getElementById("dateForm").reset();
                 return false;
            }else{
                return true;
            }
             
        }
        
 
 
// $().ready(function () {
//    $("#dateForm").validate({
//        onfocusout: false,
//        onkeyup: false,
//        onclick: false,
//        rules: {
//
//            "txtStart": {
//               
//                checkDate: true
//            },
//            "txtEnd": {
//                checkDate: true
//            }
//        }
//    });
//});

//$("dateForm").validate({
//    rules: {
//        EndDate: { greaterThan: "#StartDate" }
//    }
//});
//
//$.validator.addMethod("checkDate", function(value, element, params) {
//
//    if (!/Invalid|NaN/.test(new Date(value))) {
//        return new Date(value) > new Date($(params).val());
//    }
//
//    return isNaN(value) && isNaN($(params).val()) 
//        || (Number(value) > Number($(params).val())); 
//},'Must be greater than {0}.');
</script>
        
        <!--javascrip-->
        <script src="../../assets/js/marketing/dashboard.js"></script>
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
