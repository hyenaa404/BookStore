<%-- 
    Document   : home
    Created on : May 21, 2024, 2:18:54 AM
    Author     : LENOVO
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="css/bootstrap.min.css" rel="stylesheet">

        <link href="style.css" rel="stylesheet">
        <script src="mycode.js">

        </script>
        <title>T-read</title>
    </head>
    <body>

        <%@ include file="/includes/header.jsp" %>
        <div class ="home">
            <div class ="new-book">
                <h3><a href="./new-books">Discover new books!</a></h3>
            </div>
        </div>


        <%@ include file="/includes/footer.jsp" %>

        <script src="js/Jquery.js"></script>
        <script src="js/bootstrap.min.js"></script>
    </body>
</html>
