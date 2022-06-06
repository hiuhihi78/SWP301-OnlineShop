<<<<<<< HEAD
<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
    <title>Customer List</title>
    <meta content='width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no' name='viewport'>
    <meta name="description" content="Developed By M Abdur Rokib Promy">
    <meta name="keywords" content="Admin, Bootstrap 3, Template, Theme, Responsive">
    <!-- bootstrap 3.0.2 -->
    <link href="../../css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
    <!-- font Awesome -->
    <link href="../../css/font-awesome.min.css" rel="stylesheet" type="text/css"/>
    <!-- Ionicons -->
    <link href="../../css/ionicons.css" rel="stylesheet" type="text/css"/>
    <link href='http://fonts.googleapis.com/css?family=Lato' rel='stylesheet' type='text/css'>
    <!-- Theme style -->
    <link href="../../css/style.css" rel="stylesheet" type="text/css"/>
    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
          <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
          <script src="https://oss.maxcdn.com/libs/respond.js/1.3.0/respond.min.js"></script>
        <![endif]-->
</head>

<body class="skin-black">
    <!-- header logo: style can be found in header.less -->
    <header class="header">
        <a href="index.html" class="logo">
            <!-- Add the class icon to your logo image or logo icon to add the margining -->
            Admin
        </a>
        <!-- Header Navbar: style can be found in header.less -->
        <nav class="navbar navbar-static-top" role="navigation">
            <!-- Sidebar toggle button-->
            <a href="#" class="navbar-btn sidebar-toggle" data-toggle="offcanvas" role="button">
                <span class="sr-only">Toggle navigation</span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </a>
            <div class="navbar-right">
                <ul class="nav navbar-nav">
                    <li class="dropdown user user-menu">

                        <a href="#" class="dropdown-toggle" data-toggle="dropdown">
                            <i class="fa fa-user"></i>
                            <span>Admin <i class="caret"></i></span>
                        </a>
                        <ul class="dropdown-menu dropdown-custom dropdown-menu-right">
                            <li class="dropdown-header text-center">Account</li>
                            <li>
                                <a href="#">
                                    <i class="fa fa-clock-o fa-fw pull-right"></i>
                                    <span class="badge badge-success pull-right">10</span> Updates</a>
                                <a href="#">
                                    <i class="fa fa-envelope-o fa-fw pull-right"></i>
                                    <span class="badge badge-danger pull-right">5</span> Messages</a>
                                <a href="#"><i class="fa fa-magnet fa-fw pull-right"></i>
                                    <span class="badge badge-info pull-right">3</span> Subscriptions</a>
                                <a href="#"><i class="fa fa-question fa-fw pull-right"></i> <span
                                        class="badge pull-right">11</span> FAQ</a>
                            </li>

                            <li class="divider"></li>

                            <li>
                                <a href="#">
                                    <i class="fa fa-user fa-fw pull-right"></i>
                                    Profile
                                </a>
                                <a data-toggle="modal" href="#modal-user-settings">
                                    <i class="fa fa-cog fa-fw pull-right"></i>
                                    Settings
                                </a>
                            </li>

                            <li class="divider"></li>

                            <li>
                                <a href="#"><i class="fa fa-ban fa-fw pull-right"></i> Logout</a>
                            </li>
                        </ul>

                    </li>
                </ul>
            </div>
        </nav>
    </header>
    <div class="wrapper row-offcanvas row-offcanvas-left">
        <!-- Left side column. contains the logo and sidebar -->
        <aside class="left-side sidebar-offcanvas">
            <!-- sidebar: style can be found in sidebar.less -->
            <section class="sidebar">
                <!-- Sidebar user panel -->
                <div class="user-panel">
                    <div class="pull-left image">
                        <img src="../../img/avatar3.png" class="img-circle" alt="User Image" />
                    </div>
                    <div class="pull-left info">
                        <p>Admin</p>

                        <a href="#"><i class="fa fa-circle text-success"></i> Online</a>
                    </div>
                </div>
                <!-- search form -->
                <form action="#" method="get" class="sidebar-form">
                    <div class="input-group">
                        <input type="text" name="q" class="form-control" placeholder="Search..." />
                        <span class="input-group-btn">
                            <button type='submit' name='seach' id='search-btn' class="btn btn-flat"><i
                                    class="fa fa-search"></i></button>
                        </span>
                    </div>
                </form>
                <!-- /.search form -->
                <!-- sidebar menu: : style can be found in sidebar.less -->
                <ul class="sidebar-menu">
                    <li>
                        <a href="#">
                            <i class="fa fa-dashboard"></i> <span>Dashboard</span>
                        </a>
                    </li>
                    <li>
                        <a href="#">
                            <i class="fa fa-user"></i> <span>User List</span>
                        </a>
                    </li>

                    <li class="active">
                        <a href="#">
                            <i class=""></i> <span>Product List</span>
                        </a>
                    </li>

                    <li>
                        <a href="#">
                            <i class=""></i> <span>Customer List</span>
                        </a>
                    </li>
                    <li>
                        <a href="#">
                            <i class=""></i> <span>Feedback List</span>
                        </a>
                    </li>
                    <li>
                        <a href="#">
                            <i class="fa fa-cog"></i> <span>Setting List</span>
                        </a>
                    </li>
                    <li>
                        <a href="#">
                            <i class=""></i> <span>Order List</span>
                        </a>
                    </li>
                </ul>
            </section>
            <!-- /.sidebar -->
        </aside>

        <!-- Right side column. Contains the navbar and content of the page -->
        <aside class="right-side">
            <!-- Main content -->
            <section class="content">
                <section class="panel">
                    <header class="panel-heading">
                        Customer Details
                    </header>
                    <div class="panel-body">
                        <form action="#">
                            <div class="form-group">
                                <label for="type">Setting Type: </label>
                                <input type="text" class="form-control" placeholder="Setting Type">
                            </div>
                            <div class="form-group">
                                <label for="value">Setting Value: </label>
                                <input type="text" class="form-control" placeholder="Setting Value">
                            </div>
                            <div class="form-group">
                                <label for="order">Setting Order: </label>
                                <input type="text" class="form-control" placeholder="Setting Order">
                            </div>
                                <input type="radio" name="checkActive" value="active">Active
                                <input type="radio" name="checkActive" value="deactive">Deactive </br>
                            <button type="submit" class="btn btn-info pull-right">Submit</button>
                        </form>
                    </div>
                </section>
            </section>
    </div>
    
    <div class="footer-main">
        Copyright &copy Director, 2014
    </div>

    <!-- jQuery 2.0.2 -->
    <script src="http://ajax.googleapis.com/ajax/libs/jquery/2.0.2/jquery.min.js"></script>
    <script src="../../js/jquery.min.js" type="text/javascript"></script>
    <!-- Bootstrap -->
    <script src="../../js/bootstrap.min.js" type="text/javascript"></script>
    <!-- Director App -->
    <script src="../../js/Director/app.js" type="text/javascript"></script>
</body>
=======
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
>>>>>>> origin/dev

</html>