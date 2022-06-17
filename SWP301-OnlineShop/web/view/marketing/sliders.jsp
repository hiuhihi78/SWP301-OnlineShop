<%-- 
    Document   : userList
    Created on : May 25, 2022, 5:57:25 AM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib  prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
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
    <link href="../assets/css/marketing/style.css" rel="stylesheet" type="text/css" />
    <link href="//netdna.bootstrapcdn.com/bootstrap/3.1.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
    <script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
    <link rel="stylesheet" type="text/css" href="../../assets/css/marketing/main.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.1/css/all.min.css" integrity="sha512-KfkfwYDsLkIlwQp6LFnl8zNdLGxu9YAA1QvwINks4PhcElQSvqcyVLLD9aMhXd13uQjoXtEKNosOWaZqXgel0g==" crossorigin="anonymous" referrerpolicy="no-referrer" />
    <link rel="stylesheet" type="text/css" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
    

</head>
<body class="skin-black">
    <!-- header logo: style can be found in header.less -->
    <jsp:include page="../marketing-template/header.jsp"></jsp:include>
        <div class="wrapper row-offcanvas row-offcanvas-left">
            <!-- Left side column. contains the logo and sidebar -->
        <jsp:include page="../marketing-template/sideBar.jsp"></jsp:include>

            <!-- Right side. contains main content -->
            <aside class="right-side">
                <!-- Main content -->
                <section class="content">
                    <div class="app-title">
                        <div>
                            <h1><i class="fa fa-list-ul" aria-hidden="true"></i> Slider List</h1>
                            <p></p>
                        </div>
                        <ul class="app-breadcrumb breadcrumb">
                            <li class="breadcrumb-item"><i class="fa fa-home fa-lg"></i></li>
                            <li class="breadcrumb-item"><a href="/marketing/dashboard">Sliders</a></li>
                        </ul>
                    </div>
                    <div style="padding-bottom: 20px"> 
                        <form action="/marketing/sliderList" method="get" id="fSearch">

                            <div class="row" style="display: flex;
                                 justify-content: flex-end; padding-right: 16px">
                                <div class="col-xs-6 col-md-1">
                                    <select class="form-control" name="select">
                                        <option value="-1" ${status == -1 ?"selected":""}>All</option>
                                    <option value="1" ${status == 1?"selected":""}>Show</option>
                                    <option value="0" ${status == 0?"selected":""}>Hide</option>
                                </select>
                            </div>
                            <div class="col-xs-7 col-md-4">
                                <div class="input-group">
                                    <input type="text" class="form-control" placeholder="Enter title or backlink..." name="txtSearch" value="${search}"/>
                                    <div class="input-group-btn">
                                        <button class="btn btn-primary" type="submit" form="fSearch">
                                            <span class="glyphicon glyphicon-search"></span>
                                        </button>
                                    </div>
                                </div>
                            </div>
                            <a href="/marketing/sliderAdd" class="btn btn-info" role="button"><i class="fa fa-plus" aria-hidden="true"></i>&nbsp;Add Slider</a>
                        </div>
                    </form>
                </div>



                <c:if test="${not empty sliders}">
                    <c:forEach var="s" items="${sliders}"> 
                        <div class="col-md-12">
                            <div class="tile">
                                <div class="wp-block property list">
                                    <div class="wp-block-title">
                                        <h3><a href="#"><b>#</b> ${s.id}</a></h3>

                                    </div>
                                    <div class="wp-block-body">
                                        <div class="wp-block-img">
                                            <a href="#">
                                                <img src="${s.image}" alt="" id="img-slider">
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
                                            <li><a href="/marketing/sliderAdd?id=${s.id}"><i class="fa fa-pencil-square-o" aria-hidden="true"></i>&nbsp;Edit</a></li>

                                            <li><a href="/marketing/sliderDetail?id=${s.id}"><i class="fa fa-eye" aria-hidden="true"></i>&nbsp;View Details</a></li>
                                            <li>
                                                <div>Show&nbsp;</div>
                                                <div class="toggle lg"> 
                                                    <label>

                                                        <form action="/marketing/sliderList?id=${s.id}" method="post" id="formChange">
                                                            <input type="checkbox" name="checkbox" value="check" ${s.status==true?"checked":""} onChange="this.form.submit()"><span class="button-indecator"></span>
                                                        </form>
                                                    </label>
                                                </div>
                                            </li>
                                        </ul>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </c:forEach>
                </c:if>

                <ul class="pagination justify-content-center" style="margin:20px 0">
                    <c:if test="${index != 1}">
                        <li class="page-item"><a class="page-link" href="/marketing/sliderList?index=${1}"><i class="fa fa-angle-double-left" aria-hidden="true"></i></a></li>
                        <li class="page-item"><a class="page-link" href="/marketing/sliderList?index=${index-1}"><i class="fa fa-angle-left" aria-hidden="true"></i></a></li>
                            </c:if>   
                            <c:forEach var = "i" begin = "1" end = "${lastPage}"> 
                        <li class="page-item"><a class="page-link ${(index == i)? "active-page":""}" href="/marketing/sliderList?index=${i}<c:if test="${status != null && search
                                                                    != null}">&txtSearch=${search}&select=${status}</c:if>">${i}</a></li>
                        </c:forEach>
                        <c:if test="${index != lastPage}">
                        <li class="page-item"><a class="page-link" href="/marketing/sliderList?index=${index+1}"><i class="fa fa-angle-right" aria-hidden="true"></i></a></li>
                        <li class="page-item"><a class="page-link" href="/marketing/sliderList?index=${lastPage}"><i class="fa fa-angle-double-right" aria-hidden="true"></i></a></li>
                            </c:if>

                </ul>
            </section><!-- /.content -->


            <!--                <div class="footer-main">
                                Copyright &copy Director, 2014
                            </div>-->
        </aside><!-- /.right-side -->


    </div><!-- ./wrapper -->




    <style type="text/css">
        .active-page {
            color:blue;
            font-weight: bold;
            font-size: initial;
        }

        #img-slider{
            height: 200px;
        }

    </style>




    <!-- jQuery 2.0.2 -->
    <script src="http://ajax.googleapis.com/ajax/libs/jquery/2.0.2/jquery.min.js"></script>
    <!-- jQuery UI 1.10.3 -->
    <script src="../assets/js/jquery-ui-1.10.3.min.js" type="text/javascript"></script>
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
