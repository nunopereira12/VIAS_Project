<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!doctype html>
<html lang="en">
<%@include file="../header.jsp" %>
<head>
    <title>VIAS | Sugestões de rota</title>
    <link rel="stylesheet" href="/css/template.css">
    <link rel="stylesheet" href="/css/home.css">
    <link rel="stylesheet" href="/css/suggestions.css">


</head>
<body class="home-body" onload="initAutocomplete()">
<button class="arrowbutton" style="z-index: 1000" onclick=window.location.href='/home';>
    <img src="/images/backarrow.png" alt="Go back!" width="30px">
</button>
<div class="home-container">
    <div class="mapbox">
        <div id="map"></div>
    </div>

    <div class="suggestions-content">
        <div class="imageDesktop">
            <footer>
                <div class="imageTopLeft" style="margin-top: 25px; margin-bottom: 12px" onclick=window.location.href='/home'>
                    <svg width="250" height="50" viewBox="0 0 196 45" fill="none" xmlns="http://www.w3.org/2000/svg">
                        <path d="M18.24 45L-0.896 0.199997H12.8L28.928 38.984H20.864L37.376 0.199997H49.92L30.72 45H18.24ZM52.5425 45V0.199997H65.2145V45H52.5425ZM68.854 45L88.63 0.199997H101.11L120.95 45H107.766L92.278 6.408H97.27L81.782 45H68.854ZM79.67 36.296L82.934 26.952H104.822L108.086 36.296H79.67Z"
                              fill="white"/>
                        <path d="M177.001 24.6667L176.998 43.3333L196 38.0027L190.46 34.1147C193.142 30.656 194.643 26.408 194.64 22C194.64 10.9733 185.51 1.99999 174.284 1.99999C158.892 1.99999 155.246 16.3226 154.049 21.032C151.3 31.832 147.294 34 141.714 34C134.98 34 129.5 28.616 129.5 22C129.5 19.272 130.482 16.664 132.189 14.5547L138.999 19.3333V0.666656L120 5.99999L125.54 9.88532C122.858 13.344 121.357 17.592 121.357 22C121.357 33.0293 130.488 42 141.714 42C155.512 42 159.869 31.1413 161.948 22.968C164.849 11.5733 169.591 9.99999 174.284 9.99999C181.018 9.99999 186.498 15.3867 186.498 22.0054C186.5 24.7307 185.518 27.3387 183.811 29.448L177.001 24.6667Z"
                              fill="#A3DD41"/>
                    </svg>
                </div>
            </footer>
        </div>
        <form method="GET" action="/perform_travel" id="form">
            <div class="button-box" style="margin-top: 50px">
                <div class="input-box">
                    <svg id="get_location" style="margin: auto 7px auto" xmlns="http://www.w3.org/2000/svg" width="25"
                         height="25" viewBox="0 0 25 25" fill="none">
                        <mask id="mask0_854_705" style="mask-type:alpha" maskUnits="userSpaceOnUse" x="0" y="0"
                              width="25" height="25">
                            <path d="M0 0H25V25H0V0Z" fill="#D9D9D9"/>
                        </mask>
                        <g mask="url(#mask0_854_705)">
                            <path d="M13.5677 22.8646V21.1285C14.3316 21.0243 15.0738 20.8218 15.7943 20.5208C16.5148 20.2199 17.1904 19.8264 17.8212 19.3403L19.0365 20.6076C18.2321 21.2616 17.3727 21.7752 16.4583 22.1484C15.544 22.5217 14.5804 22.7604 13.5677 22.8646ZM20.5816 19.0278L19.349 17.8299C19.8119 17.2222 20.1939 16.5639 20.4948 15.855C20.7957 15.1461 21.0041 14.3866 21.1198 13.5764H22.8906C22.7517 14.6296 22.487 15.6149 22.0964 16.5321C21.7057 17.4494 21.2008 18.2813 20.5816 19.0278ZM21.1198 11.4236C21.0041 10.6076 20.7957 9.8481 20.4948 9.14497C20.1939 8.44185 19.8119 7.78356 19.349 7.17013L20.5816 5.97221C21.2413 6.80554 21.7549 7.66203 22.1224 8.54166C22.4899 9.4213 22.746 10.3819 22.8906 11.4236H21.1198ZM11.3976 22.8646C8.74133 22.5637 6.52923 21.4294 4.76128 19.4618C2.99334 17.4942 2.10938 15.1736 2.10938 12.5C2.10938 9.8206 2.99334 7.49711 4.76128 5.5295C6.52923 3.56192 8.74133 2.43055 11.3976 2.13541V3.87151C9.22164 4.16665 7.41898 5.13019 5.98958 6.76213C4.56017 8.39409 3.84547 10.3067 3.84547 12.5C3.84547 14.6933 4.56017 16.6044 5.98958 18.2335C7.41898 19.8626 9.22164 20.8275 11.3976 21.1285V22.8646ZM17.8559 5.65971C17.1962 5.19096 16.5046 4.80613 15.7812 4.50521C15.0579 4.20427 14.3316 3.99304 13.6024 3.87151V2.13541C14.5689 2.25694 15.515 2.50434 16.441 2.8776C17.3669 3.25087 18.2321 3.75579 19.0365 4.39237L17.8559 5.65971ZM12.5 17.8993C11.4699 17.0255 10.4977 16.0851 9.58333 15.0781C8.66898 14.0712 8.2118 12.8993 8.2118 11.5625C8.2118 10.3472 8.62702 9.30844 9.45747 8.44617C10.2879 7.58391 11.3021 7.15278 12.5 7.15278C13.6979 7.15278 14.7121 7.58391 15.5425 8.44617C16.373 9.30844 16.7882 10.3472 16.7882 11.5625C16.7882 12.8993 16.331 14.0712 15.4167 15.0781C14.5023 16.0851 13.5301 17.0255 12.5 17.8993ZM12.5 12.5347C12.8241 12.5347 13.0975 12.4233 13.3203 12.2005C13.5431 11.9777 13.6545 11.7043 13.6545 11.3802C13.6545 11.0851 13.5431 10.8189 13.3203 10.5816C13.0975 10.3443 12.8241 10.2257 12.5 10.2257C12.1759 10.2257 11.9025 10.3443 11.6797 10.5816C11.4569 10.8189 11.3455 11.0851 11.3455 11.3802C11.3455 11.7043 11.4569 11.9777 11.6797 12.2005C11.9025 12.4233 12.1759 12.5347 12.5 12.5347Z"
                                  fill="white"/>
                        </g>
                    </svg>
                    <span style="margin: auto auto auto 0">
                    <c:choose>
                    <c:when test="${legs != null}">
                <input class="input-field" type="text" name="origem" id="origem1" onfocus=selectText(this)
                       value="${legs.get(0).getStart_address()}" style="margin: 0px" required></span>
                    </c:when>
                    <c:when test="${legs == null}">
                        <input class="input-field" type="text" name="origem" id="origem1" value=""
                               placeholder="${origem}" style="margin: 0px" required></span>
                    </c:when>
                    </c:choose></div>
                <div class="input-box">
                    <button style="background-color: #1F7EB2; border: none; margin: 0 3px 0 5px">
                        <svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" viewBox="0 0 20 20" fill="none">
                            <path d="M18.6667 20L11.463 12.7963C10.9074 13.2654 10.2626 13.6327 9.52853 13.8981C8.79447 14.1636 8.01336 14.2963 7.18519 14.2963C5.17703 14.2963 3.47745 13.6003 2.08647 12.2083C0.695491 10.8164 0 9.12965 0 7.14817C0 5.16668 0.695991 3.47995 2.08797 2.08797C3.47994 0.695991 5.16975 0 7.15742 0C9.14506 0 10.8318 0.695991 12.2176 2.08797C13.6034 3.47995 14.2963 5.16761 14.2963 7.15095C14.2963 7.95156 14.1667 8.71915 13.9074 9.45372C13.6482 10.1883 13.2716 10.8642 12.7778 11.4815L20 18.6667L18.6667 20ZM7.16667 12.4445C8.63272 12.4445 9.87886 11.9275 10.9051 10.8935C11.9313 9.85958 12.4444 8.61113 12.4444 7.14817C12.4444 5.68518 11.9313 4.43672 10.9051 3.40278C9.87886 2.36883 8.63272 1.85186 7.16667 1.85186C5.69033 1.85186 4.43544 2.36883 3.402 3.40278C2.36856 4.43672 1.85183 5.68518 1.85183 7.14817C1.85183 8.61113 2.36856 9.85958 3.402 10.8935C4.43544 11.9275 5.69033 12.4445 7.16667 12.4445Z"
                                  fill="white"/>
                        </svg>
                    </button>
                    <span style="margin: auto auto auto 0 ">
                        <c:choose>
                        <c:when test="${legs != null}">
                        <input class="input-field" type="text" name="destino" id="destino1" onfocus=selectText(this)
                               value="${legs.get(0).getEnd_address()}" alt="" style="margin: 0px" required></span>
                    </c:when>
                    <c:when test="${legs == null}">
                        <input class="input-field" type="text" name="destino" id="destino1" value=""
                               placeholder="${destino}" style="margin: 0px" required></span>
                    </c:when>
                    </c:choose></div>
                <button class="switch-button" id="swapvalues">
                    <svg width="32" height="32" viewBox="0 0 40 40" fill="none" xmlns="http://www.w3.org/2000/svg">
                        <circle cx="20" cy="20" r="20" fill="#041F48"/>
                        <mask id="mask0_0_1" style="mask-type:alpha" maskUnits="userSpaceOnUse" x="8" y="8" width="24"
                              height="24">
                            <rect x="8" y="8" width="24" height="24" fill="#D9D9D9"/>
                        </mask>
                        <g mask="url(#mask0_0_1)">
                            <path d="M16 21V13.825L13.425 16.4L12 15L17 10L22 15L20.575 16.4L18 13.825V21H16ZM23 30L18 25L19.425 23.6L22 26.175V19H24V26.175L26.575 23.6L28 25L23 30Z"
                                  fill="white"/>
                        </g>
                    </svg>
                </button>

            </div>
            <div class="dropdown" style="margin-top: 5px; display:flex; justify-content: center; justify-items: center">
                <button class="btn btn-secondary dropdown-toggle" type="button" data-bs-toggle="dropdown"
                        aria-expanded="false" id="dropdown" style="width: 250px; margin: 10px auto">
                    <span>
                        <c:choose>
                            <c:when test="${button_date == null}">
                                <span style="font-weight: 600">Partir agora</span></c:when>
                            <c:when test="${depart == true}">
                                <span style="font-weight: 600">Partida:&nbsp;</span>${button_date}</c:when>
                            <c:otherwise><span style="font-weight: 600">Chegada:&nbsp;</span> ${button_date}</c:otherwise>
                        </c:choose>
                    </span>
                </button>
                <ul class="dropdown-menu">
                    <input type="hidden" name="depart" value=true id="depart">
                    <li><a class="dropdown-item" href="#divDeparture" id="departureLink">Hora de partida</a></li>
                    <li><a class="dropdown-item" href="#divArrival" id="arrivalLink">Hora de chegada</a></li>
                </ul>
            </div>
            <div class="date-hour-box">
                <div class="date-hour-input hidden" id="divDeparture">
                    <input class="time-input" id="departureTime" value="" type="time" name="time">
                    <input class="date-input" id="departureDate" value="" type="date" name="date">
                </div>
                <div class="date-hour-input hidden" id="divArrival">
                    <input class="time-input" id="arrivalTime" value="" type="time" name="time">
                    <input class="date-input" id="arrivalDate" value="" type="date" name="date">
                </div>
            </div>

        </form>


        <c:if test="${search_error != null}">
            <div class="suggestions-box">

                <div class="alert alert-danger text-center">
                    <p>${search_error}</p>
                </div>
                <button class="return-button" onclick=window.location.href='/home';>Regressar</button>
            </div>
            <div class="footerlogo">
                <footer>
                    <div class="footerimage" style="margin-bottom: 25px">
                        <svg width="115" height="25" viewBox="0 0 196 45" fill="none"
                             xmlns="http://www.w3.org/2000/svg">
                            <path d="M18.24 45L-0.896 0.199997H12.8L28.928 38.984H20.864L37.376 0.199997H49.92L30.72 45H18.24ZM52.5425 45V0.199997H65.2145V45H52.5425ZM68.854 45L88.63 0.199997H101.11L120.95 45H107.766L92.278 6.408H97.27L81.782 45H68.854ZM79.67 36.296L82.934 26.952H104.822L108.086 36.296H79.67Z"
                                  fill="white"/>
                            <path d="M177.001 24.6667L176.998 43.3333L196 38.0027L190.46 34.1147C193.142 30.656 194.643 26.408 194.64 22C194.64 10.9733 185.51 1.99999 174.284 1.99999C158.892 1.99999 155.246 16.3226 154.049 21.032C151.3 31.832 147.294 34 141.714 34C134.98 34 129.5 28.616 129.5 22C129.5 19.272 130.482 16.664 132.189 14.5547L138.999 19.3333V0.666656L120 5.99999L125.54 9.88532C122.858 13.344 121.357 17.592 121.357 22C121.357 33.0293 130.488 42 141.714 42C155.512 42 159.869 31.1413 161.948 22.968C164.849 11.5733 169.591 9.99999 174.284 9.99999C181.018 9.99999 186.498 15.3867 186.498 22.0054C186.5 24.7307 185.518 27.3387 183.811 29.448L177.001 24.6667Z"
                                  fill="#A3DD41"/>
                        </svg>
                    </div>
                </footer>
            </div>
        </c:if>
        <c:if test="${search_error == null}">

            <div class="suggestions-box">
                <h4>Sugestões de Rota</h4>
                    <%--<c:if test="${search_error != null}">
                        <div class="alert alert-danger">
                                ${search_error}
                        </div>
                    </c:if>--%>
                <c:forEach var="leg" items="${legs}">
                    <div class="card-box">
                        <form class="submit-button" id="myForm_${leg.getId()}" action="/travel_details" method="GET">
                            <button class="card">
                                <input type="hidden" name="id" value="${leg.getId()}">
                                <div class="time-travel-box">
                                    <div class="travel-box">
                                        <c:forEach var="step" items="${leg.getSteps()}" varStatus="loop">
                                            <c:if test="${step.getTravel_mode().equals('WALKING')}">
                                                <div class="icon-box"><img class="icon" src="${step.getIcon()}"></div>
                                            </c:if>
                                            <c:if test="${!step.getTravel_mode().equals('WALKING')}">
                                                <div class="icon-box"><img class="icon" src="${step.getIcon()}"></div>
                                                <div class="travel-text"
                                                     style="background-color: ${step.getLine().getColor()}; color: ${step.getLine().getText_color()}; padding: 0 2px 0 2px">
                                                    <span style="margin: 0 2px">${step.getLine().getName()}</span></div>
                                            </c:if>
                                            <c:if test="${!loop.last}">
                                                <div class="icon-box">
                                                    <svg xmlns="http://www.w3.org/2000/svg" width="7" height="11"
                                                         viewBox="0 0 7 11" fill="none">
                                                        <path d="M4.33562 5.54835L0.502289 1.71502L1.66896 0.548355L6.66896 5.54835L1.66896 10.5484L0.502289 9.38169L4.33562 5.54835Z"
                                                              fill="#3C4043"/>
                                                    </svg>
                                                </div>
                                            </c:if>

                                        </c:forEach></div>
                                    <div class="time-box"><strong>${leg.getDuration()}</strong></div>
                                </div>
                                <div class="time-travel-box">
                                    <div class="start-end-box">${leg.getDeparture_time()}<span
                                            style="margin: 0 3px"> - </span>${leg.getArrival_time()}</div>
                                    <div class="fare-box"><span
                                            class="fare-style">VIAS Card: </span> ${leg.getFare()}<span>€</span>
                                    </div>
                                </div>
                            </button>
                            <input type="hidden" name="depart" value="${depart}">
                            <input type="hidden" name="date" value="${date}">
                            <input type="hidden" name="time" value="${time}">
                        </form>
                        <div class="card-button" onclick="window.location.href='/wallet';">
                            <svg xmlns="http://www.w3.org/2000/svg" width="23" height="23" viewBox="0 0 28 28"
                                 fill="none" style="margin: 18px 5px 0 0">
                                <mask id="mask0_27_398" style="mask-type:alpha" maskUnits="userSpaceOnUse" x="0"
                                      y="0"
                                      width="28" height="28">
                                    <rect width="28" height="28" fill="#D9D9D9"/>
                                </mask>
                                <g mask="url(#mask0_27_398)">
                                    <path d="M14 16.975C14.2658 16.975 14.4943 16.8794 14.6855 16.6882C14.8767 16.497 14.9723 16.2685 14.9723 16.0028C14.9723 15.737 14.8767 15.5085 14.6855 15.3173C14.4943 15.1261 14.2658 15.0305 14 15.0305C13.7343 15.0305 13.5058 15.1261 13.3146 15.3173C13.1234 15.5085 13.0278 15.737 13.0278 16.0028C13.0278 16.2685 13.1234 16.497 13.3146 16.6882C13.5058 16.8794 13.7343 16.975 14 16.975ZM14 12.1722C14.2658 12.1722 14.4943 12.0766 14.6855 11.8854C14.8767 11.6942 14.9723 11.4657 14.9723 11.2C14.9723 10.9342 14.8767 10.7058 14.6855 10.5146C14.4943 10.3234 14.2658 10.2278 14 10.2278C13.7343 10.2278 13.5058 10.3234 13.3146 10.5146C13.1234 10.7058 13.0278 10.9342 13.0278 11.2C13.0278 11.4657 13.1234 11.6942 13.3146 11.8854C13.5058 12.0766 13.7343 12.1722 14 12.1722ZM14 7.3694C14.2658 7.3694 14.4943 7.2738 14.6855 7.0826C14.8767 6.8914 14.9723 6.66293 14.9723 6.39718C14.9723 6.13146 14.8767 5.90298 14.6855 5.71177C14.4943 5.52057 14.2658 5.42497 14 5.42497C13.7343 5.42497 13.5058 5.52057 13.3146 5.71177C13.1234 5.90298 13.0278 6.13146 13.0278 6.39718C13.0278 6.66293 13.1234 6.8914 13.3146 7.0826C13.5058 7.2738 13.7343 7.3694 14 7.3694ZM23.7223 20.5333H4.2778C3.74308 20.5333 3.28533 20.3429 2.90454 19.9621C2.52376 19.5814 2.33337 19.1236 2.33337 18.5889V14.0583C3.0269 13.9546 3.60861 13.6354 4.0785 13.1007C4.54842 12.566 4.78337 11.9324 4.78337 11.2C4.78337 10.4676 4.54842 9.83075 4.0785 9.28956C3.60861 8.74834 3.0269 8.43236 2.33337 8.34161V3.81106C2.33337 3.27634 2.52376 2.81859 2.90454 2.43781C3.28533 2.05703 3.74308 1.86664 4.2778 1.86664H23.7223C24.257 1.86664 24.7148 2.05703 25.0955 2.43781C25.4763 2.81859 25.6667 3.27634 25.6667 3.81106V8.34161C24.9732 8.43236 24.3915 8.74834 23.9216 9.28956C23.4517 9.83075 23.2167 10.4676 23.2167 11.2C23.2167 11.9324 23.4517 12.566 23.9216 13.1007C24.3915 13.6354 24.9732 13.9546 25.6667 14.0583V18.5889C25.6667 19.1236 25.4763 19.5814 25.0955 19.9621C24.7148 20.3429 24.257 20.5333 23.7223 20.5333ZM23.7223 18.5889V15.4778C22.9899 14.9981 22.3984 14.3872 21.948 13.6451C21.4975 12.903 21.2723 12.0879 21.2723 11.2C21.2723 10.312 21.4975 9.49696 21.948 8.75484C22.3984 8.01271 22.9899 7.40182 23.7223 6.92218V3.81106H4.2778V6.92218C5.02318 7.40182 5.61786 8.01271 6.06184 8.75484C6.50581 9.49696 6.7278 10.312 6.7278 11.2C6.7278 12.0879 6.50581 12.903 6.06184 13.6451C5.61786 14.3872 5.02318 14.9981 4.2778 15.4778V18.5889H23.7223Z"
                                          fill="white"/>
                                </g>
                            </svg>
                            <span class="card-button-text">Títulos de Transporte</span></div>
                    </div>
                </c:forEach>
                <button class="return-button" onclick=window.location.href='/home';>Regressar</button>
            </div>
            <div class="footerlogo">
                <footer>
                    <div class="footerimage" style="margin-bottom: 25px">
                        <svg width="115" height="25" viewBox="0 0 196 45" fill="none"
                             xmlns="http://www.w3.org/2000/svg">
                            <path d="M18.24 45L-0.896 0.199997H12.8L28.928 38.984H20.864L37.376 0.199997H49.92L30.72 45H18.24ZM52.5425 45V0.199997H65.2145V45H52.5425ZM68.854 45L88.63 0.199997H101.11L120.95 45H107.766L92.278 6.408H97.27L81.782 45H68.854ZM79.67 36.296L82.934 26.952H104.822L108.086 36.296H79.67Z"
                                  fill="white"/>
                            <path d="M177.001 24.6667L176.998 43.3333L196 38.0027L190.46 34.1147C193.142 30.656 194.643 26.408 194.64 22C194.64 10.9733 185.51 1.99999 174.284 1.99999C158.892 1.99999 155.246 16.3226 154.049 21.032C151.3 31.832 147.294 34 141.714 34C134.98 34 129.5 28.616 129.5 22C129.5 19.272 130.482 16.664 132.189 14.5547L138.999 19.3333V0.666656L120 5.99999L125.54 9.88532C122.858 13.344 121.357 17.592 121.357 22C121.357 33.0293 130.488 42 141.714 42C155.512 42 159.869 31.1413 161.948 22.968C164.849 11.5733 169.591 9.99999 174.284 9.99999C181.018 9.99999 186.498 15.3867 186.498 22.0054C186.5 24.7307 185.518 27.3387 183.811 29.448L177.001 24.6667Z"
                                  fill="#A3DD41"/>
                        </svg>
                    </div>
                </footer>
            </div>
        </c:if>
    </div>

    <c:forEach var="leg" items="${legs}" varStatus="status">
        <input type="hidden" id="polylineInput_${status.index}" value="${leg.getOverview_polyline()}">

    </c:forEach>

    <script>


        document.addEventListener("DOMContentLoaded", function () {
            var origin = document.getElementById("origem1");
            var destination = document.getElementById("destino1");
            var swapButton = document.getElementById("swapvalues");
            var dropdown = document.getElementById("dropdown");

            dropdown.addEventListener("click", function () {
                dropdown.textContent = "Planear viagem";
            });

            swapButton.addEventListener("click", function () {
                var tempValue = origin.value;
                origin.value = destination.value;
                destination.value = tempValue;

            });
        });


        document.addEventListener("DOMContentLoaded", function () {
            var bool = document.getElementById("depart");

            var departureLink = document.getElementById("departureLink");
            var arrivalLink = document.getElementById("arrivalLink");

            var departure = document.getElementById("divDeparture");
            var arrival = document.getElementById("divArrival");

            var departureTime = document.getElementById("departureTime");
            var departureDate = document.getElementById("departureDate");
            var arrivalTime = document.getElementById("arrivalTime");
            var arrivalDate = document.getElementById("arrivalDate");

            var dropdown = document.getElementById("dropdown");

            const currentDate = new Date();
            const year = currentDate.getFullYear();
            const month = String(currentDate.getMonth() + 1).padStart(2, '0');
            const day = String(currentDate.getDate()).padStart(2, '0');
            const formattedDate = year + '-' + month + '-' + day;
            const hours = String(currentDate.getHours()).padStart(2, '0');
            const minutes = String(currentDate.getMinutes()).padStart(2, '0');
            const formattedTime = hours + ':' + minutes;

            departureLink.addEventListener("click", function (e) {
                e.preventDefault();
                dropdown.textContent = "Partida às";
                arrival.classList.add("hidden");
                departure.classList.remove("hidden");
                arrivalTime.value = "";
                arrivalDate.value = "";
                departureDate.value = formattedDate;
                departureTime.value = formattedTime;
                bool.value = true;
            });

            arrivalLink.addEventListener("click", function (e) {
                e.preventDefault();
                dropdown.textContent = "Chegada às";
                departure.classList.add("hidden");
                arrival.classList.remove("hidden");
                departureTime.value = "";
                departureDate.value = "";
                arrivalDate.value = formattedDate;
                arrivalTime.value = formattedTime;
                bool.value = false;
            });

            departureTime.addEventListener("")


        });


    </script>
    <script>

        let map;
        let otherPolylines = []; // Declare an array to hold non-walking Polylines

        async function initMap() {
            const {Map, Polyline} = await google.maps.importLibrary("maps");

            map = new Map(document.getElementById("map"), {
                center: {lat: 38.77851493507939, lng: -9.33226675574515},
                zoom: 12,
                streetViewControl: false, // Disable street view
                mapTypeControl: false, // Disable map/satellite buttons
                zoomControl: false, // Disable zoom in/out buttons
                styles: [
                    {
                        featureType: "poi",
                        elementType: "labels",
                        stylers: [{visibility: "off"}], // Hide location labels
                    },
                ],
            });

            // Find all hidden input elements with IDs starting with "polylineInput_"
            const legInputs = document.querySelectorAll('[id^="polylineInput_"]');

            // Define a green color for the first leg
            const greenColor = '#A4DE41';

            // Iterate through the hidden input elements for legs
            legInputs.forEach((input, index) => {
                const polylineString = input.value;

                if (polylineString) {
                    const decodedPath = google.maps.geometry.encoding.decodePath(polylineString);

                    // Create an array to hold LatLng objects
                    const path = [];
                    for (const point of decodedPath) {
                        path.push(new google.maps.LatLng(point.lat(), point.lng()));
                    }

                    // Create a Polyline with the specified color for each leg
                    const legPolyline = new google.maps.Polyline({
                        path: path,
                        map: map,
                        strokeColor: index === 0 ? greenColor : '#CCCCCC', // Green for the first leg, gray for others
                        strokeOpacity: 1,
                        strokeWeight: 4,
                    });

                    otherPolylines.push(legPolyline); // Add the leg polyline to the otherPolylines array

                    // Create a duplicate polyline behind the main one for the outline effect
                    const outlinePolyline = new google.maps.Polyline({
                        path: path,
                        map: map,
                        strokeColor: "#000000", // Outline color
                        strokeOpacity: 0.3, // Full opacity for outline
                        strokeWeight: 7, // Adjust the thickness of the outline
                    });

                    outlinePolyline.setMap(map); // Add the outline polyline to the map

                    if (index === 0) {
                        legPolyline.setOptions({zIndex: google.maps.Marker.MAX_ZINDEX + 1});
                    }
                }
            });

            // Create markers for the start and end of the first polyline
            const firstPolyline = otherPolylines[0];

            const svgMarkerStart = {
                path: "M12 2a8 8 0 0 0-7.992 8A12.816 12.816 0 0 0 12 22a12.816 12.816 0 0 0 7.988-12A8 8 0 0 0 12 2zm0 11a3 3 0 1 1 3-3 3 3 0 0 1-3 3z",
                opacity: 1,
                strokeColor: '#041F48',
                fillColor: '#041F48',
                fillOpacity: 1,
                anchor: new google.maps.Point(12, 22),
                scale: 1.2


            };

            const startMarker = new google.maps.Marker({
                position: firstPolyline.getPath().getAt(0), // Start of the first polyline
                map: map,
                icon: svgMarkerStart
            });

            const svgMakerEnd = {
                path: "M2 15h9v3h8V5h-8V2H2V0H0v23h2zM8 4v3h3v3h3V7h3v3h-3v3h3v3h-3v-3h-3v-3H8v3H5v-3H2V7h3V4z M4 7h3v3H5z",
                opacity: 1,
                strokeColor: '#041F48',
                fillColor: '#041F48',
                fillOpacity: 1,
                anchor: new google.maps.Point(2, 24),
                scale: 1.4,
                strokeWeight: 0.1,
            };


            const endMarker = new google.maps.Marker({
                position: firstPolyline.getPath().getAt(firstPolyline.getPath().getLength() - 1), // End of the first polyline
                map: map,
                icon: svgMakerEnd
            });

            // Automatically fit the map to the bounds of all the leg polylines
            const bounds = new google.maps.LatLngBounds();
            otherPolylines.forEach((polyline) => {
                polyline.getPath().forEach((point) => bounds.extend(point));
            });
            map.fitBounds(bounds);
        }


        function initAutocomplete() {

            /*  const defaultBounds = {
                  north: 38.7223 + 0.3,
                  south: 38.7223 - 0.4,
                  east: -9.1393 + 0.6,
                  west: -9.1393 - 0.4,
              }*/


            const options = {
                /*bounds: defaultBounds,*/
                componentRestrictions: {country: "pt"},
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

        const form = document.getElementById("form");

        function getLocation() {
            if ("geolocation" in navigator) {

                navigator.geolocation.getCurrentPosition(function (position) {
                    latitude = position.coords.latitude;
                    longitude = position.coords.longitude;

                    const coordinates = latitude + "," + longitude;

                    var origin = document.getElementById("origem1");
                    origin.value = coordinates;
                    form.submit();
                });
            } else {
                alert("O serviço de localização não é suportado no seu dispositivo.");
            }
        }

        document.getElementById("get_location").addEventListener("click", getLocation);
    </script>

    <script>
        function selectText(inputElement) {
            inputElement.select();
        }
    </script>

    <script async
            src="https://maps.googleapis.com/maps/api/js?key=AIzaSyDDHXeHO_gegeY8AJ_QRvjVv2D_KTQ82Bs&libraries=drawing,geometry,core,places&callback=initMap">
    </script>

</div>
</div>
</body>
</html>