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
    <section class="material-half-bg">
      <div class="cover"></div>
    </section>
    <section class="login-content">
      <div class="logo">
        <h1>Online Shop</h1>
      </div>
        
        
        
        
      <!-- login-box -->
      <div class="login-box">
          
          <!-- login form -->
          <form class="login-form" action="login" method="post">
          <h3 class="login-head"><i class="fa fa-lg fa-fw fa-user"></i>SIGN IN</h3>
          <div class="form-group">
            <label class="control-label">EMAIL</label>
            <input class="form-control" type="text" placeholder="Email" name="txtEmail" autofocus value="${email}">
          </div>
          <div class="form-group">
            <label class="control-label">PASSWORD</label>
            <input class="form-control" type="password" placeholder="Password" name="txtPassword" value="${password}">
          </div>
          <div class="form-group">
            <div class="utility">
              <div class="animated-checkbox">
                <label>
                    <input type="checkbox" name="cboSigned" value="check" ${checkbox.equals("checked")?"checked":""}><span class="label-text">Remember</span>
                </label>
              </div>
              <p class="semibold-text mb-2"><a href="register" >Sign up</a></p>
              <p class="semibold-text mb-2"><a href="#" data-toggle="flip">Forgot Password</a></p>
            </div>
          </div>
          <div class="form-group btn-container">
            <button class="btn btn-primary btn-block"><i class="fa fa-sign-in fa-lg fa-fw"></i>SIGN IN</button>
            
          </div>

        </form>
   
          
        <!-- forget form -->  
        <form class="forget-form" action="reset" method="post">
          <h3 class="login-head"><i class="fa fa-lg fa-fw fa-lock"></i>Forgot Password ?</h3>
          <div class="form-group">
            <label class="control-label">EMAIL</label>
            <input class="form-control" type="text" placeholder="Email" name="txtEmail">
          </div>
          <div class="form-group btn-container">
            <button class="btn btn-primary btn-block"><i class="fa fa-unlock fa-lg fa-fw"></i>RESET</button>
          </div>
          <div class="form-group mt-3">
            <p class="semibold-text mb-0"><a href="#" data-toggle="flip"><i class="fa fa-angle-left fa-fw"></i> Back to Login</a></p>
          </div>
        </form>
      </div>
      <!-- end login-box -->
      
      
      
    </section>
                
                
                
    <!-- Essential javascripts for application to work-->
    <script src="assets/js/login/jquery-3.2.1.min.js"></script>
    <script src="assets/js/login/popper.min.js"></script>
    <script src="assets/js/login/bootstrap.min.js"></script>
    <script src="assets/js/login/main.js"></script>
    <!-- The javascript plugin to display page loading on top-->
    <script src="assets/js/login/pace.min.js"></script>
    <script type="text/javascript">
      // Login Page Flipbox control
      $('.login-content [data-toggle="flip"]').click(function() {
      	$('.login-box').toggleClass('flipped');
      	return false;
      });
    </script>
    
    
    
  </body>
</html>
