<%-- 
    Document   : view-order
    Created on : Jul 15, 2024, 11:15:13 AM
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
        <title>T-Read- View order items</title>
    </head>
    <body>

        <%@ include file="/includes/header.jsp" %>

        <div>


            <div  class ="center  container cart">
                <h1>Order Items</h1>
                    <div class = "cart-products">
                        <div class="cart-thead">
                            <div style="width: 3%" ></div><div style="width: 25%;text-align: left;">Product</div>
                            <div style="width: 20%;text-align: left;padding-left: 5px;"></div><div id ="head2" style="width: 21%"><span>Price</span></div>
                            <div style="width: 16%">Quantity</div><div id ="head3" style="width: 13%;text-align: right!important;" >Amount</div></div>

                        <div class="cart-tbody">
                            <c:forEach var ="book" items='${oiList}'>
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
                            

                        </div>

                        <table class = "total-table">
                            <tr>
                                <td class = "a-right"><span class="total_tt">Total:</span> 
                                    <span class="totals_price"></span></td></tr>
                        </table>
                    </div>
                    

            </div>




                        </br></br>


        </div>

        <%@ include file="/includes/footer.jsp" %>

        <script src="js/Jquery.js"></script>
        <script src="js/bootstrap.min.js"></script>
    </body>
</html>



