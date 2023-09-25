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
        <button class="arrowbutton" onclick="window.history.back()">
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


<div class="footerlogo">
    <footer>
        <img class="footerimage" src="images/logo_nobg.png" alt="">
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

<%--<script>
    $(document).ready(function () {
        // Check if the uploadMessage exists and is not empty
        var uploadMessage = '${uploadMessage}';
        if (uploadMessage && uploadMessage.trim().length > 0) {
            $('#profilePhotoModal').modal('show'); // Show the modal
        }
    });
</script>--%>

</html>