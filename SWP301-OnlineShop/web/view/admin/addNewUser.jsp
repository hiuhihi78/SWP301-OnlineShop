<%-- 
    Document   : addNewUser
    Created on : May 26, 2022, 8:50:53 AM
    Author     : Admin
--%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>  
        <meta charset="UTF-8">
        <title>Director | Dashboard</title>
        <meta content='width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no' name='viewport'>
        <meta name="description" content="Developed By M Abdur Rokib Promy">
        <meta name="keywords" content="Admin, Bootstrap 3, Template, Theme, Responsive">
        <!-- bootstrap 3.0.2 -->
        <link href="../assets/css/bootstrap.min.css" rel="stylesheet" type="text/css" />
        <!-- font Awesome -->
        <link href="../assets/css/font-awesome.min.css" rel="stylesheet" type="text/css" />
        <!-- Theme style -->
        <link href="../assets/css/style.css" rel="stylesheet" type="text/css" />
        <script src="https://cdn.jsdelivr.net/npm/jquery@3.6.0/dist/jquery.slim.min.js"></script>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.1/css/all.min.css" integrity="sha512-KfkfwYDsLkIlwQp6LFnl8zNdLGxu9YAA1QvwINks4PhcElQSvqcyVLLD9aMhXd13uQjoXtEKNosOWaZqXgel0g==" crossorigin="anonymous" referrerpolicy="no-referrer" />
        <!--<script src="../assets/js/additional-methods.js"></script>-->
    </head>
    <body class="skin-black">
        <!-- header logo: style can be found in header.less -->
        <jsp:include page="../admin-layout/header.jsp"></jsp:include>
            <div class="wrapper row-offcanvas row-offcanvas-left">
                <!-- Left side column. contains the logo and sidebar -->
            <jsp:include page="../admin-layout/sideBar.jsp"></jsp:include>
                <!-- Right side. contains main content -->
                <aside class="right-side">
                    <!-- Main content -->
                    <section class="content" style="margin: 0px 20px;">
                        <div id="content" style="width: 100%;">
                            <h2 style="text-align: center; margin-bottom: 20px;">Add new user</h2>
                            <form id="basic-form" action="addNewUser" method="post" class="d-flex justify-content-center">
                                <p>
                                    <label for="fullname">Full name<span class="text-danger">*</span></label>
                                    <input type="text" id="fullname" name="fullname" value="${requestScope.fullname}" required>
                            </p>
                            <p>
                                <label for="gender">Gender<span class="text-danger">*</span></label>
                                <input type="radio" name="gender" value="male" checked="checked" ${requestScope.gender == "male" ? "checked='checked'": ""} /> Male
                                <input type="radio" name="gender" value="female" ${requestScope.gender == "female" ? "checked='checked'": ""}/>Female
                            </p>
                            <p>
                                <label for="email">Email<span class="text-danger">*</span></label>
                                <input id="email" name="email" value="${requestScope.email}">
                            </p>
                            <p>
                                <label for="mobile">Mobile<span class="text-danger">*</span></label>
                                <input type="text" id="mobile" name="mobile" value="${requestScope.mobile}" onchange="validateMobile();">
                                <span id="mobile-errors" class="error" for="mobile" style="display: none;"></span>
                            </p>
                            <p>
                                <label for="role">Role<span class="text-danger">*</span></label>
                                <select name="role" id="role">
                                    <c:forEach items="${requestScope.roles}" var="r">
                                        <option value="${r.id}"  ${requestScope.roleId == r.id ? "selected='selected'":""}>${r.name}</option>
                                    </c:forEach>
                                </select>
                            </p>
                            <p>
                                <label for="address">Address<span class="text-danger">*</span></label>
                                <input id="address" name="address" value="${requestScope.address}">
                            </p>
                            <p>
                                <label for="status">Status<span class="text-danger">*</span></label>
                                <input type="radio" name="status" value="active" ${requestScope.status == "active" ? "checked='checked'": ""}>Active
                                <input type="radio" name="status" value="unactive" checked="checked"} ${requestScope.status == "unactive" ? "checked='checked'": ""}>Unactive
                            </p>

                            <c:if test="${message != null}">
                                <div class="alert alert-danger fade in" style="width: 80%; margin-left: 9%;">
                                    ${requestScope.message}
                                </div>
                            </c:if>
                            <input class="submit" type="submit" value="SUBMIT" class="">
                        </form>
                    </div>
                </section>
            </aside>
        </div>

        <style>
            form{
                width: 60%;
                margin-top: 20px;
                border: 1px solid black;
                border-radius: 10px;
                margin: 0 auto;
                box-shadow: 4.0px 8.0px 8.0px hsl(0deg 0% 0% / 0.38);
            }
            p {
                width: 80%;
                margin: 0 auto;
                margin-bottom: 10px;
            }

            p.note {
                font-size: 1rem;
                color: red;
            }

            input, textarea {
                border-radius: 5px;
                border: 1px solid #ccc;
                padding: 4px;
                font-family: 'Lato';
                width: 30vw;
                margin-top: 10px;
            }

            label {
                width: 5vw;
                font-weight: bold;
                display: inline-block;
                margin-top: 20px;
                margin-right: 1vw;
            }

            label span {
                font-size: 1rem;
            }

            label.error ,#mobile-errors{
                color: red;
                font-size: 1rem;
                display: block;
                margin-top: 5px;
                width: 30vw;
                margin-left: 6.5vw;
            }

            input.error, textarea.error {
                border: 1px dashed red;
                font-weight: 300;
                color: red;
            }

            input[type="radio"]{
                border-radius: 0px;
                border: 1px solid #ccc;
                padding: 0px;
                font-family: 'Lato';
                width: 10%;
            }

            select{
                border-radius: 5px;
                border: 1px solid #ccc;
                padding: 4px;
                font-family: 'Lato';
                width: 10vw;
                margin-top: 10px;
            }
            [type="submit"]{
                width: 20%;
                margin-left: 40%;
                margin-bottom: 20px;
                background-color: green;
                color: white;
            }
            [type="submit"]:hover{
                background-color: white;
                border-color: green;
                color: green;
            }
            .alter{
                position: relative;
                border-radius: 2px;
                border: none;
                width: 80%;
                margin-left: 9%;
            }
        </style>
        <script>
            $(document).ready(function () {
                $("#basic-form").validate({
                    rules: {
                        fullname: {
                            required: true,
                            minlength: 3
                        },
                        mobile: {
                            required: true,
                            minlength: 10,
                            maxlength: 10
//                            phonenumber:true
                        },
                        email: {
                            required: true,
                            email: true
                        },
                        address: {
                            required: true,
                            minlength: 3
                        }

                    },
                    messages: {
                        name: {
                            required: "Please enter your full name",
                            minlength: "Name should be at least 3 characters"
                        },
                        mobile: {
                            required: "Please enter your mobile",
//                            
                        },
                        email: {
                            email: "The email should be in the format: abc@domain.tld"
                        },
                        address: {
                            required: "Please enter your address"
                        }
                    }
                });

//                jQuery.validator.addMethod('phonenumber', function (value, element) {
//                    var regex = '^0[0-9]{9}$';
//                    if (element.value.match(regex)) {
//                        return true;
//                    } else {
//                        return false;
//                    }
//                    , 'Invalid phone number';
//                });
            });
            
            function  validateMobile() {
                var inputTag = document.getElementById('mobile');
                var value = document.getElementById('mobile').value;
                const regex = new RegExp('^0[0-9]{9}$');
                var label = document.getElementById('mobile-error');
                document.getElementById('mobile').classList.remove("valid");
                var form = document.getElementById('basic-form' );
                if (!regex.test(value)) {
                    document.getElementById('mobile').classList.add('error');
                    document.getElementById('mobile').setAttribute('aria-invalid', 'true');
                    document.getElementById('mobile-errors').style.display = 'block';
                    document.getElementById('mobile-errors').innerHTML = "Phone number invalid!";
                    $('#basic-form').submit(function(event) {
                        event.preventDefault();
                        window.history.back();
                    });
                }else{
                     $('#basic-form').submit(function(event) {
                        document.getElementById('basic-form').submit();
                    });
                    document.getElementById('mobile-errors').style.display = 'none';
                }
            }


        </script>

        <!-- jQuery 2.0.2 -->
        <script src="http://ajax.googleapis.com/ajax/libs/jquery/2.0.2/jquery.min.js"></script>
        <script src="../js/jquery.min.js" type="text/javascript"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-validate/1.19.0/jquery.validate.min.js"></script>
        <!-- jQuery UI 1.10.3 -->
        <script src="../assets/js/jquery-ui-1.10.3.min.js" type="text/javascript"></script>
        <!-- Bootstrap -->
        <script src="../assets/js/bootstrap.min.js" type="text/javascript"></script>
        <!-- Director App -->
        <script src="../assets/js/Director/app.js" type="text/javascript"></script>
    </body>
</html>
