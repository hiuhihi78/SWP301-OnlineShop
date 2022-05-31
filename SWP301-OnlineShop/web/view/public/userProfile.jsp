<%-- 
    Document   : useProfile
    Created on : May 25, 2022, 10:07:13 PM
    Author     : Hoang Quang
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>User Profile </title>
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
    <body>
        <button type="button" class="btn btn-info btn-lg" data-toggle="modal" data-target="#myModal">User Profile</button>
        <!-- Modal -->
        <div class="modal fade" id="myModal" role="dialog">
            <div class="modal-dialog">
                <!-- Modal content-->
                <div class="modal-content">
                    <!-- header -->
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal">&times;</button>
                        <h4 class="modal-title">User Profile</h4>
                    </div>
                    <!-- Body -->
                    <div class="modal-body">
                        <form action="../user/profile" class="form-horizontal" method="post">
                            <c:set var="customer" value="${requestScope.user}"></c:set>
<!--                                <div class="form-group">
                                    <label for="avata" class="col-lg-2 col-sm-2 control-label"> </label>
                                    <div class="col-md-8 text-center">
                                        <img src="../../img/14161.gif" class="rounded-circle" style="width: 120px;" alt="Avatar" />
                                        <h6>Upload a different photo...</h6> 
                                        <input type="file" class="form-control text-center" style="width: 50%; display: inline-block;">
                                    </div>
                                </div>-->
                                <div class="form-group">
                                    <div class="col-md-8">
                                        <input type="hidden" class="form-control" name="id" value="${user.id}">
                                </div>
                            </div> 
                            <div class="form-group">
                                <label for="inputName" class="col-lg-3 col-sm-2 control-label">Name: </label>
                                <div class="col-md-8">
                                    <input type="text" class="form-control" name="fullname" value="${user.fullname}">
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="inputEmail" class="col-lg-3 col-sm-2 control-label">Email:</label>
                                <div class="col-md-8">
                                    <input type="text" readonly class="form-control" name="email" value="${user.email}">
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="inputMobile"
                                       class="col-lg-3 col-sm-2 control-label">Mobile: </label>
                                <div class="col-md-8">
                                    <input type="text" class="form-control" name="mobile" value="${user.mobile}">
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="inputAdress"
                                       class="col-lg-3 col-sm-2 control-label">Address: </label>
                                <div class="col-md-8">
                                    <input type="text" class="form-control" name="address" value="${user.address}">
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="inputGender" class="col-lg-3 col-sm-2 control-label">Gender:</label>
                                <div class="col-md-8">                                       
                                    <label class="checkbox-inline">
                                        <input type="radio" name="gender" ${user.gender?"checked='checked'":"" }value="male"> Male 
                                    </label>
                                    <label class="checkbox-inline">
                                        <input type="radio" name="gender" ${!user.gender?"checked='checked'":""}value="female"> Female
                                    </label>
                                </div>
                            </div>
                            <div class="modal-footer">
                                <div class="col-md-offset-9">
                                    <button type="submit" class="btn btn-info">Save</button>
                                    <a href="../user/profile" class="btn btn-danger">Back</a>
                                </div>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
        <!-- jQuery 2.0.2 -->
        <script src="http://ajax.googleapis.com/ajax/libs/jquery/2.0.2/jquery.min.js"></script>
        <script src="../../assets/js/jquery.min.js" type="text/javascript"></script>
        <!-- Bootstrap -->
        <script src="../../assets/js/bootstrap.min.js" type="text/javascript"></script>
        <!-- Director App -->
        <script src="../../assets/js/Director/app.js" type="text/javascript"></script>
    </body>
</html>
