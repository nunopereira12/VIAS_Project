<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!doctype html>
<html lang="en">
<%@include file="header.jsp"%>
<head>
    <title>VIAS | Recuperação de Password</title>
    <link rel="stylesheet" href="/css/passwordrecovery.css">
</head>
<body>

<div class="container">
    <button class="arrowbutton" onclick="window.history.back()">
        <img src="/images/backarrow.png" alt="Go back!" width="30px">
    </button>
    <p class="title">Recuperar Password</p>
    <div class="content">
        <form class="card p-3" action="/recover_password" method="post" >
        <div class="mb-3">
            <label  for="email" class="form-label text-start">Insira o seu e-mail</label>
            <input type="email" name="email" class="form-control formtext" id="email" placeholder="Inserir e-mail" required>
        </div>

            <div class="d-grid">
                <button type="submit" class="btn btn-primary buttons">Confirmar</button>
            </div>
            <div class="d-grid">
                <button type="reset" class="btn btn-primary buttons" id="reset-button">Limpar</button>
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