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


        <%@ include file="/includes/header-admin.jsp" %>
        <div class ="home">
            <button class="sticky-button"onclick="showAddProductOverlay()"><abbr title="Click to add new book!">+</abbr></button>
            <c:if test="${not empty list}">
                <div class ="list-book">

                    <div class = "row">
                        <c:forEach var ="b" items='${list}'>
                            <div class="col-6 col-sm-4 col-md-3 book3">
                                <input type = "hidden" name ="bookId" value = ${b.getId()}>
                                <div class ="book-detail">
                                    <div class = img-wrapper>
                                        <img src="${b.getImgURL()}" alt="${b.title}" />
                                        <div class="action-buttons">
                                            <button type="button" class="btn-update"
                                                    data-bookid="${b.getId()}"
                                                    data-title="${b.getTitle()}"
                                                    data-author="${b.getAuthor()}"
                                                    data-price="${b.getPrice()}"
                                                    data-quantity="${b.getQuantity()}"
                                                    data-description="${b.getDescrip()}"
                                                    data-imgurl="${b.getImgURL()}"
                                                    onclick="showUpdateProductOverlay();updateButton(this)">Update</button>
                                            <form action="products-manage" method="post">
                                                <input type="hidden" name="mt" value="delete">
                                                <input type="hidden" name="bookId" value="${b.getId()}">
                                                <button type="submit" class="btn-delete">Delete</button>
                                            </form>
                                        </div>
                                    </div>

                                    <a href="./detail?bookId=${b.getId()}">
                                        <div class = "book-inf">
                                            <h4 class = "book-name">
                                                ${b.getTitle()}
                                            </h4>
                                            <h4 class = "price">
                                                <c:out value="${FormatString.formatCurrency(b.getPrice())}" />
                                            </h4>
                                        </div>
                                    </a>
                                </div>
                            </div>
                        </c:forEach>
                    </div>
                </div>




                <div id="update-product-overlay" class="overlay center">
                    <div class="overlay-content">
                        <span class="close-btn" onclick="hideUpdateProductOverlay()">&times;</span></br>
                        <form name = "updateProduct" action = "products-manage" method = "post" enctype="multipart/form-data">
                            <div class =" account product">
                                <h1>Update product</h1>
                                <input type="hidden" name="mt" value="update">
                                <input type="hidden" id="overlayBookId" name="bookId" value="">
                                <label for="title">Title:</label>
                                <input type="text" id="overlayTitle" name="title" value=""><br>
                                <label for="author">Author:</label>
                                <input type="text" id="overlayAuthor" name="author" value=""><br>
                                <label for="price">Price:</label>
                                <input type="number" id="overlayPrice" name="price" value=""><br>
                                <label for="quantity">Quantity</label>
                                <input type="number" id="overlayQuantity" name="quantity" value=""><br>
                                <label for="category">Category:</label>
                                <select id="category" name="category">
                                    <option value="1">Fiction </option>
                                    <option value="2">Nonfiction</option>
                                    <option value="3">Poetry</option>
                                </select><br>
                                <label for="description">Description:</label>
                                <input type="text"id="overlayDescription" name="description" value=""><br>
                                <label for="imgURL">Image URL:</label>
                                <input type="text" id="overlayImgURL" name="imgURL" value=""><br><br>
                                <label for="imgURL">Upload Img:</label>
                                <input type="file" id="img" name="img" accept="image/*" >

                                </br><button type='submit'>Save</button>
                            </div>

                        </form>
                        <br/><br/>
                    </div>
                </div>






                <div id="add-product-overlay" class="overlay center">
                    <div class="overlay-content product">
                        <span class="close-btn" onclick="hideAddProductOverlay()">&times;</span></br>
                        <form name = "updateProduct" action = "products-manage" method = "post" enctype="multipart/form-data">
                            <div class =" account">
                                <h1>Add product</h1>
                                <input type="hidden" name="mt" value="add">
                                <label for="title">Title:</label>
                                <input type="text" id="overlayTitle" name="title" value=""><br>
                                <label for="author">Author:</label>
                                <input type="text" id="overlayAuthor" name="author" value=""><br>
                                <label for="price">Price:</label>
                                <input type="number" id="overlayPrice" name="price" value=""><br>
                                <label for="quantity">Quantity</label>
                                <input type="number" id="overlayQuantity" name="quantity" value=""><br>
                                <label for="category">Category</label>
                                <select id="category" name="category">
                                    <option value="1">Fiction </option>
                                    <option value="2">Nonfiction</option>
                                    <option value="3">Poetry</option>
                                </select><br>
                                <label for="description">Description:</label>
                                <input type="text"id="overlayDescription" name="description" value=""><br>
                                <label for="imgURL">Image URL:</label>
                                <input type="text" id="overlayImgURL" name="imgURL" value=""><br><br>
                                <label for="imgURL">Upload Img:</label>
                                <input type="file" id="img" name="img" accept="image/*" required>

                                </br><button type='submit'>Save</button>
                            </div>

                        </form>
                        <br/><br/>
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
