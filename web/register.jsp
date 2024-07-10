<%-- 
    Document   : register
    Created on : Jun 12, 2024, 3:16:06 PM
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
        <title>T-Read- Register</title>
    </head>
    <body>

        <%@ include file="/includes/header.jsp" %>


        <div class ="center register">
            <h1>Register Account</h1>
            <form action="register" method="post">

                <input  type="text" id="fullname" name="fullname" placeholder="Full name"><br><br>

                <input  type="text" id="phonenumer" name="phonenumer" placeholder="Phone number"><br><br>

                <input  type="text" id="email" name="email" placeholder="Email"><br><br>

                <input  type="text" id="address" name="address" placeholder="Adress" value ="${user.getAdress()}"><br>

                <input  type="text" id="username" name="user" placeholder="User name"><br><br>

                <input  type="password" id="password" name="pass" placeholder="Password"><br><br>


                <input type="submit" value="Register">
            </form>
            </br> <p>${message}</p>

        </div>

        <%@ include file="/includes/footer.jsp" %>

        <script src="js/Jquery.js"></script>
        <script src="js/bootstrap.min.js"></script>
    </body>
</html>
