<%-- 
    Document   : users-manage
    Created on : Jun 13, 2024, 2:27:41 AM
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
        <title>T-Read Users-Management</title>
    </head>
    <body>

        <%@ include file="/includes/header.jsp" %>

        <div>


            <div id ="order-history account" class ="center account">
                <h1>Users Information</h1>
                <table class ="list-table" border='1'>
                    <thead><tr><th>ID</th><th>Name</th><th>Phone</th><th>Email</th><th>User Name</th></tr></thead></br>
                    
                        <tr>
                            <td>1</td>
                            <td>John Doe</td>
                            <td>023827348</td>
                            <td>johndoe97@123</td>
                            <td>johndoe</td></tr>
                </table>
                </br>
                
                <button onclick="showDeleteOverlay()">Delete Account</button>
            </div>


            <div id="delete-overlay" class="overlay center">
                <div class="overlay-content">
                    <span class="close-btn" onclick="hideDeleteOverlay()">&times;</span></br>
                    <div class =" account">
                        <h1>Delete Account</h1>
                        <table class ="list-table" border='1'>
                            <thead><tr><th>ID</th><th>Name</th><th>User Name</th><th>Select</th></tr></thead></br>
                            <form name= 'update' action='update' method = 'post'>
                                <tr>
                                    <td>1</td>
                                    <td>John Doe</td>
                                    <td>johndoe</td>
                                    <td><input name="isDelete" type="checkbox" value =${user.getId()} ></td>
                        </table>
                        </br>
                        <tr><button type='submit'>Save</button></tr>
                        </form>
                    </div>

                    
                    <br/><br/>
                </div>
            </div>

        </div>

        <%@ include file="/includes/footer.jsp" %>

        <script src="js/Jquery.js"></script>
        <script src="js/bootstrap.min.js"></script>
    </body>
</html>


