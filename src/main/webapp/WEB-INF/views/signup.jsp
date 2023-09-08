<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!doctype html>
<html lang="en">
<%@include file="header.jsp"%>
<head>
    <title>VIAS - Registo</title>
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
        <form action="/signup_action" method="POST" class="card p-3">
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
                <input type="password" name="confirmPassword" class="form-control formtext" id="confirmPassword" placeholder="Confirmar a sua password" required>
            </div>
            <label class="container-checkbox">
                <input type="checkbox" checked="checked">Li e aceito <button class="termsbutton" data-bs-toggle="modal" data-bs-target="#exampleModal"> os termos e condições</button>  da VIAS
                <span class="checkmark"></span>
            </label>
            <!-- Modal -->
            <div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
                <div class="modal-dialog modal-dialog-centered">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h1 class="modal-title fs-5" id="exampleModalLabel" style="text-align: justify; margin-left: 15px; margin-right: 15px">Termos e Condições da VIAS e VIAS League</h1>
                            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                        </div>
                        <div class="modal-body" style="text-align: justify; margin-left: 15px; margin-right: 15px">
                            <p >Lorem ipsum dolor sit amet, consectetur adipiscing elit. Mauris viverra sem ut elit fermentum, ullamcorper egestas ante pulvinar. Nam scelerisque pulvinar aliquet. Interdum et malesuada fames ac ante ipsum primis in faucibus. Mauris placerat hendrerit risus, quis faucibus purus ultrices at. Integer sollicitudin tellus non elementum maximus. Nam suscipit condimentum lacus nec lobortis. Integer ut venenatis nulla. Phasellus vestibulum sem erat, eget luctus turpis auctor vitae. In hac habitasse platea dictumst. Proin ac arcu neque. Vestibulum feugiat euismod pellentesque. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. </p>

                            <p>Phasellus quis mollis diam. Vivamus id euismod arcu. Etiam sed nunc egestas, finibus est ut, pulvinar lacus. Cras egestas nisi nec eleifend consectetur. Sed ut neque vel dui vulputate eleifend at ut nibh. Ut sem risus, viverra vel massa eu, varius vehicula tortor. Vivamus nec sollicitudin arcu. Suspendisse id consequat lectus, nec commodo lorem. Nulla mattis consectetur neque, blandit pretium enim pretium ac. Suspendisse at erat felis. Aliquam vel consectetur augue, rutrum auctor sem. Mauris at mi dui. Maecenas vulputate feugiat pretium. Aenean sodales est ac finibus commodo. Nullam nisl risus, volutpat at elit sed, pulvinar malesuada risus. Vivamus scelerisque, purus et viverra tincidunt, lectus neque imperdiet quam, non tempor lacus leo sit amet dolor.</p>

                            <p>Morbi scelerisque dignissim purus, sit amet fermentum quam laoreet et. In cursus tortor at leo porttitor vestibulum. Suspendisse et cursus sem, volutpat commodo lorem. Praesent augue purus, hendrerit condimentum semper ut, volutpat ullamcorper lectus. Pellentesque varius lobortis ante sed mollis. Mauris ornare vestibulum ante, sed cursus nibh commodo a. Phasellus semper turpis quis porta dapibus. Aliquam non sapien quam. Duis mattis lectus nec diam consequat tristique. Suspendisse malesuada viverra consequat. Suspendisse mollis leo sed posuere varius. Mauris non nulla sit amet felis vulputate egestas. Integer sed vulputate nulla. Vestibulum sollicitudin velit elit, vitae volutpat orci ultricies vitae. Proin pellentesque elementum sapien pulvinar vestibulum. Cras id dui eu erat luctus euismod sit amet ac diam.</p>

                            <p>Phasellus sed justo felis. Sed sagittis maximus gravida. Donec non sagittis sapien. Curabitur faucibus elementum purus, vitae sollicitudin sapien lacinia eget. Pellentesque mollis ultrices sem, imperdiet semper dui cursus vel. Vestibulum egestas id purus ut molestie. Nam sit amet ex enim. Suspendisse sit amet molestie erat, eu bibendum metus. Morbi eget faucibus orci. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia curae; Ut aliquet odio non eros congue porttitor. Vivamus sed porta massa, a ornare ipsum. Pellentesque rhoncus et dui sit amet ornare. Aliquam ornare tellus quis tempor porttitor. </p>

                            <p>Nam posuere metus sit amet leo placerat egestas. Nam facilisis, diam nec laoreet aliquam, lorem dolor sollicitudin magna, elementum egestas augue dui eget purus. Aenean sem urna, lobortis vitae gravida malesuada, cursus et sapien. Proin convallis augue eu massa elementum, vitae dapibus lacus facilisis. Morbi malesuada, nisl vel dapibus tempus, lorem quam pretium velit, ut tincidunt purus mi aliquam libero. Nam gravida, erat in posuere scelerisque, risus erat euismod felis, quis ullamcorper ante justo id magna.</p>

                            <p> Phasellus ac pretium neque, vitae ultricies libero. Vestibulum et nulla in justo elementum sollicitudin. Suspendisse hendrerit massa ex. Phasellus et nisi tellus. Aenean laoreet dui vehicula enim congue sollicitudin. Aliquam eget tempus sapien. Donec nec porta tortor. </p>

                            <div class="modal-footer">
                                <button type="button" class="btn btn-primary buttons">Li os Termos e Condições</button>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!-- Botões de registo/login -->

            <div class="d-grid">
                <button type="submit" class="btn btn-primary buttons">Registar</button>
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