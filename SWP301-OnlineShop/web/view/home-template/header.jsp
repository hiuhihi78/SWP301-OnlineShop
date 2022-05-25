<%-- 
    Document   : header
    Created on : May 24, 2022, 9:59:30 PM
    Author     : DELL
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib  prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<header id="header">
    <div class="header-top">
        <!--header-top-->
        <div class="container">
            <div class="row">
                <div class="col-sm-4">
                    <div class="logo pull-left">
                        <a href="index.html"><img src="../../assets/images/home/logo.png" alt="" /></a>
                    </div>
                </div>
                <div class="col-sm-8">
                    <div class="shop-menu pull-right">
                        <ul class="nav navbar-nav">
                            <li><a href="#"><i class="fa fa-shopping-cart"></i> Cart</a></li>
                            <c:if test="${sessionScope.user == null}">
                                <li><a href="#"><i class="fa fa-lock"></i> Login</a></li>
                                </c:if>
                                <c:if test="${sessionScope.user != null}">
                                <li><a href="#"><i class="fa fa-user"></i>${sessionScope.user.fullname}</a></li>
                                </c:if>
                            
                        </ul>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!--/header-top-->

    <div class="header-bottom">
        <!--header-bottom-->
        <div class="container">
            <div class="row">
                <div class="col-sm-9">
                    <div class="navbar-header">
                        <button type="button" class="navbar-toggle" data-toggle="collapse"
                                data-target=".navbar-collapse">
                            <span class="sr-only">Toggle navigation</span>
                            <span class="icon-bar"></span>
                            <span class="icon-bar"></span>
                            <span class="icon-bar"></span>
                        </button>
                    </div>
                    <div class="mainmenu pull-left">
                        <ul class="nav navbar-nav collapse navbar-collapse">
                            <li><a href="index.html" class="active">Home</a></li>
                            <li class="dropdown"><a href="#">Shop
                                </a>
                            </li>
                            <li class="dropdown">
                                <a href="#">Blog
                                </a>
                            </li>
                        </ul>
                    </div>
                </div>
                <div class="col-sm-3">
                    <div class="search_box pull-right">
                        <input id="search-box" type="text" placeholder="Search" name="search-product"/>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!--/header-bottom-->
</header>
