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
        <link href="css/bootstrap.min.css" rel="stylesheet">

        <link href="style.css" rel="stylesheet">
        <title>Home work</title>
    </head>
    <body>

        <%@ include file="/includes/header.jsp" %>


         <div class ="center">
             
            <form action="LoginServlet" method="post">
                <label for="username">Username:</label>
                <input type="text" id="username" name="user"><br><br>

                <label for="password">Password:</label>
                <input type="password" id="password" name="pass"><br><br>

                <input type="submit" value="Login">
            </form>
            </br> <p>${message}</p>
            
        </div>

        <%@ include file="/includes/footer.jsp" %>

        <script src="js/Jquery.js"></script>
        <script src="js/bootstrap.min.js"></script>
    </body>
</html>
