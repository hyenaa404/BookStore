<%-- 
    Document   : order
    Created on : Jun 18, 2024, 5:04:41 PM
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
        <script>document.addEventListener('DOMContentLoaded', function () {

                var quantityInputs = document.querySelectorAll('.quantity');
                quantityInputs.forEach(function (input) {
                    updateAmount(input);
                });
            });</script>
        <title>T-Read- Cart</title>
    </head>
    <body>

        <%@ include file="/includes/header.jsp" %>




        <div class="container order ">
            <div class="center">
                <h1>Proceed to checkout</h1></div>
            <table id ="inf-table" class ="list-table" >
                <thead><tr><th>Name</th><th>Phone</th><th>Email</th><th>Address</th></tr></thead></br>

                <tr>
                    <td>${user.getFullName()}</td>
                    <td>${user.getPhoneNumber()}</td>
                    <td>${user.getEmail()}</td>
                    <td>${user.getAddress()}</</td></tr>
            </table>

            <p>${message}</p>
            <div class ="center">
                <button onclick="showInfOverlay()">Edit Information</button></div>
            <div id="user-overlay" class ="user-inf overlay center account">
                <div class="overlay-content">
                    <form name ="updateInf" action = "order" method ="post">
                        <span class="close-btn" onclick="hideInfOverlay()">&times;</span></br>

                        <label for="fullname">Name</label>
                        <input  type="text" id="fullname" name="fullname" placeholder="Name" value = "${user.getFullName()} " ><br><br>

                        <label for="phonenumer">Phone</label>
                        <input  type="text" id="phonenumer" name="phonenumer" placeholder="Phone number" value ="${user.getPhoneNumber()} " ><br><br>

                        <label for="email">Email</label>
                        <input  type="text" id="email" name="email" placeholder="Email"value="${user.getEmail()} " ><br><br>

                        <label for="address">Address</label>
                        <input  type="text" id="address" name="address" placeholder="Adress"value ="${user.getAddress()} " ><br><br>

                        <input  type="hidden" id="id" name="id" value ="${user.getId()}" >
                        <input  type="hidden" id="mt" name="mt" value ="update" >

                        </br><button type='submit'>Save</button>
                    </form>
                </div>
            </div>


            <div  class ="products center  ">
                <form name= 'process' action='order' method = 'post'>
                    <div class = "cart-products">
                        <div class="cart-thead">
                            <div style="width: 3%" ></div><div style="width: 25%;text-align: left;">Product</div>
                            <div style="width: 20%;text-align: left;padding-left: 5px;"></div><div id ="head2" style="width: 21%"><span>Price</span></div>
                            <div style="width: 16%">Quantity</div><div id ="head3" style="width: 13%;text-align: right!important;" >Amount</div></div>

                        <div class="cart-tbody">
                            <c:forEach var ="book" items='${orderList}'>
                                <div class="cart-item">
                                    <tr>
                                    <div style="width: 3%" ></div>
                                    <div style="width: 6%;text-align: left;"><img width="120" height="auto" alt="${book.getTitle()}" src="${book.getImgURL()}"></div>
                                    <div style="width: 6%" ></div>
                                    <div id ="col1" style="width: 33%;align-items: flex-start;" class="a-center cart2"><h2 class="product-name" title="${book.getTitle()}"> <a href="./detail?bookId=${book.getId()}">${book.getTitle()}</a><span class="variant-title">Good / Paperback</span> </h2></div>
                                    <div id ="col2" style="width: 21%;" ><span class ="price">${book.getPrice()}</span></div>
                                    <div style="width: 16%">
                                        <div class="number-input">
                                            <input type='number' id=''${book.getId()}' name ='quantity_${book.getId()}' class ='quantity' value='${book.getQuantity()}' min='1' max='10'onchange='updateAmount(this)'>

                                        </div></div>
                                    <div id = "col3"style="width: 13%;text-align: right!important;align-items: flex-end;padding-right: 0" >
                                        <span class="amount"></span>
                                    </div>

                                    </tr>
                                </div>
                            </c:forEach>
                            <input type = "hidden" name ="userID" value = "${user.getId()}">
                            <input  type="hidden" id="mt" name="mt" value ="order" >

                        </div>

                        <table class = "total-table">
                            <tr>
                                <td class = "a-right"><span class="total_tt">Total:</span> 
                                    <span class="totals_price"></span></td></tr>
                        </table>
                    </div>
                    <button type="submit" ">Order</button></tr>
                </form>


            </div>

            <c:if test="${not empty sessionScope.alert}">

                <script>
                    alert("${alert}");
                </script>
                <%session.setAttribute("alert", null);%>
            </c:if>
        </div>






        <%@ include file="/includes/footer.jsp" %>

        <script src="js/Jquery.js"></script>
        <script src="js/bootstrap.min.js"></script>
    </body>
</html>



