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
                    <td>John Doe</td>
                    <td>023827348</td>
                    <td>johndoe97@123</td>
                    <td>123-Oak Street- London- England</td></tr>
            </table>
            <div class ="center">
                <button onclick="showInfOverlay()">Edit Inf</button></div>
            <div id="user-overlay" class ="user-inf overlay center account">
                <div class="overlay-content">
                    <span class="close-btn" onclick="hideInfOverlay()">&times;</span></br>

                    <label for="fullname">Full Name</label>
                    <input  type="text" id="fullname" name="fullname" placeholder="Full name" value = "${fullname} " ><br><br>

                    <label for="phonenumer">Phone</label>
                    <input  type="text" id="phonenumer" name="phonenumer" placeholder="Phone number" value ="${phone} " ><br><br>

                    <label for="email">Email</label>
                    <input  type="text" id="email" name="email" placeholder="Email"value="${mail} " ><br><br>

                    <label for="address">Address</label>
                    <input  type="text" id="address" name="address" placeholder="Adress"value ="${address} " ><br><br>

                </div>
            </div>

            <form name= 'process' action='order' method = 'post'>
                <div  class ="products center  ">
                    <div class = "cart-products">
                        <div class="cart-thead">
                                <div style="width: 2%" ></div><div style="width: 25%;text-align: left;">Product</div>
                            <div style="width: 21%;text-align: left;padding-left: 5px;"></div><div id ="head2" style="width: 21%"><span>Price</span></div>
                            <div style="width: 16%">Quantity</div><div id ="head3" style="width: 13%;text-align: right!important;" >Amount</div></div>

                        <div class="cart-tbody">
                            <div class="cart-item">
                                <tr>
                                <div style="width: 2%" ></div>
                                <div style="width: 6%;text-align: left;"><img width="120" height="auto" alt="A Soldier Reports (1980 edition) - Good / Paperback" src="https://bizweb.dktcdn.net/thumb/compact/100/364/248/products/a1sq8yjeg5l-sl1500.jpg"></div>
                                <div style="width: 6%" ></div>
                                <div id ="col1" style="width: 34%;align-items: flex-start;" class="a-center cart2"><h2 class="product-name" title="A Soldier Reports (1980 edition)"> <a href="./a-soldier-reports-1980-edition">A Soldier Reports (1980 edition)</a><span class="variant-title">Good / Paperback</span> </h2></div>
                                <div id ="col2" style="width: 21%;" ><span class ="price">290.000</span></div>
                                <div style="width: 16%">
                                    <div class="number-input">
                                        <input type="number" id="number" name ="quantity" class ="quantity" value="2" min="1" max="10"onchange="updateAmount(this)">
                                    </div></div>
                                <div id = "col3"style="width: 13%;text-align: right!important;align-items: flex-end;padding-right: 0" >
                                    <span class="amount"></span></div>
                                <div style="width: 2%" ></div></tr></div>
                            <div class="cart-item"><tr>
                                <div style="width: 2%" ></div>
                                <div style="width: 6%;text-align: left;"><img width="120" height="auto" alt="Culture and Imperialism" src="//bizweb.dktcdn.net/thumb/large/100/364/248/products/9780679750543.jpg?v=1623227444083"></div>
                                <div style="width: 6%" ></div>
                                <div id ="col1" style="width: 34%;align-items: flex-start;" class="a-center cart2"><h2 class="product-name" title="Culture and Imperialism"> <a href="./a-soldier-reports-1980-edition">Culture and Imperialism</a><span class="variant-title"> Edward W. Said</span> </h2></div>
                                <div id ="col2" style="width: 21%;" ><span class ="price">350.000</span></div>
                                <div style="width: 16%">
                                    <div class="number-input">
                                        <input type="number" id="number" name ="quantity" class ="quantity" value="2" min="1" max="10"onchange="updateAmount(this)">
                                    </div></div>
                                <div id = "col3"style="width: 13%;text-align: right!important;align-items: flex-end;padding-right: 0" >
                                    <span class="amount"></span></div>
                                <div style="width: 2%" ></div></tr></div>
                        </div>

                        <table class = "total-table">
                            <tr>
                                <td class = "a-right"><span class="total_tt">Total:</span> 
                                    <span class="totals_price"></span></td></tr>
                        </table>
                    </div>
                    <tr>
                    <button type="submit" >Order</button></tr>
            </form>
        </div>
    </div>
</form>





<%@ include file="/includes/footer.jsp" %>

<script src="js/Jquery.js"></script>
<script src="js/bootstrap.min.js"></script>
</body>
</html>



