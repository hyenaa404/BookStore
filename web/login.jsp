<%-- 
    Document   : login
    Created on : Jun 12, 2024, 12:19:08 AM
    Author     : LENOVO
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link href="css/bootstrap.min.css" rel="stylesheet">

        <link href="style.css" rel="stylesheet">
        <title>T-Read- Login</title>
    </head>
    <body>

        <%@ include file="/includes/header.jsp" %>


         <div class ="center login">
            <h1>Login</h1>
            <form action="login" method="post">
                <!--<label for="username">Username:</label>-->
                <input  type="text" id="username" name="user" placeholder="User name"><br><br>

                <!--<label for="password">Password:</label>-->
                <input  type="password" id="password" name="pass" placeholder="Password"><br><br>

                <input type="submit" value="Login">
            </form>
            </br> <p>${message}</p>
            
        </div>

        <%@ include file="/includes/footer.jsp" %>

        <script src="js/Jquery.js"></script>
        <script src="js/bootstrap.min.js"></script>
    </body>
</html>
