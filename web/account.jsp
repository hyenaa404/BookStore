<%-- 
    Document   : account
    Created on : Jun 12, 2024, 3:44:05 PM
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
            <div class ="center account">
                <h1>Account information</h1>
                <label for="username">Full Name</label>
                <input  type="text" id="fullname" name="fullname" placeholder="Full name" value ="${user.getFullName()}" disabled><br><br>

                <label for="username">Phone</label>
                <input  type="text" id="phonenumer" name="phonenumer" placeholder="Phone number" value ="${user.getPhoneNumber()}" disabled><br><br>

                <label for="username">Email</label>
                <input  type="text" id="email" name="email" placeholder="Email"value="${user.getEmail()}" disabled><br><br>

                <label for="address">Address</label>
                <input  type="text" id="adress" name="adress" placeholder="Adress" value ="${user.getAddress()}" disabled><br><br>

                <label for="username">Username:</label>
                <input  type="text" id="username" name="user" placeholder="User name"value ="${user.getUserName()}" disabled><br><br>
                <button onclick="showUpdateAccountOverlay()">Update information</button>

            </div>

            <div id ="order-history account" class ="center account">
                <h1>Orders History</h1>
                <table class ="orders-table" border='1'>
                    <thead>
                        <tr><th>Order</th><th>Date</th><th>Address</th><th>Order value</th><th>Transport</th></tr></br>
                    </thead>
                    <tr>

                        <td name ='order'>Order 01</td>
                        <td name ='date'>01/01/2011</td>
                        <td name ='address'>29 An Hai - Ngu Hanh Son - Danang</td>
                        <td name ='value'>299.000</td>
                        <td name ='status'>Shipped</td>
                    </tr>

                </table>

            </div>


            <div id="update-account-overlay" class="overlay center">
                <div class="overlay-content">
                    <span class="close-btn" onclick="hideUpdateAccountOverlay()">&times;</span></br>
                    <form name = "updateName" action = "account" method = "post">
                        <div class =" account">
                            <h1>Update information</h1>
                            <label for="name">Full Name</label>
                            <input  type="text" id="fullname" name="fullname" placeholder="ex: John Doe" value ="${user.getFullName()}" ><br>

                            <label for="phone">Phone</label>
                            <input  type="text" id="phonenumer" name="phonenumer" placeholder="ex: 0928349273" value ="${user.getPhoneNumber()}"><br>

                            <label for="email">Email</label>
                            <input  type="text" id="email" name="email" placeholder="ex: johndoe97@gmail.com" value ="${user.getEmail()}"><br>

                            <label for="address">Address</label>
                            <input  type="text" id="address" name="address" placeholder="ex: 123 Oak Street London EngLand" value ="${user.getAddress()}"><br>

                            <label for="username">Username:</label>
                            <input  type="text" id="username" name="username" placeholder="More than 8 letter" value ="${user.getUserName()}"><br>

                            <label for="pass">Password</label>
                            <input  type="password" id="password" name="password" placeholder="More than 8 letter" value ="${user.getPassWord()}"><br>
                            <input  type="hidden" id="id" name="id" value ="${user.getId()}" >


                            </br><button type='submit'>Save</button>
                        </div>

                    </form>
                    <br/><br/>
                </div>
            </div>
            </br> <p>${message}</p>

        </div>

        <%@ include file="/includes/footer.jsp" %>

        <script src="js/Jquery.js"></script>
        <script src="js/bootstrap.min.js"></script>
    </body>
</html>

