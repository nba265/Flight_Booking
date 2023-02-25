<%--
  Created by IntelliJ IDEA.
  User: bbb26
  Date: 05/11/22
  Time: 1:12 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<html>
<head>
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <title>Flight - Travel and Tour</title>

    <meta name="description" content="">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/assets/css/bootstrap4.5/bootstrap.min.css"
          type="text/css">
    <link rel="stylesheet"
          href="${pageContext.request.contextPath}/resources/assets/css/bootstrap4.5/bootstrap-grid.min.css"
          type="text/css">

</head>
<body>
<nav class="navbar navbar-light bg-light" style="min-height: 60px; margin-bottom: 0; border: 0;
                                                background: linear-gradient(90deg, rgba(5,41,48,1) 19%, rgba(107,135,140,1) 42%, rgba(204,235,241,1) 73%);">
    <a class="navbar-brand" href="index">
        <img src="${pageContext.request.contextPath}/resources/assets/img/logo.png"
             alt="Flight Template" class="d-inline-block align-text-top"
             style="max-width: 70%; padding-left: 2rem;">
    </a>
    <div class="clearfix" style="margin-right: 30px">
        <sec:authorize access="isAuthenticated()">
            <sec:authorize access="hasRole('ROLE_USER')">
                <a type="button" class="btn btn-outline-warning btn-lg float-right" href="logout">Logout</a>
                <a class="btn btn-outline-primary btn-lg float-right mr-5" href="user/booking_history">Manage Account</a>
            </sec:authorize>
            <sec:authorize access="hasRole('ROLE_ADMIN')">
                <a type="button" class="btn btn-outline-warning btn-lg float-right" href="logout">Logout</a>
                <a class="btn btn-outline-primary btn-lg float-right mr-5" href="admin/home">Manager</a>
            </sec:authorize>
            <sec:authorize access="hasRole('ROLE_MANAGER')">
                <a type="button" class="btn btn-outline-warning btn-lg float-right" href="logout">Logout</a>
                <a class="btn btn-outline-primary btn-lg float-right mr-5" href="manager/home">Manager</a>
            </sec:authorize>
            <h2 class="float-right mr-5 text-center text-monospace text-black-50"><sec:authorize access="isAuthenticated()"><sec:authentication property="principal.username" /> </sec:authorize></h2>
        </sec:authorize>
        <sec:authorize access="!isAuthenticated()">
            <a type="button" class="btn btn-outline-warning btn-lg float-right" href="login">Login</a>
        </sec:authorize>
    </div>
</nav>
</body>
</html>
