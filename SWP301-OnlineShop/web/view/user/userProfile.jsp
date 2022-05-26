<%-- 
    Document   : useProfile
    Created on : May 25, 2022, 10:07:13 PM
    Author     : Hoang Quang
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>User Profile </title>
        <meta content='width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no' name='viewport'>
        <meta name="description" content="Developed By M Abdur Rokib Promy">
        <meta name="keywords" content="Admin, Bootstrap 3, Template, Theme, Responsive">
        <!-- bootstrap 3.0.2 -->
        <link href="../../css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
        <!-- font Awesome -->
        <link href="../../css/font-awesome.min.css" rel="stylesheet" type="text/css"/>
        <!-- Ionicons -->
        <link href="../../css/ionicons.css" rel="stylesheet" type="text/css"/>
        <link href='http://fonts.googleapis.com/css?family=Lato' rel='stylesheet' type='text/css'>
        <!-- Theme style -->
        <link href="../../css/style.css" rel="stylesheet" type="text/css"/>
    </head>
    <body>
        <button type="button" class="btn btn-info btn-lg" data-toggle="modal" data-target="#myModal">Open User
            Profile</button>
        <!-- Modal -->
        <div class="modal fade" id="myModal" role="dialog">
            <div class="modal-dialog">

                <!-- Modal content-->
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal">&times;</button>
                        <h4 class="modal-title">User Profile</h4>
                    </div>
                    <div class="modal-body">
                        <form action="">
                            <div class="modal-body">
                                <div class="form-row">
                                    <div class="col-md-12">
                                        <img src="../../img/14161.gif" class="rounded-circle mb-3" style="width: 150px;" alt="Avatar" />
                                        <h5 class="mb-2"><strong>User Name Here</strong></h5>
                                        <h6>Upload a different photo...</h6>
                                        <input type="file" class="form-control">
                                    </div>
                                </div>
                                <div class="form-row">
                                    <div class=" col-md-12">
                                        <label for="inputFristName">Full Name</label>
                                        <input type="text" class="form-control" id="inputFristName" placeholder="Name">
                                    </div>
                                    <!-- <div class="col-md-6">
                                      <label for="inputLastName">Last Name</label>
                                      <input type="text" class="form-control" id="inputLastName" placeholder="Last Name">
                                    </div>-->
                                </div>
                                <div class="form-row">
                                    <div class=" col-md-6">
                                        <label for="inputPhone">Phone</label>
                                        <input type="text" class="form-control" id="inputPhone" placeholder="+84...">
                                    </div>
                                    <div class="col-md-6">
                                        <label for="inputEmail">Email</label>
                                        <input type="text" class="form-control" readonly id="inputEamil" placeholder="abc@abc">
                                    </div>
                                </div>
                                <div class="form-row">
                                    <div class="col-md-12">
                                        <label for="inputAddress">Address</label>
                                        <input type="text" class="form-control" id="inputAddress">
                                    </div>
                                </div>
                                <div class="form-row">
                                    <div class="col-md-12">
                                        <label for="inputGender">Gender</label>
                                    </div>
                                    <div class="col-md-4">
                                        <input class="form-check-input" type="radio" name="inputGender" id="gender" value="#" checked>
                                        <label class="form-check-label" for="gridRadios1">
                                            Male
                                        </label>
                                    </div>
                                    <div class="col-md-4">
                                        <input class="form-check-input" type="radio" name="inputGender" id="gender" value="#">
                                        <label class="form-check-label" for="gridRadios2">
                                            Female
                                        </label>
                                    </div>
                                    <div class="col-md-4">
                                        <input class="form-check-input" type="radio" name="inputGender" id="gender" value="#">
                                        <label class="form-check-label" for="gridRadios3">
                                            Other
                                        </label>
                                    </div>
                                </div>
                            </div>
                            <div class="modal-footer">
                                <button type="submit" class="btn btn-info">Update</button>
                                <button type="button" class="btn btn-danger " data-dismiss="modal">Close</button>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <script src="http://ajax.googleapis.com/ajax/libs/jquery/2.0.2/jquery.min.js"></script>
    <script src="../../js/jquery.min.js" type="text/javascript"></script>
    <!-- Bootstrap -->
    <script src="../../js/bootstrap.min.js" type="text/javascript"></script>
    <!-- Director App -->
    <script src="../../js/Director/app.js" type="text/javascript"></script>
</body>
</html>
