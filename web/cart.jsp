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
                <div class = "cart-products">
                    <div class="cart-thead"><div style="width: 6%" ></div><div style="width: 21%;text-align: left;">Product</div>
                        <div style="width: 21%;text-align: left;padding-left: 5px;"></div><div id ="head2" style="width: 21%"><span>Price</span></div>
                        <div style="width: 16%">Quantity</div><div id ="head3" style="width: 13%;text-align: right!important;" >Amount</div></div>

                    <div class="cart-tbody">
                        <form name= 'process' action='order' method = 'post'>
                            <div class="cart-item">
                                <tr>
                                <div style="width: 6%" ><input name="isDelete" type="checkbox" value =${book.getId()} ></div>
                                <div style="width: 6%;text-align: left;"><img width="120" height="auto" alt="A Soldier Reports (1980 edition) - Good / Paperback" src="https://bizweb.dktcdn.net/thumb/compact/100/364/248/products/a1sq8yjeg5l-sl1500.jpg"></div>
                                <div style="width: 6%" ></div>
                                <div id ="col1" style="width: 30%;align-items: flex-start;" class="a-center cart2"><h2 class="product-name" title="A Soldier Reports (1980 edition)"> <a href="./a-soldier-reports-1980-edition">A Soldier Reports (1980 edition)</a><span class="variant-title">Good / Paperback</span> </h2></div>
                                <div id ="col2" style="width: 21%;" ><span class ="price">290.000</span></div>
                                <div style="width: 16%">
                                    <div class="number-input">
                                        <button type="button" onclick="decrement(this)">-</button>
                                        <input type="number" id="number" name ="quantity" class ="quantity" value="1" min="1" max="10"onchange="updateAmount(this)">
                                        <button type="button" onclick="increment(this)">+</button>
                                    </div></div>
                                <div id = "col3"style="width: 13%;text-align: right!important;align-items: flex-end;padding-right: 0" >
                                    <span class="amount"></span></div></tr></div>
                            <div class="cart-item"><tr>
                                <div style="width: 6%" ><input name="isDelete" type="checkbox" value =${book.getId()} ></div>
                                <div style="width: 6%;text-align: left;"><img width="120" height="auto" alt="Culture and Imperialism" src="//bizweb.dktcdn.net/thumb/large/100/364/248/products/9780679750543.jpg?v=1623227444083"></div>
                                <div style="width: 6%" ></div>
                                <div id ="col1" style="width: 30%;align-items: flex-start;" class="a-center cart2"><h2 class="product-name" title="Culture and Imperialism"> <a href="./a-soldier-reports-1980-edition">Culture and Imperialism</a><span class="variant-title"> Edward W. Said</span> </h2></div>
                                <div id ="col2" style="width: 21%;" ><span class ="price">350.000</span></div>
                                <div style="width: 16%">
                                    <div class="number-input">
                                        <button type="button"  onclick="decrement(this)">-</button>
                                        <input type="number" name ="quantity" class ="quantity" value="1" min="1" max="10"onchange="updateAmount(this)">
                                        <button  type="button" onclick="increment(this)">+</button>
                                    </div></div>
                                <div id = "col3"style="width: 13%;text-align: right!important;align-items: flex-end;padding-right: 0" >
                                    <span class="amount"></span></div></tr></div>
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
            </div>






        </div>

        <%@ include file="/includes/footer.jsp" %>

        <script src="js/Jquery.js"></script>
        <script src="js/bootstrap.min.js"></script>
    </body>
</html>


