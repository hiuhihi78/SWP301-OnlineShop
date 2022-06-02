<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>

    <head>
        <meta charset="UTF-8">
        <title>Customer List</title>
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
        <header class="header">
            <a href="../../home" class="logo">
                <!-- Add the class icon to your logo image or logo icon to add the margining -->
                Shop
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
                            <img src="../../assets/img/defaultUserAvatar.png" class="img-circle" alt="User Image" />
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
                            <a href="../../admin/userList">
                                <i class="fa fa-user"></i> <span>User List</span>
                            </a>
                        </li>

                        <li>
                            <a href="#">
                                <i class=""></i> <span>Product List</span>
                            </a>
                        </li>

                        <li class="active">
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
                        <!--Header-->
                        <header class="panel-heading">
                            Customer List
                        </header>
                        <!--Body-->
                        <div class="panel-body">
                            <!-- Search and add-->
                            <div class="row">
                                <div class="col-md-6">
                                    <form  action="../customer/list" method="get"> 

                                        <input type="text" name="searchBy" placeholder="Search...">

                                        <select name="statusBy">
                                            <option value="-1"  ${requestScope.statusBy == "" ? "selected='selected'":""}>Status</option>
                                            <option value="1" ${requestScope.statusBy == "1" ? "selected='selected'":""} >Active</option>
                                            <option value="0" ${requestScope.statusBy == "0" ? "selected='selected'":""}>Deactive</option>
                                        </select>
                                        <select name="sortBy" onchange="submitForm()">
                                            <option value="-1" ${requestScope.sortBy == "" ? "selected='selected'":""}>SortBy</option>
                                            <option value="fullname" ${requestScope.sortBy == "fullname" ? "selected='selected'":""}>Full Name</option>
                                            <option value="email" ${requestScope.sortBy == "email" ? "selected='selected'":""}>Email</option>
                                            <option value="mobile" ${requestScope.sortBy == "mobile" ? "selected='selected'":""}>Mobile</option>
                                            <!--<option value="status" ${requestScope.sortBy == "status" ? "selected='selected'":""}>Status</option>-->
                                        </select>
                                        <button type="submit" class="btn btn-info">Search</button>
                                    </form>
                                </div>
                                <div class=" addtask-row">
                                    <a class="btn btn-success btn-md pull-right" href="../customer/add">Add New Customer</a>
                                </div>
                            </div>
                            <!--List of Customer Infomation-->
                            <div class="row">
                                <section class="panel">
                                    <header class="panel-heading">
                                    </header>
                                    <div class="panel-body table-responsive">
                                        <!--Table for customer list-->
                                        <table class="table table-hover">
                                            <thead>
                                                <tr>
                                                    <th scope="col">ID</th>
                                                    <th scope="col">Full Name</th>
                                                    <th scope="col">Gender</th>
                                                    <th scope="col">Mobile</th>
                                                    <th scope="col">Email</th>
                                                    <th scope="col">Address</th>
                                                    <th scope="col">Status</th>
                                                    <th scope="col">Action</th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                                <c:forEach items="${requestScope.listCustomer}" var="list">
                                                    <tr>
                                                        <td>${list.id}</td>
                                                        <td>${list.fullname}</td>
                                                        <td>${list.gender ==true ? "Male" : "Female"}</td>
                                                        <td>${list.mobile}</td>
                                                        <td>${list.email}</td>
                                                        <td>${list.address}</td>
                                                        <!--Active And Deactive-->
                                                        <td>
                                                            <form action="../customer/editStatus" id="changeStatus-${list.id}" method="get">
                                                                <input type="hidden" name="id" value="${list.id}">
                                                                <c:if test="${!list.status}">
                                                                    <input type="hidden" name="status" value="active">
                                                                    <button type="button" class="btn btn-danger" data-toggle="modal" data-target="#active" onclick="openModal('changeStatus-${list.id}')">Deactive</button>
                                                                </c:if>
                                                                <c:if test="${list.status}">
                                                                    <input type="hidden" name="status" value="deactive">
                                                                    <button type="button" class="btn btn-success" data-toggle="modal" data-target="#active" onclick="openModal('changeStatus-${list.id}')">Active</button>
                                                                </c:if>
                                                            </form>
                                                        </td>
                                                        <!--EDIT-->
                                                        <td>
                                                            <a href="../../customer/details?id=${list.id}" style="text-decoration: none; color:white">
                                                                <button type="button" class="btn btn-primary">
                                                                    <i class="fa-solid fa-user-pen"></i>Edit
                                                                </button>
                                                            </a>
                                                        </td>
                                                    </tr>
                                                </c:forEach>

                                            </tbody>
                                        </table>
                                    </div>
                            </div>
                            <!-- Pagging -->
<!--                            <nav aria-label="page">
                                <ul class="pagination pull-right">
                                    <li class="page-item"><a class="page-link" href="#">Previous</a></li>
                                    <li class="page-item"><a class="page-link" href="#">1</a></li>
                                    <li class="page-item"><a class="page-link" href="#">2</a></li>
                                    <li class="page-item"><a class="page-link" href="#">3</a></li>
                                    <li class="page-item"><a class="page-link" href="#">Next</a></li>
                                </ul>
                            </nav>-->
                        </div>

                    </section>
                </section>
            </aside> 
        </div>
        <div class="footer-main">
            Copyright &copy Director, 2014
        </div>
        <!--Modal-->
        <div class="modal" id="active">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-body">
                        Do you want to change this status!
                    </div>
                    <div class="modal-footer">
                        <button id="clickChangeStatus" type="button"></button>
                        <!--<button type="button" class="btn btn-primary" onclick="document.getElementById('changeStatus-2').submit();">Yes</button>-->
                        <button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
                    </div>

                </div>
            </div>
        </div>
        <script language="JavaScript" type="text/javascript" >
            function openModal(id) {
                var button = document.getElementById('clickChangeStatus');
                button.innerHTML = '';
                button.setAttribute('class', "btn btn-primary");
                button.setAttribute('onclick', 'document.getElementById("' + id + '").submit();');
                button.innerHTML = 'Yes';
            }
            function submitForm() {
                document.getElementById("searchForm").submit();
            }
        </script>
        <!-- jQuery 2.0.2 -->
        <script src="http://ajax.googleapis.com/ajax/libs/jquery/2.0.2/jquery.min.js"></script>
        <script src="../../assets/js/jquery.min.js" type="text/javascript"></script>
        <!-- Bootstrap -->
        <script src="../../assets/js/bootstrap.min.js" type="text/javascript"></script>
        <!-- Director App -->
        <script src="../../assets/js/Director/app.js" type="text/javascript"></script>
    </body>

</html>