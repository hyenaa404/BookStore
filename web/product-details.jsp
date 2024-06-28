
<%-- 
    Document   : product-details
    Created on : Jun 20, 2024, 8:28:01 AM
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

        <title>T-Read- Best Book store</title>
    </head>
    <body>

        <div >
            <div class = header >
                <div class=" heading "> <!--content header-->

                    <div id="col1" class="col-md-4          ">  
                        <div id="logo">
                            <img src="./img/logo.png" alt="T-Read" />
                        </div>
                    </div>

                    <div id="col2" class="col-md-4">
                        <!-- Actual search box -->
                        <form name= 'seach' action='search' method = 'post'>
                            <div class=" search-new ">
                                <div class="input">
                                    <input type="text" name ="search" placeholder="Search..."></div>
                            </div>


                        </form>
                    </div>
                    <div id="col3" class="col-md-4 mid-header">
                        <div class="header-icons">
                            <a href="./cart" class="cart-icon">
                                <img src="./img/cart.png" alt="Cart" />
                            </a>
                            <button class="btn login-btn" onclick="window.location.href = './${leftlink}'">${leftbtn}</button>
                            <button class="btn register-btn" onclick="window.location.href = './${rightlink}'">${rightbtn}</button>
                        </div>
                    </div>


                </div> <!--Kết thúc content header-->
                <nav class=" navi navbar navbar-expand-lg navbar-dark ">
                    <div class="container">
                        <!--<a class="navbar-brand" href="#">Home work</a>-->
                        <!--<img src="./img/logo.png" alt=""/>-->
                        <button class="navbar-toggler" id ="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNav"
                                aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
                            <span class="navbar-toggler-icon"></span>
                        </button>
                        <div class="collapse navbar-collapse" id="navbarNav">
                            <ul class="navbar-nav ml-auto">
                                <li class="nav-item active">
                                    <a class="nav-link" href="#">Home</a>
                                </li>
                                <li class="nav-item">
                                    <a class="nav-link" href="#">All Book</a>
                                </li>
                                <li class="nav-item">
                                    <a class="nav-link" href="#">Fiction </a>
                                </li>
                                <li class="nav-item">
                                    <a class="nav-link" href="#">Nonfiction</a>
                                </li>
                                <li class="nav-item">
                                    <a class="nav-link" href="#">Poetry </a>
                                </li>
                            </ul>
                        </div>
                    </div>
                </nav>

                <script>
                    document.getElementById('navbar-toggler').addEventListener('click', function () {
                        document.querySelector('.navi').classList.toggle('expanded');
                    });
                </script>
            </div>

            <div class ="details-container row">
                <div class = "book-img col-12 col-sm-5 col-md-5 col-lg-4" >
                    <img src="//bizweb.dktcdn.net/thumb/large/100/364/248/products/81whkzew5ml-sl1500.jpg?v=1715421259473" alt="Camry 2021" />

                </div>

                <div id ="details"class ="col-12 col-sm-7 col-md-7 col-lg-8">
                    <div class="product-details ">
                        <h1 class="title-product">Down and Out in Saigon : Stories of the Poor in a Colonial City</h1>
                        <div class="group-status">
                            <p><b>Author: </b><a href="#" title="Haydon Cherry">Haydon Cherry</a></p>
                            <p><b>Genre: </b><a href="#" title="Nonfiction">Nonfiction</a></p>
                        </div>
                        <h4 class = "price">
                            290.000 VND
                        </h4>
                        <div>
                            <div class = "quantity-label">Quantity</div>
                            <div class="number-input">
                                <button type="button"  onclick="decrement(this)">-</button>
                                <input type="number" id ="${book.getId()}" name ="quantity" class ="quantity" value="1" min="1" max="10"onchange="updateAmount(this)">
                                <button  type="button" onclick="increment(this)">+</button>
                            </div>
                        </div>
                        <div class ="add-cart-btn">
                            <h4 class="status">New / Hardback: 290.000 VND</h4>
                            <button id ="cart-btn">Add to cart</button>
                        </div>

                        <div class="rating " data-rating="3"></div>
                        <div class ="rating-border"></div>
                    </div>
                </div>



            </div> 
            <div class ="product-descript" >
                <div class ="product-tab">
                    <h4>DESCRIPTION</h4>
                </div>
                <div>
                    <p>The Coming of the French Revolution remains essential reading for anyone interested in the origins of this great turning point in the formation of the modern world. First published in 1939, on the eve of the Second World War, and suppressed by the Vichy government, this classic work explains what happened in France in 1789, the first year of the French Revolution. Georges Lefebvre wrote history "from below"--a Marxist approach. Here, he places the peasantry at the center of his analysis, emphasizing the class struggles in France and the significant role they played in the coming of the revolution. Eloquently translated by the historian R. R. Palmer and featuring an introduction by Timothy Tackett that provides a concise intellectual biography of Lefebvre and a critical appraisal of the book, this Princeton Classics edition continues to offer fresh insights into democracy, dictatorship, and insurrection. show more</p>
                </div>
            </div>
            <div class ="product-descript" >
                <div class ="product-tab">
                    <h4>REVIEW</h4>
                </div>
                
                <div class ="review-content">
                    <input type = "text" name = "review" placeholder="Enter content...">
                </div>
            </div>
        </div>

        <%@ include file="/includes/footer.jsp" %>

        <script src="js/Jquery.js"></script>
        <script src="js/bootstrap.min.js"></script>
    </body>
</html>


