<%-- 
    Document   : orders-manage
    Created on : Jul 15, 2024, 12:27:34 PM
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
        <script src="mycode.js"></script>
        <title>T-Read- Account</title>
    </head>
    <body>

        <%@ include file="/includes/header.jsp" %>


        <div>


            <div id ="order-history account" class ="center account">
                <h1>Orders Manage</h1>
                <table class ="orders-table" border='1'>
                    <thead>
                        <tr><th>UserID</th><th>Order</th><th>Date</th><th>Order value</th><th>Transport</th><th>Update Status</th></tr></br>
                    </thead>

                    <c:forEach var ="o" items='${listUserOrder}'>
                        <form action="./orders-manage" method="post">
                            <tr>
                                <td name ='date'>${o.getCustomerID()}</td>
                                <td name ='order'><a href="./view-order?orderID=${o.getOrderID()}" >${o.getOrderID()}</a></td>
                                <td name ='date'>${o.getOrderDate()}</td>
                                <td name ='value'>${o.getTotalAmount()}</td>
                                <td name ='status'>${o.getStatus()}</td>
                                <td>
                                    <input type="hidden" name="orderID" value="${o.getOrderID()}">
                                    <select name="status" onchange="this.form.submit()">
                                        <option value="Pending" ${o.getStatus() == 'Pending' ? 'selected' : ''}>Pending</option>
                                        <option value="Processing" ${o.getStatus() == 'Processing' ? 'selected' : ''}>Processing</option>
                                        <option value="Shipped" ${o.getStatus() == 'Shipped' ? 'selected' : ''}>Shipped</option>
                                        <option value="Delivered" ${o.getStatus() == 'Delivered' ? 'selected' : ''}>Delivered</option>
                                    </select>
                                </td>
                            </tr>
                            <input type="hidden" name="sellerID" value="${user.getId()}">
                        </form>
                    </c:forEach>

                </table>

                <!--<button type="submit" ">Update Status</button>-->
            </div>

            <div id ="pagi" class="pagination-1">
                <c:if test="${currentPage > 1}">
                    <a class ="navi-button" href="${pageContext.request.contextPath}/orders-manage?page=${currentPage - 1}">&lsaquo;</a>
                </c:if>


                <a href="${pageContext.request.contextPath}/orders-manage?page=1">1</a>

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
                                <a href="${pageContext.request.contextPath}/orders-manage?page=${i}">${i}</a>
                            </c:otherwise>
                        </c:choose>
                    </c:if>
                </c:forEach>

                <c:if test="${currentPage < totalPages - 2}">
                    <span id ="none">...</span>
                </c:if>

                <!-- Always show the last page -->
                <a href="${pageContext.request.contextPath}/orders-manage?page=${totalPages}">${totalPages}</a>

                <c:if test="${currentPage < totalPages}">
                    <a class ="navi-button" href="${pageContext.request.contextPath}/orders-manage?page=${currentPage + 1}">&rsaquo;</a>
                </c:if>
            </div>
            <div class ="center noti">
                <p>${noti}</p>
            </div>
            </br> <p>${message}</p>

        </div>

        <%@ include file="/includes/footer.jsp" %>

        <script src="js/Jquery.js"></script>
        <script src="js/bootstrap.min.js"></script>
    </body>
</html>

