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
            <div class="row" style="padding: 5px 0px; box-shadow: 0px 4px 5px -3px #fe980f;">
                <div class="col-sm-4">
                    <div class="logo pull-left">
                        <a href="./home"><img src="../../assets/public/images/home/logo.png" alt="" /></a>
                    </div>
                </div>
                <div class="col-sm-8">
                    <div class="shop-menu pull-right">
                        <ul class="nav navbar-nav">
                            <li><a href="cartDetails"><i class="fa fa-shopping-cart"></i> Cart</a></li>
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
                                               <a href="#" class="text-none-underline" data-toggle="modal" data-target="#myModalProfilfe">Profile</a>
                                        </li>

                                        <c:if test="${sessionScope.user.role.id == 1}">
                                            <li>
                                                <a href="admin/userList" class="text-none-underline">Manage</a>
                                            </li>
                                        </c:if>

                                        <c:if test="${sessionScope.user.role.id == 2}">
                                            <li>
                                                <a href="/marketing/productlist" class="text-none-underline">Maketing manage</a>
                                            </li>
                                        </c:if>

                                        <c:if test="${sessionScope.user.role.id == 1 || sessionScope.user.role.id == 2 || sessionScope.user.role.id == 3}">
                                            <li>
                                                <a href="sale/productlist" class="text-none-underline">My store</a>
                                            </li>
                                        </c:if>  

                                        <li>
                                            <a href="myorders" class="text-none-underline">My orders</a>
                                        </li>
                                        <li>
                                            <!--                                            <a type="button" class="btn btn-primary text-none-underline" data-toggle="modal" data-target="#myModal">
                                                                                            Change password
                                                                                        </a>-->
                                            <a href="#" class="text-none-underline" data-toggle="modal" data-target="#myModal">Change password</a>
                                        </li>

                                        <!--                                        <li>
                                                                                    <a class="btn btn-primary text-none-underline mg-0" data-toggle="modal" data-target="#myModal">Change password</a>
                                                                                </li>-->

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
                            <li><a href="productlist" ${(requestScope.active == "productList")?"class=\"active\"":""}>Products</a></li>
                        </ul>
                    </div>
                </div>

            </div>
        </div>
    </div>  
    <!--/header-bottom-->

    <!-- Modal -->
    <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
        <div class="modal-dialog w-30percent" role="document"">
            <div class="modal-content pd-20px">
                <div class="modal-header text-center" >
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"></button>
                    <h4 class="modal-title fw-bolder-fz-20" id="myModalLabel">Change Password</h4>
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
                            <div class="btn-modal flex-justify-end-wrap">
                                <button type="button" class="btn btn-primary bg-darkgray-radius" data-dismiss="modal">Close</button>
                                <button type="button" class="btn btn-primary mg-l-3percent-radius" id="saveNewPassword">Save changes</button>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
    
    <!-- Modal User Profile -->
    <div class="modal fade" id="myModalProfilfe" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
        <div class="modal-dialog w-30percent" role="document"">
            <div class="modal-content pd-20px">
                <div class="modal-header text-center" >
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"></button>
                    <h4 class="modal-title fw-bolder-fz-20" id="myModalLabel">User Profile</h4>
                </div>
                <div class="modal-body">
                    <div class="row">
                        <form action="../user/profile" class="form-horizontal" method="post">
                            <c:set var="customer" value="${requestScope.user}"></c:set>
                                <div class="form-group">
                                    <label for="avata" class="col-lg-2 col-sm-2 control-label"> </label>
                                    <div class="col-md-8 text-center">
                                        <img src="https://www.peynirdiyarim.com/yeppanel/yep/yep_comments/user-5f5f8f9bf1829.png" class="rounded-circle" style="width: 120px;" alt="Avatar" />
                                        <h6>Upload a different photo...</h6> 
                                        <input type="file" class="form-control text-center" style="width: 50%; display: inline-block;">
                                    </div>
                                </div>
                                <div class="form-group">
                                    <div class="col-md-8">
                                        <input type="hidden" class="form-control" name="id" value="${user.id}">
                                </div>
                            </div> 
                            <div class="form-group">
                                <label for="inputName" class="col-lg-3 col-sm-2 control-label">Name: </label>
                                <div class="col-md-8">
                                    <input type="text" class="form-control" name="fullname" value="${user.fullname}" pattern="^[a-z A-Z 0-9]+$" required>
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="inputEmail" class="col-lg-3 col-sm-2 control-label">Email: </label>
                                <div class="col-md-8">
                                    <input type="text" readonly class="form-control" name="email" value="${user.email}">
                                    <h6>You can't change email</h6> 
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="inputMobile"
                                       class="col-lg-3 col-sm-2 control-label">Mobile: </label>
                                <div class="col-md-8">
                                    <input type="text" class="form-control" name="mobile" value="${user.mobile}" pattern="^[0-9]+$"  required
                                                       title="Your phone must be number">
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="inputAdress"
                                       class="col-lg-3 col-sm-2 control-label">Address: </label>
                                <div class="col-md-8">
                                    <input type="text" class="form-control" name="address" value="${user.address}" required="">
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="inputGender" class="col-lg-3 col-sm-2 control-label">Gender:</label>
                                <div class="col-md-8">                                       
                                    <label class="checkbox-inline">
                                        <input type="radio" name="gender" ${user.gender?"checked='checked'":"" }value="male" required=""> Male 
                                    </label>
                                    <label class="checkbox-inline">
                                        <input type="radio" name="gender" ${!user.gender?"checked='checked'":""}value="female" required=""> Female
                                    </label>
                                </div>
                            </div>
                            <div class="modal-footer">
                                <div class="col-md-offset">
                                    <button type="submit" onclick="return confirm('Are you sure to edit?')"  class="btn btn-info"> Save </button>
                                    <!--<button type="submit" class="btn btn-info">Save</button>-->
                                    <button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
                                </div>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
                                    
</header>
