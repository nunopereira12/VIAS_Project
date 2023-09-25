<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!doctype html>
<html lang="en">
<%@include file="../header.jsp"%>
<head>
    <title>VIAS | Registo com sucesso</title>
    <link rel="stylesheet" href="/css/passwordrecovery.css">
</head>
<body id="login-page">

<div class="container">
    <button class="arrowbutton" onclick="window.location.href='/login';">
        <img src="/images/backarrow.png" alt="Go back!" width="30px">
    </button>
    <div class="content">

        <div class="image-container">
            <img class="imagelogo" src="images/logo_whitebg.png" >
        </div>
        <p class="title">E-mail enviado.</p>
            <p class="subtitle-text">Bem-vindo(a)! Enviamos um email de ativação para completar o processo.
                Por favor, verifique a sua caixa de entrada e siga as instruções.</p>

    </div>
</div>

<div class="footerlogo">
    <footer>
        <img class="footerimage" src="/images/logo_nobg.png" alt="">
    </footer>
</div>

</body>
</html>