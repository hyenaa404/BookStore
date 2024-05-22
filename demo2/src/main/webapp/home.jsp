
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%--
  Created by IntelliJ IDEA.
  User: ADMIN
  Date: 10/22/2023
  Time: 3:31 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<html lang="en">

<head>

    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">

    <title>Trang Chủ</title>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/css/bootstrap.min.css"/>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/css/font-awesome.css"/>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/css/style.css"/>

</head>

<body>

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

<jsp:include page="./common/header.jsp"></jsp:include>
<jsp:include page="./common/slide-intro.jsp"></jsp:include>

<section class="section" id="trainers">
    <div class="container">
        <div class="row">
            <div class="col-lg-6 offset-lg-3">
                <div class="section-heading">
                    <h2>Xe <em>thịnh hành</em></h2>
                    <img src="${pageContext.request.contextPath}/assets/images/line-dec.png" alt=""/>
                    <p>Chúng tôi tự hào là đơn vị dẫn đầu trong phân khúc xe lướt với các thương hiệu như: Peugeot,
                        Mazda, Hyundai, Kia, Toyota, Mercedes, ...</p>
                </div>
            </div>
        </div>
        <div class="row">
            <c:forEach items="${listCar}" var="car" varStatus="loop">
                <c:if test="${loop.count <= 3}">
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
                </c:if>
            </c:forEach>
        </div>

        <br>

        <div class="main-button text-center">
            <a href="/cars">Danh sách xe</a>
        </div>
    </div>
</section>

<section class="section section-bg" id="schedule"
         style="background-image: url(assets/images/about-fullscreen-1-1920x700.jpg)">
    <div class="container">
        <div class="row">
            <div class="col-lg-6 offset-lg-3">
                <div class="section-heading dark-bg">
                    <h2><em>Giới thiệu</em></h2>
                    <img src="${pageContext.request.contextPath}/assets/images/line-dec.png" alt=""/>
                    <p>Chúng tôi tự hào là đơn vị dẫn đầu trong phân khúc xe lướt với các thương hiệu như: Peugeot,
                        Mazda, Hyundai, Kia, Toyota, Mercedes, ...</p>
                </div>
            </div>
        </div>
        <div class="row">
            <div class="col-lg-12">
                <div class="cta-content text-center">
                    <p>Với đội ngũ Tư vấn bán hàng chuyên nghiệp - có nhiều năm kinh nghiệm, Qúy khách hàng sẽ nhận được
                        sự chăm sóc rất chu đáo và tận tình 24/24. Họ sẽ giải đáp và hỗ trợ quý khách về kỹ thuật xe
                        cũng như các thủ tục tài chính, đăng ký, đăng kiểm,…</p>

                    <p>PRO 192 SHOWROOM - Đà Nẵng được đầu tư: hệ thống Showroom trưng bày xe mới đẹp và sang trọng
                        mang chức năng trưng bày kinh doanh các loại xe ô tô trên thế giới Việt Nam phân phối như:
                        Peugeot,
                        Mazda, Hyundai, Kia, Toyota, Mercedes, ... Chúng tôi đã bán
                        ra thị trường hàng trăm xe các loại với chính sách bán hàng ưu đãi, dịch vụ sau bán hàng cực tốt
                        đã để lại ấn tượng rất sâu sắc trong lòng các khách hàng. Chúng tôi rất tự hào khi luôn luôn là
                        đại lý thuộc hệ thống Đà Nẵng được đánh giá tốt nhất và rất uy tín nhất trong lòng người tiêu
                        dùng.</p>
                </div>
            </div>
        </div>
    </div>
</section>

<section class="section" id="our-classes">
    <div class="container">
        <div class="row">
            <div class="col-lg-6 offset-lg-3">
                <div class="section-heading">
                    <h2><em>Blog</em> của chúng tôi</h2>
                    <img src="${pageContext.request.contextPath}/assets/images/line-dec.png" alt=""/>
                    <p>Blog tổng hợp PRO 192 chia sẻ các thông tin cụ thể về sửa chữa, bảo dưỡng, chăm sóc xe ô
                        tô, xe hơi mới nhất, chuẩn nhất.</p>
                </div>
            </div>
        </div>
        <div class="row" id="tabs">
            <div class="col-lg-4">
                <ul>
                    <li><a href='#tabs-1'>Loạt SUV cỡ B cạnh tranh mạnh về giá tại Việt Nam</a></li>
                    <li><a href='#tabs-2'>Lời tiên tri của Toyota thành sự thật - người dùng 'chán ngấy' xe điện? Sự thật bất ngờ!</a>
                    </li>
                    <li><a href='#tabs-3'>Chiếc Toyota Land Cruiser này dành cho những ai thích xe đời cũ nhưng sợ ồn ào và tốn xăng</a></li>
                    <div class="main-rounded-button"><a href="blog.jsp">Read More</a></div>
                </ul>
            </div>
            <div class="col-lg-8">
                <section class='tabs-content'>
                    <article id='tabs-1'>
                        <img src="${pageContext.request.contextPath}/assets/images/blog-image-1-940x460.jpg" alt=""/>
                        <h4>Loạt SUV Cỡ B Cạnh Tranh Mạnh Về Giá Tại Việt Nam</h4>

                        <p><i class="fa fa-user"></i> John Doe &nbsp;|&nbsp; <i class="fa fa-calendar"></i> 27.07.2020
                            10:10 &nbsp;|&nbsp; <i class="fa fa-comments"></i> 15 comments</p>

                        <p>Phasellus convallis mauris sed elementum vulputate. Donec posuere leo sed dui eleifend
                            hendrerit. Sed suscipit suscipit erat, sed vehicula ligula. Aliquam ut sem fermentum sem
                            tincidunt lacinia gravida aliquam nunc. Morbi quis erat imperdiet, molestie nunc ut,
                            accumsan diam.</p>
                        <div class="main-button">
                            <a href="blog-details.jsp">Continue Reading</a>
                        </div>
                    </article>
                    <article id='tabs-2'>
                        <img src="${pageContext.request.contextPath}/assets/images/blog-image-2-940x460.jpg" alt=""/>
                        <h4>Lời Tiên Tri Của Toyota Thành Sự Thật - Người Dùng 'Chán Ngấy' Xe Điện? Sự Thật Bất Ngờ!</h4>
                        <p><i class="fa fa-user"></i> John Doe &nbsp;|&nbsp; <i class="fa fa-calendar"></i> 27.07.2020
                            10:10 &nbsp;|&nbsp; <i class="fa fa-comments"></i> 15 comments</p>
                        <p>Integer dapibus, est vel dapibus mattis, sem mauris luctus leo, ac pulvinar quam tortor a
                            velit. Praesent ultrices erat ante, in ultricies augue ultricies faucibus. Nam tellus nibh,
                            ullamcorper at mattis non, rhoncus sed massa. Cras quis pulvinar eros. Orci varius natoque
                            penatibus et magnis dis parturient montes, nascetur ridiculus mus.</p>
                        <div class="main-button">
                            <a href="blog-details.jsp">Continue Reading</a>
                        </div>
                    </article>
                    <article id='tabs-3'>
                        <img src="${pageContext.request.contextPath}/assets/images/blog-image-3-940x460.jpg" alt=""/>
                        <h4>Chiếc Toyota Land Cruiser Này Dành Cho Những Ai Thích Xe Đời Cũ Nhưng Sợ Ồn Ào Và Tốn Xăng.</h4>
                        <p><i class="fa fa-user"></i> John Doe &nbsp;|&nbsp; <i class="fa fa-calendar"></i> 27.07.2020
                            10:10 &nbsp;|&nbsp; <i class="fa fa-comments"></i> 15 comments</p>
                        <p>Fusce laoreet malesuada rhoncus. Donec ultricies diam tortor, id auctor neque posuere sit
                            amet. Aliquam pharetra, augue vel cursus porta, nisi tortor vulputate sapien, id scelerisque
                            felis magna id felis. Proin neque metus, pellentesque pharetra semper vel, accumsan a
                            neque.</p>
                    </article>
                </section>
            </div>
        </div>
    </div>
</section>
<jsp:include page="common/contact-frame.jsp"></jsp:include>

<section class="section" id="features">
    <div class="container">
        <div class="row">
            <div class="col-lg-6 offset-lg-3">
                <div class="section-heading">
                    <h2>Lời <em>cam kết</em></h2>
                    <img src="${pageContext.request.contextPath}/assets/images/line-dec.png" alt="waves"/>
                    <p>Khi khách hàng đến với PRO 192 showroom, chúng tôi luôn cam kết:</p>
                </div>
            </div>
            <div class="col-lg-6">
                <ul class="features-items">
                    <li class="feature-item">
                        <div class="left-icon">
                            <img src="${pageContext.request.contextPath}/assets/images/features-first-icon.png"
                                 alt="First One"/>
                        </div>
                        <div class="right-content">
                            <h4>Điều 1</h4>
                            <p><em>"Xe không đâm đụng, không ngập nước"</em></p>
                        </div>
                    </li>
                    <li class="feature-item">
                        <div class="left-icon">
                            <img src="${pageContext.request.contextPath}/assets/images/features-first-icon.png"
                                 alt="second one"/>
                        </div>
                        <div class="right-content">
                            <h4>Điều 2</h4>
                            <p><em>"Xe có giấy tờ nguồn gốc rõ ràng, hỗ trợ thủ sang tên, chuyển vùng, rút hồ sơ"</em>
                            </p>
                        </div>
                    </li>
                </ul>
            </div>
            <div class="col-lg-6">
                <ul class="features-items">
                    <li class="feature-item">
                        <div class="left-icon">
                            <img src="${pageContext.request.contextPath}/assets/images/features-first-icon.png"
                                 alt="fourth muscle"/>
                        </div>
                        <div class="right-content">
                            <h4>Điều 3</h4>
                            <p><em>"Thu nhận mọi ý kiến, làm hài lòng khách hàng nhất có thể"</em></p>
                        </div>
                    </li>
                    <li class="feature-item">
                        <div class="left-icon">
                            <img src="${pageContext.request.contextPath}/assets/images/features-first-icon.png"
                                 alt="training fifth"/>
                        </div>
                        <div class="right-content">
                            <h4>Điều 4</h4>
                            <p><em>"Khi có nhu cầu TRẢ GÓP, chúng tôi có sẵn giải pháp tài chính, với hơn 10 ngân hàng
                                hỗ trợ với lãi suất ưu đãi"</em></p>
                        </div>
                    </li>
                </ul>
            </div>
        </div>

        <br>
    </div>
</section>
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

<script src="${pageContext.request.contextPath}/assets/js/jquery-2.1.0.min.js"></script>

<script src="${pageContext.request.contextPath}/assets/js/popper.js"></script>
<script src="${pageContext.request.contextPath}/assets/js/bootstrap.min.js"></script>

<script src="${pageContext.request.contextPath}/assets/js/scrollreveal.min.js"></script>
<script src="${pageContext.request.contextPath}/assets/js/waypoints.min.js"></script>
<script src="${pageContext.request.contextPath}/assets/js/jquery.counterup.min.js"></script>
<script src="${pageContext.request.contextPath}/assets/js/imgfix.min.js"></script>
<script src="${pageContext.request.contextPath}/assets/js/mixitup.js"></script>
<script src="${pageContext.request.contextPath}/assets/js/accordions.js"></script>

<script src="${pageContext.request.contextPath}/assets/js/custom.js"></script>
<script type="text/javascript">
    function showDetailCar(id) {
        window.location = "detail-car?id=" + id;
    }
</script>
</body>
</html>
