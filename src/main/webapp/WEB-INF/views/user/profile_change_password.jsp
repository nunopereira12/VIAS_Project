<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!doctype html>
<html lang="en">
<%@include file="../header.jsp"%>
<head>
    <title>VIAS | Registo com sucesso</title>
    <link rel="stylesheet" href="/css/profile_change_password.css">
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
        <p class="title">Palavra-passe actualizada.</p>
        <p class="subtitle-text">Será redirecionado para a página de login após alguns segundos.
            Por favor, aguarde.</p>


    </div>
</div>

<div class="footerlogo">
    <footer>
        <img class="footerimage" src="images/logo_nobg.png" alt="">
    </footer>
</div>

<script>
    setTimeout(function () {
        window.location.href = '/logout';
    }, 5000);
</script>

</body>
</html>