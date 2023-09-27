<%--
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
    <button class="arrowbutton" onclick="window.history.back()">
        <img src="/images/backarrow.png" alt="Go back!" width="30px">
    </button>
    <div class="content">
        <form action="/signup_action" method="POST" class="card p-3">
            <img class="imagelogo" src="images/logo_whitebg.png" >
            <c:if test="${error != null}">
                <div class="alert alert-danger">
                        ${error}
                </div>
            </c:if>
            <c:if test="${error2 != null}">
                <div class="alert alert-danger">
                        ${error2}
                </div>
            </c:if>
            <c:if test="${error3 != null}">
                <div class="alert alert-danger">
                        ${error3}
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
                <label for="email" class="form-label text-start">E-mail</label>
                <input type="email" name="email" class="form-control formtext" id="email" placeholder="Inserir o seu e-mail" required>
            </div>
            <div class="mb-3">
                <label for="birthday" class="form-label text-start">Data de Nascimento</label>
                <input type="date" name="DOB" class="form-control formtext" id="birthday" placeholder="Seleccionar data de nascimento" required>
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
                <input type="checkbox" id="myCheckbox"  required>Li e aceito <button class="termsbutton" data-bs-toggle="modal" data-bs-target="#exampleModal"> os termos e condições</button>  da VIAS
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
                                <button type="button" class="btn btn-primary buttons" id="enableCheckbox">Li os Termos e Condições</button>
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

<script>
    /*var modalButton = document.querySelector('#enableCheckbox'); // Replace with the actual class or ID of your modal button
    var myCheckbox = document.getElementById('myCheckbox');
    var myModal = new bootstrap.Modal(document.getElementById('exampleModal')); // Replace with the actual ID of your modal


    modalButton.addEventListener('click', function () {
        myCheckbox.removeAttribute('disabled');
        myModal.hide(); // Close the modal

    });
    */




</script>

</body>
</html>--%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!doctype html>
<html lang="en">
<%@include file="../header.jsp" %>
<head>
    <title>VIAS - Registo</title>
    <link rel="stylesheet" href="/css/login.css">
</head>
<body id="login-page">

<div class="container">
    <button class="arrowbutton" onclick="window.history.back()">
        <img src="/images/backarrow.png" alt="Go back!" width="30px">
    </button>
    <div class="content">
        <form action="/signup_action" method="POST" class="card p-3" onsubmit="return validateCheckbox()">
            <div class="top_image" id="top_message">
                <svg width="270" height="60" viewBox="0 0 196 45" fill="none" xmlns="http://www.w3.org/2000/svg">
                    <path d="M19.24 45L0.104 0.199997H13.8L29.928 38.984H21.864L38.376 0.199997H50.92L31.72 45H19.24ZM53.5425 45V0.199997H66.2145V45H53.5425ZM69.854 45L89.63 0.199997H102.11L121.95 45H108.766L93.278 6.408H98.27L82.782 45H69.854ZM80.67 36.296L83.934 26.952H105.822L109.086 36.296H80.67Z" fill="#004A89"/>
                    <path d="M176.667 25.6667L176.665 44.3334L195.667 39.0027L190.127 35.1147C192.809 31.656 194.31 27.408 194.307 23C194.307 11.9734 185.176 3.00002 173.95 3.00002C158.558 3.00002 154.913 17.3227 153.716 22.032C150.967 32.832 146.961 35 141.38 35C134.646 35 129.166 29.616 129.166 23C129.166 20.272 130.149 17.664 131.856 15.5547L138.666 20.3334V1.66669L119.667 7.00002L125.206 10.8854C122.525 14.344 121.024 18.592 121.024 23C121.024 34.0294 130.154 43 141.38 43C155.179 43 159.535 32.1414 161.614 23.968C164.516 12.5734 169.258 11 173.95 11C180.684 11 186.164 16.3867 186.164 23.0054C186.167 25.7307 185.184 28.3387 183.477 30.448L176.667 25.6667Z" fill="#A3DD41"/>
                </svg>
            </div>

            <c:if test="${error_message != null}">
                <div class="alert alert-danger">
                        ${error_message}
                </div>
            </c:if>


            <div class="mb-3">
                <label for="firstName" class="form-label text-start">Primeiro Nome</label>
                <input type="text" name="first_name" class="form-control formtext" id="firstName"
                       placeholder="Inserir primeiro nome" required>
            </div>
            <div class="mb-3">
                <label for="lastName" class="form-label text-start">Último Nome</label>
                <input type="lastName" name="last_name" class="form-control formtext" id="lastName"
                       placeholder="Inserir último nome" required>
            </div>
            <div class="mb-3">
                <label for="username" class="form-label text-start">Username VIAS League</label>
                <input type="username" name="username" class="form-control formtext" id="username"
                       placeholder="Inserir username para VIAS League" required>
            </div>
            <div class="mb-3">
                <label for="email" class="form-label text-start">E-mail</label>
                <input type="email" name="email" class="form-control formtext" id="email"
                       placeholder="Inserir o seu e-mail" required>
            </div>
            <div class="mb-3">
                <label for="birthday" class="form-label text-start">Data de Nascimento</label>
                <input type="date" name="birthday" class="form-control formtext" id="birthday"
                       placeholder="Seleccionar data de nascimento" required min="1900-01-01">
            </div>
            <div class="mb-3">
                <label for="password" class="form-label text-start">Password</label>
                <input type="password" name="password" class="form-control formtext" id="password"
                       placeholder="Inserir a sua password" required>
            </div>
            <div class="mb-3">
                <label for="confirmPassword" class="form-label text-start">Confirmar Password</label>
                <input type="password" name="confirm_password" class="form-control formtext" id="confirmPassword"
                       placeholder="Confirmar a sua password" required>
            </div>
            <label class="container-checkbox" style="display: flex; align-items: center">
                <input style="margin-right: 5px" type="checkbox" id="myCheckbox" disabled
                       required ${termsAndConditionsChecked ? 'checked' : ''}><span class="termstext">Li e aceito
                <button type="button" class="termsbutton" data-bs-toggle="modal" data-bs-target="#exampleModal"> os
                    termos e condições
                </button>
                da VIAS</span>

                <span class="checkmark"></span>
            </label>
            <!-- Modal -->
            <div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel"
                 aria-hidden="true">
                <div class="modal-dialog modal-dialog-centered">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h1 class="modal-title fs-5" id="exampleModalLabel" style="">TERMOS E CONDIÇÕES DA VIAS E
                                VIAS LEAGUE </h1>
                            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                        </div>
                        <div class="modal-body" style="text-align: justify; margin-left: 20px; margin-right: 20px">
                            <h5>1. Introdução </h5>

                            <p> Bem-vindo aos Termos e Condições de Uso ("Termos") da aplicação "VIAS" e do jogo "VIAS
                                League" (coletivamente referidos como "Serviços"), desenvolvidos e mantidos por Grupo
                                VIAS da Turma 2 de JAVA 2023 do UpSkill na Start-Up de Sintra. Ao acessar ou usar nossos
                                Serviços, você concorda em cumprir e estar vinculado a estes Termos. Se você não
                                concordar com estes Termos, por favor, não utilize nossos Serviços.</p>

                            <h5>2. Uso dos Serviços</h5>

                            <h6> 2.1. Requisitos de Idade: </h6>
                            <p>Você deve ter pelo menos 10 anos de idade para usar nossos Serviços. Se você é menor de
                                18 anos, certifique-se de que seu responsável legal concorda com estes Termos em seu
                                nome.</p>

                            <h6>2.2. Acesso à API da Google Maps: </h6>
                            <p>Nossos Serviços podem utilizar a API da Google Maps para fornecer informações de
                                localização e navegação. O uso da API da Google Maps está sujeito aos Termos de Serviço
                                da Google Maps, disponíveis no seu próprio site. Você concorda em cumprir esses termos
                                ao usar nossos Serviços.</p>

                            <h6>2.3. VIAS League: </h6>
                            <p>A VIAS League é um jogo que faz parte de nossos Serviços. O uso da VIAS League está
                                sujeito a termos e condições adicionais específicos do jogo, que serão apresentados
                                quando você acessar o jogo.</p>

                            <h5>3. Conta do Utilizador</h5>

                            <h6> 3.1. Registro de Conta: </h6>
                            <p>Para acessar alguns recursos de nossos Serviços, você pode precisar criar uma conta de
                                usuário. Ao fazer isso, você concorda em fornecer informações precisas e
                                atualizadas.</p>

                            <h6> 3.2. Credenciais de Acesso: </h6>
                            <p> Você é responsável por manter a confidencialidade de suas credenciais de acesso (nome de
                                utilizador e senha) e por todas as atividades que ocorrerem na conta. Você concorda em
                                nos notificar imediatamente sobre qualquer uso não autorizado da sua conta.</p>

                            <h5>4. Privacidade</h5>

                            <p>Nossa Política de Privacidade, disponível nas definições da aplicaação, acessível antes
                                criar conta, descreve como coletamos, usamos e protegemos suas informações pessoais ao
                                usar nossos Serviços. Ao usar os nossos Serviços, você concorda com a coleta e o uso de
                                suas informações conforme descrito em nossa Política de Privacidade.</p>

                            <h6>5. Propriedade Intelectual</h6>

                            <h5> 5.1. Direitos Autorais: </h5>
                            <p>Todos os direitos autorais, marcas registradas, e outros direitos de propriedade
                                intelectual relacionados aos Serviços são de propriedade exclusiva do Grupo VIAS da
                                Turma 2 de JAVA 2023 do UpSkill na Start-Up de Sintra ou de nossos licenciantes.</p>

                            <h6> 5.2. Uso Permitido:</h6>
                            <p>Você pode usar nossos Serviços apenas para fins pessoais e não comerciais. Você não pode
                                copiar, modificar, distribuir, exibir, transmitir ou criar obras derivadas dos Serviços,
                                exceto conforme permitido expressamente por estes Termos.</p>

                            <h5> 6. Rescisão </h5>

                            <p>Podemos encerrar ou suspender sua conta e acesso aos nossos Serviços a qualquer momento,
                                com ou sem motivo, sem aviso prévio. </p>

                            <h5>7. Isenção de Responsabilidade</h5>

                            <h6>7.1. Uso por Sua Conta e Risco: </h6>
                            <p> O uso de nossos Serviços é por sua conta e risco. Não garantimos a precisão,
                                disponibilidade ou desempenho de nossos Serviços.</p>

                            <h6>7.2. Exclusão de Danos: </h6>
                            <p> Em nenhuma circunstância, Grupo VIAS será responsável por quaisquer danos diretos,
                                indiretos, incidentais, especiais, punitivos ou consequentes decorrentes do uso ou da
                                incapacidade de usar os nossos Serviços.</p>

                            <h5>8. Disposições Gerais</h5>

                            <h6>8.1. Lei Aplicável: </h6>
                            <p>Estes Termos serão regidos e interpretados de acordo com as leis de Portugal, excluindo
                                qualquer conflito de princípios legais.</p>

                            <h6>8.2. Alterações nos Termos:</h6>
                            <p>Reservamo-nos o direito de modificar ou atualizar estes Termos a qualquer momento, e tais
                                alterações entrarão em vigor após a publicação em nossos Serviços. É sua
                                responsabilidade revisar periodicamente estes Termos para estar ciente de qualquer
                                alteração.</p>

                            <h6>8.3. Contato: </h6>
                            <p>Para entrar em contato conosco sobre estes Termos ou qualquer outra questão relacionada
                                aos nossos Serviços, envie um e-mail para the.vias.app@gmail.com.
                                Ao utilizar nossos Serviços, você concorda com estes Termos e Condições de Uso. Se você
                                não concordar com qualquer parte destes Termos, por favor, não use nossos Serviços.</p>

                            <div class="modal-footer">
                                <button type="button" class="btn btn-primary buttons" id="enableCheckbox">Confirmo que
                                    li os Termos e Condições
                                </button>
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

        <div id="customAlert" class="custom-alert">
            <div class="custom-alert-content">
                <span class="custom-alert-close" onclick="closeCustomAlert()">&times;</span>
                <h2>Atenção!</h2>
                <p>Deve abrir, ler e aceitar os termos e condições para se poder registar.</p>
                <button onclick="closeCustomAlert()">OK</button>
            </div>
        </div>

    </div>
</div>

<div class="footerlogo">
    <footer>
        <div class="footerimage" style="margin-top: 12px">
            <svg width="115" height="25" viewBox="0 0 196 45" fill="none" xmlns="http://www.w3.org/2000/svg">
                <path d="M18.24 45L-0.896 0.199997H12.8L28.928 38.984H20.864L37.376 0.199997H49.92L30.72 45H18.24ZM52.5425 45V0.199997H65.2145V45H52.5425ZM68.854 45L88.63 0.199997H101.11L120.95 45H107.766L92.278 6.408H97.27L81.782 45H68.854ZM79.67 36.296L82.934 26.952H104.822L108.086 36.296H79.67Z" fill="white"/>
                <path d="M177.001 24.6667L176.998 43.3333L196 38.0027L190.46 34.1147C193.142 30.656 194.643 26.408 194.64 22C194.64 10.9733 185.51 1.99999 174.284 1.99999C158.892 1.99999 155.246 16.3226 154.049 21.032C151.3 31.832 147.294 34 141.714 34C134.98 34 129.5 28.616 129.5 22C129.5 19.272 130.482 16.664 132.189 14.5547L138.999 19.3333V0.666656L120 5.99999L125.54 9.88532C122.858 13.344 121.357 17.592 121.357 22C121.357 33.0293 130.488 42 141.714 42C155.512 42 159.869 31.1413 161.948 22.968C164.849 11.5733 169.591 9.99999 174.284 9.99999C181.018 9.99999 186.498 15.3867 186.498 22.0054C186.5 24.7307 185.518 27.3387 183.811 29.448L177.001 24.6667Z" fill="#A3DD41"/>
            </svg>
        </div>
    </footer>
</div>

<script>
    var modalButton = document.querySelector('#enableCheckbox');
    var myCheckbox = document.getElementById('myCheckbox');
    var myModal = new bootstrap.Modal(document.getElementById('exampleModal'));
    const currentDate = new Date();
    const currentDateString = currentDate.toISOString().slice(0, 10);
    document.getElementById("birthday").setAttribute("max", currentDateString);


    modalButton.addEventListener('click', function () {
        myCheckbox.removeAttribute('disabled');
        myModal.hide(); // Close the modal

    });

    /*function validateCheckbox() {
        if (!myCheckbox.checked) {
            alert("Você deve aceitar os termos e condições para se registrar.");
            return false; // Prevent form submission
        }
        return true; // Allow form submission
    }*/

    function openCustomAlert() {
        document.getElementById('customAlert').style.display = 'flex';
    }

    function closeCustomAlert() {
        document.getElementById('customAlert').style.display = 'none';
    }

    function validateCheckbox() {
        var myCheckbox = document.getElementById('myCheckbox');
        if (!myCheckbox.checked) {
            openCustomAlert();
            return false; // Prevent form submission
        }
        return true; // Allow form submission
    }

</script>

<script>

    var signupFormExists = ${not empty signupForm};

    if (signupFormExists) {
        var firstNameFromServer = "${signupForm.first_name}";
        var lastNameFromServer = "${signupForm.last_name}";
        var birthdayFromServer = "${signupForm.birthday}";

        var usernameFromServer = "${signupForm.username}";
        var emailFromServer = "${signupForm.email}";


        document.getElementById("firstName").value = firstNameFromServer;
        document.getElementById("lastName").value = lastNameFromServer;
        document.getElementById("birthday").value = birthdayFromServer;

        document.getElementById("username").value = usernameFromServer;
        document.getElementById("email").value = emailFromServer;


        var error = "${error_message}"
        if(error.includes("Username")) {
            document.getElementById("username").value = "";
        }
        if(error.includes("Email")) {
            document.getElementById("email").value = "";
        }
    }

</script>


</body>
</html>
