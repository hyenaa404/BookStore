
<%-- 
    Document   : product-details
    Created on : Jun 20, 2024, 8:28:01 AM
    Author     : LENOVO
--%>


<%@page contentType="text/html" pageEncoding="UTF-8" import="model.*,java.util.*,util.*"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link href="css/bootstrap.min.css" rel="stylesheet">

        <link href="style.css" rel="stylesheet">
        <script src="mycode.js"></script>

        <title>T-Read- Best Book store</title>
    </head>
    <body>

        <div >

            <%@ include file="/includes/header2.jsp" %>


            <div class ="details-container row">
                <div class = "book-img col-12 col-sm-5 col-md-5 col-lg-4" >
                    <img src="${book.getImgURL()}" alt="${book.getImgURL()}" />

                </div>

                <div id ="details"class ="col-12 col-sm-7 col-md-7 col-lg-8">
                    <div class="product-details ">
                        <h1 class="title-product">${book.getTitle()}</h1>
                        <div class="group-status">
                            <p><b>Author: </b><a href="#" title="${book.getAuthor()}">${book.getAuthor()}</a></p>
                            <p><b>Genre: </b><a href="./all-book?category=${cateName}" title="Nonfiction">${cateName}</a></p>
                        </div>
                        <h4 class = "price">
                            <c:out value="${FormatString.formatCurrency(book.getPrice())}" />
                        </h4>
                        <form name = "addCart" action = "cart" method ="post">
                            <div>
                                <div class = "quantity-label">Quantity</div>
                                <div class="number-input">
                                    <button type="button"  onclick="decrement(this)">-</button>
                                    <input type="number" id ="${book.getId()}" name ="quantity" class ="quantity" value="1" min="1" max="10"onchange="updateAmount(this)">
                                    <button  type="button" onclick="increment(this)">+</button>
                                    <input type = "hidden" name ="isAdd" value = "true">
                                    <input type = "hidden" name ="bookID" value = "${book.getId()}">
                                    <input type = "hidden" name ="userID" value = "${user.getId()}">
                                </div>
                            </div>
                            <div class ="add-cart-btn">
                                <h4 class="status">New / Hardback: ${FormatString.formatCurrency(book.getPrice())}</h4>
                                <c:if test="${sessionScope.role != 'admin'}">
                                    <button id ="cart-btn">Add to cart</button>
                                </c:if>
                            </div>
                        </form>

                        <div class="rating " data-rating="${rating}"></div>
                        <p id = "ratingStatus">${ratingStatus}</p>
                        <div class ="rating-border"></div>
                    </div>
                </div>



            </div> 
            <div class ="product-descript" >
                <div class ="product-tab">
                    <h4>DESCRIPTION</h4>
                </div>
                <div>
                    <p>${book.getDescrip()}</p>
                </div>
            </div>
            <div class ="product-descript" >
                <div class ="product-tab">
                    <h4>REVIEW</h4>
                </div>
                <form action="detail" method="POST">
                    <div class ="rate-product">
                        <label for="rating">Rate:</label>
                        <select name="rating" id="rating">
                            <option value="1">⭐</option>
                            <option value="2">⭐ ⭐</option>
                            <option value="3">⭐ ⭐ ⭐</option>
                            <option value="4">⭐ ⭐ ⭐ ⭐</option>
                            <option value="5">⭐ ⭐ ⭐ ⭐ ⭐</option>
                        </select>
                    </div>
                    <div class ="review-content">
                        <input type = "text" name = "comment" placeholder="Enter content...">
                    </div>

                    <c:if test="${sessionScope.role != null}">
                        <input type = "hidden" name ="bookID" value = "${book.getId()}">
                        <input type = "hidden" name ="userID" value = "${user.getId()}">
                        <div class ="center">
                            <button type="submit">Send</button></div>
                        </c:if>
                </form>

                <c:forEach var ="b" items='${reviewList}'>
                    <p id = "comment">@${b.getUserId()} : ${b.getComment()}</p>

                </c:forEach>
            </div>


        </div>
        <%@ include file="/includes/footer.jsp" %>


        <script src="js/Jquery.js"></script>
        <script src="js/bootstrap.min.js"></script>
        <c:if test="${not empty sessionScope.alert}">

            <script>
                                        alert("${alert}");
            </script>
            <%session.setAttribute("alert", null);%>
        </c:if>
    </body>
</html>


