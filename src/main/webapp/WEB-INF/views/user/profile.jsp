<!DOCTYPE html>
<html lang="en">
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="../header.jsp" %>
<head>
    <title>VIAS | Profile</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <%--<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>--%>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    <link rel="stylesheet" href="/css/profile.css">

</head>
<style>
    body {
        font-family: Montserrat, serif;
    }
</style>
<body>

<div class="container">
    <div class="mapa-container">
        <button class="arrowbutton" onclick="window.location.href='/home'">
            <img src="/images/backarrow.png" alt="Go back!" width="30px">
        </button>
        <button class="circle-button" data-toggle="modal" data-target="#profilePhotoModal" style="background-image: url('/uploads/${user.getProfile_picture()}')">

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
            <a class="btn btn-primary buttons">

                Perfil de ${user.getUsername()}

            </a>

        </div>
    </div>

    <div class="info-container">
        <div class="primeiro-nome">
            <p id="firstt"><strong>Primeiro Nome</strong></p>
            <hr>
            <strong>${user.getFirst_name()}</strong>
        </div>
        <div class="info">
            <p class="nomes"><strong>Último Nome</strong></p>
            <hr>
            <strong>${user.getLast_name()}</strong>
        </div>

        <div class="info">
            <p class="nomes"><strong>Data de Nascimento</strong></p>
            <hr>
            <strong>${birthday}</strong>
        </div>

        <div class="info">
            <p class="nomes"><strong>Username</strong></p>
            <hr>
            <strong>${user.getUsername()}</strong>
        </div>

        <div class="info">
            <p class="nomes"><strong>Email</strong></p>
            <hr>
            <strong>${user.getEmail()}</strong>
        </div>

    </div>
</div>


<div class="footerlogo" onclick=window.location.href='/home'>
    <footer>
        <div class="footerimage" style="margin-top: 12px">
            <svg width="115" height="25" viewBox="0 0 196 45" fill="none" xmlns="http://www.w3.org/2000/svg">
                <path d="M18.24 45L-0.896 0.199997H12.8L28.928 38.984H20.864L37.376 0.199997H49.92L30.72 45H18.24ZM52.5425 45V0.199997H65.2145V45H52.5425ZM68.854 45L88.63 0.199997H101.11L120.95 45H107.766L92.278 6.408H97.27L81.782 45H68.854ZM79.67 36.296L82.934 26.952H104.822L108.086 36.296H79.67Z" fill="white"/>
                <path d="M177.001 24.6667L176.998 43.3333L196 38.0027L190.46 34.1147C193.142 30.656 194.643 26.408 194.64 22C194.64 10.9733 185.51 1.99999 174.284 1.99999C158.892 1.99999 155.246 16.3226 154.049 21.032C151.3 31.832 147.294 34 141.714 34C134.98 34 129.5 28.616 129.5 22C129.5 19.272 130.482 16.664 132.189 14.5547L138.999 19.3333V0.666656L120 5.99999L125.54 9.88532C122.858 13.344 121.357 17.592 121.357 22C121.357 33.0293 130.488 42 141.714 42C155.512 42 159.869 31.1413 161.948 22.968C164.849 11.5733 169.591 9.99999 174.284 9.99999C181.018 9.99999 186.498 15.3867 186.498 22.0054C186.5 24.7307 185.518 27.3387 183.811 29.448L177.001 24.6667Z" fill="#A3DD41"/>
            </svg>
        </div>
    </footer>
</div>

<div class="modal fade" id="profilePhotoModal" tabindex="-1" role="dialog" aria-labelledby="profilePhotoModalLabel" aria-hidden="true" data-backdrop="static">
    <div class="modal-dialog modal-dialog-centered" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="profilePhotoModalLabel">Upload Foto de Perfil</h5>

                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <%--<p id="uploadMessage">${uploadMessage}</p>--%>
                <form action="/upload" method="post" enctype="multipart/form-data">
                    <div class="form-group">
                        <label for="fileInput" style="margin-bottom: 1.5rem">Escolha uma foto de perfil:</label>
                        <input type="file" name="file" class="form-control-file" id="fileInput" accept="image/jpeg, image/png" required>
                        <h6 style="margin-top: 1.5rem">Tamanho máximo de ficheiro: 10MB</h6>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-dismiss="modal">Fechar</button>
                        <button type="submit" class="btn btn-primary">Upload</button>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>

</body>


</html>