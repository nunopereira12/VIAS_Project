<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!doctype html>
<html lang="en">
<%@include file="../header.jsp" %>
<head>
    <title>VIAS | Sucesso de Pagamento</title>
    <link rel="stylesheet" href="/css/passwordrecovery.css">
</head>
<body id="login-page">

<div class="container">
    <button class="arrowbutton" onclick="window.location.href='/wallet';">
        <img src="/images/backarrow.png" alt="Go back!" width="30px">
    </button>
    <div class="content">
        <div class="image-container">
            <img class="imagelogo" src="images/logo_whitebg.png" >
        </div>
        <p class="title">O seu pagamento foi realizado com sucesso!</p>
        <p class="subtitle-text">Poderá consultar os seus títulos de transporte actualizados na Carteira.</p>

    </div>
</div>

<div class="footerlogo">
    <footer>
        <img class="footerimage" src="/images/logo_nobg.png" alt="">
    </footer>
</div>

</body>
</html>