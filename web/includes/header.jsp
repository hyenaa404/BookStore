<%-- 
    Document   : header
    Created on : May 21, 2024, 1:46:15 AM
    Author     : LENOVO
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<div class = header >
    <div class=" heading "> <!--content header-->

        <div id="col1" class="col-md-4          ">  
            <a href="${pageContext.request.contextPath}">
            <div id="logo">
                <img src="./img/logo.png" alt="T-Read" />
            </div>
                </a>
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
                        <a class="nav-link" href="${pageContext.request.contextPath}">Home</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="./all-book">All Book</a>
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



    <!-- Banner Section -->
    <section class=" banner jumbotron text-center">
        <h1>T-READ</h1>
        <p>Books to change our world.</p>
    </section>
    <script>
        document.getElementById('navbar-toggler').addEventListener('click', function () {
            document.querySelector('.navi').classList.toggle('expanded');
        });
    </script>
</div>
