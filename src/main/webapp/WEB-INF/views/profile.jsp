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
            ~Foto Perfil~
            <svg xmlns="http://www.w3.org/2000/svg" width="56" height="52" viewBox="0 0 56 52" fill="none" class="bottom-right-image">
                <circle cx="25.5" cy="28.5" r="17.5" fill="white"/>
                <mask id="mask0_305_3024" style="mask-type:alpha" maskUnits="userSpaceOnUse" x="14" y="16" width="24" height="24">
                    <rect x="14" y="16" width="24" height="24" fill="#D9D9D9"/>
                </mask>
                <g mask="url(#mask0_305_3024)">
                    <path d="M18.175 37C17.825 37.0834 17.5208 36.9959 17.2625 36.7375C17.0041 36.4792 16.9166 36.175 17 35.825L18 31.05L22.95 36L18.175 37ZM22.95 36L18 31.05L29.45 19.6C29.8333 19.2167 30.3083 19.025 30.875 19.025C31.4416 19.025 31.9166 19.2167 32.3 19.6L34.4 21.7C34.7833 22.0834 34.975 22.5584 34.975 23.125C34.975 23.6917 34.7833 24.1667 34.4 24.55L22.95 36ZM30.875 21L20.525 31.35L22.65 33.475L33 23.125L30.875 21Z" fill="#1C1B1F"/>
                </g>
            </svg>
        </button>

        <img class="mapa mapa-shadow" src="/images/map1.png" alt="~~api inbound">
    </div>

    <div class="edit-container">
        <div class="d-grid">
            <a href="/edit_profile" class="btn btn-primary buttons">
                <svg xmlns="http://www.w3.org/2000/svg" width="56" height="52" viewBox="0 0 56 52" fill="none">
                    <circle cx="25.5" cy="28.5" r="17.5" fill="white"/>
                    <mask id="mask0_305_3024" style="mask-type:alpha" maskUnits="userSpaceOnUse" x="14" y="16" width="24" height="24">
                        <rect x="14" y="16" width="24" height="24" fill="#D9D9D9"/>
                    </mask>
                    <g mask="url(#mask0_305_3024)">
                        <path d="M18.175 37C17.825 37.0834 17.5208 36.9959 17.2625 36.7375C17.0041 36.4792 16.9166 36.175 17 35.825L18 31.05L22.95 36L18.175 37ZM22.95 36L18 31.05L29.45 19.6C29.8333 19.2167 30.3083 19.025 30.875 19.025C31.4416 19.025 31.9166 19.2167 32.3 19.6L34.4 21.7C34.7833 22.0834 34.975 22.5584 34.975 23.125C34.975 23.6917 34.7833 24.1667 34.4 24.55L22.95 36ZM30.875 21L20.525 31.35L22.65 33.475L33 23.125L30.875 21Z" fill="#1C1B1F"/>
                    </g>
                </svg>

                ${userr.getFullName()}

            </a>

        </div>
    </div>

    <div class="info-container">
        <div class="primeiro-nome">
            <p id="firstt"><strong>Primeiro Nome</strong></p>
            <hr>
            <strong>${userr.getFirstName()}</strong>
        </div>
        <div class="info">
            <p class="nomes"><strong>Ultimo Nome</strong></p>
            <hr>
            <strong>${userr.getLastName()}</strong>
        </div>

        <div class="info">
            <p class="nomes"><strong>Data de Nascimento</strong></p>
            <hr>
            <strong>${userr.formatDateToDDMMYY(userr.getBirthday())}</strong>
        </div>

        <div class="info">
            <p class="nomes"><strong>Username</strong></p>
            <hr>
            <strong>${userr.getUsername()}</strong>
        </div>

        <div class="info">
            <p class="nomes"><strong>Email</strong></p>
            <hr>
            <strong>${userr.getEmail()}</strong>
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