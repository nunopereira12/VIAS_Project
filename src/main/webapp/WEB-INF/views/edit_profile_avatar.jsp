<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!doctype html>
<html lang="en">
<%@include file="header.jsp"%>
<head>
    <title>VIAS | Alterar foto de perfil</title>
    <link rel="stylesheet" href="/css/template.css">
    <link rel="stylesheet" href="/css/edit_profile.css">
    <link rel="stylesheet" href="/css/edit_profile_avatar.css">
</head>
<body>

<div class="container">
    <button class="arrowbutton" onclick="window.history.back();">
        <img src="/images/backarrow.png" alt="Go back!" width="30px">
    </button>
    <p class="title">Alterar foto de perfil</p>
    <div class="content">
        <div class="edit-box">
            <form action="/upload_avatar" method="post" enctype="multipart/form-data">
                <label class="circle-button" for="file-input">
                    ~Foto Perfil~
                    <svg xmlns="http://www.w3.org/2000/svg" width="56" height="52" viewBox="0 0 56 52" fill="none" class="bottom-right-image">
                        <!-- SVG content here -->
                    </svg>
                </label>

                <!-- Hidden file input element -->
                <input type="file" id="file-input" name="file" style="display: none;" accept="image/*">
                <div>
                    <input type="submit" value="Upload" class="uploadButton btn btn-primary buttons">
                </div>
            </form>

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