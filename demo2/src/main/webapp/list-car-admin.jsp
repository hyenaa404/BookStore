<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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

    <title>Admin - Quản lý xe</title>

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

<section class="section" id="trainers" style="margin-top: 150px">
    <div class="d-flex justify-content-between align-items-center m-3">
        <div><a href="/admin?action=add-car" class="btn btn-dark text-decoration-none font-weight-bold"
                style="color: #ffffff">Thêm mới xe</a></div>
        <div>
            <form action="/admin?action=search" method="post" class="d-flex justify-content-center align-items-center">
                <input name="name" placeholder="Tìm kiếm theo tên" type="text" class="btn btn-outline-dark"/>
                <button class="btn btn-dark">Tìm kiếm</button>
            </form>
        </div>
    </div>
    <div>
        <table class="table">
            <thead class="table-dark">
            <tr>
                <th>STT</th>
                <th class="col-2">Ảnh xe</th>
                <td>Tên xe</td>
                <td>Ngày đăng</td>
                <td>Trạng thái</td>
                <td>Giá xe</td>
                <td>Loại xe</td>
                <td>Hãng xe</td>
                <td colspan="2" class="text-center">Cập nhật</td>
            </tr>
            </thead>
            <tbody>
            <c:choose>
                <c:when test="${listCar.size() == 0}">
                    <th colspan="10" class="text-center">Không thể tìm thấy.</th>
                </c:when>
                <c:otherwise>
                    <c:forEach items="${listCar}" var="car" varStatus="loop">
                        <tr>
                            <th>${loop.count}</th>
                            <th class="col-2"><c:set var="carImages"
                                                     value="${imgCars.stream().filter(p -> p.getCar().getId().equals(car.getId())).toList()}"/>

                                <c:if test="${not empty carImages}">
                                    <img style="height: 80px; width: 110px"
                                         src="${pageContext.request.contextPath}${carImages.get(0).getImgPath()}"
                                         alt="Car Image">
                                </c:if></th>
                            <td>${car.getNameCar()}</td>
                            <td>${car.getPostDate()}</td>
                            <td>${car.getStatusCar().getNameStatus()}</td>
                            <td><fmt:setLocale value="vi_VN"/>
                                <fmt:formatNumber value="${car.getPrice()}" type="currency"/></td>
                            <td>${car.getTypeCar().getNameType()}</td>
                            <td>${car.getCarCompany().getNameCompany()}</td>
                            <td>
                                <button class="btn btn-warning" onclick="getDetailUpdateCar('${car.getId()}')">Chỉnh
                                    sửa
                                </button>
                            </td>
                            <td>
                                <button class="btn btn-danger" type="button" data-bs-toggle="modal"
                                        data-bs-target="#exampleModal" onclick="handleShowCarDelete('${car.getId()}','${car.getNameCar()}')">Xóa
                                </button>
                            </td>
                        </tr>
                    </c:forEach>
                </c:otherwise>
            </c:choose>
            </tbody>
        </table>
    </div>
    <div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <h1 class="modal-title fs-5" id="exampleModalLabel">Xác nhận</h1>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body" id="confirm-content">
                    ...
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Đóng</button>
                    <button type="button" class="btn btn-primary" id="delete-btn">Xóa</button>
                </div>
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
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.min.js"
        integrity="sha384-BBtl+eGJRgqQAUMxJ7pMwbEyER4l1g+O15P+16Ep7Q9Q+zqX6gSbd85u4mG4QzX+"
        crossorigin="anonymous"></script>
<!-- Global Init -->
<script src="${pageContext.request.contextPath}/assets/js/custom.js"></script>
<script type="text/javascript">
    function showDetailCar(id) {
        window.location = "detail-car?id=" + id;
    }

    function getDetailUpdateCar(id) {
        window.location = "/admin?action=update-car&id=" + id;
    }
    function handleShowCarDelete(id, nameCar) {
        document.getElementById("confirm-content").innerHTML = "Bạn chắc chắn xóa <strong>" + nameCar + "</strong> ?";
        document.getElementById("delete-btn").addEventListener("click", () => {
            window.location = "/admin?action=delete-car&id=" + id;
        })
    }
</script>
</body>
</html>
