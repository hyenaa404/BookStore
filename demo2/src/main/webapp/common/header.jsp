<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: ADMIN
  Date: 10/23/2023
  Time: 9:16 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<header class="header-area header-sticky">
    <div class="container">
        <div class="row">
            <div class="col-12">
                <nav class="main-nav">
                    <a href="/" class="logo">PRO 192<em> showroom</em></a>

                    <ul class="nav">
                        <li><a href="/" class="active">Tranh chủ</a></li>
                        <li><a href="/cars">Xe đang bán</a></li>
                        <c:choose>
                            <c:when test="${sessionScope.account != null}">
                                <li>
                                    <a href="/admin">Quản lý xe</a>
                                </li>
                            </c:when>
                            <c:otherwise>
                                <li class="dropdown">
                                    <a href="/about">Giới thiệu</a>
                                </li>
                                <li><a href="/contact">Liên hệ</a></li>
                            </c:otherwise>
                        </c:choose>
                        <c:choose>
                            <c:when test="${sessionScope.account != null}">
                                <li><a href="/logout">${sessionScope.account.getUsername()} (Log out)</a></li>
                            </c:when>
                            <c:otherwise>
                                <li><a href="/login">Admin</a></li>
                            </c:otherwise>
                        </c:choose>
                    </ul>
                    <a class='menu-trigger'>
                        <span>Menu</span>
                    </a>
                </nav>
            </div>
        </div>
    </div>
</header>
<!-- ***** Header Area End ***** -->
