<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!doctype html>
<html lang="en">
<%@include file="../header.jsp"%>
<head>
    <title>VIAS | Ativação com sucesso</title>
    <link rel="stylesheet" href="/css/passwordrecovery.css">
</head>
<body id="login-page">

<div class="container">
    <button class="arrowbutton" onclick="window.location.href='/home';">
        <img src="/images/backarrow.png" alt="Go back!" width="30px">
    </button>
    <div class="content">

        <div class="image-container">
            <div class="imagelogo">
                <svg width="196" height="45" viewBox="0 0 196 45" fill="none" xmlns="http://www.w3.org/2000/svg">
                    <path d="M19.24 45L0.104 0.199997H13.8L29.928 38.984H21.864L38.376 0.199997H50.92L31.72 45H19.24ZM53.5425 45V0.199997H66.2145V45H53.5425ZM69.854 45L89.63 0.199997H102.11L121.95 45H108.766L93.278 6.408H98.27L82.782 45H69.854ZM80.67 36.296L83.934 26.952H105.822L109.086 36.296H80.67Z" fill="#004A89"/>
                    <path d="M176.667 25.6667L176.665 44.3334L195.667 39.0027L190.127 35.1147C192.809 31.656 194.31 27.408 194.307 23C194.307 11.9734 185.176 3.00002 173.95 3.00002C158.558 3.00002 154.913 17.3227 153.716 22.032C150.967 32.832 146.961 35 141.38 35C134.646 35 129.166 29.616 129.166 23C129.166 20.272 130.149 17.664 131.856 15.5547L138.666 20.3334V1.66669L119.667 7.00002L125.206 10.8854C122.525 14.344 121.024 18.592 121.024 23C121.024 34.0294 130.154 43 141.38 43C155.179 43 159.535 32.1414 161.614 23.968C164.516 12.5734 169.258 11 173.95 11C180.684 11 186.164 16.3867 186.164 23.0054C186.167 25.7307 185.184 28.3387 183.477 30.448L176.667 25.6667Z" fill="#A3DD41"/>
                </svg>
            </div>

        </div>

        <p class="title">Obrigado! </p>
        <p class="subtitle-text">A sua conta foi ativada. Pode pressionar no botão entrar e proceder ao login ou no botão retroceder e regressar à página principal.</p>
        <div class="d-grid">
            <button type="submit" id="buttonentry" class="btn btn-primary buttons" style="margin-top: 140px" onclick="window.location.href='/login';">
                Entrar
            </button>
        </div>

    </div>
</div>

<div class="footerlogo">
    <footer>
        <div class="footerimage" style="margin-top: 12px">
            <svg width="115" height="25" viewBox="0 0 196 45" fill="none" xmlns="http://www.w3.org/2000/svg">
                <path d="M18.24 45L-0.896 0.199997H12.8L28.928 38.984H20.864L37.376 0.199997H49.92L30.72 45H18.24ZM52.5425 45V0.199997H65.2145V45H52.5425ZM68.854 45L88.63 0.199997H101.11L120.95 45H107.766L92.278 6.408H97.27L81.782 45H68.854ZM79.67 36.296L82.934 26.952H104.822L108.086 36.296H79.67Z" fill="white"/>
                <path d="M177.001 24.6667L176.998 43.3333L196 38.0027L190.46 34.1147C193.142 30.656 194.643 26.408 194.64 22C194.64 10.9733 185.51 1.99999 174.284 1.99999C158.892 1.99999 155.246 16.3226 154.049 21.032C151.3 31.832 147.294 34 141.714 34C134.98 34 129.5 28.616 129.5 22C129.5 19.272 130.482 16.664 132.189 14.5547L138.999 19.3333V0.666656L120 5.99999L125.54 9.88532C122.858 13.344 121.357 17.592 121.357 22C121.357 33.0293 130.488 42 141.714 42C155.512 42 159.869 31.1413 161.948 22.968C164.849 11.5733 169.591 9.99999 174.284 9.99999C181.018 9.99999 186.498 15.3867 186.498 22.0054C186.5 24.7307 185.518 27.3387 183.811 29.448L177.001 24.6667Z" fill="#A3DD41"/>
            </svg>
        </div>
    </footer>
</div>

</body>
</html>