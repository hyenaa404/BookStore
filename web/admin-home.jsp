<%-- 
    Document   : home
    Created on : May 21, 2024, 2:18:54 AM
    Author     : LENOVO
--%>

<%@page contentType="text/html" pageEncoding="UTF-8" import="model.*,java.util.*,util.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
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

        <%HttpSession existingSession = request.getSession(false);
                if (existingSession != null &&  existingSession.getAttribute("username") != null && existingSession.getAttribute("role").equals("admin") ) {
                  request.setAttribute("leftbtn", "Logout");
                  request.setAttribute("leftlink", "logout");
                  request.setAttribute("rightbtn", "Account");
                  request.setAttribute("rightlink", "account");
               }%>
        <%@ include file="/includes/header-admin.jsp" %>
        <div class ="home">
            <div class ="recommend">
                <h3><a href="./recommend">Recommend</a></h3>
                <div class = "row">
                    <c:forEach var ="b" items='${recommend}'>
                        <div class="col-6 col-sm-4 col-md-3 book3">
                            <a href="./detail?bookId=${b.getId()}">
                            <input type = "hidden" name ="bookId" value = ${b.getId()}>
                                <div class ="book-detail">
                                    <div class = img-wrapper>
                                        <img src="${b.getImgURL()}" alt="${b.title}" /></div>
                                    <div class = "book-inf">
                                        <h4 class = "book-name">
                                            ${b.getTitle()}
                                        </h4>
                                        <h4 class = "price">
                                            <c:out value="${FormatString.formatCurrency(b.getPrice())}" />
                                        </h4>
                                    </div>
                                </div>
                            </a>
                        </div>
                    </c:forEach>
                </div>
            </div>
            <div class = "banner-home">
                <img src="./img/banner2.png" />
            </div>
            <div class ="new-book">
                <h3><a href="./new-books">Discover new books!</a></h3>
                <div class = "row">
                    <c:forEach var ="b" items='${newBook}'>
                        <div class="col-6 col-sm-4 col-md-3 book">
                            <a href="./detail?bookId=${b.getId()}">
                                <div class ="book-detail">
                                    <div class = img-wrapper>
                                        <img src="${b.getImgURL()}" alt="${b.title}" /><div class="img-shadow"></div></div>
                                    <div class = "book-inf">
                                        <h4 class = "book-name">
                                            ${b.getTitle()}
                                        </h4>
                                        <h4 class = "price">
                                            <c:out value="${FormatString.formatCurrency(b.getPrice())}" />
                                        </h4>
                                    </div>
                                </div>
                            </a>
                        </div>
                    </c:forEach>
                </div>
            </div>

            <div class = "banner-home">
                <img src="./img/banner1.png" />
            </div>
            <div class ="best-seller">
                <h3><a href="./best-seller">Best sellers</a></h3>
                <div class = "row">
                    <c:forEach var ="b" items='${bestSeller}'>
                        <div class="col-6 col-sm-4 col-md-3 book2">
                            <a href="./detail?bookId=${b.getId()}">
                                <div class ="book-detail">
                                    <div class = img-wrapper>
                                        <img src="${b.getImgURL()}" alt="${b.title}" /></div>
                                    <div class = "book-inf">
                                        <h4 class = "book-name">
                                            ${b.getTitle()}
                                        </h4>
                                        <h4 class = "price">
                                            <c:out value="${FormatString.formatCurrency(b.getPrice())}" />
                                        </h4>
                                    </div>
                                </div>
                            </a>
                        </div>
                    </c:forEach>
                </div>

            </div>


            <div class = "banner-home">
                <img src="./img/banner3.png" />
            </div>

        </div>


        <%@ include file="/includes/footer.jsp" %>

        <script src="js/Jquery.js"></script>
        <script src="js/bootstrap.min.js"></script>
    </body>
</html>
