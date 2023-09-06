<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="en">

<%@include file="header.jsp"%>


<head><title>VIAS | Estamos na via</title>
    <link rel="stylesheet" href="/css/login.css"></head>


<body id="login-page">

<div class="container mt-5 loginbox">
    <div class="row justify-content-center">
        <div class="col-md-auto">
            <div class="signUp-container">
                <form action="/login" method="post" class="card p-3">
                    <img class="imagelogo" src="images/logo_whitebg.png" >
                    <c:if test="${error != null}">
                        <div class="alert alert-danger">
                                ${error}
                        </div>
                    </c:if>
                    <div class="mb-3">
                        <label  for="firstName" class="form-label text-start">Primeiro Nome</label>
                        <input type="firstName" name="firstName" class="form-control formtext" id="firstName" placeholder="Inserir primeiro nome" required>
                    </div>
                    <div class="mb-3">
                        <label for="lastName" class="form-label text-start">Último Nome</label>
                        <input type="lastName" name="lastName" class="form-control formtext" id="lastName" placeholder="Inserir último nome" required>
                    </div>
                    <div class="mb-3">
                        <label for="username" class="form-label text-start">Username VIAS League</label>
                        <input type="username" name="username" class="form-control formtext" id="username" placeholder="Inserir username para VIAS League" required>
                    </div>
                    <div class="mb-3">
                        <label for="birthday" class="form-label text-start">Data de Nascimento</label>
                        <input type="date" name="birthday" class="form-control formtext" id="birthday" placeholder="Seleccionar data de nascimento" required>
                    </div>
                    <div class="mb-3">
                        <label for="password" class="form-label text-start">Password</label>
                        <input type="password" name="password" class="form-control formtext" id="password" placeholder="Inserir a sua password" required>
                    </div>
                    <div class="mb-3">
                        <label for="confirmPassword" class="form-label text-start">Confirmar Password</label>
                        <input type="confirmPassword" name="confirmPassword" class="form-control formtext" id="confirmPassword" placeholder="Confirmar a sua password" required>
                    </div>
                    <label class="container-checkbox">
                        <input type="checkbox" checked="checked">*Li e aceito <a href="#" id="myBtn">os termos e condições</a>  da VIAS
                        <span class="checkmark"></span>
                    </label>
                    <div class="d-grid">
                        <button type="submit" class="btn btn-primary buttons">Registar</button>
                    </div>
                    <div class="d-grid"> <button type="submit" class="btn btn-primary buttons">Entrar</button> </div>

                </form>

            </div>
            <div class="col-md-auto text-center">
                <div class="footerlogo">
                    <jsp:include page="footer.jsp" />
                </div>
            </div>
        </div>
    </div>
</div>

</body>
</html>