<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!doctype html>
<html lang="en">
<%@include file="../header.jsp"%>
<head>
    <title>VIAS | Ativação sem sucesso</title>
    <link rel="stylesheet" href="/css/passwordrecovery.css">
</head>
<body id="login-page">

<div class="container">
    <button class="arrowbutton" onclick="window.location.href='/home';">
        <img src="/images/backarrow.png" alt="Go back!" width="30px">
    </button>
    <div class="content">

        <div class="image-container">
            <img class="imagelogo" src="/images/logo_whitebg.png" >
        </div>

        <p class="title">Oops</p>
        <p class="subtitle-text">O seu token está inválido. Foi enviado um novo email de ativação de conta.</p>

    </div>
</div>

<div class="footerlogo">
    <footer>
        <img class="footerimage" src="/images/logo_nobg.png" alt="">
    </footer>
</div>

</body>
</html>