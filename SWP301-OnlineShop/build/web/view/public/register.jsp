<%-- 
    Document   : login
    Created on : May 23, 2022, 7:19:04 AM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <!-- Main CSS-->
        <link rel="stylesheet" type="text/css" href="assets/css/main.css">
        <!-- Font-icon css-->
        <link rel="stylesheet" type="text/css" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
        <title>Login</title>
    </head>
    <body>
        <section class="login-content">   
            <div class="tile1">
                <h3 class="tile-title">Register</h3>
                <form action="register" method="post">
                    <hr/>
                    <div class="container-fluid">
                        <div class="row">
                            <label class="col-md-2">Name: </label>
                            <div class="col-md-10">
                                <input class="form-control" type="text" name="txtName" placeholder="Enter full name"/>
                                
                            </div>
                        </div>
                        <p>
                        <div class="row">
                            <label class="col-md-2">Gender: </label>
                            <div class="col-md-5">
                                <input type="radio" name="rd" value="0"/> Male &nbsp;
                                <input type="radio" name="rd" value="1"/> Female
                            </div>
                        </div>
                        <p>
                        <div class="row">
                            <label class="col-md-2">Email: </label>
                            <div class="col-md-10">
                                <input class="form-control" type="text" name="txtEmail" placeholder="Enter email address"/>
                            </div>
                        </div>
                        <p>
                        <div class="row">
                            <label class="col-md-2">Mobile: </label>
                            <div class="col-md-5">
                                <input class="form-control" type="text" name="txtMobile" placeholder="Enter your mobile"/>
                            </div>
                        </div>
                        <p>
                        <div class="row">
                            <label class="col-md-2">Address: </label>
                            <div class="col-md-10">
                                <textarea class="form-control" rows="4" placeholder="Enter your address" name="txtAddress"></textarea>
                            </div>
                        </div>                 
                        <hr/>
                        <div class="row">
                            <div class="col-md-2"></div>
                            <div class="col-md-5">
                                <a href="login" class="btn btn-danger">Cancel</a>
                                <input type="submit" value="Verify" class="btn btn-primary">
                            </div>
                            <div class="row">
                            </div>
                            <div class="row">
                                <div class="col-md-2"></div>
                                <div class="col-md-10">
                                    <span class="text-warning">${mess}</span><br/>
                                </div>
                            </div>
                        </div>
                    </div>
                </form>
            </div>

        </section>
    </body>
</html>
