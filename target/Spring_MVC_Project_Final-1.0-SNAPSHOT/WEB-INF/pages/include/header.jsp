<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags" %>
<%--
  Created by IntelliJ IDEA.
  User: speed
  Date: 03/28/22
  Time: 11:29 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<div class="page-header navbar navbar-fixed-top">
    <div class="page-header-inner ">
        <!-- logo start -->
        <div class="page-logo">
            <a href="${pageContext.request.contextPath}/index">
                <img alt="" src="${pageContext.request.contextPath}/resources/images/logo.png" width="40" height="40">
                <span class="logo-default" >Flight</span> </a>
        </div>
        <!-- logo end -->
        <ul class="nav navbar-nav navbar-left in">
            <li><a href="#" class="menu-toggler sidebar-toggler"><i class="icon-menu"></i></a></li>
        </ul>


        <!-- start mobile menu -->
        <a href="javascript:;" class="menu-toggler responsive-toggler" data-toggle="collapse" data-target=".navbar-collapse">
            <span></span>
        </a>
        <!-- end mobile menu -->
        <!-- start header menu -->
        <div class="top-menu">
            <ul class="nav navbar-nav pull-right">
                <!-- start notification dropdown -->
                <!-- end notification dropdown -->
                <!-- start message dropdown -->
                <!-- end message dropdown -->
                <!-- start manage user dropdown -->
                <li class="dropdown dropdown-user">
                    <a href="javascript:" class="dropdown-toggle" data-toggle="dropdown" data-hover="dropdown" data-close-others="true">
                        <img alt="" class="img-circle " src="${pageContext.request.contextPath}/resources-management/assets/img/dp.jpg" />
                        <span class="username username-hide-on-mobile"><security:authorize access="isAuthenticated()"><security:authentication property="principal.username" /> </security:authorize></span>
                        <i class="fa fa-angle-down"></i>
                    </a>
                    <ul class="dropdown-menu dropdown-menu-default animated jello">
                        <li>
                            <a href="profile">
                                <i class="icon-user"></i> Profile </a>
                        </li>
                        <security:authorize access="hasRole('ROLE_USER')">
                        <li>
                            <a href="booking_history">
                                <i class="icon-settings"></i> Manager Booking
                            </a>
                        </li>
                        </security:authorize>
                        <li>
                            <a href="<c:url value="/logout"/>" ><i class="icon-logout"></i> Log Out</a>
                        </li>
                    </ul>
                </li>
                <!-- end manage user dropdown -->

            </ul>
        </div>
    </div>
</div>
</body>
</html>
