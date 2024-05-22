<%--
  Created by IntelliJ IDEA.
  User: ADMIN
  Date: 10/22/2023
  Time: 3:32 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="en">

<head>

  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta name="description" content="">
  <meta name="author" content="">
  <link href="https://fonts.googleapis.com/css?family=Poppins:100,100i,200,200i,300,300i,400,400i,500,500i,600,600i,700,700i,800,800i,900,900i&display=swap" rel="stylesheet">

  <title>${car.getNameCar()}</title>

  <link rel="stylesheet" type="text/css" href="assets/css/bootstrap.min.css">

  <link rel="stylesheet" type="text/css" href="assets/css/font-awesome.css">

  <link rel="stylesheet" href="assets/css/style.css">

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


<jsp:include page="common/header.jsp"></jsp:include>

<!-- ***** Call to Action Start ***** -->
<section class="section section-bg" id="call-to-action" style="background-image: url(assets/images/banner-image-1-1920x500.jpg)">
  <div class="container">
    <div class="row">
      <div class="col-lg-10 offset-lg-1">
        <div class="cta-content">
          <br>
          <br>
          <h2>${car.getNameCar()}</h2>
          <h3 style="color: wheat; font-weight: 600">
            <fmt:setLocale value = "vi_VN"/>
            <fmt:formatNumber value = "${car.getPrice()}" type = "currency"/>
          </h3>
        </div>
      </div>
    </div>
  </div>
</section>
<!-- ***** Call to Action End ***** -->

<!-- ***** Fleet Starts ***** -->
<section class="section" id="trainers">
  <div class="container">
    <br>
    <br>

    <div id="carouselExampleIndicators" class="carousel slide" data-ride="carousel">
      <ol class="carousel-indicators">
        <li data-target="#carouselExampleIndicators" data-slide-to="0" class="active"></li>
        <li data-target="#carouselExampleIndicators" data-slide-to="1"></li>
        <li data-target="#carouselExampleIndicators" data-slide-to="2"></li>
      </ol>
      <div class="carousel-inner" style="height: 400px">
        <c:forEach items="${imgCar}" var="img">
          <div class="carousel-item h-100 ${imgCar.get(0).getId().equals(img.getId()) ? "active" : ""}">
            <img class="d-block h-100 w-100" style="object-fit: scale-down" src="${img.getImgPath()}" alt="First slide">
          </div>
        </c:forEach>
      </div>
      <a class="carousel-control-prev" href="#carouselExampleIndicators" role="button" data-slide="prev">
        <span class="carousel-control-prev-icon" aria-hidden="true"></span>
        <span class="sr-only">Previous</span>
      </a>
      <a class="carousel-control-next" href="#carouselExampleIndicators" role="button" data-slide="next">
        <span class="carousel-control-next-icon" aria-hidden="true"></span>
        <span class="sr-only">Next</span>
      </a>
    </div>

    <br>
    <br>

    <div class="row" id="tabs">
      <div class="col-lg-4">
        <ul>
          <li><a href='#tabs-1'><i class="fa fa-cog"></i> Thông số kĩ thuật</a></li>
          <li><a href='#tabs-2'><i class="fa fa-info-circle"></i> Mô tả xe</a></li>
          <li><a href='#tabs-3'><i class="fa fa-plus-circle"></i> Tiện ích bổ sung</a></li>
          <li><a href='#tabs-4'><i class="fa fa-phone"></i> Liên hệ</a></li>
        </ul>
      </div>
      <div class="col-lg-8">
        <section class='tabs-content' style="width: 100%;">
          <article id='tabs-1'>
            <h4>Thông số kĩ thuật</h4>

            <div class="row">
              <div class="col-sm-6">
                <label>Trạng thái</label>

                <p>${car.getStatusCar().getNameStatus()}</p>
              </div>

              <div class="col-sm-6">
                <label>Xuất xứ</label>

                <p>${car.getOriginal()}</p>
              </div>

              <div class="col-sm-6">
                <label>Loại xe</label>

                <p>${car.getTypeCar().getNameType()}</p>
              </div>

              <div class="col-sm-6">
                <label>Ngày đăng</label>

                <p>${car.getPostDate()}</p>
              </div>

              <div class="col-sm-6">
                <label>Mileage</label>

                <p>5000 km</p>
              </div>

              <div class="col-sm-6">
                <label>Nghiên liệu</label>

                <p>${car.getFwd()}</p>
              </div>

              <div class="col-sm-6">
                <label>Hộp số</label>

                <p>${car.getGearBox()}</p>
              </div>

              <div class="col-sm-6">
                <label>Tiêu thụ nhiên liệu</label>

                <p>${car.getFuelConsumption()}</p>
              </div>


              <div class="col-sm-6">
                <label>Màu ngoại thất</label>

                <p>${car.getExteriorColor()}</p>
              </div>

              <div class="col-sm-6">
                <label>Màu nội thất</label>

                <p>${car.getInteriorColor()}</p>
              </div>

              <div class="col-sm-6">
                <label>Số cửa</label>

                <p>${car.getDoorAmount()}</p>
              </div>

              <div class="col-sm-6">
                <label>Số ghế ngồi</label>

                <p>${car.getSeatAmount()}</p>
              </div>
            </div>
          </article>
          <article id='tabs-2'>
            <h4>Mô tả xe</h4>
            <div class="col-sm-6">
              <label>Hãng xe</label>

              <p>${car.getCarCompany().getNameCompany()}</p>
            </div>
              <p>${car.getDescription()}</p>
            </article>
          <article id='tabs-3'>
            <h4>Tiện ích bổ sung cho xe</h4>

            <div class="row">
              <div class="col-sm-6">
                <p>ABS</p>
              </div>
              <div class="col-sm-6">
                <p>Ghế da</p>
              </div>
              <div class="col-sm-6">
                <p>Tay lái trợ lực</p>
              </div>
              <div class="col-sm-6">
                <p>Ghế sửa điện</p>
              </div>
              <div class="col-sm-6">
                <p>Công nghệ HU và AU</p>
              </div>
              <div class="col-sm-6">
                <p>Đèn pha Xenon</p>
              </div>
            </div>
          </article>
          <article id='tabs-4'>
            <h4>Liên hệ</h4>

            <div class="row">
              <div class="col-sm-6">
                <label>Chủ showroom</label>

                <p>Lê Văn Chính</p>
              </div>
              <div class="col-sm-6">
                <label>Điện Thoại</label>

                <p>0915-412-406 </p>
              </div>
              <div class="col-sm-6">
                <label>Email</label>
                <p>chinhlvde170423@fpt.edu.vn </p>
              </div>
              <div class="col-sm-6">
                <label>Địa chỉ</label>
                <p><a href="#">Ngũ Hành Sơn, Đà Nẵng</a></p>
              </div>
            </div>
          </article>
        </section>
      </div>
    </div>
  </div>
</section>
<!-- ***** Fleet Ends ***** -->

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
<script src="assets/js/jquery-2.1.0.min.js"></script>

<!-- Bootstrap -->
<script src="assets/js/popper.js"></script>
<script src="assets/js/bootstrap.min.js"></script>

<!-- Plugins -->
<script src="assets/js/scrollreveal.min.js"></script>
<script src="assets/js/waypoints.min.js"></script>
<script src="assets/js/jquery.counterup.min.js"></script>
<script src="assets/js/imgfix.min.js"></script>
<script src="assets/js/mixitup.js"></script>
<script src="assets/js/accordions.js"></script>

<!-- Global Init -->
<script src="assets/js/custom.js"></script>
<script>
  function convertMoney(x) {
    return x.toLocaleString('it-IT', {style : 'currency', currency : 'VND'});
  }
</script>
</body>
</html>