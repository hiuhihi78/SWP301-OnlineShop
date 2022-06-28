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
    <head>
        <meta charset="UTF-8">
        <title>Slider | List</title>
        <link data-require="bootstrap-css@3.1.1" data-semver="3.1.1" rel="stylesheet" href="//netdna.bootstrapcdn.com/bootstrap/3.1.1/css/bootstrap.min.css" />
        <!-- bootstrap 3.0.2 -->
        <link href="../assets/css/bootstrap.min.css" rel="stylesheet" type="text/css" />
        <!--font Awesome--> 
        <link href="../assets/css/font-awesome.min.css" rel="stylesheet" type="text/css" />

        <!--Theme style--> 
        <link href="../assets/css/style.css" rel="stylesheet" type="text/css" />
        <!--css-->
        <link href="../../assets/css/admin/userList.css" rel="stylesheet" type="text/css"/>
        <link href="../../assets/css/admin/main.css" rel="stylesheet" type="text/css"/>
        <link href="../assets/css/marketing/style.css" rel="stylesheet" type="text/css" />

        <link href="//netdna.bootstrapcdn.com/bootstrap/3.1.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">


        <link rel="stylesheet" type="text/css" href="../../assets/css/marketing/main.css">

        <!--active button nav in sidebar-->
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.1/css/all.min.css" integrity="sha512-KfkfwYDsLkIlwQp6LFnl8zNdLGxu9YAA1QvwINks4PhcElQSvqcyVLLD9aMhXd13uQjoXtEKNosOWaZqXgel0g==" crossorigin="anonymous" referrerpolicy="no-referrer" />

        <style>
            .left-side {
                min-height: 1096px !important;
            }
        </style>
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
                        <!--Alter-->
                    <jsp:include page="../admin-layout/alter.jsp"></jsp:include>
                        <!--Alter-->
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

                                                    <button id="btn-status-${s.id}" data-id="${s.id}" data-status="${(s.status)}" type="button" class="btn ${(s.status)?"btn-danger":"btn-success"} btn-id">
                                                        ${(s.status)?"Hide":"Show"}
                                                    </button>


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
                </section>
            </aside>
        </div>

        <div class="modal fade" id="confirm-show-slider" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">

                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                        <h4 class="modal-title" id="myModalLabel">Confirm Change Status</h4>
                    </div>

                    <div class="modal-body">
                        <p id="ct"></p>
                        <p>Do you want to proceed?</p>
                        <p class="debug-url"></p>
                    </div>

                    <div class="modal-footer">
                        <button type="button" class="btn btn-default" data-dismiss="modal">Cancel</button>
                        <a class="btn btn-danger btn-change">Change</a>
                    </div>
                    <input type="hidden" id="hSid" value="0"/>
                    <input type="hidden" id="hStatus" value=""/>
                </div>
            </div>
        </div>

        <script data-require="jquery@*" data-semver="2.0.3" src="http://code.jquery.com/jquery-2.0.3.min.js"></script>
        <script data-require="bootstrap@*" data-semver="3.1.1" src="//netdna.bootstrapcdn.com/bootstrap/3.1.1/js/bootstrap.min.js"></script>
        <script src="../assets/js/marketing/sliderList.js"></script>
        <script src="../assets/js/plugins/daterangepicker/daterangepicker.js" type="text/javascript"></script>
        <script src="../assets/js/plugins/chart.js" type="text/javascript"></script>
        <script src="../assets/js/plugins/iCheck/icheck.min.js" type="text/javascript"></script>


    </body>
</html>
