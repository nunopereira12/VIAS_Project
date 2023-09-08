<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="en">
<%@include file="header.jsp"%>
<head>
    <title>Template</title>
    <link rel="stylesheet" href="/css/login.css">
</head>
<body id="login-page">
<div class="container">
    <a style="display: block" href="http://localhost:8080">
        <button class="arrowbutton">
            <img src="/images/backarrow.png" alt="Go back!" width="30px">
        </button>
    </a>
    <div class="content">
        <form action="/login" method="post" class="card p-3">
            <img class="imagelogo" src="images/logo_whitebg.png" alt="VIAS logo with white BG">
            <c:if test="${error != null}">
                <div class="alert alert-danger">
                        ${error}
                </div>
            </c:if>
            <div class="mb-3">
                <label for="email" class="form-label text-start">Email</label>
                <input type="email" name="email" class="form-control formtext" id="email" placeholder="Inserir email de usuário" required>
            </div>
            <div class="mb-3">
                <label for="password" class="form-label text-start">Senha</label>
                <input type="password" name="password" class="form-control formtext" id="password" placeholder="Inserir senha de usuário" required>
            </div>
            <div class="d-grid" >
                <button type="submit" id="buttonentry" class="btn btn-primary buttons" style="margin-bottom: 3rem;">Entrar</button>
            </div>
            <div class="d-grid">
                <button type="submit" class="btn btn-primary buttons">Registar</button>
            </div>
            <div class="d-grid">
                <button type="submit" class="btn btn-primary buttons">Recuperar Password</button>
            </div>
        </form>
    </div>
</div>
<div class="footerlogo">
    <jsp:include page="footer.jsp" />
</div>
</body>
</html>
