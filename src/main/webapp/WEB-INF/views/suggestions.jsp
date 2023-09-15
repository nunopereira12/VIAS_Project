<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!doctype html>
<html lang="en">
<%@include file="header.jsp"%>
<head>
    <title>Bem-vindo à VIAS</title>
    <link rel="stylesheet" href="/css/template.css">
    <link rel="stylesheet" href="/css/home.css">
    <link rel="stylesheet" href="/css/suggestions.css">
    <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyDDHXeHO_gegeY8AJ_QRvjVv2D_KTQ82Bs"></script>

</head>
<body class="home-body" onload="initDirectionsService()">
<div class="home-container">
    <button class="arrowbutton" style="z-index: 1000" onclick="window.location.href='/home';">
        <img src="/images/backarrow.png" alt="Go back!" width="30px">
    </button>
    <div class="mapbox">
        <iframe
                width=100%
                height=100%
                style="border:0"
                loading="lazy"
                allowfullscreen
                referrerpolicy="no-referrer-when-downgrade"
                src="https://www.google.com/maps/embed/v1/view?key=AIzaSyDDHXeHO_gegeY8AJ_QRvjVv2D_KTQ82Bs
    &center=38.77851493507939, -9.33226675574515
    &zoom=12">
        </iframe>
    </div>

    <div class="home-content" style="margin: -70px 0 0 0;">
        <div class="imageDesktop">
            <footer>
                <img class="imageTopLeft" src="images/logo_nobg.png" alt="">
            </footer>
        </div>
        <div class="button-box">
            <button class="button">Origem</button>
            <button class="button">Destino</button>
        </div>
        <div class="suggestions-box">
            <div class="card"></div>

        </div>

    </div>
</div>
<div class="footerlogo">
    <footer>
        <img class="footerimage" src="images/logo_nobg.png" alt="">
    </footer>
</div>


</body>
</html>