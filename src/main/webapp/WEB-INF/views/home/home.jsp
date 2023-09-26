<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!doctype html>
<html lang="en">
<%@include file="../header.jsp" %>
<head>
    <title>Bem-vindo à VIAS</title>
    <link rel="stylesheet" href="/css/template.css">
    <link rel="stylesheet" href="/css/home.css">


</head>
<body class="home-body" onload="initAutocomplete()">

<nav class="navbar bg-body-tertiary fixed-top " style="padding: 0">
    <div class="container-fluid">
        <button class="navbar-toggler arrowbutton menubutton" type="button" data-bs-toggle="offcanvas"
                data-bs-target="#offcanvasNavbar" data-bs-placement="start" aria-controls="offcanvasNavbar" aria-label="Toggle navigation"
                style="margin: 55px 0 0 0px;">
            <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none">
                <path d="M20 3.5H4V6.5H20V3.5Z" fill="black"/>
                <path fill-rule="evenodd" clip-rule="evenodd"
                      d="M3.25 3.5C3.25 3.08579 3.58579 2.75 4 2.75H20C20.4142 2.75 20.75 3.08579 20.75 3.5V6.5C20.75 6.91421 20.4142 7.25 20 7.25H4C3.58579 7.25 3.25 6.91421 3.25 6.5V3.5ZM4.75 4.25V5.75H19.25V4.25H4.75Z"
                      fill="black"/>
                <path d="M20 10.5H4V13.5H20V10.5Z" fill="black"/>
                <path fill-rule="evenodd" clip-rule="evenodd"
                      d="M3.25 10.5C3.25 10.0858 3.58579 9.75 4 9.75H20C20.4142 9.75 20.75 10.0858 20.75 10.5V13.5C20.75 13.9142 20.4142 14.25 20 14.25H4C3.58579 14.25 3.25 13.9142 3.25 13.5V10.5ZM4.75 11.25V12.75H19.25V11.25H4.75Z"
                      fill="black"/>
                <path d="M20 17.5H4V20.5H20V17.5Z" fill="black"/>
                <path fill-rule="evenodd" clip-rule="evenodd"
                      d="M3.25 17.5C3.25 17.0858 3.58579 16.75 4 16.75H20C20.4142 16.75 20.75 17.0858 20.75 17.5V20.5C20.75 20.9142 20.4142 21.25 20 21.25H4C3.58579 21.25 3.25 20.9142 3.25 20.5V17.5ZM4.75 18.25V19.75H19.25V18.25H4.75Z"
                      fill="black"/>
            </svg>
        </button>
        <div class="offcanvas offcanvas-start" tabindex="-1" id="offcanvasNavbar" aria-labelledby="offcanvasNavbarLabel">
            <button class="btn-close arrowbutton menubutton" data-bs-dismiss="offcanvas" aria-label="Close"
                    style="margin: 15px 0 0 15px"></button>
            <div class="offcanvas-header" style="text-align: center; justify-content: center; border-bottom: 2px solid #D9D9D9; padding-top: 7px; padding-bottom:7px">
                <c:choose>
                    <c:when test="${user.getRole() eq 'USER' || user.getRole() eq 'PICA' }">
                        <a>
                            <button onclick="window.location.href='/profile'" class="nav-perfil-button" style="background-image: url('<c:choose><c:when test='${user.getProfile_picture() == null}'>images/map1.png
                                </c:when><c:otherwise>uploads/${user.getProfile_picture()}</c:otherwise></c:choose>'); background-size: cover; border-radius:50%; width:80px; height:80px">

                            </button>
                            <span onclick="window.location.href='/profile'"><h5
                                    style="margin-top:10px">${user.getFirst_name()} ${user.getLast_name()}</h5></span>
                        </a>
                    </c:when>
                    <c:when test="${user == null}">
                        <a href="/login">
                            <button class="nav-perfil-button">
                                <svg xmlns="http://www.w3.org/2000/svg" width="60" height="60" viewBox="0 0 60 60"
                                     fill="none">
                                    <mask id="mask0_329_666" style="mask-type:alpha" maskUnits="userSpaceOnUse" x="0"
                                          y="0" width="60" height="60">
                                        <rect width="60" height="60" fill="#FFFFFF"/>
                                    </mask>
                                    <g mask="url(#mask0_329_666)">
                                        <path d="M14.6249 42.7499C16.7499 41.1249 19.1249 39.8436 21.7499 38.9061C24.3749 37.9686 27.1249 37.4999 29.9999 37.4999C32.8749 37.4999 35.6249 37.9686 38.2499 38.9061C40.8749 39.8436 43.2499 41.1249 45.3749 42.7499C46.8332 41.0415 47.9686 39.104 48.7811 36.9374C49.5936 34.7707 49.9999 32.4582 49.9999 29.9999C49.9999 24.4582 48.052 19.7395 44.1561 15.8436C40.2603 11.9478 35.5415 9.99988 29.9999 9.99988C24.4582 9.99988 19.7395 11.9478 15.8436 15.8436C11.9478 19.7395 9.99988 24.4582 9.99988 29.9999C9.99988 32.4582 10.4061 34.7707 11.2186 36.9374C12.0311 39.104 13.1665 41.0415 14.6249 42.7499ZM29.9999 32.4999C27.5415 32.4999 25.4686 31.6561 23.7811 29.9686C22.0936 28.2811 21.2499 26.2082 21.2499 23.7499C21.2499 21.2915 22.0936 19.2186 23.7811 17.5311C25.4686 15.8436 27.5415 14.9999 29.9999 14.9999C32.4582 14.9999 34.5311 15.8436 36.2186 17.5311C37.9061 19.2186 38.7499 21.2915 38.7499 23.7499C38.7499 26.2082 37.9061 28.2811 36.2186 29.9686C34.5311 31.6561 32.4582 32.4999 29.9999 32.4999ZM29.9999 54.9999C26.5415 54.9999 23.2915 54.3436 20.2499 53.0311C17.2082 51.7186 14.5624 49.9374 12.3124 47.6874C10.0624 45.4374 8.28113 42.7915 6.96863 39.7499C5.65613 36.7082 4.99988 33.4582 4.99988 29.9999C4.99988 26.5415 5.65613 23.2915 6.96863 20.2499C8.28113 17.2082 10.0624 14.5624 12.3124 12.3124C14.5624 10.0624 17.2082 8.28113 20.2499 6.96863C23.2915 5.65613 26.5415 4.99988 29.9999 4.99988C33.4582 4.99988 36.7082 5.65613 39.7499 6.96863C42.7915 8.28113 45.4374 10.0624 47.6874 12.3124C49.9374 14.5624 51.7186 17.2082 53.0311 20.2499C54.3436 23.2915 54.9999 26.5415 54.9999 29.9999C54.9999 33.4582 54.3436 36.7082 53.0311 39.7499C51.7186 42.7915 49.9374 45.4374 47.6874 47.6874C45.4374 49.9374 42.7915 51.7186 39.7499 53.0311C36.7082 54.3436 33.4582 54.9999 29.9999 54.9999ZM29.9999 49.9999C32.2082 49.9999 34.2915 49.677 36.2499 49.0311C38.2082 48.3853 39.9999 47.4582 41.6249 46.2499C39.9999 45.0415 38.2082 44.1145 36.2499 43.4686C34.2915 42.8228 32.2082 42.4999 29.9999 42.4999C27.7915 42.4999 25.7082 42.8228 23.7499 43.4686C21.7915 44.1145 19.9999 45.0415 18.3749 46.2499C19.9999 47.4582 21.7915 48.3853 23.7499 49.0311C25.7082 49.677 27.7915 49.9999 29.9999 49.9999ZM29.9999 27.4999C31.0832 27.4999 31.979 27.1457 32.6874 26.4374C33.3957 25.729 33.7499 24.8332 33.7499 23.7499C33.7499 22.6665 33.3957 21.7707 32.6874 21.0624C31.979 20.354 31.0832 19.9999 29.9999 19.9999C28.9165 19.9999 28.0207 20.354 27.3124 21.0624C26.604 21.7707 26.2499 22.6665 26.2499 23.7499C26.2499 24.8332 26.604 25.729 27.3124 26.4374C28.0207 27.1457 28.9165 27.4999 29.9999 27.4999Z"
                                              fill="#4D4C4C"/>
                                    </g>
                                </svg>
                                <span> <h5 style="margin-top:10px">Entrar na sua conta </h5></span></button>
                        </a>
                    </c:when>
                </c:choose>
            </div>
            <div class="offcanvas-body">
                <ul class="navbar-nav justify-content-end flex-grow-1 pe-3">
                    <li class="nav-item nav-option-big">
                        <a class="nav-link" href="/schedules">Horários</a>
                    </li>
                    <li class="nav-item nav-option-big">
                        <a class="nav-link" href="/diagrams">Linhas</a>
                    </li>
                    <c:choose>
                        <c:when test="${user == null}">
                            <div style="text-align: center">
                                <li class="nav-item-small" style="margin-top: 200px">
                                    <a class="nav-link" href="/settings">Definições</a>
                                </li>
                                <li class="nav-item-small">
                                    <a class="nav-link" href="/contacts">Contactos</a>
                                </li>
                                <li class="nav-item-small">
                                    <a class="nav-link" href="/help">Ajuda</a>
                                </li>
                            </div>
                        </c:when>
                        <c:when test="${user.getRole() eq 'PICA'}">
                            <li class="nav-item nav-option-big">
                                <a class="nav-link" href="/logout">Terminar sessão</a>
                            </li>
                            <li class="nav-item nav-option-big" style="visibility: hidden">
                                <a class="nav-link" href="/wallet">Carteira</a>
                            </li>
                            <li class="nav-item nav-option-big" style="visibility: hidden">
                                <a class="nav-link" href="/history">Histórico</a>
                            </li>
                            <li class="nav-item nav-option-big" style="visibility: hidden">
                                <a class="nav-link" href="/vias_league">Vias League</a>

                            </li>
                            <div style="text-align: center">
                                <li class="nav-item-small" style="margin-top: 25px">
                                    <a class="nav-link" href="/settings">Definições</a>
                                </li>
                                <li class="nav-item-small">
                                    <a class="nav-link" href="/contacts">Contactos</a>
                                </li>
                                <li class="nav-item-small">
                                    <a class="nav-link" href="/help">Ajuda</a>
                                </li>
                            </div>
                        </c:when>
                        <c:when test="${user.getRole() eq 'USER' }">
                            <li class="nav-item nav-option-big">
                                <a class="nav-link" href="/wallet">Carteira</a>
                            </li>
                            <li class="nav-item nav-option-big">
                                <a class="nav-link" href="/history">Histórico</a>
                            </li>
                            <li class="nav-item nav-option-big">
                                <a class="nav-link" href="/vias_league">Vias League</a>
                            </li>
                            <li class="nav-item nav-option-big">
                                <a class="nav-link" href="/logout">Terminar sessão</a>

                            </li>
                            <div style="text-align: center">
                                <li class="nav-item-small" style="margin-top: 25px">
                                    <a class="nav-link" href="/settings">Definições</a>
                                </li>
                                <li class="nav-item-small">
                                    <a class="nav-link" href="/contacts">Contactos</a>
                                </li>
                                <li class="nav-item-small">
                                    <a class="nav-link" href="/help">Ajuda</a>
                                </li>
                            </div>
                        </c:when>
                    </c:choose>

                </ul>
                <div class="footerlogo" style="margin:23px 0 0 0">
                    <footer>
                        <img class="footerimage" width="30%" src="images/logo_whitebg.png" alt="">
                    </footer>
                </div>
            </div>
        </div>
    </div>
</nav>

<div class="home-container">
    <div class="mapbox">
        <div id="map" ></div>
    </div>

    <div class="home-content">
        <div class="imageDesktop">
            <footer>
                <img class="imageTopLeft" src="/images/logo_nobg.png" alt="">
            </footer>
        </div>

        <c:choose>
        <c:when test="${user == null || user.getRole() eq 'USER'}">
        <form id="directionsForm" method="POST" action="/perform_travel">
        <div class="search-box">
            <div class="home-title">
                <h3>Para onde vai?</h3>
            </div>
            <div>
                    <div class="search-bar" style="border-bottom: 2px solid #D9D9D9 ">
                        <input style="border: none" type="text" name="origem" id="origem1" onfocus=selectText(this) placeholder="A sua origem" required>
                        <button class="form-button">
                            <svg xmlns="http://www.w3.org/2000/svg" width="25" height="25" viewBox="0 0 40 41"
                                 fill="none">
                                <mask id="mask0_15_302" style="mask-type:alpha" maskUnits="userSpaceOnUse" x="0"
                                      y="0"
                                      width="40" height="41">
                                    <path d="M0 0.5H40V40.5H0V0.5Z" fill="#FFFFFF"/>
                                </mask>
                                <g mask="url(#mask0_15_302)">
                                    <path d="M21.7083 37.0834V34.3056C22.9306 34.1389 24.1181 33.8149 25.2708 33.3334C26.4236 32.8519 27.5046 32.2223 28.5139 31.4445L30.4583 33.4722C29.1713 34.5185 27.7963 35.3403 26.3333 35.9375C24.8704 36.5347 23.3287 36.9167 21.7083 37.0834ZM32.9305 30.9445L30.9583 29.0278C31.6991 28.0556 32.3102 27.0023 32.7917 25.8681C33.2732 24.7338 33.6065 23.5185 33.7917 22.2222H36.625C36.4028 23.9074 35.9792 25.4838 35.3542 26.9514C34.7292 28.419 33.9213 29.75 32.9305 30.9445ZM33.7917 18.7778C33.6065 17.4723 33.2732 16.257 32.7917 15.132C32.3102 14.007 31.6991 12.9537 30.9583 11.9722L32.9305 10.0556C33.9861 11.3889 34.8079 12.7593 35.3958 14.1667C35.9838 15.5741 36.3935 17.1111 36.625 18.7778H33.7917ZM18.2361 37.0834C13.9861 36.6019 10.4468 34.7871 7.61804 31.6389C4.78935 28.4908 3.375 24.7778 3.375 20.5C3.375 16.213 4.78935 12.4954 7.61804 9.34723C10.4468 6.19909 13.9861 4.38891 18.2361 3.91669V6.69444C14.7546 7.16666 11.8704 8.70833 9.58333 11.3194C7.29628 13.9306 6.15275 16.9908 6.15275 20.5C6.15275 24.0093 7.29628 27.0671 9.58333 29.6736C11.8704 32.2801 14.7546 33.8241 18.2361 34.3056V37.0834ZM28.5695 9.55556C27.5139 8.80556 26.4074 8.18983 25.25 7.70835C24.0926 7.22685 22.9305 6.88888 21.7639 6.69444V3.91669C23.3102 4.11113 24.8241 4.50696 26.3055 5.10419C27.787 5.70141 29.1713 6.50928 30.4583 7.52781L28.5695 9.55556ZM20 29.1389C18.3519 27.7408 16.7963 26.2361 15.3333 24.625C13.8704 23.0139 13.1389 21.1389 13.1389 19C13.1389 17.0556 13.8032 15.3935 15.132 14.0139C16.4607 12.6343 18.0833 11.9445 20 11.9445C21.9167 11.9445 23.5393 12.6343 24.868 14.0139C26.1968 15.3935 26.8611 17.0556 26.8611 19C26.8611 21.1389 26.1296 23.0139 24.6667 24.625C23.2037 26.2361 21.6481 27.7408 20 29.1389ZM20 20.5556C20.5185 20.5556 20.956 20.3773 21.3125 20.0209C21.669 19.6644 21.8472 19.2269 21.8472 18.7084C21.8472 18.2361 21.669 17.8102 21.3125 17.4306C20.956 17.051 20.5185 16.8611 20 16.8611C19.4815 16.8611 19.044 17.051 18.6875 17.4306C18.331 17.8102 18.1528 18.2361 18.1528 18.7084C18.1528 19.2269 18.331 19.6644 18.6875 20.0209C19.044 20.3773 19.4815 20.5556 20 20.5556Z"
                                          fill="#4D4C4C"/>
                                </g>
                            </svg>
                        </button>
                    </div>
                    <div class="search-bar">
                        <input style="border: none" type="text" name="destino" id="destino1" onfocus=selectText(this)
                               placeholder="O seu destino"
                               required>
                        <button type="submit" class="form-button">
                            <svg xmlns="http://www.w3.org/2000/svg" width="25" height="25" fill="none">
                                <mask id="mask0_15_307" style="mask-type:alpha" maskUnits="userSpaceOnUse" x="0"
                                      y="0">
                                    <path d="M0 0.5H30V30.5H0V0.5Z" fill="#FFFFFF"/>
                                </mask>
                                <g mask="url(#mask0_15_307)">
                                    <path d="M24.75 26.7292L16.6458 18.625C16.0208 19.1528 15.2954 19.566 14.4696 19.8646C13.6438 20.1632 12.765 20.3125 11.8333 20.3125C9.57416 20.3125 7.66214 19.5295 6.09728 17.9636C4.53243 16.3976 3.75 14.5 3.75 12.2709C3.75 10.0417 4.53299 8.14413 6.09897 6.57816C7.66493 5.01218 9.56597 4.22919 11.8021 4.22919C14.0382 4.22919 15.9358 5.01218 17.4948 6.57816C19.0538 8.14413 19.8333 10.0428 19.8333 12.274C19.8333 13.1747 19.6875 14.0382 19.3958 14.8646C19.1042 15.691 18.6806 16.4514 18.125 17.1459L26.25 25.2292L24.75 26.7292ZM11.8125 18.2292C13.4618 18.2292 14.8637 17.6476 16.0182 16.4844C17.1727 15.3212 17.75 13.9167 17.75 12.2709C17.75 10.625 17.1727 9.2205 16.0182 8.05731C14.8637 6.89412 13.4618 6.31253 11.8125 6.31253C10.1516 6.31253 8.73987 6.89412 7.57725 8.05731C6.41463 9.2205 5.83331 10.625 5.83331 12.2709C5.83331 13.9167 6.41463 15.3212 7.57725 16.4844C8.73987 17.6476 10.1516 18.2292 11.8125 18.2292Z"
                                          fill="#4D4C4C"/>
                                </g>
                            </svg>
                        </button>
                    </div>
            </div>
        </div>

            <div class="dropdown" >
                <button class="btn btn-secondary dropdown-toggle" type="button" data-bs-toggle="dropdown" aria-expanded="false" id="dropdown" style="width: 250px">
                    <span>Horário da viagem</span>
                </button>
                <ul class="dropdown-menu" >
                    <input type="hidden" name="depart" value=true id="depart">
                    <li><a class="dropdown-item" href="#departure" id="departureLink">Partida às</a></li>
                    <li><a class="dropdown-item" href="#arrival" id="arrivalLink">Chegada às</a></li>
                </ul>
            </div>
       <div class="date-hour-box">
           <div class="date-hour-input" id="divDeparture">
            <input class="time-input hidden" type="datetime-local" id="departure" name="date">
           </div>
       <div class="date-hour-input" id="divArrival">
           <input class="time-input hidden" type="datetime-local" id="arrival" name="date">
       </div>
       </div>
        </form>



        <c:if test="${user != null}">

            <button class="wallet-button" onclick="window.location.href='/wallet';">
                <svg xmlns="http://www.w3.org/2000/svg" width="25" height="25" viewBox="0 0 34 28" fill="none"
                     style="margin-top: 10px">
                    <path d="M17 22.25C17.3797 22.25 17.7061 22.1134 17.9792 21.8403C18.2523 21.5671 18.3889 21.2407 18.3889 20.8611C18.3889 20.4815 18.2523 20.1551 17.9792 19.8819C17.7061 19.6088 17.3797 19.4722 17 19.4722C16.6204 19.4722 16.294 19.6088 16.0209 19.8819C15.7477 20.1551 15.6112 20.4815 15.6112 20.8611C15.6112 21.2407 15.7477 21.5671 16.0209 21.8403C16.294 22.1134 16.6204 22.25 17 22.25ZM17 15.3889C17.3797 15.3889 17.7061 15.2523 17.9792 14.9792C18.2523 14.706 18.3889 14.3796 18.3889 14C18.3889 13.6204 18.2523 13.294 17.9792 13.0208C17.7061 12.7477 17.3797 12.6111 17 12.6111C16.6204 12.6111 16.294 12.7477 16.0209 13.0208C15.7477 13.294 15.6112 13.6204 15.6112 14C15.6112 14.3796 15.7477 14.706 16.0209 14.9792C16.294 15.2523 16.6204 15.3889 17 15.3889ZM17 8.52774C17.3797 8.52774 17.7061 8.39117 17.9792 8.11803C18.2523 7.84489 18.3889 7.5185 18.3889 7.13887C18.3889 6.75925 18.2523 6.43287 17.9792 6.1597C17.7061 5.88656 17.3797 5.74999 17 5.74999C16.6204 5.74999 16.294 5.88656 16.0209 6.1597C15.7477 6.43287 15.6112 6.75925 15.6112 7.13887C15.6112 7.5185 15.7477 7.84489 16.0209 8.11803C16.294 8.39117 16.6204 8.52774 17 8.52774ZM30.889 27.3333H3.11112C2.34724 27.3333 1.6933 27.0613 1.14933 26.5174C0.60536 25.9734 0.333374 25.3195 0.333374 24.5556V18.0834C1.32412 17.9352 2.15514 17.4792 2.82642 16.7153C3.49772 15.9514 3.83337 15.0463 3.83337 14C3.83337 12.9537 3.49772 12.044 2.82642 11.2708C2.15514 10.4977 1.32412 10.0463 0.333374 9.91662V3.44441C0.333374 2.68052 0.60536 2.02659 1.14933 1.48262C1.6933 0.938643 2.34724 0.666656 3.11112 0.666656H30.889C31.6528 0.666656 32.3068 0.938643 32.8508 1.48262C33.3947 2.02659 33.6667 2.68052 33.6667 3.44441V9.91662C32.676 10.0463 31.8449 10.4977 31.1737 11.2708C30.5024 12.044 30.1667 12.9537 30.1667 14C30.1667 15.0463 30.5024 15.9514 31.1737 16.7153C31.8449 17.4792 32.676 17.9352 33.6667 18.0834V24.5556C33.6667 25.3195 33.3947 25.9734 32.8508 26.5174C32.3068 27.0613 31.6528 27.3333 30.889 27.3333ZM30.889 24.5556V20.1111C29.8427 19.4259 28.9977 18.5532 28.3542 17.493C27.7107 16.4329 27.389 15.2685 27.389 14C27.389 12.7315 27.7107 11.5671 28.3542 10.5069C28.9977 9.44675 29.8427 8.57406 30.889 7.88887V3.44441H3.11112V7.88887C4.17596 8.57406 5.0255 9.44675 5.65975 10.5069C6.294 11.5671 6.61112 12.7315 6.61112 14C6.61112 15.2685 6.294 16.4329 5.65975 17.493C5.0255 18.5532 4.17596 19.4259 3.11112 20.1111V24.5556H30.889Z"
                          fill="white"/>
                </svg>
                <span style="margin-bottom:10px">Bilhete Digital</span></button>
        </c:if>

    </div>
    <div class="footerlogo">
        <footer>
            <img class="footerimage" src="/images/logo_nobg.png" alt="">
        </footer>
    </div>
</div>

</c:when>
<c:when test="${user.getRole() eq 'PICA'}">

        <button class="wallet-button" onclick="window.location.href='/validate';" style="margin-top:60px">
            <svg xmlns="http://www.w3.org/2000/svg" width="25" height="25" viewBox="0 0 34 28" fill="none"
                 style="margin-top: 10px">
                <path d="M17 22.25C17.3797 22.25 17.7061 22.1134 17.9792 21.8403C18.2523 21.5671 18.3889 21.2407 18.3889 20.8611C18.3889 20.4815 18.2523 20.1551 17.9792 19.8819C17.7061 19.6088 17.3797 19.4722 17 19.4722C16.6204 19.4722 16.294 19.6088 16.0209 19.8819C15.7477 20.1551 15.6112 20.4815 15.6112 20.8611C15.6112 21.2407 15.7477 21.5671 16.0209 21.8403C16.294 22.1134 16.6204 22.25 17 22.25ZM17 15.3889C17.3797 15.3889 17.7061 15.2523 17.9792 14.9792C18.2523 14.706 18.3889 14.3796 18.3889 14C18.3889 13.6204 18.2523 13.294 17.9792 13.0208C17.7061 12.7477 17.3797 12.6111 17 12.6111C16.6204 12.6111 16.294 12.7477 16.0209 13.0208C15.7477 13.294 15.6112 13.6204 15.6112 14C15.6112 14.3796 15.7477 14.706 16.0209 14.9792C16.294 15.2523 16.6204 15.3889 17 15.3889ZM17 8.52774C17.3797 8.52774 17.7061 8.39117 17.9792 8.11803C18.2523 7.84489 18.3889 7.5185 18.3889 7.13887C18.3889 6.75925 18.2523 6.43287 17.9792 6.1597C17.7061 5.88656 17.3797 5.74999 17 5.74999C16.6204 5.74999 16.294 5.88656 16.0209 6.1597C15.7477 6.43287 15.6112 6.75925 15.6112 7.13887C15.6112 7.5185 15.7477 7.84489 16.0209 8.11803C16.294 8.39117 16.6204 8.52774 17 8.52774ZM30.889 27.3333H3.11112C2.34724 27.3333 1.6933 27.0613 1.14933 26.5174C0.60536 25.9734 0.333374 25.3195 0.333374 24.5556V18.0834C1.32412 17.9352 2.15514 17.4792 2.82642 16.7153C3.49772 15.9514 3.83337 15.0463 3.83337 14C3.83337 12.9537 3.49772 12.044 2.82642 11.2708C2.15514 10.4977 1.32412 10.0463 0.333374 9.91662V3.44441C0.333374 2.68052 0.60536 2.02659 1.14933 1.48262C1.6933 0.938643 2.34724 0.666656 3.11112 0.666656H30.889C31.6528 0.666656 32.3068 0.938643 32.8508 1.48262C33.3947 2.02659 33.6667 2.68052 33.6667 3.44441V9.91662C32.676 10.0463 31.8449 10.4977 31.1737 11.2708C30.5024 12.044 30.1667 12.9537 30.1667 14C30.1667 15.0463 30.5024 15.9514 31.1737 16.7153C31.8449 17.4792 32.676 17.9352 33.6667 18.0834V24.5556C33.6667 25.3195 33.3947 25.9734 32.8508 26.5174C32.3068 27.0613 31.6528 27.3333 30.889 27.3333ZM30.889 24.5556V20.1111C29.8427 19.4259 28.9977 18.5532 28.3542 17.493C27.7107 16.4329 27.389 15.2685 27.389 14C27.389 12.7315 27.7107 11.5671 28.3542 10.5069C28.9977 9.44675 29.8427 8.57406 30.889 7.88887V3.44441H3.11112V7.88887C4.17596 8.57406 5.0255 9.44675 5.65975 10.5069C6.294 11.5671 6.61112 12.7315 6.61112 14C6.61112 15.2685 6.294 16.4329 5.65975 17.493C5.0255 18.5532 4.17596 19.4259 3.11112 20.1111V24.5556H30.889Z"
                      fill="white"/>
            </svg>
            <span style="margin-bottom:10px">Validar títulos</span></button>

        <button class="wallet-button pica-button" onclick="window.location.href='/id_pica';" style="margin-top:70px">
            <svg xmlns="http://www.w3.org/2000/svg" width="40" height="40" viewBox="0 0 40 40" fill="none">
                <mask id="mask0_172_785" style="mask-type:alpha" maskUnits="userSpaceOnUse" x="0" y="0" width="40"
                      height="40">
                    <rect width="40" height="40" fill="#D9D9D9"/>
                </mask>
                <g mask="url(#mask0_172_785)">
                    <path d="M6.11106 36.6667C5.36106 36.6667 4.7106 36.3913 4.15969 35.8403C3.60877 35.2894 3.33331 34.639 3.33331 33.889V14.4445C3.33331 13.6945 3.60877 13.044 4.15969 12.4931C4.7106 11.9422 5.36106 11.6667 6.11106 11.6667H15.8334V6.11112C15.8334 5.36112 16.1088 4.71067 16.6597 4.15975C17.2106 3.60883 17.8649 3.33337 18.6225 3.33337H21.3774C22.1351 3.33337 22.7893 3.60883 23.3402 4.15975C23.8911 4.71067 24.1666 5.36112 24.1666 6.11112V11.6667H33.8889C34.6389 11.6667 35.2894 11.9422 35.8403 12.4931C36.3912 13.044 36.6666 13.6945 36.6666 14.4445V33.889C36.6666 34.639 36.3912 35.2894 35.8403 35.8403C35.2894 36.3913 34.6389 36.6667 33.8889 36.6667H6.11106ZM6.11106 33.889H33.8889V14.4445H24.1666V15.2778C24.1666 16.1019 23.8911 16.7709 23.3402 17.2848C22.7893 17.7986 22.1351 18.0556 21.3774 18.0556H18.6225C17.8649 18.0556 17.2106 17.7986 16.6597 17.2848C16.1088 16.7709 15.8334 16.1019 15.8334 15.2778V14.4445H6.11106V33.889ZM9.77777 29.8056H19.75V29.1667C19.75 28.676 19.6227 28.2338 19.368 27.8403C19.1134 27.4468 18.7778 27.1667 18.3611 27C17.5833 26.713 16.9328 26.5163 16.4097 26.4098C15.8866 26.3033 15.3611 26.25 14.8333 26.25C14.2685 26.25 13.6921 26.3125 13.1041 26.4375C12.5162 26.5625 11.8796 26.75 11.1944 27C10.7592 27.1667 10.4143 27.4468 10.1597 27.8403C9.90508 28.2338 9.77777 28.676 9.77777 29.1667V29.8056ZM23.5555 27.1111H30.5V24.8889H23.5555V27.1111ZM14.8333 24.8889C15.4815 24.8889 16.0324 24.6621 16.4861 24.2084C16.9398 23.7547 17.1666 23.2038 17.1666 22.5556C17.1666 21.9074 16.9398 21.3565 16.4861 20.9028C16.0324 20.4491 15.4815 20.2223 14.8333 20.2223C14.1852 20.2223 13.6342 20.4491 13.1805 20.9028C12.7268 21.3565 12.5 21.9074 12.5 22.5556C12.5 23.2038 12.7268 23.7547 13.1805 24.2084C13.6342 24.6621 14.1852 24.8889 14.8333 24.8889ZM23.5555 22.3056H30.5V20.0834H23.5555V22.3056ZM18.6111 15.2778H21.3889V6.11112H18.6111V15.2778Z"
                          fill="white"/>
                </g>
            </svg>
            <span style="margin-bottom:10px">ID Oficial</span></button>

    </div>
    <div class="footerlogo">
        <footer>
            <img class="footerimage" src="/images/logo_nobg.png" alt="">
        </footer>
    </div>
    </div>


</c:when>
</c:choose>


<%--<div class="footerlogo">
    <footer>
        <img class="footerimage" src="images/logo_nobg.png" alt="">
    </footer>
</div>--%>

<script>

    document.addEventListener("DOMContentLoaded", function () {
        var bool = document.getElementById("depart");
        var arrival = document.getElementById("arrivalLink");
        var departure = document.getElementById("departureLink");

        arrival.addEventListener("click", function () {
            bool.value = false;
        });

        departure.addEventListener("click", function () {
            bool.value = true;
        });
    });

    document.addEventListener("DOMContentLoaded", function () {
        var departureLink = document.getElementById("departureLink");
        var departure = document.getElementById("departure");

        var arrivalLink = document.getElementById("arrivalLink");
        var arrival = document.getElementById("arrival");

        var dropdown = document.getElementById("dropdown");

        departureLink.addEventListener("click", function () {
            dropdown.textContent = "Partida às";
            arrival.classList.add("hidden");
            departure.classList.remove("hidden");
        });

        arrivalLink.addEventListener("click", function () {
            dropdown.textContent = "Chegada às";
            departure.classList.add("hidden");
            arrival.classList.remove("hidden");
        });
    });

    departureLink.addEventListener("click", function (e) {
            e.preventDefault();
            arrival.classList.add("hidden"); // Hide the arrival input
            arrival.value="";
            departure.classList.remove("hidden"); // Show the departure input
        });

        arrivalLink.addEventListener("click", function (e) {
            e.preventDefault();
            departure.classList.add("hidden"); // Hide the departure input
            departure.value="";
            arrival.classList.remove("hidden"); // Show the arrival input
        });



    async function initMap() {
        const {Map, Polyline} = await google.maps.importLibrary("maps");

        map = new Map(document.getElementById("map"), {
            center: {lat: 38.7223, lng: -9.1393},
            zoom: 11,
            streetViewControl: false, // Disable street view
            mapTypeControl: false, // Disable map/satellite buttons
            zoomControl: false, // Disable zoom in/out buttons
            minZoom: 3,
            styles: [
                {
                    featureType: "poi",
                    elementType: "labels",
                    stylers: [{visibility: "off"}], // Hide location labels
                },
            ],

        });
    }
    function initAutocomplete() {




        const options = {
            /*bounds: defaultBounds,*/
            componentRestrictions: { country: "pt" },
            strictBounds: true,


        }

        const input1 = document.getElementById("origem1");
        const autocomplete = new google.maps.places.Autocomplete(input1, options);
        const place = autocomplete.getPlace();
        //autocomplete.bindTo("bounds", map);
        console.log(place);

        const input2 = document.getElementById("destino1");
        const autocomplete2 = new google.maps.places.Autocomplete(input2, options);
        const place2 = autocomplete2.getPlace();
        //autocomplete2.bindTo("bounds", map);

        console.log(place2);

    }



</script>

<script>
    function selectText(inputElement) {
        inputElement.select();
    }
</script>

<script async
        src="https://maps.googleapis.com/maps/api/js?key=AIzaSyDDHXeHO_gegeY8AJ_QRvjVv2D_KTQ82Bs&libraries=drawing,geometry,core,places&callback=initMap">
</script>

</body>
</html>