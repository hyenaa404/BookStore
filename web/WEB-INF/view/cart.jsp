<%-- 
    Document   : cart
    Created on : Jun 14, 2024, 4:01:13 PM
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

        <div>


            <div  class ="center  container cart">
                <h1>Your cart</h1>
                <form id ="myForm" name= 'process' action='' method = ''>
                    <div class = "cart-products">
                        <div class="cart-thead"><div style="width: 6%" ></div><div style="width: 21%;text-align: left;">Product</div>
                            <div style="width: 21%;text-align: left;padding-left: 5px;"></div><div id ="head2" style="width: 21%"><span>Price</span></div>
                            <div style="width: 16%">Quantity</div><div id ="head3" style="width: 13%;text-align: right!important;" >Amount</div></div>

                        <div class="cart-tbody">

                            <c:forEach var ="book" items='${cart}'>
                                <div class="cart-item">
                                    <tr>
                                    <div style="width: 6%" ><input name="isSelected" type="checkbox" value ="${book.getId()}" ></div>
                                    <div style="width: 6%;text-align: left;"><img width="120" height="auto" alt="${book.getTitle()}" src="${book.getImgURL()}"></div>
                                    <div style="width: 6%" ></div>
                                    <div id ="col1" style="width: 30%;align-items: flex-start;" class="a-center cart2"><h2 class="product-name" title="${book.getTitle()}"> <a href="./detail?bookId=${book.getId()}">${book.getTitle()}</a><span class="variant-title">Good / Paperback</span> </h2></div>
                                    <div id ="col2" style="width: 21%;" ><span class ="price">${book.getPrice()}</span></div>
                                    <div style="width: 16%">
                                        <div class="number-input">
                                            <button type="button" onclick="decrement(this)">-</button>
                                            <input type='number' id=''${book.getId()}' name ='quantity_${book.getId()}' class ='quantity' value='${book.getQuantity()}' min='1' max='10'onchange='updateAmount(this)'>
                                            <button type="button" onclick="increment(this)">+</button>
                                        </div></div>
                                    <div id = "col3"style="width: 13%;text-align: right!important;align-items: flex-end;padding-right: 0" >
                                        <span class="amount"></span>
                                    </div>

                                    </tr>
                                </div>
                            </c:forEach>
                            <input  type="hidden" id="mt" name="mt" value ="display" >
                            <input  type="hidden" id="userID" name="userID" value ="${user.getId()}" >

                        </div>

                        <table class = "total-table">
                            <tr>
                                <td class = "a-right"><span class="total_tt">Total:</span> 
                                    <span class="totals_price"></span></td></tr>
                        </table>
                    </div>
                    <tr><button id="delete-btn" type='submit' onclick="submitForm('method1')">Delete</button>
                    <button type="submit" onclick="submitForm('method2')">Order</button></tr>
                </form>

                <p>${cartStatus}</p>
            </div>






        </div>

        <%@ include file="/includes/footer.jsp" %>

        <script src="js/Jquery.js"></script>
        <script src="js/bootstrap.min.js"></script>
    </body>
</html>


