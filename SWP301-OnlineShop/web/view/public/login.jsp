<%-- 
    Document   : login
    Created on : May 23, 2022, 7:19:04 AM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Login</h1>
        <form method="post">
            <p>
                Email: <input type="text" name="txtEmail" value="${email}"/>
            <p>
                Password: <input type="password" name="txtPass" value="${pass}"/>
            <p>
                <input type="submit" value="Login"/>
        </form>
            <a href="register">Register</a>
    </body>
</html>
