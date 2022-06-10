<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>

    <head>
        <meta charset="UTF-8">
        <title>Add Customer</title>
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
                            Add Customer
                        </header>
                        <!--BODY-->
                        <div class="panel-body">
                            <!--FORM OF CUSTOMER INFOMATION DATA-->
                            <form class="form-horizontal" role="form" action="../../customer/add" method="post">
                                <!--                                <div class="form-group">
                                                                    <label for="avata" class="col-lg-2 col-sm-2 control-label"> </label>
                                                                    <div class="col-md-8 text-center">
                                                                        <img src="../../img/14161.gif" class="rounded-circle" style="width: 120px;" alt="Avatar" />
                                                                        <h6>Upload a different photo...</h6> 
                                                                        <input type="file" name="avatar" class="form-control text-center" style="width: 50%; display: inline-block;">
                                                                    </div>
                                                                </div>-->
                                <div class="form-group">
                                    <label for="inputName" class="col-lg-3 col-sm-2 control-label">Name: </label>
                                    <div class="col-md-8">
                                        <input type="text" id="fullname" class="form-control" name="fullname" pattern="^[a-z A-Z 0-9]+$" required>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="inputEmail" class="col-lg-3 col-sm-2 control-label">Email:</label>
                                    <div class="col-md-8">
                                        <input type="email" id="email" class="form-control" name="email" required>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="inputMobile"
                                           class="col-lg-3 col-sm-2 control-label">Mobile: </label>
                                    <div class="col-md-8">
                                        <input type="text" id="mobile" class="form-control" name="mobile" pattern="^[0-9]+$"  required
                                               title="Your phone must be number">
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="inputAdress"
                                           class="col-lg-3 col-sm-2 control-label">Address: </label>
                                    <div class="col-md-8">
                                        <input type="text" id="address" class="form-control" name="address" required>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="inputRole"
                                           class="col-lg-3 col-sm-2 control-label">Role: </label>
                                    <div class="col-md-8">
                                        <!--<input type="text" class="form-control" name="role" value="">-->
                                        <select name="roleID" class="form-control">
                                            <option value="4">
                                                Customer
                                            </option>
                                        </select>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="inputGender" class="col-lg-3 col-sm-2 control-label">Gender:</label>
                                    <div class="col-md-8">                                       
                                        <label class="checkbox-inline">
                                            <input type="radio" name="gender" value="male" required> Male
                                        </label>
                                        <label class="checkbox-inline">
                                            <input type="radio" name="gender" value="female" required> Female
                                        </label>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="inputStatus" class="col-lg-3 col-sm-2 control-label">Status:</label>
                                    <div class="col-md-8">                                       
                                        <label class="checkbox-inline">
                                            <input type="radio" name="status" value="active" required> Active
                                        </label>
                                        <label class="checkbox-inline">
                                            <input type="radio" name="status" value="deactive" required> Deactive
                                        </label>
                                    </div>
                                </div>
                                <div class="form-row">
                                    <div class="col-md-offset-9">
                                        <button type="submit" class="btn btn-info">Save</button>
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
        <!-- jQuery 2.0.2 -->
<!--        <script src="../../assets/js/admin/addNewUser.js"></script>
        <script src="../../assets/js/admin/addNewUser.js"></script>
        <script src="../../assets/js/admin/main.js" type="text/javascript"></script>  -->
        
        <script src="http://ajax.googleapis.com/ajax/libs/jquery/2.0.2/jquery.min.js"></script>
        <script src="../../assets/js/jquery.min.js" type="text/javascript"></script>
        <!-- Bootstrap -->
        <script src="../../assets/js/bootstrap.min.js" type="text/javascript"></script>
        <!-- Director App -->
        <script src="../../assets/js/Director/app.js" type="text/javascript"></script>
    </body>

</html>