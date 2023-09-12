<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!doctype html>
<html lang="en">
<%@include file="header.jsp" %>
<head>
    <title>VIAS - VIAS League</title>
    <link rel="stylesheet" href="/css/template.css">
    <link rel="stylesheet" href="/css/vias_league.css">
</head>
<body>

<div class="container">
    <button class="arrowbutton" onclick="window.location.href='/home';">
        <img src="/images/backarrow.png" alt="Go back!" width="30px">
    </button>

    <img class="imagelogo center-img" src="images/vias_league.v3.png" width="200px">
    <div class="switches-container">
        <input type="radio" id="switchLeague" name="switchPlan" value="My League Logo" checked="checked"/>
        <input type="radio" id="switchLeaderboard" name="switchPlan" value="Leaderboard"/>
        <label for="switchLeague">
            <div class="centered-content">
                <svg xmlns="http://www.w3.org/2000/svg" width="30" height="30" viewBox="0 0 30 30" fill="none">
                    <mask id="mask0_39_618" style="mask-type:alpha" maskUnits="userSpaceOnUse" x="0" y="0"
                          width="30" height="30">
                        <rect width="30" height="30" fill="#D9D9D9"/>
                    </mask>
                    <g mask="url(#mask0_39_618)">
                        <path d="M7.50003 23.75L2.50003 18.75L4.25003 16.9375L6.25003 18.9375V10C6.25003 8.625 6.73961 7.44792 7.71878 6.46875C8.69795 5.48958 9.87503 5 11.25 5C12.625 5 13.8021 5.48958 14.7813 6.46875C15.7604 7.44792 16.25 8.625 16.25 10V18.75C16.25 19.4375 16.4948 20.026 16.9844 20.5156C17.474 21.0052 18.0625 21.25 18.75 21.25C19.4375 21.25 20.0261 21.0052 20.5157 20.5156C21.0052 20.026 21.25 19.4375 21.25 18.75V9.8125L19.25 11.8125L17.5 10L22.5 5L27.5 10L25.75 11.8125L23.75 9.8125V18.75C23.75 20.125 23.2604 21.3021 22.2813 22.2812C21.3021 23.2604 20.125 23.75 18.75 23.75C17.375 23.75 16.1979 23.2604 15.2188 22.2812C14.2396 21.3021 13.75 20.125 13.75 18.75V10C13.75 9.3125 13.5052 8.72396 13.0157 8.23438C12.5261 7.74479 11.9375 7.5 11.25 7.5C10.5625 7.5 9.97399 7.74479 9.48441 8.23438C8.99482 8.72396 8.75003 9.3125 8.75003 10V18.9375L10.75 16.9375L12.5 18.75L7.50003 23.75Z"
                              fill="white"/>
                    </g>
                </svg>
                <span>My League</span>
            </div>
        </label>
        <label for="switchLeaderboard">
            <div class="centered-content">
                <svg xmlns="http://www.w3.org/2000/svg" width="30" height="30" viewBox="0 0 30 30" fill="none">
                    <mask id="mask0_39_633" style="mask-type:alpha" maskUnits="userSpaceOnUse" x="0" y="0"
                          width="30" height="30">
                        <rect width="30" height="30" fill="#D9D9D9"/>
                    </mask>
                    <g mask="url(#mask0_39_633)">
                        <path d="M15 13.75C15.6875 13.75 16.276 13.5052 16.7656 13.0156C17.2552 12.526 17.5 11.9375 17.5 11.25C17.5 10.5625 17.2552 9.97396 16.7656 9.48438C16.276 8.99479 15.6875 8.75 15 8.75C14.3125 8.75 13.724 8.99479 13.2344 9.48438C12.7448 9.97396 12.5 10.5625 12.5 11.25C12.5 11.9375 12.7448 12.526 13.2344 13.0156C13.724 13.5052 14.3125 13.75 15 13.75ZM8.75 26.25V23.75H13.75V19.875C12.7292 19.6458 11.8177 19.2135 11.0156 18.5781C10.2135 17.9427 9.625 17.1458 9.25 16.1875C7.6875 16 6.38021 15.3177 5.32812 14.1406C4.27604 12.9635 3.75 11.5833 3.75 10V8.75C3.75 8.0625 3.99479 7.47396 4.48438 6.98438C4.97396 6.49479 5.5625 6.25 6.25 6.25H8.75V3.75H21.25V6.25H23.75C24.4375 6.25 25.026 6.49479 25.5156 6.98438C26.0052 7.47396 26.25 8.0625 26.25 8.75V10C26.25 11.5833 25.724 12.9635 24.6719 14.1406C23.6198 15.3177 22.3125 16 20.75 16.1875C20.375 17.1458 19.7865 17.9427 18.9844 18.5781C18.1823 19.2135 17.2708 19.6458 16.25 19.875V23.75H21.25V26.25H8.75ZM8.75 13.5V8.75H6.25V10C6.25 10.7917 6.47917 11.5052 6.9375 12.1406C7.39583 12.776 8 13.2292 8.75 13.5ZM15 17.5C16.0417 17.5 16.9271 17.1354 17.6562 16.4062C18.3854 15.6771 18.75 14.7917 18.75 13.75V6.25H11.25V13.75C11.25 14.7917 11.6146 15.6771 12.3438 16.4062C13.0729 17.1354 13.9583 17.5 15 17.5ZM21.25 13.5C22 13.2292 22.6042 12.776 23.0625 12.1406C23.5208 11.5052 23.75 10.7917 23.75 10V8.75H21.25V13.5Z"
                              fill="white"/>
                    </g>
                </svg>
                <span>Leaderboard</span>
            </div>
        </label>
        <div class="switch-wrapper">
            <div class="switch">
                <div class="centered-content">
                    <svg xmlns="http://www.w3.org/2000/svg" width="30" height="30" viewBox="0 0 30 30" fill="none">
                        <mask id="mask0_39_618" style="mask-type:alpha" maskUnits="userSpaceOnUse" x="0" y="0"
                              width="30" height="30">
                            <rect width="30" height="30" fill="#D9D9D9"/>
                        </mask>
                        <g mask="url(#mask0_39_618)">
                            <path d="M7.50003 23.75L2.50003 18.75L4.25003 16.9375L6.25003 18.9375V10C6.25003 8.625 6.73961 7.44792 7.71878 6.46875C8.69795 5.48958 9.87503 5 11.25 5C12.625 5 13.8021 5.48958 14.7813 6.46875C15.7604 7.44792 16.25 8.625 16.25 10V18.75C16.25 19.4375 16.4948 20.026 16.9844 20.5156C17.474 21.0052 18.0625 21.25 18.75 21.25C19.4375 21.25 20.0261 21.0052 20.5157 20.5156C21.0052 20.026 21.25 19.4375 21.25 18.75V9.8125L19.25 11.8125L17.5 10L22.5 5L27.5 10L25.75 11.8125L23.75 9.8125V18.75C23.75 20.125 23.2604 21.3021 22.2813 22.2812C21.3021 23.2604 20.125 23.75 18.75 23.75C17.375 23.75 16.1979 23.2604 15.2188 22.2812C14.2396 21.3021 13.75 20.125 13.75 18.75V10C13.75 9.3125 13.5052 8.72396 13.0157 8.23438C12.5261 7.74479 11.9375 7.5 11.25 7.5C10.5625 7.5 9.97399 7.74479 9.48441 8.23438C8.99482 8.72396 8.75003 9.3125 8.75003 10V18.9375L10.75 16.9375L12.5 18.75L7.50003 23.75Z"
                                  fill="white"/>
                        </g>
                    </svg>
                    <span> My League </span>
                </div>
                <div class="centered-content">
                    <svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" viewBox="0 0 30 30" fill="none">
                        <mask id="mask0_39_633" style="mask-type:alpha" maskUnits="userSpaceOnUse" x="0" y="0"
                              width="30" height="30">
                            <rect width="30" height="30" fill="#D9D9D9"/>
                        </mask>
                        <g mask="url(#mask0_39_633)">
                            <path d="M15 13.75C15.6875 13.75 16.276 13.5052 16.7656 13.0156C17.2552 12.526 17.5 11.9375 17.5 11.25C17.5 10.5625 17.2552 9.97396 16.7656 9.48438C16.276 8.99479 15.6875 8.75 15 8.75C14.3125 8.75 13.724 8.99479 13.2344 9.48438C12.7448 9.97396 12.5 10.5625 12.5 11.25C12.5 11.9375 12.7448 12.526 13.2344 13.0156C13.724 13.5052 14.3125 13.75 15 13.75ZM8.75 26.25V23.75H13.75V19.875C12.7292 19.6458 11.8177 19.2135 11.0156 18.5781C10.2135 17.9427 9.625 17.1458 9.25 16.1875C7.6875 16 6.38021 15.3177 5.32812 14.1406C4.27604 12.9635 3.75 11.5833 3.75 10V8.75C3.75 8.0625 3.99479 7.47396 4.48438 6.98438C4.97396 6.49479 5.5625 6.25 6.25 6.25H8.75V3.75H21.25V6.25H23.75C24.4375 6.25 25.026 6.49479 25.5156 6.98438C26.0052 7.47396 26.25 8.0625 26.25 8.75V10C26.25 11.5833 25.724 12.9635 24.6719 14.1406C23.6198 15.3177 22.3125 16 20.75 16.1875C20.375 17.1458 19.7865 17.9427 18.9844 18.5781C18.1823 19.2135 17.2708 19.6458 16.25 19.875V23.75H21.25V26.25H8.75ZM8.75 13.5V8.75H6.25V10C6.25 10.7917 6.47917 11.5052 6.9375 12.1406C7.39583 12.776 8 13.2292 8.75 13.5ZM15 17.5C16.0417 17.5 16.9271 17.1354 17.6562 16.4062C18.3854 15.6771 18.75 14.7917 18.75 13.75V6.25H11.25V13.75C11.25 14.7917 11.6146 15.6771 12.3438 16.4062C13.0729 17.1354 13.9583 17.5 15 17.5ZM21.25 13.5C22 13.2292 22.6042 12.776 23.0625 12.1406C23.5208 11.5052 23.75 10.7917 23.75 10V8.75H21.25V13.5Z"
                                  fill="white"/>
                        </g>
                    </svg>
                    <span> Leaderboard </span>
                </div>
            </div>
        </div>
    </div>
    <div class="list-container">
        <c:choose>
            <c:when test="${userr.getLeague() eq 'Gold'}">
                <img class="image_badge center-img" src="images/badge_gold.png" width="45px" alt="Gold Image"/>
                <div id="liga">Liga de Ouro</div>
            </c:when>
            <c:when test="${userr.getLeague() eq 'Silver'}">
                <img class="image_badge center-img" src="images/badge_silver.png" width="45px" alt="Silver Image"/>
                <div id="liga">Liga de Prata</div>
            </c:when>
            <c:when test="${userr.getLeague() eq 'Bronze'}">
                <img class="image_badge center-img" src="images/badge_bronze.png" width="45px" alt="Silver Image"/>
                <div id="liga">Liga de Bronze</div>
            </c:when>
        </c:choose>
        <hr>
        <div class="table-container">

            <table class="table">
                <%--<thead>
                <tr>
                    <th scope="col">&lt;%&ndash;#&ndash;%&gt;</th>
                    <th scope="col">&lt;%&ndash;Avatar&ndash;%&gt;</th>
                    <th scope="col">&lt;%&ndash;Nome&ndash;%&gt;</th>
                    <th scope="col">&lt;%&ndash;Pontos&ndash;%&gt;</th>
                </tr>
                </thead>--%>
                <tbody>


                <c:forEach var="player" items="${players}" varStatus="loopStatus">
                    <tr>
                        <td><strong>${loopStatus.index + 1}</strong></td>
                        <td>
                            <div class="circle">
                                <img src="https://avatars.steamstatic.com/1049039bc4e85be4f93ecd09f6398d7c7a9442ba_full.jpg"
                                     alt="av1" width="5px">
                            </div>
                        </td>
                        <td>${player.getUsername()}</td>

                        <td>
                            <div class="points">
                                <div class="points-number">${player.getPoints()}</div>
                                <div class="points-text">pontos</div>
                            </div>
                        </td>

                    </tr>
                </c:forEach>


                </tbody>
            </table>
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

