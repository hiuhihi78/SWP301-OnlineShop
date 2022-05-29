<%-- 
    Document   : resetpassword
    Created on : May 28, 2022, 9:55:51 PM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib  prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <link href="//netdna.bootstrapcdn.com/bootstrap/3.1.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
        <script src="//netdna.bootstrapcdn.com/bootstrap/3.1.0/js/bootstrap.min.js"></script>
        <script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="../../assets/public/css/bootstrap.min.css" rel="stylesheet">
        <link href="../../assets/public/css/font-awesome.min.css" rel="stylesheet">
        <link href="../../assets/public/css/prettyPhoto.css" rel="stylesheet">
        <link href="../../assets/public/css/price-range.css" rel="stylesheet">
        <link href="../../assets/public/css/animate.css" rel="stylesheet">
        <link href="../../assets/public/css/main.css" rel="stylesheet">
        <link href="../../assets/public/css/responsive.css" rel="stylesheet">
        <title>Reset Password</title>
    </head>
    <body>
        <jsp:include page="../home-template/header.jsp"/>
        <c:if test="${messTrue != null}">
            <div class="alert alert-success" role="alert" style="text-align: center">
                ${messTrue}
            </div>
        </c:if>
        <c:if test="${messFalse != null}">
            <div class="alert alert-danger" role="alert" style="text-align: center">
                This ${messFalse}
            </div>
        </c:if>
        <div class="container" style="margin: 40px auto">
            <div class="row">
                <div class="col-sm-12">
                    <h1  style="text-align: center">Change Password</h1>
                </div>
            </div>
            <div class="row">
                <div class="col-sm-6 col-sm-offset-3">

                    <form method="post" id="passwordForm" method="post" action="changePassword">
                        <h3>New Password</h3>
                        <input type="hidden" name="hdEmail" value="${email}"/>
                        <input type="password" class="input-lg form-control" name="txtPassword1" id="password1" placeholder="New Password" autocomplete="off">
                        <div class="row">
                            <div class="col-sm-6">
                                <span id="8char" class="glyphicon glyphicon-remove" style="color:#FF0004;"></span> 8 Characters Long<br>
                                <span id="ucase" class="glyphicon glyphicon-remove" style="color:#FF0004;"></span> One Uppercase Letter
                            </div>
                            <div class="col-sm-6">
                                <span id="lcase" class="glyphicon glyphicon-remove" style="color:#FF0004;"></span> One Lowercase Letter<br>
                                <span id="num" class="glyphicon glyphicon-remove" style="color:#FF0004;"></span> One Number
                            </div>
                        </div>
                        <h3>Confirm Password</h3>
                        <input type="password" class="input-lg form-control" name="txtPassword2" id="password2" placeholder="Repeat Password" autocomplete="off">
                        <div class="row">
                            <div class="col-sm-12">
                                <span id="pwmatch" class="glyphicon glyphicon-remove" style="color:#FF0004;"></span> Passwords Match
                            </div>
                        </div>
                        <input type="submit" class="col-xs-12 btn btn-primary btn-load btn-lg" data-loading-text="Changing Password..." value="Change Password">
                    </form>
                </div><!--/col-sm-6-->
            </div><!--/row-->
        </div>

        <jsp:include page="../home-template/footer.jsp"/>
    </body>
</html>
