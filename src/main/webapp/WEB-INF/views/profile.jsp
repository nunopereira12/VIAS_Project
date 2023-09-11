<!DOCTYPE html>
<html lang="en">

<%@include file="header.jsp" %>
<head>
    <title>VIAS | Profile</title>
    <link rel="stylesheet" href="/css/profile.css">
</head>
<body>

<div class="container">
    <div class="mapa-container">
        <a style="display: block" href="http://localhost:8080/home">
            <button class="arrowbutton">
                <img src="/images/backarrow.png" alt="Go back!" width="30px">
            </button>
        </a>

        <button class="circle-button">
            ~~Imagem~~
        </button>

        <img class="mapa mapa-shadow" src="/images/map1.png" alt="~~api inbound">
    </div>

    <div class="edit-container">
        <div class="d-grid">
            <a href="/home" class="btn btn-primary buttons">${userr.getFullName()}</a>
        </div>
    </div>

    <div class="info-container">
        <div class="primeiro-nome">
            <p>Primeiro Nome</p>
            <hr>
            <strong>${userr.getFirstName()}</strong>
        </div>
        <div class="ultimo-nome">
            <p>Ultimo Nome</p>
            <hr>
            <strong>${userr.getLastName()}</strong>
        </div>

        <div class="data-nascimento">
            <p>Data de Nascimento</p>
            <hr>
            <strong>${userr.getLastName()}</strong>
        </div>

        <div class="usernamee">
            <p>Username</p>
            <hr>
            <strong>${userr.getLastName()}</strong>
        </div>

        <div class="emaill">
            <p>Email</p>
            <hr>
            <strong>${userr.getLastName()}</strong>
        </div>

    </div>
</div>

<%--<div class="container">

</div>--%>


<div class="footerlogo">
    <footer>
        <img class="footerimage" src="images/logo_nobg.png" alt="">
    </footer>
</div>

</body>
</html>