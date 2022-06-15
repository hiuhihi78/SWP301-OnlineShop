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

    <c:choose>
        <c:when test="${s == null}">
            <title>Add Slider</title>
        </c:when>
        <c:otherwise>
            <title>Edit Slider</title>
        </c:otherwise>
    </c:choose>

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

    <link href='http://fonts.googleapis.com/css?family=Lato' rel='stylesheet' type='text/css'>
    <!-- Theme style -->
    <link href="../assets/css/style.css" rel="stylesheet" type="text/css" />
    <link href="../../assets/css/marketing/style.css" rel="stylesheet" type="text/css" />
    <link href="//netdna.bootstrapcdn.com/bootstrap/3.1.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.1/css/all.min.css" integrity="sha512-KfkfwYDsLkIlwQp6LFnl8zNdLGxu9YAA1QvwINks4PhcElQSvqcyVLLD9aMhXd13uQjoXtEKNosOWaZqXgel0g==" crossorigin="anonymous" referrerpolicy="no-referrer" />
    <link rel="stylesheet" type="text/css" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
    <link rel="stylesheet" type="text/css" href="../../assets/css/marketing/main.css"/>

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
                            <h1>

                            <c:choose>
                                <c:when test="${s != null}">
                                    <i class="fa fa-pencil-square-o" aria-hidden="true"></i> Edit Slider
                                </c:when>
                                <c:otherwise>
                                    <i class="fa fa-plus" aria-hidden="true"></i> Add Slider
                                </c:otherwise>
                            </c:choose>
                        </h1>
                        <p></p>
                    </div>
                    <ul class="app-breadcrumb breadcrumb">
                        <li class="breadcrumb-item"><i class="fa fa-home fa-lg"></i></li>
                        <li class="breadcrumb-item"><a href="/marketing/sliderAdd">Information</a></li>
                    </ul>
                </div>
                <!--                    <div class="container">-->

                <c:if test="${messFalse != null}"> 
                    <div id="alert" class="alert alert-danger">
                        ${messFalse}
                    </div>
                </c:if>
                <c:if test="${messTrue != null}"> 
                    <div id="alert" class="alert alert-success">
                        ${messTrue}&nbsp;
                    </div>
                </c:if>
                <!-- 

                -->
                <!--      
                <div "conten-body"></div>-->
                <form role="form" class="form-horizontal" action="/marketing/sliderAdd" method="post" enctype="multipart/form-data">
                    <div class="row">
                        <div class="col-lg-12">
                            <div class="bs-component">
                                <div class="jumbotron" id="clock">
                                    <div class="col-sm-10">
                                        <div class="toggle lg"> 
                                            <label>
                                                <input type="checkbox" name="checkbox" value="check" ${s.status==true?"checked":""} ><span class="button-indecator"></span>
                                            </label>
                                        </div>
                                        <p class="note">(Hide/Show)</p>
                                    </div>

                                <input type="file" name="fImage" id="getval" style="margin-top: 300px;" value="" <c:if test="${s == null}">required=""</c:if>/>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="row">

                        <div class="form-group">
                            <label class="control-label col-sm-1" for="firstname">Title</label>
                            <div class="col-sm-10">
                                <input type="text" name= "txtTitle" class="form-control" placeholder="Enter Title" value="${s.title}" required="">
                                <input type="hidden" name= "hId" class="form-control" value="${id}"/>
                            </div>
                        </div>

                        <div class="form-group">
                            <label class="control-label col-sm-1">Backlink</label>
                            <div class="col-sm-10">
                                <input type="text" name="txtBacklink" class="form-control" placeholder="Enter Backlink" value="${s.backlink}" required="">
                            </div>
                        </div>

                        <div class="form-group">
                            <label class="control-label col-sm-1" for="Password">Notes</label>
                            <div class="col-sm-10">
                                <textarea class="form-control" rows="5" placeholder="Enter your notes" name="txtNotes" required="">${s.note}</textarea>
                            </div>
                        </div>

                        <div class="form-group">
                            <label class="control-label col-sm-1" for="Password"></label>
                            <div class="col-sm-10">
                                <a class="btn btn-primary" href="/marketing/sliderList" role="button"><i class="fa fa-arrow-circle-left" aria-hidden="true"></i>&nbsp;Cancel</a>

                                <button type="submit" class="btn btn-primary">Submit&nbsp;<i class="fa fa-arrow-circle-right" aria-hidden="true"></i></button>
                            </div>
                        </div>

                    </div>
                </form>
                <!--                </div>-->
            </section><!-- /.content -->


            <!--                <div class="footer-main">
                                Copyright &copy Director, 2014
                            </div>-->
        </aside><!-- /.right-side -->


    </div><!-- ./wrapper -->

    <style type="text/css">
        #clock{
            background-image: url("../..${image}");
        }

    </style>


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
    <script src="../../assets/js/marketing/addSlider.js" type="text/javascript"></script>
    <script src="//netdna.bootstrapcdn.com/bootstrap/3.1.0/js/bootstrap.min.js"></script>
    <script src="//code.jquery.com/jquery-1.11.1.min.js"></script>

    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
</body>
</html>
