<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!doctype html>
<html lang="en">
<%@include file="../header.jsp"%>
<head>
    <title>VIAS | Definições</title>
    <link rel="stylesheet" href="/css/template.css">
    <link rel="stylesheet" href="/css/settings.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

</head>
<body>

<div class="container">
    <button class="arrowbutton" onclick="window.history.back()">
        <img src="/images/backarrow.png" alt="Go back!" width="30px">
    </button>
    <p class="title">Definições</p>
    <div class="content">
        <div class="settings-box">
            <a href="/edit_profile"><button class="button">Definições de Conta</button></a>
            <button class="button" data-bs-toggle="modal" data-bs-target="#termsModal">Termos e Condições</button>
            <button class="button" data-bs-toggle="modal" data-bs-target="#privacyModal">Política de Privacidade</button>
            <button class="button" data-bs-toggle="modal" data-bs-target="#shareModal">Partilhar a VIAS</button>
        </div>

    </div>

    <!-- Modal Terms -->
    <div class="modal fade" id="termsModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
        <div class="modal-dialog modal-dialog-centered">
            <div class="modal-content">
                <div class="modal-header">
                    <h1 class="modal-title fs-5" id="exampleModalLabel" style="text-align: justify; margin-left: 15px; margin-right: 15px">Termos e Condições da VIAS e VIAS League</h1>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body query" style="text-align: justify; margin-left: 15px; margin-right: 15px">
                    <h5>1. Introdução </h5>

                    <p> Bem-vindo aos Termos e Condições de Uso ("Termos") da aplicação "VIAS" e do jogo "VIAS League" (coletivamente referidos como "Serviços"), desenvolvidos e mantidos por Grupo VIAS da Turma 2 de JAVA 2023 do UpSkill na Start-Up de Sintra. Ao acessar ou usar nossos Serviços, você concorda em cumprir e estar vinculado a estes Termos. Se você não concordar com estes Termos, por favor, não utilize nossos Serviços.</p>

                    <h5>2. Uso dos Serviços</h5>

                    <h6> 2.1. Requisitos de Idade: </h6><p>Você deve ter pelo menos 10 anos de idade para usar nossos Serviços. Se você é menor de 18 anos, certifique-se de que seu responsável legal concorda com estes Termos em seu nome.</p>

                    <h6>2.2. Acesso à API da Google Maps: </h6>
                    <p>Nossos Serviços podem utilizar a API da Google Maps para fornecer informações de localização e navegação. O uso da API da Google Maps está sujeito aos Termos de Serviço da Google Maps, disponíveis no seu próprio site. Você concorda em cumprir esses termos ao usar nossos Serviços.</p>

                    <h6>2.3. VIAS League: </h6>
                    <p>A VIAS League é um jogo que faz parte de nossos Serviços. O uso da VIAS League está sujeito a termos e condições adicionais específicos do jogo, que serão apresentados quando você acessar o jogo.</p>

                    <h5>3. Conta do Utilizador</h5>

                    <h6> 3.1. Registro de Conta: </h6>
                    <p>Para acessar alguns recursos de nossos Serviços, você pode precisar criar uma conta de usuário. Ao fazer isso, você concorda em fornecer informações precisas e atualizadas.</p>

                    <h6> 3.2. Credenciais de Acesso: </h6>
                    <p> Você é responsável por manter a confidencialidade de suas credenciais de acesso (nome de utilizador e senha) e por todas as atividades que ocorrerem na conta. Você concorda em nos notificar imediatamente sobre qualquer uso não autorizado da sua conta.</p>

                    <h5>4. Privacidade</h5>

                    <p>Nossa Política de Privacidade, disponível nas definições da aplicaação, acessível antes criar conta, descreve como coletamos, usamos e protegemos suas informações pessoais ao usar nossos Serviços. Ao usar os nossos Serviços, você concorda com a coleta e o uso de suas informações conforme descrito em nossa Política de Privacidade.</p>

                    <h6>5. Propriedade Intelectual</h6>

                    <h5> 5.1. Direitos Autorais: </h5>
                    <p>Todos os direitos autorais, marcas registradas, e outros direitos de propriedade intelectual relacionados aos Serviços são de propriedade exclusiva do Grupo VIAS da Turma 2 de JAVA 2023 do UpSkill na Start-Up de Sintra ou de nossos licenciantes.</p>

                    <h6> 5.2. Uso Permitido:</h6>
                    <p>Você pode usar nossos Serviços apenas para fins pessoais e não comerciais. Você não pode copiar, modificar, distribuir, exibir, transmitir ou criar obras derivadas dos Serviços, exceto conforme permitido expressamente por estes Termos.</p>

                    <h5> 6. Rescisão </h5>

                    <p>Podemos encerrar ou suspender sua conta e acesso aos nossos Serviços a qualquer momento, com ou sem motivo, sem aviso prévio. </p>

                    <h5>7. Isenção de Responsabilidade</h5>

                    <h6>7.1. Uso por Sua Conta e Risco: </h6>
                    <p> O uso de nossos Serviços é por sua conta e risco. Não garantimos a precisão, disponibilidade ou desempenho de nossos Serviços.</p>

                    <h6>7.2. Exclusão de Danos: </h6>
                    <p> Em nenhuma circunstância, Grupo VIAS será responsável por quaisquer danos diretos, indiretos, incidentais, especiais, punitivos ou consequentes decorrentes do uso ou da incapacidade de usar os nossos Serviços.</p>

                    <h5>8. Disposições Gerais</h5>

                    <h6>8.1. Lei Aplicável: </h6>
                    <p>Estes Termos serão regidos e interpretados de acordo com as leis de Portugal, excluindo qualquer conflito de princípios legais.</p>

                    <h6>8.2. Alterações nos Termos:</h6>
                    <p>Reservamo-nos o direito de modificar ou atualizar estes Termos a qualquer momento, e tais alterações entrarão em vigor após a publicação em nossos Serviços. É sua responsabilidade revisar periodicamente estes Termos para estar ciente de qualquer alteração.</p>

                    <h6>8.3. Contato: </h6>
                    <p>Para entrar em contato conosco sobre estes Termos ou qualquer outra questão relacionada aos nossos Serviços, envie um e-mail para the.vias.app@gmail.com.
                        Ao utilizar nossos Serviços, você concorda com estes Termos e Condições de Uso. Se você não concordar com qualquer parte destes Termos, por favor, não use nossos Serviços.</p>

                    <div class="modal-footer">
                        <button type="button" class="btn btn-primary buttons" id="termsButton">Confirmo que li os Termos e Condições</button>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- Modal Privacy Policy -->
    <div class="modal fade" id="privacyModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
        <div class="modal-dialog modal-dialog-centered">
            <div class="modal-content">
                <div class="modal-header">
                    <h1 class="modal-title fs-5" id="privacyModalLabel" style="text-align: center; margin-left: 15px; margin-right: 15px">POLÍTICA DE PRIVACIDADE DA VIAS</h1>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body" style="text-align: justify; margin-left: 15px; margin-right: 15px">

                    <p>Data de Entrada em Vigor: 2/10/2023</p>

                    <h5>1. INTRODUÇÃO</h5>

                    <p>Bem-vindo à Política de Privacidade da aplicação "VIAS" e do jogo "VIAS League" (coletivamente referidos como "Serviços"), desenvolvidos e mantidos por Grupo VIAS. Nossa prioridade é proteger a sua privacidade e os seus dados pessoais. Nesta Política, explicamos como recolhemos, utilizamos, divulgamos e protegemos as suas informações pessoais.</p>

                    <h5>2. INFORMAÇÕES QUE RECOLHEMOS</h5>

                    <h6>2.1. Informações que nos fornece: </h6>
                    <p>Podemos recolher informações que você fornece voluntariamente ao usar os nossos Serviços, como o seu nome, endereço de e-mail e outras informações de contacto.</p>

                    <h6>2.2. Informações de Localização: </h6>
                    <p>Os nossos Serviços podem recolher informações de localização com o seu consentimento para melhorar a experiência de utilização, como navegação em transportes públicos.</p>

                   <h6> 2.3. Informações de Uso: </h6>
                    <p>Podemos recolher informações sobre a forma como utiliza os nossos Serviços, como as páginas visitadas, os cliques, o tempo gasto e outras estatísticas.</p>

                    <h5>3. COMO UTILIZAMOS AS SUAS INFORMAÇÕES</h5>

                    <h6>3.1. Fornecimento e Melhoria dos Serviços: </h6>
                    <p>Utilizamos as suas informações para fornecer, manter e melhorar os nossos Serviços, incluindo a personalização da experiência do utilizador.</p>

                    <h6>3.2. Comunicações: </h6>
                    <p>Podemos enviar-lhe comunicações relacionadas com os nossos Serviços, como atualizações, alertas e informações relevantes.</p>

                    <h6>3.3. Análise de Dados: </h6>
                    <p>Podemos utilizar as informações recolhidas para análises e estatísticas internas.</p>

                    <h5>4. DIVULGAÇÃO A TERCEIROS</h5>

                    <h6>4.1. Parceiros de Serviço: </h6>
                       <p> Podemos partilhar as suas informações com terceiros que nos auxiliam na prestação dos nossos Serviços, como fornecedores de serviços de hospedagem, suporte técnico e processamento de pagamentos.</p>

                    <h6>4.2. Cumprimento Legal: </h6>
                    <p>Podemos divulgar informações quando exigido por lei ou em resposta a solicitações legais, como ordens judiciais.</p>

                    <h5>5. SEGURANÇA DOS DADOS</h5>

                    <p>Empregamos medidas de segurança razoáveis para proteger as suas informações contra acesso não autorizado, uso indevido ou divulgação não autorizada.</p>

                    <h5>6. SEUS DIREITOS</h5>

                    <p>De acordo com a legislação de proteção de dados aplicável, você pode ter direitos relacionados com as suas informações pessoais, incluindo o direito de aceder, corrigir, apagar ou limitar o processamento das suas informações. Para exercer esses direitos ou fazer perguntas sobre a nossa Política de Privacidade, entre em contato connosco em the.vias.app@gmail.com.</p>

                    <h5>7. ALTERAÇÕES A ESTA POLÍTICA DE PRIVACIDADE</h5>

                    <p>Reservamo-nos o direito de atualizar esta Política de Privacidade periodicamente para refletir as alterações nas práticas de privacidade. A data de entrada em vigor será atualizada quando ocorrerem alterações significativas. Encorajamos você a rever esta Política regularmente.</p>

                    <h5>8. CONTACTO</h5>

                    <p>Se tiver alguma dúvida, preocupação ou comentário sobre esta Política de Privacidade ou sobre as nossas práticas de privacidade, entre em contato connosco em the.vias.app@gmail.com.</p>
                    <p>Ao utilizar os nossos Serviços, você concorda com os termos desta Política de Privacidade.</p>

                    <div class="modal-footer">
                        <button id="privacyButton" type="button" class="btn btn-primary buttons">Confirmo que li esta Política de Privacidade</button>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- Modal Share -->
    <div class="modal fade" id="shareModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
        <div class="modal-dialog modal-dialog-centered modalquery">
            <div class="modal-content">
                <div class="modal-header">
                    <h1 class="modal-title fs-5" id="shareModalLabel" style="text-align: justify; margin-left: 15px; margin-right: 15px">Partilhar a aplicação:</h1>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body" style="text-align: justify; margin-left: 15px; margin-right: 15px">
                    <a href="" class="fa fa-facebook"></a>
                    <a href="" class="fa fa-twitter"></a>
                    <a href="" class="fa fa-google"></a>
                    <a href="" class="fa fa-instagram"></a>
                    <a href="" class="fa fa-linkedin"></a>

                    <div class="modal-footer">
                    </div>
                </div>
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

    var modalButton = document.querySelector('#privacyButton');
    var myModal = new bootstrap.Modal(document.getElementById('privacyModal'));

    modalButton.addEventListener('click', function () {
        myModal.hide(); // Close the modal
    });

    var modalButtonTerms = document.querySelector('#termsButton');
    var myModalTerms = new bootstrap.Modal(document.getElementById('termsModal'));

    modalButtonTerms.addEventListener('click', function () {
        myModalTerms.hide(); // Close the modal

    });



</script>

</body>
</html>