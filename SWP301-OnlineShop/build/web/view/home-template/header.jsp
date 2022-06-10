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
                        <a href="./home"><img src="../../assets/public/images/home/logo.png" alt="" /></a>
                    </div>
                </div>
                <div class="col-sm-8">
                    <div class="shop-menu pull-right">
                        <ul class="nav navbar-nav">
                            <li><a href="#"><i class="fa fa-shopping-cart"></i> Cart</a></li>
                                <c:if test="${sessionScope.user == null}">
                                <li><a href="login" id="button"><i class="fa fa-lock"></i> Login</a></li>
                                </c:if>

                            <c:if test="${sessionScope.user != null}">
                                <li class="dropdown">
                                    <a href="#">
                                        <i class="fa fa-user"></i>
                                        ${sessionScope.user.fullname}
                                        <i class="fa fa-angle-down"></i>
                                    </a>
                                    <ul role="menu" class="sub-menu">
                                        <li>
                                            <a href="user/profile" class="text-none-underline">Profile</a>
                                        </li>
                                        <li>
                                            <a type="button" class="btn btn-primary text-none-underline" data-toggle="modal" data-target="#myModal">
                                                Change password
                                            </a>
                                        </li>
                                        <c:if test="${sessionScope.user.role.id == 1}">
                                            <li>
                                                <a href="admin/userList" class="text-none-underline">Manage</a>
                                            </li>
                                        </c:if>
                                        <c:if test="${sessionScope.user.role.id == 1 || sessionScope.user.role.id == 2 || sessionScope.user.role.id == 3}">
                                            <li>
                                                <a href="sale/productlist" class="text-none-underline">My store</a>
                                            </li>
                                        </c:if>    
                                        <c:if test="${sessionScope.user.role.id == 2}">
                                            <li>
                                                <a href="marketing/productlist" class="text-none-underline">Maketing manage</a>
                                            </li>
                                        </c:if>
                                        <li>
                                            <a href="logout" class="text-none-underline">Logout</a>
                                        </li>
                                    </ul>
                                </li>                   
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
                            <li><a href="home" ${(requestScope.active == "home")?"class=\"active\"":""}>Home</a></li>
                            <li><a href="bloglist" ${(requestScope.active == "blog")?"class=\"active\"":""}>Blog</a></li>
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

    <!-- Modal -->
    <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"></button>
                    <h4 class="modal-title" id="myModalLabel">Change password</h4>
                </div>
                <div class="modal-body">
                    <div class="row">
                        <!-- Success alert -->
                        <div class="alert alert-success" id="alertSuccess">
                            <strong>Success!</strong> ${requestScope.msg}
                        </div>

                        <!-- Failed alert -->
                        <div class="alert alert-danger" id="alertDanger">
                            <strong>Danger!</strong> ${requestScope.msg}
                        </div>
                        <form id ="changePassForm">
                            <div class="form-group">
                                <label for="oldPassword">Old Password</label>
                                <input type="password" class="form-control" id="oldPassword" placeholder="Enter old password" name="oldPassword">
                            </div>
                            <div class="form-group">
                                <label for="newPassword">New Password</label>
                                <input type="password" class="form-control" id="newPassword" placeholder="Enter new password" name="newPassword">
                            </div>
                            <div class="form-group">
                                <label for="reEnterNewPassword">Re-enter new password</label>
                                <input type="password" class="form-control" id="reEnterNewPassword" placeholder="Re-enter new password" name="reEnterPass">
                            </div>
                            <button type="button" class="btn btn-primary" data-dismiss="modal">Close</button>
                            <button type="button" class="btn btn-primary" id="saveNewPassword">Save changes</button>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
</header>
