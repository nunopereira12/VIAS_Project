<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!doctype html>
<html lang="en">
<%@include file="header.jsp"%>
<head>
    <title>Bem-vindo à VIAS</title>
    <link rel="stylesheet" href="/css/template.css">
    <link rel="stylesheet" href="/css/home.css">
    <link rel="stylesheet" href="/css/traveldetails.css">
    <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyDDHXeHO_gegeY8AJ_QRvjVv2D_KTQ82Bs"></script>

</head>
<body class="home-body" onload="initDirectionsService()">
<button class="arrowbutton" style="z-index: 1000" onclick="window.location.href='/home';">
    <img src="/images/backarrow.png" alt="Go back!" width="30px">
</button>
<div class="home-container">

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
            <div class="card">Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.
                Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. </div>
            <div class="detailed-card">
                <p>   Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.
                Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur.
                Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum. Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.
                    Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur.
                    Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.
                    Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur.
                    Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>
            </div>
            <div class="button-box-travel">
                <button class="button-travel" style="margin-left: 12px">Começar Viagem</button>
                <button class="button-travel">Cancelar</button>
                <button class="button-travel">Simular Viagem</button>
            </div>

        </div>
        <div class="footerlogo">
            <footer>
                <img class="footerimage" src="images/logo_nobg.png" alt="">
            </footer>
        </div>

    </div>
</div>


</body>
</html>