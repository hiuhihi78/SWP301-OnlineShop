<%-- 
    Document   : login
    Created on : May 23, 2022, 7:19:04 AM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
  <body>
<<<<<<< HEAD
    <section class="material-half-bg">
      <div class="cover"></div>
    </section>
    <section class="login-content">
      <div class="logo">
        <h1>Online Shop</h1>
      </div>
      <div class="login-box">
          <form class="login-form" action="login" method="POST">
          <h3 class="login-head"><i class="fa fa-lg fa-fw fa-user"></i>SIGN IN</h3>
          <div class="form-group">
            <label class="control-label">USERNAME</label>
            <input class="form-control" type="text" placeholder="username" name="username" autofocus>
          </div>
          <div class="form-group">
            <label class="control-label">PASSWORD</label>
            <input class="form-control" type="password" name="password" placeholder="Password">
=======
    <!-- login form -->
    <div class="bg-modal">
        <div class="modal-content">
          <div class="close">+</div>
        <h3>${mess}</h3>
          <form class="login-form" action="login" method="post">
              <h3 class="login-head" id="sign"><i class="fa fa-lg fa-fw fa-user"></i>SIGN IN</h3>
          <div class="form-group">
            <label class="control-label">EMAIL</label>
            <input class="form-control" type="text" placeholder="Email" name="txtEmail" autofocus value="${email}">
          </div>
          <div class="form-group">
            <label class="control-label">PASSWORD</label>
            <input class="form-control" type="password" placeholder="Password" name="txtPassword" value="${password}">
>>>>>>> 6a0acfc0e8f1f1eed079f6a275b85c5625ff74f8
          </div>
          <div class="link-box">
              
              <input type="checkbox" name="cboSigned" ${checkbox.equals("checked")? "checked":""}/>&nbsp;<span class="label-text a">Remember</span>
              <p class="semibold-text mb-2 a"><a href="register" >Sign up</a></p>
              <p class="semibold-text mb-2 a"><a href="#" data-toggle="flip">Forgot Password</a></p>
          </div>
          <div class="form-group btn-container">
            <button class="btn btn-primary btn-block"><i class="fa fa-sign-in fa-lg fa-fw"></i>SIGN IN</button>
            
          </div>
        </form>
           </div>
      </div> 
   
          
        <!-- forget form -->  
<!--        <form class="forget-form" action="reset" method="post">
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
      </div>-->
      <!-- end login-box -->
<!--        </div>
    </div>-->
             
</body>
<!--     <script src="assets/js/login/jquery-3.2.1.min.js"></script>
    <script src="assets/js/login/popper.min.js"></script>
    <script src="assets/js/login/bootstrap.min.js"></script>
    <script src="assets/js/login/main.js"></script>
     The javascript plugin to display page loading on top
    <script src="assets/js/login/pace.min.js"></script>
    <script type="text/javascript">
      // Login Page Flipbox control
      $('.login-content [data-toggle="flip"]').click(function() {
      	$('.login-box').toggleClass('flipped');
      	return false;
      });
    </script>
    
    -->
   
</html>
