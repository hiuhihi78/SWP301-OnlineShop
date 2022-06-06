<%-- 
    Document   : userList
    Created on : May 25, 2022, 5:57:25 AM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib  prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <meta charset="UTF-8">
    <title>Slider | List</title>
    <meta content='width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no' name='viewport'>
    <link href="../assets/css/bootstrap.min.css" rel="stylesheet" type="text/css" />
    <!-- font Awesome -->
    <link href="../assets/css/font-awesome.min.css" rel="stylesheet" type="text/css" />
    <!-- Ionicons -->
    <link href="../assets/css/ionicons.min.css" rel="stylesheet" type="text/css" />
    <!-- Morris chart -->
    <link href="../assets/css/morris/morris.css" rel="stylesheet" type="text/css" />
    <!-- jvectormap -->
    <link href="../assets/css/jvectormap/jquery-jvectormap-1.2.2.css" rel="stylesheet" type="text/css" />
    <!-- Date Picker -->
    <link href="../css/datepicker/datepicker3.css" rel="stylesheet" type="text/css" />

    <link href="../assets/css/daterangepicker/daterangepicker-bs3.css" rel="stylesheet" type="text/css" />
    <!-- iCheck for checkboxes and radio inputs -->
    <link href="../assets/css/iCheck/all.css" rel="stylesheet" type="text/css" />
    <!-- bootstrap wysihtml5 - text editor -->
    <!-- <link href="css/bootstrap-wysihtml5/bootstrap3-wysihtml5.min.css" rel="stylesheet" type="text/css" /> -->
    <link href='http://fonts.googleapis.com/css?family=Lato' rel='stylesheet' type='text/css'>
    <!-- Theme style -->
    <link href="../assets/css/style.css" rel="stylesheet" type="text/css" />
    <link href="../../assets/css/marketing/style.css" rel="stylesheet" type="text/css" />
    <link href="//netdna.bootstrapcdn.com/bootstrap/3.1.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
    <script src="//netdna.bootstrapcdn.com/bootstrap/3.1.0/js/bootstrap.min.js"></script>
    <script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
    <link rel="stylesheet" type="text/css" href="assets/css/marketing/main.css">
    <link rel="stylesheet" type="text/css" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">

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
                    <div class="row">
                        <form method="post" id="form1">
                            <div class="col-xs-8 col-xs-offset-2">
                                <div class="input-group">
                                    <div class="input-group-btn search-panel">
                                        <button type="button" class="btn btn-default dropdown-toggle" data-toggle="dropdown">
                                            <span id="search_concept">Filter by</span> <span class="caret"></span>
                                        </button>
                                        <ul class="dropdown-menu" role="menu">
                                            <li><a href="#contains">Show</a></li>
                                            <li><a href="#contains">Hide</a></li>
                                        </ul>
                                    </div>
                                    <input type="hidden" name="search_param" value="all" id="search_param">         
                                    <input type="text" class="form-control" name="x" placeholder="Enter title or backlink...">
                                    <span class="input-group-btn">
                                        <button class="btn btn-default" type="submit" form="form1"><span class="glyphicon glyphicon-search"></span></button>
                                    </span>
                                </div>
                            </div>
                        </form>
                    </div>
                    <p>
                    <div class="row">
                    <c:if test="${not empty sliders}">
                        <c:forEach var="s" items="${sliders}"> 
                            <div class="col-md-12">
                                <div class="wp-block property list">
                                    <div class="wp-block-title">
                                        <h3><a href="#"><b>#</b> ${s.id}</a></h3>

                                    </div>
                                    <div class="wp-block-body">
                                        <div class="wp-block-img">
                                            <a href="#">
                                                <img src="${s.image}" alt="">
                                            </a>
                                        </div>
                                        <div class="wp-block-content">
                                            <small>10 days only</small>
                                            <h4 class="content-title">${s.title}</h4>
                                            <p class="description">${s.note}</p>
                                        </div>
                                    </div>
                                    <div class="wp-block-footer">
                                        <ul class="aux-info">
                                            <li><a href="${s.backlink}"><i class="fa fa-external-link" aria-hidden="true"></i>&nbsp;Backlink</a></li>
                                            <li><a href="#"><i class="fa fa-pencil-square-o" aria-hidden="true"></i>&nbsp;Edit</a></li>
                                            <li><a href="home"><i class="fa fa-eye" aria-hidden="true"></i>&nbsp;View</a></li>
                                            <li>
                                                <div class="toggle lg">
                                                    <label>
                                                        Show&nbsp;
                                                        <form action="sliderList?id=${s.id}" method="post" id="formChange">
                                                            <input type="checkbox" name="checkbox" value="check" ${s.status==true?"checked":""} onChange="this.form.submit()"><span class="button-indecator"></span>
                                                        </form>
                                                    </label>
                                                </div>
                                            </li>
                                        </ul>
                                    </div>
                                </div>
                            </div>
                        </c:forEach>
                    </c:if>

                </div> 
                <ul class="pagination justify-content-center" style="margin:20px 0">
                    <li class="page-item disabled"><a class="page-link" href="#">Previous</a></li>
                    <li class="page-item"><a class="page-link" href="#">1</a></li>
                    <li class="page-item"><a class="page-link" href="#">2</a></li>
                    <li class="page-item"><a class="page-link" href="#">3</a></li>
                    <li class="page-item"><a class="page-link" href="#">Next</a></li>
                </ul>
            </section><!-- /.content -->


            <!--                <div class="footer-main">
                                Copyright &copy Director, 2014
                            </div>-->
        </aside><!-- /.right-side -->


    </div><!-- ./wrapper -->







    <!-- jQuery 2.0.2 -->
    <script src="http://ajax.googleapis.com/ajax/libs/jquery/2.0.2/jquery.min.js"></script>
    <script src="../js/jquery.min.js" type="text/javascript"></script>
    <!-- jQuery UI 1.10.3 -->
    <script src="../assets/js/jquery-ui-1.10.3.min.js" type="text/javascript"></script>
    <!-- Bootstrap -->
    <script src="../assets/js/bootstrap.min.js" type="text/javascript"></script>
    <!-- daterangepicker -->
    <script src="../assets/js/plugins/daterangepicker/daterangepicker.js" type="text/javascript"></script>
    <script src="../assets/js/plugins/chart.js" type="text/javascript"></script>
    <script src="../assets/js/plugins/iCheck/icheck.min.js" type="text/javascript"></script>
    <!-- calendar -->
    <script src="../assets/js/plugins/fullcalendar/fullcalendar.js" type="text/javascript"></script>
    <!-- Director App -->
    <script src="../assets/js/Director/app.js" type="text/javascript"></script>

    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
</body>
</html>
