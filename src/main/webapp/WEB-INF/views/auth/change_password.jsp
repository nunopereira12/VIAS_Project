<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!doctype html>
<html lang="en">
<%@include file="../header.jsp"%>
<head>
    <title>VIAS - Repôr Palavra-Chave</title>
    <link rel="stylesheet" href="/css/login.css">
</head>
<body id="login-page">

<div class="container">
    <button class="arrowbutton" onclick="window.location.href='/login';">
        <img src="/images/backarrow.png" alt="Go back!" width="30px">
    </button>
    <div class="content">
        <form action="/set_password" method="POST" class="card p-3">
            <!-- Hidden input to store the token ID -->
            <input type="hidden" name="tokenID" value="${tokenID}">
            <img class="imagelogo" src="/images/logo_whitebg.png">
            <c:if test="${param.password_error != null}">
                <div class="alert alert-danger">
                        <p>${password_error}erro</p>
                </div>
            </c:if>
            <div class="mb-3">
                <label for="password" class="form-label text-start">Password</label>
                <input type="password" name="password" class="form-control formtext" id="password" placeholder="Inserir a sua nova password" required>
            </div>
            <div class="mb-3">
                <label for="confirmPassword" class="form-label text-start">Confirmar Password</label>
                <input type="password" name="confirm_password" class="form-control formtext" id="confirmPassword" placeholder="Confirmar a sua nova password" required>
            </div>
            <div class="d-grid">
                <button type="submit" class="btn btn-primary buttons">Alterar Palavra-Chave</button>
            </div>
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