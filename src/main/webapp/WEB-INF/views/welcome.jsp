<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <%@include file="header.jsp"%>
</head>
<head><title>Welcome back!</title>
    <link rel="stylesheet" href="/css/welcome.css"></head>

<body>
    <div class="welcome-page">
        <div class="welcome-container" >
            <%--<h1 class="welcome-heading" >Welcome Back, ${name}!</h1>--%>
            <img class = "welcome-image" src="/images/logo_bluenobg.png" alt="Your Image" style="width: 300px;" onclick="redirectToHomePage()">
            <div class="animation" onclick="redirectToHomePage()"></div>
        </div>
    </div>

<script src="/js/welcome.js"></script>

</body>
</html>