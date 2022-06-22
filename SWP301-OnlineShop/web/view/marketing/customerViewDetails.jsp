<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>

    <head>
        <meta charset="UTF-8">
        <title>Customer Details</title>
        <meta content='width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no' name='viewport'>
        <meta name="description" content="Developed By M Abdur Rokib Promy">
        <meta name="keywords" content="Admin, Bootstrap 3, Template, Theme, Responsive">
        <!-- bootstrap 3.0.2 -->
        <link href="../../assets/css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
        <!-- font Awesome -->
        <link href="../../assets/css/font-awesome.min.css" rel="stylesheet" type="text/css"/>
        <!-- Ionicons -->
        <link href="../../assets/css/ionicons.css" rel="stylesheet" type="text/css"/>
        <link href='http://fonts.googleapis.com/css?family=Lato' rel='stylesheet' type='text/css'>
        <!-- Theme style -->
        <link href="../../assets/css/style.css" rel="stylesheet" type="text/css"/>

    </head>

    <body class="skin-black">
        <!-- header logo: style can be found in header.less -->
        <jsp:include page="../admin-layout/header.jsp"></jsp:include>
            <div class="wrapper row-offcanvas row-offcanvas-left">
                <!-- Left side column. contains the logo and sidebar -->
            <jsp:include page="../admin-layout/sideBar.jsp"></jsp:include>

                <!-- Right side column. Contains the navbar and content of the page -->
                <aside class="right-side">

                    <!-- Main content -->
                    <section class="content">
                        <div class="row">
                            <div class="col-md-6">
                                <div class="panel">
                                    <header class="panel-heading">
                                        Customer Details Information
                                    </header>
                                    <div class="panel-body">
                                        <form class="form-horizontal" role="form">
                                        <c:set var="customer" value="${requestScope.customer}"></c:set>

                                            <div class="form-group">
                                                <label for="inputName" class="col-lg-3 col-sm-2 control-label">Name: </label>
                                                <div class="col-md-8">
                                                    <input readonly class="form-control"value="${customer.fullname}">
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label for="inputEmail" class="col-lg-3 col-sm-2 control-label">Email:</label>
                                            <div class="col-md-8">
                                                <input readonly class="form-control"value="${customer.email}">
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label for="inputMobile" class="col-lg-3 col-sm-2 control-label">Mobile: </label>
                                            <div class="col-md-8">
                                                <input readonly class="form-control"value="${customer.mobile}">
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label for="inputAdress"
                                                   class="col-lg-3 col-sm-2 control-label">Address: </label>
                                            <div class="col-md-8">
                                                <input readonly class="form-control"value="${customer.address}">
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label for="inputGender" class="col-lg-3 col-sm-2 control-label">Gender:</label>
                                            <div class="col-md-8">                                       
                                                <label class="checkbox-inline">
                                                    <input type="radio" name="gender" ${customer.gender?"checked='checked'":"" } disabled> Male 
                                                </label>
                                                <label class="checkbox-inline">
                                                    <input type="radio" name="gender" ${!customer.gender?"checked='checked'":""} disabled> Female
                                                </label>
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label for="inputStatus" class="col-lg-3 col-sm-2 control-label">Status:</label>
                                            <div class="col-md-8">                                       
                                                <label class="checkbox-inline">
                                                    <input type="radio" name="checkActive" ${customer.status?"checked='checked'":""} disabled> Active
                                                </label>
                                                <label class="checkbox-inline">
                                                    <input type="radio" name="checkActive" ${!customer.status?"checked='checked'":""} disabled> Deactive
                                                </label>
                                            </div>
                                        </div>
                                        <div class="form-row">
                                            <div class="col-md-12 ">
                                                <a class="btn btn-danger pull-right" href="../customer/list">Back</a>
                                            </div> 
                                        </div>
                                    </form>
                                </div><!-- /.panel-body -->

                            </div><!-- /.panel -->


                        </div><!-- /.col -->
                        <div class="col-md-6">
                            <div class="panel">
                                <header class="panel-heading">
                                    Customer Edit History
                                </header>
                                <div class="panel-body">
                                    <c:if test="${ not empty requestScope.listHistoryUpdate}">
                                        <table class="table table-hover">
                                            <thead>
                                                <tr>
                                                    <th scope="col">Email</th>
                                                    <th scope="col">Update By</th>
                                                    <th scope="col">Update Date</th>
                                                    <th scope="col">Full Name</th>
                                                    <th scope="col">Gender</th>
                                                    <th scope="col">Mobile</th>
                                                    <th scope="col">Address</th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                                <c:forEach items="${requestScope.listHistoryUpdate}" var="updateHistory">
                                                    <tr>
                                                        <td>${updateHistory.email}</td>
                                                        <td>${updateHistory.updateBy}</td>
                                                        <td>${updateHistory.updateDate}</td>
                                                        <td>${updateHistory.fullname}</td>
                                                        <td>${updateHistory.gender ==true ? "Male" : "Female"}</td>
                                                        <td>${updateHistory.mobile}</td>
                                                        <td>${updateHistory.address}</td>

                                                    </tr>
                                                </c:forEach>

                                            </tbody>
                                        </table>
                                    </c:if>
                                    <c:if test="${empty requestScope.listHistoryUpdate}">
                                        <div style="text-align: center;">
                                            <p>This customer have no update before!!</p>
                                        </div>
                                    </c:if>
                                </div><!-- /.panel-body -->
                            </div><!-- /.panel -->
                        </div><!-- /.col -->
                    </div><!-- /.row -->
                </section><!-- /.content -->
            </aside><!-- /.right-side -->
        </div>
        <div class="footer-main">
            Copyright &copy Director, 2014
        </div>
        <script src="http://ajax.googleapis.com/ajax/libs/jquery/2.0.2/jquery.min.js"></script>
        <script src="../../assets/js/jquery.min.js" type="text/javascript"></script>
        <!-- Bootstrap -->
        <script src="../../assets/js/bootstrap.min.js" type="text/javascript"></script>
        <!-- Director App -->
        <script src="../../assets/js/Director/app.js" type="text/javascript"></script>
    </body>

</html>