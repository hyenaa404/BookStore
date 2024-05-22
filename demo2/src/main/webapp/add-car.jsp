<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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

    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">
    <link href="https://fonts.googleapis.com/css?family=Poppins:100,100i,200,200i,300,300i,400,400i,500,500i,600,600i,700,700i,800,800i,900,900i&display=swap"
          rel="stylesheet">

    <title>Thêm mới xe</title>

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
<div class="container mt-5">
    <h2 style="font-family: math; font-weight: 800; margin-top: 150px" class="text-center">Thêm mới xe tại đây</h2>
    <form class="mt-5" method="post" enctype="multipart/form-data">
        <div class="mb-3">
            <label class="form-label">Tên xe (<strong style="color: red">*</strong>)</label>
            <input type="text" name="nameCar" class="form-control" aria-describedby="emailHelp">
            <p style="color: red">${errors['nameCar']}</p>
        </div>
        <div class="mb-3">
            <label class="form-label">Xuất xứ</label>
            <input type="text" name="original" class="form-control" aria-describedby="emailHelp">

        </div>
        <div class="mb-3">
            <label class="form-label">Giá xe (<strong style="color: red">*</strong>)</label>
            <input type="number" name="price" class="form-control" aria-describedby="emailHelp">
            <p style="color: red">${errors['price']}</p>
        </div>
        <div class="mb-3">
            <label class="form-label">Trạng thái xe (<strong style="color: red">*</strong>)</label>
            <select class="form-select" name="statusCar">
                <c:forEach var="item" items="${statusCars}">
                    <option value="${item.getId()}">${item.getNameStatus()}</option>
                </c:forEach>
            </select>
        </div>
        <div class="mb-3">
            <label class="form-label">Màu ngoại thất (<strong style="color: red">*</strong>)</label>
            <input type="text" name="exteriorColor" class="form-control" aria-describedby="emailHelp">
            <p style="color: red">${errors['exteriorColor']}</p>
        </div>
        <div class="mb-3">
            <label class="form-label">Màu nội thất (<strong style="color: red">*</strong>)</label>
            <input type="text" name="interiorColor" class="form-control" aria-describedby="emailHelp">
            <p style="color: red">${errors['interiorColor']}</p>
        </div>
        <div class="mb-3">
            <label class="form-label">Số cửa (<strong style="color: red">*</strong>)</label>
            <input type="number" name="doorAmount" class="form-control" aria-describedby="emailHelp">
            <p style="color: red">${errors['doorAmount']}</p>
        </div>
        <div class="mb-3">
            <label class="form-label">Số ghế (<strong style="color: red">*</strong>)</label>
            <input type="number" name="seatAmount" class="form-control" aria-describedby="emailHelp">
            <p style="color: red">${errors['seatAmount']}</p>
        </div>
        <div class="mb-3">
            <label class="form-label">Hộp số</label>
            <input type="text" name="gearBox" class="form-control" aria-describedby="emailHelp">
        </div>
        <div class="mb-3">
            <label class="form-label">Dẫn động</label>
            <input type="text" name="fwd" class="form-control" aria-describedby="emailHelp">
        </div>
        <div class="mb-3">
            <label class="form-label">Tiêu thụ nhiên liệu</label>
            <input type="text" name="fuelConsumption" class="form-control" aria-describedby="emailHelp">
        </div>
        <div class="mb-3">
            <label class="form-label">Mô tả xe (<strong style="color: red">*</strong>)</label>
            <textarea type="text" name="description" class="form-control" aria-describedby="emailHelp"></textarea>
            <p style="color: red">${errors['description']}</p>
        </div>
        <div class="mb-3">
            <label class="form-label">Loại xe (<strong style="color: red">*</strong>)</label>
            <select class="form-select" name="typeCar">
                <c:forEach var="item" items="${typeCars}">
                    <option value="${item.getIdType()}">${item.getNameType()}</option>
                </c:forEach>
            </select>
        </div>
        <div class="mb-3">
            <label class="form-label">Công ty sản xuất (<strong style="color: red">*</strong>)</label>
            <select class="form-select" name="carCompany">
                <c:forEach var="item" items="${carCompanies}">
                    <option value="${item.getId()}">${item.getNameCompany()}</option>
                </c:forEach>
            </select>
        </div>
        <div class="mb-3">
            <label class="form-label">Ảnh mô tả xe (<strong style="color: red">*</strong>)</label>
                <input type="file" name="fileImg1" accept="image/*"/>
                <input type="file" name="fileImg2" accept="image/*"/>
                <input type="file" name="fileImg3" accept="image/*"/>
        </div>
        <p style="color: red">${errors['image']}</p>
        <button type="submit" class="btn btn-primary">Submit</button>
    </form>
</div>
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

</body>
</html>