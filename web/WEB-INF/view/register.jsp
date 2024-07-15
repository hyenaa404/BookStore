<%-- 
    Document   : register
    Created on : Jun 12, 2024, 3:16:06 PM
    Author     : LENOVO
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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

                <input  type="text" id="fullname" name="fullname" placeholder="Full name" required><br><br>

                <input  type="text" id="phonenumer" name="phonenumer" placeholder="Phone number" required><br><br>

                <input  type="text" id="email" name="email" placeholder="Email" required><br><br>

                <input  type="text" id="address" name="address" placeholder="Adress" ><br><br>

                <input  type="text" id="username" name="user" placeholder="User name" required><br><br>

                <input  type="password" id="password" name="pass" placeholder="Password" required><br><br>


                <input type="submit" value="Register">
                <c:if test="${not empty sessionScope.username && sessionScope.role == 'admin'}">
                 <input type="submit" name ="sellerRegister" value="Seller Register">
                </c:if>
            </form>
            </br> <p>${message}</p>

        </div>

        <%@ include file="/includes/footer.jsp" %>

        <script src="js/Jquery.js"></script>
        <script src="js/bootstrap.min.js"></script>
    </body>
</html>
