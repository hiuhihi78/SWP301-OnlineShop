<%-- 
    Document   : login
    Created on : May 23, 2022, 7:19:04 AM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib  prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link href="../../assets/public/css/bootstrap.min.css" rel="stylesheet">
        <link href="../../assets/public/css/font-awesome.min.css" rel="stylesheet">
        <link href="../../assets/public/css/prettyPhoto.css" rel="stylesheet">
        <link href="../../assets/public/css/price-range.css" rel="stylesheet">
        <link href="../../assets/public/css/animate.css" rel="stylesheet">
        <link href="../../assets/public/css/main.css" rel="stylesheet">
        <link href="../../assets/public/css/responsive.css" rel="stylesheet">
        <script src="https://ajax.aspnetcdn.com/ajax/jQuery/jquery-3.2.1.min.js" type="text/javascript"></script>
        <script src="http://ajax.aspnetcdn.com/ajax/jquery.validate/1.9/jquery.validate.min.js" type="text/javascript"></script>
        <script src="../../assets/js/login/validation.js" type="text/javascript"></script>
        <title>Register</title>
    </head>
    <body>
        <jsp:include page="../home-template/header.jsp"/>
        <div class="container" style="margin-bottom: 30px;">
            <c:if test="${messFalse != null}"> 
                <div id="alert" class="alert alert-danger">
                    ${messFalse}
                </div>
            </c:if>
            <form class="form-horizontal" role="form" action="register" method="post" id="registerForm1">
                <h2 style="padding-bottom: 40px;">Registration</h2>
                <div class="form-group">
                    <label class="col-sm-3 control-label">Full Name</label>
                    <div class="col-sm-9">
                        <input type="text" id="firstName" name="txtName" placeholder="Enter full name" class="form-control" autofocus required=""/>
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-sm-3 control-label">Email</label>
                    <div class="col-sm-9">
                        <input type="email" name="txtEmail" placeholder="Enter email address" class="form-control" autofocus>
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-sm-3 control-label">Mobile </label>
                    <div class="col-sm-9">
                        <input type="text" id="email" name="txtMobile" placeholder="Enter your mobile" class="form-control">
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-sm-3 control-label">Address </label>
                    <div class="col-sm-9">
                        <textarea class="form-control" rows="4" placeholder="Enter your address" name="txtAddress"></textarea>
                    </div>
                </div>
                <div class="form-group">
                    <label for="password" class="col-sm-3 control-label">Password*</label>
                    <div class="col-sm-9">
                        <input type="password" id="password" name="txtPassword" placeholder="Password" class="form-control" >
                    </div>
                </div>
                <div class="form-group">
                    <label for="password" class="col-sm-3 control-label">Confirm Password*</label>
                    <div class="col-sm-9">
                        <input type="password" name="txtPassword1" placeholder="Confirm Password" class="form-control" >
                    </div>
                </div>
                <div class="form-group">
                    <label class="control-label col-sm-3">Gender</label>
                    <div class="col-sm-6">
                        <div class="row">
                            <div class="col-sm-4">
                                <label class="radio-inline">
                                    <input type="radio" name="rd" id="femaleRadio" value="0">Female
                                </label>
                            </div>
                            <div class="col-sm-4">
                                <label class="radio-inline">
                                    <input type="radio" name="rd" id="maleRadio" value="1" checked="">Male
                                </label>
                            </div>
                        </div>
                    </div>
                </div> <!-- /.form-group -->
                <div class="form-group">
                    <div class="col-sm-9 col-sm-offset-3">

                    </div>
                </div>
                <button type="submit" class="btn btn-primary btn-block">Verify by email</button>
            </form> <!-- /form -->
        </div> <!-- ./container -->
        <jsp:include page="../home-template/footer.jsp"/>
    </body>
    <script src="assets/js/login/scripts.js"></script>
</html>
