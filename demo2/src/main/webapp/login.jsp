<%--
  Created by IntelliJ IDEA.
  User: ADMIN
  Date: 10/22/2023
  Time: 3:31 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">

<head>

    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">

    <title>Car showroom</title>

    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/css/bootstrap.min.css">

    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/css/font-awesome.css">

    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/style.css">

</head>

<body>

<!-- ***** Preloader Start ***** -->
<div id="js-preloader" class="js-preloader">
    <div class="preloader-inner">
        <span class="dot"></span>
        <div class="dots">
            <span></span>
            <span></span>
            <span></span>
        </div>
    </div>
</div>
<jsp:include page="common/header.jsp"></jsp:include>

<!-- ***** Call to Action Start ***** -->
<section class="section section-bg" id="call-to-action"
         style="background-image: url(/assets/images/banner-image-1-1920x500.jpg)">
    <div class="container">
        <div class="row">
            <div class="col-lg-10 offset-lg-1">
                <div class="cta-content">
                    <br>
                    <br>
                    <h2 class="text-center"><em>LOGIN ADMIN</em></h2>
                    <p class="text-center">Tính năng này chỉ dành cho người quản lý trang web, chủ cửa hàng. Vui lòng
                        đăng nhập để tiếp tục.</p>
                </div>
            </div>
        </div>
    </div>
</section>
<div class="m-3">
    <form action="/login" method="post" class="d-flex flex-column align-items-center justify-content-start mt-5 mb-5">
        <input name="username" class="mt-4 input-login" required placeholder="Tên đăng nhập"/>
        <p style="color: red">${message != null ? message: ""}</p>
        <input name="password" type="password" class="mt-4 input-login" required placeholder="Mật khẩu"/>
        <button class="btn-login mt-4" type="submit">Đăng nhập</button>
    </form>
</div>
<footer>
    <div class="container">
        <div class="row">
            <div class="col-lg-12">
                <p>
                    Copyright © 2020 Company Name
                    - Template by: <a href="https://www.phpjabbers.com/">PHPJabbers.com</a>
                </p>
            </div>
        </div>
    </div>
</footer>

<!-- jQuery -->
<script src="${pageContext.request.contextPath}/assets/js/jquery-2.1.0.min.js"></script>

<!-- Bootstrap -->
<script src="${pageContext.request.contextPath}/assets/js/popper.js"></script>
<script src="${pageContext.request.contextPath}/assets/js/bootstrap.min.js"></script>

<!-- Plugins -->
<script src="${pageContext.request.contextPath}/assets/js/scrollreveal.min.js"></script>
<script src="${pageContext.request.contextPath}/assets/js/waypoints.min.js"></script>
<script src="${pageContext.request.contextPath}/assets/js/jquery.counterup.min.js"></script>
<script src="${pageContext.request.contextPath}/assets/js/imgfix.min.js"></script>
<script src="${pageContext.request.contextPath}/assets/js/mixitup.js"></script>
<script src="${pageContext.request.contextPath}/assets/js/accordions.js"></script>

<!-- Global Init -->
<script src="${pageContext.request.contextPath}/assets/js/custom.js"></script>

</body>
</html>
