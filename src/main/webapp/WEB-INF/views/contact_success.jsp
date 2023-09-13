<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!doctype html>
<html lang="en">
<%@include file="header.jsp"%>
<head>
    <title>VIAS | Contacto</title>
    <link rel="stylesheet" href="/css/passwordrecovery.css">
</head>
<body id="login-page">

<div class="container">
    <button class="arrowbutton" onclick="window.location.href='/passwordrecovery';">
        <img src="/images/backarrow.png" alt="Go back!" width="30px">
    </button>
    <div class="content">
        <form action="/signup_action" method="POST" class="card p-3">
            <img class="imagelogo" src="images/logo_whitebg.png" >
            <p class="title">E-mail enviado.</p>
            <p>Agradecemos o seu contacto. Iremos responder o mais brevemente possível!</p>
        </form>
    </div>
</div>

<div class="footerlogo">
    <footer>
        <img class="footerimage" src="images/logo_nobg.png" alt="">
    </footer>
</div>

</body>
</html>