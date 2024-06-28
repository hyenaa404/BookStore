<%-- 
    Document   : products-list
    Created on : Jun 25, 2024, 11:24:26 AM
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
        <script src="mycode.js">
        </script>
        <script>

            window.addEventListener('resize', updateBookVisibility);
            window.addEventListener('load', updateBookVisibility);
        </script>
        <title>T-read</title>
    </head>
    <body>

        <%@ include file="/includes/header.jsp" %>
        <div class ="home">
            <div class ="new-book">
                <h3><a href="./new-books">Discover new books!</a></h3>
                <div class = "row">
                    <%for (int i = 0; i<8; i++){%>
                    <div class="col-6 col-sm-4 col-md-3 book">
                        <a href="#">
                            <div class ="book-detail">
                                <img src=" //bizweb.dktcdn.net/thumb/large/100/364/248/products/91qvx7ze7yl-sl1500.jpg?v=1716211197813" alt="Camry 2021" />
                                <div class = "book-inf">
                                    <h4 class = "book-name">
                                        Divided : Why We're Living in an Age of Walls
                                    </h4>
                                    <h4 class = "price">
                                        290.000 VND
                                    </h4>
                                </div>
                            </div>
                        </a>
                    </div>
                    <%}%>
                </div>
            </div>
            

        </div>


        <%@ include file="/includes/footer.jsp" %>

        <script src="js/Jquery.js"></script>
        <script src="js/bootstrap.min.js"></script>
    </body>
</html>
