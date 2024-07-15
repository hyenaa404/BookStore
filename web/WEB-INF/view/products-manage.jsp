<%-- 
    Document   : products-manage
    Created on : Jul 15, 2024, 6:56:50 PM
    Author     : LENOVO
--%>


<%@page contentType="text/html" pageEncoding="UTF-8" import="model.*,java.util.*,util.*"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link href="css/bootstrap.min.css" rel="stylesheet">

        <link href="style.css" rel="stylesheet">
        <script src="mycode.js">
        </script>

        <title>T-read</title>
    </head>
    <body>

        
        <%@ include file="/includes/header.jsp" %>
        <div class ="home">
            <c:if test="${not empty list}">
            <div class ="list-book">

                <div class = "row">
                    <c:forEach var ="b" items='${list}'>
                        <div class="col-6 col-sm-4 col-md-3 book3">
                            <a href="./detail?bookId=${b.getId()}">
                                <input type = "hidden" name ="bookId" value = ${b.getId()}>
                                <div class ="book-detail">
                                    <div class = img-wrapper>
                                        <img src="${b.getImgURL()}" alt="${b.title}" />
                                    <div class="action-buttons">
                        <form action="updateBook" method="post">
                            <input type="hidden" name="bookId" value="${b.getId()}">
                            <button type="submit" class="btn-update">Update</button>
                        </form>
                        <form action="deleteBook" method="post">
                            <input type="hidden" name="bookId" value="${b.getId()}">
                            <button type="submit" class="btn-delete">Delete</button>
                        </form>
                    </div>
                                    </div>
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

            <div id ="pagi" class="pagination-1">
                <c:if test="${currentPage > 1}">
                    <a class ="navi-button" href="${pageContext.request.contextPath}/all-book?page=${currentPage - 1}">&lsaquo;</a>
                </c:if>


                <a href="${pageContext.request.contextPath}/all-book?page=1">1</a>

                <!-- Show the dots if current page is far from the start -->
                <c:if test="${currentPage > 3}">
                    <span id ="none">...</span>
                </c:if>

                <c:forEach var="i" begin="2" end="${totalPages - 1}">
                    <c:if test="${i >= currentPage - 1 && i <= currentPage + 1}">
                        <c:choose>
                            <c:when test="${i == currentPage}">
                                <span>${i}</span>
                            </c:when>
                            <c:otherwise>
                                <a href="${pageContext.request.contextPath}/all-book?page=${i}">${i}</a>
                            </c:otherwise>
                        </c:choose>
                    </c:if>
                </c:forEach>

                <c:if test="${currentPage < totalPages - 2}">
                    <span id ="none">...</span>
                </c:if>

                <!-- Always show the last page -->
                <a href="${pageContext.request.contextPath}/all-book?page=${totalPages}">${totalPages}</a>

                <c:if test="${currentPage < totalPages}">
                    <a class ="navi-button" href="${pageContext.request.contextPath}/all-book?page=${currentPage + 1}">&rsaquo;</a>
                </c:if>
            </div>
                </c:if>
            <div class ="center noti">
            <p>${noti}</p>
            </div>
        </div>

        <%@ include file="/includes/footer.jsp" %>

        <script src="js/Jquery.js"></script>
        <script src="js/bootstrap.min.js"></script>
    </body>
</html>
