<%--
  Created by IntelliJ IDEA.
  User: ADMIN
  Date: 10/22/2023
  Time: 3:32 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="en">

<head>

    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">
    <link href="https://fonts.googleapis.com/css?family=Poppins:100,100i,200,200i,300,300i,400,400i,500,500i,600,600i,700,700i,800,800i,900,900i&display=swap" rel="stylesheet">

    <title>PHPJabbers.com | Free Car Dealer Website Template</title>

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
<!-- ***** Preloader End ***** -->


<!-- ***** Header Area Start ***** -->
<jsp:include page="common/header.jsp"></jsp:include>
<jsp:include page="common/slide-intro.jsp"></jsp:include>

<!-- ***** Features Item Start ***** -->
<section class="section" id="features">
    <div class="container">
        <div class="row text-center">
            <div class="col-lg-6 offset-lg-3">
                <div class="section-heading">
                    <h2>Thông tin <em> liên hệ</em></h2>
                    <img src="${pageContext.request.contextPath}/assets/images/line-dec.png" alt="waves">

                </div>
            </div>

            <div class="col-md-4">
                <div class="icon">
                    <i class="fa fa-phone"></i>
                </div>

                <h5><a href="#">+1 333 4040 5566</a></h5>

                <br>
            </div>

            <div class="col-md-4">
                <div class="icon">
                    <i class="fa fa-envelope"></i>
                </div>

                <h5><a href="#">pro192showroom@fpt.edu.vn</a></h5>

                <br>
            </div>

            <div class="col-md-4">
                <div class="icon">
                    <i class="fa fa-map-marker"></i>
                </div>

                <h5>Ngu Hanh Son, Da Nang</h5>

                <br>
            </div>
        </div>
    </div>
</section>
<!-- ***** Features Item End ***** -->

<!-- ***** Contact Us Area Starts ***** -->
<section class="section" id="contact-us" style="margin-top: 0">
    <div class="container-fluid">
        <div class="row">
            <div class="col-lg-6 col-md-6 col-xs-12">
                <div id="map">
                    <iframe src="https://maps.google.com/maps?q=Av.+L%C3%BAcio+Costa,+Rio+de+Janeiro+-+RJ,+Brazil&t=&z=13&ie=UTF8&iwloc=&output=embed" width="100%" height="600px" frameborder="0" style="border:0" allowfullscreen></iframe>
                </div>
            </div>
            <div class="col-lg-6 col-md-6 col-xs-12">
                <div class="contact-form section-bg" style="background-image: url(${pageContext.request.contextPath}/assets/images/contact-1-720x480.jpg)">
                    <form id="contact" action="" method="post">
                        <div class="row">
                            <div class="col-md-6 col-sm-12">
                                <fieldset>
                                    <input name="name" type="text" id="name" placeholder="Tên của bạn*" required="">
                                </fieldset>
                            </div>
                            <div class="col-md-6 col-sm-12">
                                <fieldset>
                                    <input name="email" type="text" id="email" pattern="[^ @]*@[^ @]*" placeholder="Email của bạn*" required="">
                                </fieldset>
                            </div>
                            <div class="col-md-12 col-sm-12">
                                <fieldset>
                                    <input name="subject" type="text" id="subject" placeholder="Tiêu đề">
                                </fieldset>
                            </div>
                            <div class="col-lg-12">
                                <fieldset>
                                    <textarea name="message" rows="6" id="message" placeholder="Nội dung" required=""></textarea>
                                </fieldset>
                            </div>
                            <div class="col-lg-12">
                                <fieldset>
                                    <button type="submit" id="form-submit" class="main-button">Gửi phản hồi</button>
                                </fieldset>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
</section>
<!-- ***** Contact Us Area Ends ***** -->

<!-- ***** Footer Start ***** -->
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
