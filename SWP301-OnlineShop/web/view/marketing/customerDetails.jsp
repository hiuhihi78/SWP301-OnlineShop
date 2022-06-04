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
                    <section class="content col-md-6" style="margin-left: 20%;">
                        <section class="panel">
                            <header class="panel-heading">
                                Customer Details
                            </header>
                            <!--BODY-->
                            <div class="panel-body">
                                <!--FORM OF CUSTOMER INFOMATION DATA-->
                                <form class="form-horizontal" role="form" action="../customer/details" method="post">
                                <c:set var="customer" value="${requestScope.customer}"></c:set>
                                    <div class="form-group">
                                        <div class="col-md-8">
                                            <input type="hidden" class="form-control" name="customerID" value="${customer.id}">
                                    </div>
                                </div> 
                                <div class="form-group">
                                    <label for="inputName" class="col-lg-3 col-sm-2 control-label">Name: </label>
                                    <div class="col-md-8">
                                        <input type="text" class="form-control" name="fullname" id="fullname" value="${customer.fullname}" required>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="inputEmail" class="col-lg-3 col-sm-2 control-label">Email:</label>
                                    <div class="col-md-8">
                                        <input type="text" class="form-control" name="email" id="email"  value="${customer.email}" required>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="inputMobile"
                                           class="col-lg-3 col-sm-2 control-label">Mobile: </label>
                                    <div class="col-md-8">
                                       <input type="text" id="mobile" class="form-control" name="mobile" value="${requestScope.mobile}" onchange="validateMobile();" required>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="inputAdress"
                                           class="col-lg-3 col-sm-2 control-label">Address: </label>
                                    <div class="col-md-8">
                                        <input type="text" class="form-control" name="address" id="address" value="${customer.address}" required>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="inputGender" class="col-lg-3 col-sm-2 control-label">Gender:</label>
                                    <div class="col-md-8">                                       
                                        <label class="checkbox-inline">
                                            <input type="radio" name="gender" ${customer.gender?"checked='checked'":"" }value="male"> Male 
                                        </label>
                                        <label class="checkbox-inline">
                                            <input type="radio" name="gender" ${!customer.gender?"checked='checked'":""}value="female"> Female
                                        </label>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="inputStatus" class="col-lg-3 col-sm-2 control-label">Status:</label>
                                    <div class="col-md-8">                                       
                                        <label class="checkbox-inline">
                                            <input type="radio" name="checkActive" ${customer.status?"checked='checked'":""} disabled = ""> Active
                                        </label>
                                        <label class="checkbox-inline">
                                            <input type="radio" name="checkActive" ${!customer.status?"checked='checked'":""} disabled = ""> Deactive
                                        </label>
                                    </div>
                                </div>
                                <div class="form-row">
                                    <div class="col-md-offset-9">
                                        <button type="submit" type="button" class="btn btn-info">Save</button>
                                        <a href="../customer/list" class="btn btn-danger">Back</a>
                                    </div>
                                </div>
                            </form>
                        </div>
                    </section>
                </section>
            </aside>
        </div>

        <div class="footer-main">
            Copyright &copy Director, 2014
        </div>
        <script src="../../assets/js/admin/addNewUser.js" type="text/javascript"></script>
        <!-- jQuery 2.0.2 -->
        <script src="http://ajax.googleapis.com/ajax/libs/jquery/2.0.2/jquery.min.js"></script>
        <script src="../../assets/js/jquery.min.js" type="text/javascript"></script>
        <!-- Bootstrap -->
        <script src="../../assets/js/bootstrap.min.js" type="text/javascript"></script>
        <!-- Director App -->
        <script src="../../assets/js/Director/app.js" type="text/javascript"></script>
    </body>

</html>