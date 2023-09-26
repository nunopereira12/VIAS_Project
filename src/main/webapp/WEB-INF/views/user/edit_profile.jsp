<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!doctype html>
<html lang="en">
<%@include file="../header.jsp" %>
<head>
    <title>VIAS | Editar Informações</title>
    <link rel="stylesheet" href="/css/template.css">
    <link rel="stylesheet" href="/css/edit_profile.css">
</head>
<body>

<div class="container">
    <button class="arrowbutton" onclick="window.history.back();">
        <img src="/images/backarrow.png" alt="Go back!" width="30px">
    </button>
    <p class="title">Editar Informações</p>
    <div class="content">
        <div class="edit-box">
            <c:if test="${password_error != null}">
                <div class="alert alert-danger" >
                    <div id="password_text">
                        <p>${password_error}As passwords não coincidem.</p>
                        <p>Por favor, tente novamente.</p>
                    </div>
                </div>
            </c:if>
            <form method="post" action="/update_user" id="userForm">
                <div class="mb-3">
                    <label for="first_name" class="form-label text-start">Primeiro Nome</label>
                    <button class="svg-button float-end toggle-button" type="button" data-attribute="first_name">
                        <svg xmlns="http://www.w3.org/2000/svg" width="52" height="42" viewBox="0 0 56 52" fill="none"
                             class="svg-image">
                            <circle cx="25.5" cy="28.5" r="17.5" fill="white"/>
                            <mask id="mask0_305_3024" style="mask-type:alpha" maskUnits="userSpaceOnUse" x="14" y="16"
                                  width="24" height="24">
                                <rect x="14" y="16" width="24" height="24" fill="#D9D9D9"/>
                            </mask>
                            <g mask="url(#mask0_305_3024)">
                                <path d="M18.175 37C17.825 37.0834 17.5208 36.9959 17.2625 36.7375C17.0041 36.4792 16.9166 36.175 17 35.825L18 31.05L22.95 36L18.175 37ZM22.95 36L18 31.05L29.45 19.6C29.8333 19.2167 30.3083 19.025 30.875 19.025C31.4416 19.025 31.9166 19.2167 32.3 19.6L34.4 21.7C34.7833 22.0834 34.975 22.5584 34.975 23.125C34.975 23.6917 34.7833 24.1667 34.4 24.55L22.95 36ZM30.875 21L20.525 31.35L22.65 33.475L33 23.125L30.875 21Z"
                                      fill="#1C1B1F"/>
                            </g>
                        </svg>
                    </button>
                    <input type="text" name="first_name" class="form-control formtext" id="first_name"
                           value=${user.getFirst_name()} oninput="validateInput(this)" maxlength="25"
                           pattern="[A-Za-zÀ-ÿçÇ]+" disabled required>
                </div>
                <div class="mb-3">
                    <label for="last_name" class="form-label text-start">Último Nome</label>
                    <button class="svg-button float-end toggle-button" type="button" data-attribute="last_name">
                        <svg xmlns="http://www.w3.org/2000/svg" width="52" height="42" viewBox="0 0 56 52" fill="none"
                             class="svg-image">
                            <circle cx="25.5" cy="28.5" r="17.5" fill="white"/>
                            <mask id="mask0_305_3024" style="mask-type:alpha" maskUnits="userSpaceOnUse" x="14" y="16"
                                  width="24" height="24">
                                <rect x="14" y="16" width="24" height="24" fill="#D9D9D9"/>
                            </mask>
                            <g mask="url(#mask0_305_3024)">
                                <path d="M18.175 37C17.825 37.0834 17.5208 36.9959 17.2625 36.7375C17.0041 36.4792 16.9166 36.175 17 35.825L18 31.05L22.95 36L18.175 37ZM22.95 36L18 31.05L29.45 19.6C29.8333 19.2167 30.3083 19.025 30.875 19.025C31.4416 19.025 31.9166 19.2167 32.3 19.6L34.4 21.7C34.7833 22.0834 34.975 22.5584 34.975 23.125C34.975 23.6917 34.7833 24.1667 34.4 24.55L22.95 36ZM30.875 21L20.525 31.35L22.65 33.475L33 23.125L30.875 21Z"
                                      fill="#1C1B1F"/>
                            </g>
                        </svg>
                    </button>
                    <input type="text" name="last_name" class="form-control formtext" id="last_name"
                           value="${user.getLast_name()}" maxlength="25" pattern="[A-Za-zÀ-ÿçÇ]+" disabled required
                           oninput="validateLastName()">

                </div>
                <div class="mb-3">
                    <label for="date" class="form-label text-start">Data Nascimento</label>
                    <button class="svg-button float-end toggle-button" type="button" data-attribute="date">
                        <svg xmlns="http://www.w3.org/2000/svg" width="52" height="42" viewBox="0 0 56 52" fill="none"
                             class="svg-image">
                            <circle cx="25.5" cy="28.5" r="17.5" fill="white"/>
                            <mask id="mask0_305_3024" style="mask-type:alpha" maskUnits="userSpaceOnUse" x="14" y="16"
                                  width="24" height="24">
                                <rect x="14" y="16" width="24" height="24" fill="#D9D9D9"/>
                            </mask>
                            <g mask="url(#mask0_305_3024)">
                                <path d="M18.175 37C17.825 37.0834 17.5208 36.9959 17.2625 36.7375C17.0041 36.4792 16.9166 36.175 17 35.825L18 31.05L22.95 36L18.175 37ZM22.95 36L18 31.05L29.45 19.6C29.8333 19.2167 30.3083 19.025 30.875 19.025C31.4416 19.025 31.9166 19.2167 32.3 19.6L34.4 21.7C34.7833 22.0834 34.975 22.5584 34.975 23.125C34.975 23.6917 34.7833 24.1667 34.4 24.55L22.95 36ZM30.875 21L20.525 31.35L22.65 33.475L33 23.125L30.875 21Z"
                                      fill="#1C1B1F"/>
                            </g>
                        </svg>
                    </button>
                    <input type="date" name="date" class="form-control formtext" id="date" disabled required  min="1900-01-01">
                </div>
                <div class="mb-3 pass">
                    <label for="password" class="form-label text-start">Password *</label>
                    <button class="svg-button float-end toggle-button" type="button" data-attribute="password">
                        <svg xmlns="http://www.w3.org/2000/svg" width="52" height="42" viewBox="0 0 56 52" fill="none"
                             class="svg-image">
                            <circle cx="25.5" cy="28.5" r="17.5" fill="white"/>
                            <mask id="mask0_305_3024" style="mask-type:alpha" maskUnits="userSpaceOnUse" x="14" y="16"
                                  width="24" height="24">
                                <rect x="14" y="16" width="24" height="24" fill="#D9D9D9"/>
                            </mask>
                            <g mask="url(#mask0_305_3024)">
                                <path d="M18.175 37C17.825 37.0834 17.5208 36.9959 17.2625 36.7375C17.0041 36.4792 16.9166 36.175 17 35.825L18 31.05L22.95 36L18.175 37ZM22.95 36L18 31.05L29.45 19.6C29.8333 19.2167 30.3083 19.025 30.875 19.025C31.4416 19.025 31.9166 19.2167 32.3 19.6L34.4 21.7C34.7833 22.0834 34.975 22.5584 34.975 23.125C34.975 23.6917 34.7833 24.1667 34.4 24.55L22.95 36ZM30.875 21L20.525 31.35L22.65 33.475L33 23.125L30.875 21Z"
                                      fill="#1C1B1F"/>
                            </g>
                        </svg>
                    </button>
                    <input type="password" name="password" class="form-control formtext" id="password" disabled
                           required>
                </div>
                <div class="mb-3">
                    <label for="confirm_password" class="form-label text-start">Confirmar Password *</label>
                    <button class="svg-button float-end toggle-button" type="button" data-attribute="confirm_password">
                        <svg xmlns="http://www.w3.org/2000/svg" width="52" height="42" viewBox="0 0 56 52" fill="none"
                             class="svg-image">
                            <circle cx="25.5" cy="28.5" r="17.5" fill="white"/>
                            <mask id="mask0_305_3024" style="mask-type:alpha" maskUnits="userSpaceOnUse" x="14" y="16"
                                  width="24" height="24">
                                <rect x="14" y="16" width="24" height="24" fill="#D9D9D9"/>
                            </mask>
                            <g mask="url(#mask0_305_3024)">
                                <path d="M18.175 37C17.825 37.0834 17.5208 36.9959 17.2625 36.7375C17.0041 36.4792 16.9166 36.175 17 35.825L18 31.05L22.95 36L18.175 37ZM22.95 36L18 31.05L29.45 19.6C29.8333 19.2167 30.3083 19.025 30.875 19.025C31.4416 19.025 31.9166 19.2167 32.3 19.6L34.4 21.7C34.7833 22.0834 34.975 22.5584 34.975 23.125C34.975 23.6917 34.7833 24.1667 34.4 24.55L22.95 36ZM30.875 21L20.525 31.35L22.65 33.475L33 23.125L30.875 21Z"
                                      fill="#1C1B1F"/>
                            </g>
                        </svg>
                    </button>
                    <input type="password" name="confirm_password" class="form-control formtext" id="confirm_password"
                           disabled required>
                </div>

                <div class="d-grid">
                    <button type="submit" class="btn btn-primary buttons">Confirmar Alterações</button>
                    <p id="nota">*Nota: Com esta alteração, terá que voltar a iniciar sessão.</p>
                </div>
            </form>
        </div>
    </div>

</div>


<div class="footerlogo">
    <footer>
        <img class="footerimage" src="/images/logo_nobg.png" alt="">
    </footer>
</div>

<script>

    const toggleButtons = document.querySelectorAll('.toggle-button');
    const currentDate = new Date();
    const currentDateString = currentDate.toISOString().slice(0, 10);
    document.getElementById("date").setAttribute("max", currentDateString);

    toggleButtons.forEach((button) => {
        button.addEventListener('click', () => {
            const inputField = button.nextElementSibling;
            if (inputField.disabled) {
                inputField.removeAttribute('disabled');
            }
        });
    });

    function validateInput() {
        const inputElement = document.getElementById('first_name');
        const inputValue = inputElement.value;

        const sanitizedValue = inputValue.replace(/[^A-Za-zÀ-ÖØ-öø-ÿ]/g, '');

        const truncatedValue = sanitizedValue.slice(0, 25);

        inputElement.value = truncatedValue;
    }

    function validateLastName() {
        const inputElement = document.getElementById('last_name');
        const inputValue = inputElement.value;

        const sanitizedValue = inputValue.replace(/[^A-Za-zÀ-ÖØ-öø-ÿ]/g, '');

        const truncatedValue = sanitizedValue.slice(0, 25);

        inputElement.value = truncatedValue;
    }

    validateInput();
    validateLastName();

    const userBirthday = new Date("${user.getBirthday()}");

    const dateInput = document.getElementById("date");

    const formattedBirthday = userBirthday.toISOString().slice(0, 10);

    dateInput.value = formattedBirthday;


</script>
</body>
</html>