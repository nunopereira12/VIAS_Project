<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="en">
<%@include file="../header.jsp" %>
<head>
    <title>VIAS | Estamos na via</title>
    <link rel="stylesheet" href="/css/login.css">
</head>
<body id="login-page">
<div class="container">
    <button class="arrowbutton" onclick="window.location.href='/home';">
        <img src="/images/backarrow.png" alt="Go back!" width="30px">
    </button>
    <div class="content">
        <form action="/perform_login" method="post" class="card p-3">
            <img class="imagelogo" src="images/logo_whitebg.png" alt="VIAS logo with white BG">
            <c:if test="${param.error != null}">
                <div class="alert alert-danger">
                        Credenciais incorrectas ou utilizador inactivo.
                </div>
            </c:if>
            <div class="mb-3">
                <label for="username" class="form-label text-start">Username ou E-mail</label>
                <input type="text" name="username" class="form-control formtext" id="username"
                       placeholder="Inserir email ou username" required>
            </div>
            <div class="mb-3">
                <label for="password" class="form-label text-start">Senha</label>
                <input type="password" name="password" class="form-control formtext" id="password"
                       placeholder="Inserir senha de usuário" required>
            </div>
            <div class="d-grid">
                <button type="submit" id="buttonentry" class="btn btn-primary buttons">
                    Entrar
                </button>
            </div>
        </form>

    </div>
    <div style="margin-bottom: 20px" class="content">
        <div class="d-grid card padb">
            <a href="/signup" class="btn btn-primary buttons">Registar</a>
        </div>

        <div class="d-grid card padb">
            <a href="/recover_password" class="btn btn-primary buttons">Recuperar Password</a>
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