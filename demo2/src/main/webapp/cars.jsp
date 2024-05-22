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
                    <h2 class="text-center"><em>Xe đang bán</em></h2>
                    <p class="text-center">Chúng tôi tự hào là đơn vị dẫn đầu trong phân khúc xe lướt với các thương
                        hiệu như: Peugeot, Mazda, Hyundai, Kia, Toyota, Mercedes, ...</p>
                </div>
            </div>
        </div>
    </div>
</section>

<section class="section" id="trainers">
    <div class="container">
        <br>
        <br>
        <div class="contact-form">
            <form action="#" id="contact">
                <div class="row">
                    <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                        <div class="form-group">
                            <label>Dòng xe:</label>

                            <select>
                                <option value="">--All --</option>
                                <option value="">--All --</option>
                                <option value="">--All --</option>
                                <option value="">--All --</option>
                                <option value="">--All --</option>
                            </select>
                        </div>
                    </div>
                    <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                        <div class="form-group">
                            <label>Trạng thái xe:</label>

                            <select>
                                <option value="">Tất cả</option>
                                <option value="new">Xe mới</option>
                                <option value="used">Xe cũ</option>
                            </select>
                        </div>
                    </div>


                    <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                        <div class="form-group">
                            <label>Màu xe:</label>

                            <select>
                                <option value="">-- All --</option>
                                <option value="">WHITE</option>
                                <option value="">BLUE</option>
                                <option value="">YELLOW</option>
                                <option value="">GRAY</option>
                                <option value="">RED</option>
                                <option value="">BLACK</option>
                            </select>
                        </div>
                    </div>

                    <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                        <div class="form-group">
                            <label>Kiểu xe:</label>

                            <select>
                                <option value="">-- All --</option>
                                <option value="">Thể thao</option>
                                <option value="">Gia đình</option>
                                <option value="">Bán tải</option>
                            </select>
                        </div>
                    </div>

                    <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                        <div class="form-group">
                            <label>Giá xe:</label>

                            <select>
                                <option value="">-- All --</option>
                                <option value="">Dưới 1 tỉ</option>
                                <option value="">Từ 1-2 tỷ</option>
                                <option value="">Trên 3 tỷ</option>
                            </select>
                        </div>
                    </div>

                    <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                        <div class="form-group">
                            <label>Hộp số:</label>

                            <select>
                                <option value="">-- All --</option>
                                <option value="">Số tự động</option>
                                <option value="">Số sàn</option>
                            </select>
                        </div>
                    </div>

                    <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                        <div class="form-group">
                            <label>Nhiên liệu:</label>

                            <select>
                                <option value="">-- All --</option>
                                <option value="">Xăng</option>
                                <option value="">Dầu</option>
                            </select>
                        </div>
                    </div>

                    <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                        <div class="form-group">
                            <label>Chỗ ngồi:</label>

                            <select>
                                <option value="">-- All --</option>
                                <option value="">2</option>
                                <option value="">4</option>
                                <option value="">5</option>
                                <option value="">7</option>
                            </select>
                        </div>
                    </div>
                </div>

                <div class="col-sm-4 offset-sm-4">
                    <div class="main-button text-center">
                        <a href="#">Tìm kiếm</a>
                    </div>
                </div>
                <br>
                <br>
            </form>
        </div>

        <div class="row">
<%--            <p>${imgCars.stream().filter(p -> p.getCar().getId().equals(listCar.get(0).getId())).toList()}</p>--%>
            <c:forEach items="${listCar}" var="car">
                <div class="col-lg-4">
                    <div class="trainer-item">
                        <div class="image-thumb">
                                <%-- Filter ImgCar objects by car ID --%>
                            <c:set var="carImages" value="${imgCars.stream().filter(p -> p.getCar().getId().equals(car.getId())).toList()}" />

                             <c:if test="${not empty carImages}">
                                <%-- Display the first image for the current car --%>
                                <img style="height: 243px" src="${pageContext.request.contextPath}${carImages.get(0).getImgPath()}" alt="Car Image">
                            </c:if>
                        </div>
                        <div class="down-content">
                            <span>
                                    <fmt:setLocale value="vi_VN"/>
                                    <fmt:formatNumber value="${car.getPrice()}" type="currency"/>
                            </span>

                            <h4 style="height: 45px">${car.getNameCar()}</h4>

                            <p>
                                <i class="fa fa-dashboard"></i> ${car.getGearBox()} &nbsp;&nbsp;&nbsp;
                                <i class="fa fa-cube"></i> ${car.getFuelConsumption()} &nbsp;&nbsp;&nbsp;
                                <i class="fa fa-cog"></i> ${car.getOriginal()} &nbsp;&nbsp;&nbsp;
                            </p>

                            <ul class="social-icons">
                                <li><a onclick="showDetailCar('${car.getId()}')" style="cursor: pointer">+ Chi Tiết</a>
                                </li>
                            </ul>
                        </div>
                    </div>
                </div>
            </c:forEach>
        </div>

        <br>

        <nav>
            <ul class="pagination pagination-lg justify-content-center">
                <li class="page-item">
                    <a class="page-link" href="#" aria-label="Previous">
                        <span aria-hidden="true">&laquo;</span>
                        <span class="sr-only">Previous</span>
                    </a>
                </li>
                <li class="page-item"><a class="page-link" href="#">1</a></li>
                <li class="page-item"><a class="page-link" href="#">2</a></li>
                <li class="page-item"><a class="page-link" href="#">3</a></li>
                <li class="page-item">
                    <a class="page-link" href="#" aria-label="Next">
                        <span aria-hidden="true">&raquo;</span>
                        <span class="sr-only">Next</span>
                    </a>
                </li>
            </ul>
        </nav>

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

<!-- Global Init -->
<script src="${pageContext.request.contextPath}/assets/js/custom.js"></script>
<script type="text/javascript">
    function showDetailCar(id) {
        window.location = "detail-car?id=" + id;
    }
</script>
</body>
</html>
