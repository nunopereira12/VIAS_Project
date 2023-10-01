<!DOCTYPE html>
<html lang="en">

<%@include file="../header.jsp" %>
<head>
    <title>VIAS | Horários</title>
    <link rel="stylesheet" href="/css/diagrams.css">
    <%@ page contentType="text/html;charset=UTF-8" language="java" %>
</head>
<body>
<div class="container">
    <button class="arrowbutton" onclick="window.history.back()">
        <img src="/images/backarrow.png" alt="Go back!" width="30px">
    </button>
    <p class="title">Horários</p>


    <div class="d-grid">
        <div class="d-flex justify-content-center">
            <button class="btn btn-primary slct-buttons" type="button" data-bs-toggle="collapse"
                    data-bs-target="#cp-collapse" aria-expanded="false" aria-controls="panelsStayOpen-collapseOne">
                CP - Comboios de Portugal
            </button>
        </div>
        <div id="cp-collapse" class="collapse">
            <div class="d-flex justify-content-center">
                <a href="https://www.cp.pt/StaticFiles/horarios/urbanos-lisboa/comboios-urbanos-lisboa-cascais.pdf"
                   target="_blank">
                    <button class="btn btn-primary dwnld-buttons" type="button">Linha de Cascais</button>
                </a>
            </div>
            <div class="d-flex justify-content-center">
                <a href="https://www.cp.pt/StaticFiles/horarios/urbanos-lisboa/completo-comboios-urbanos-lisboa.pdf"
                   target="_blank">
                    <button class="btn btn-primary dwnld-buttons" type="button">Linha de Azambuja/Sintra</button>
                </a>
            </div>
            <div class="d-flex justify-content-center">
                <a href="https://www.cp.pt/StaticFiles/horarios/urbanos-lisboa/comboios-urbanos-lisboa-sado.pdf"
                   target="_blank">
                    <button class="btn btn-primary dwnld-buttons" type="button">Linha de Praias do Sado</button>
                </a>
            </div>
        </div>

        <div class="d-flex justify-content-center">
            <button class="btn btn-primary slct-buttons" type="button" data-bs-toggle="collapse"
                    data-bs-target="#carris-collapse" aria-expanded="false" aria-controls="panelsStayOpen-collapseOne">
                Carris Metropolitana
            </button>
        </div>
        <div id="carris-collapse" class="collapse">
            <div class="d-flex justify-content-center">
                <a href="https://www.carrismetropolitana.pt/horarios/" target="_blank">
                    <button class="btn btn-primary dwnld-buttons" type="button">Todos os Horários</button>
                </a>
            </div>
        </div>

        <div class="d-flex justify-content-center">
            <button class="btn btn-primary slct-buttons" type="button" data-bs-toggle="collapse"
                    data-bs-target="#fert-collapse" aria-expanded="false" aria-controls="panelsStayOpen-collapseOne">
                Fertagus
            </button>
        </div>
        <div id="fert-collapse" class="collapse">
            <div class="d-flex justify-content-center">
                <button class="btn btn-primary dwnld-buttons" type="button" data-bs-toggle="collapse"
                        data-bs-target="#ls-collapse" aria-expanded="false" aria-controls="panelsStayOpen-collapseOne">Lisboa - Setúbal</button>
            </div>
            <div id="ls-collapse" class="collapse">
                <div class="d-flex justify-content-center">
                    <a href="https://www.fertagus.pt/DesktopModules/FTWebsite_CoreBusiness/DownloadHandler.ashx?subjectType=1&versao=9&tipo=1&sentido=1&locale=pt-PT"
                       target="_blank">
                        <button class="btn btn-primary third-buttons" type="button">Dias Úteis</button>
                    </a>
                </div>
                <div class="d-flex justify-content-center">
                    <a href="https://www.fertagus.pt/DesktopModules/FTWebsite_CoreBusiness/DownloadHandler.ashx?subjectType=1&versao=9&tipo=2&sentido=1&locale=pt-PT"
                       target="_blank">
                        <button class="btn btn-primary third-buttons" type="button">Fins de Semana e Feriados</button>
                    </a>
                </div>
            </div>
            <div class="d-flex justify-content-center">
                <button class="btn btn-primary dwnld-buttons" type="button" data-bs-toggle="collapse"
                        data-bs-target="#sl-collapse" aria-expanded="false" aria-controls="panelsStayOpen-collapseOne">Setúbal - Lisboa</button>
            </div> <div id="sl-collapse" class="collapse">
            <div class="d-flex justify-content-center">
                <a href="https://www.fertagus.pt/DesktopModules/FTWebsite_CoreBusiness/DownloadHandler.ashx?subjectType=1&versao=10&tipo=1&sentido=2&locale=pt-PT"
                   target="_blank">
                    <button class="btn btn-primary third-buttons" type="button">Dias Úteis</button>
                </a>
            </div>
            <div class="d-flex justify-content-center">
                <a href="https://www.fertagus.pt/DesktopModules/FTWebsite_CoreBusiness/DownloadHandler.ashx?subjectType=1&versao=10&tipo=2&sentido=2&locale=pt-PT"
                   target="_blank">
                    <button class="btn btn-primary third-buttons" type="button">Fins de Semana e Feriados</button>
                </a>
            </div>
        </div>

        </div>

        <div class="d-flex justify-content-center">
            <button class="btn btn-primary slct-buttons" type="button" data-bs-toggle="collapse"
                    data-bs-target="#ttsl-collapse" aria-expanded="false" aria-controls="panelsStayOpen-collapseOne">
                TTSL -
                Transtejo Soflusa
            </button>
        </div>

        <div id="ttsl-collapse" class="collapse">
            <div class="d-flex justify-content-center">
                <a href="https://ttsl.pt/wp-content/uploads/2020/12/Horarios-TTSL_Todas-as-ligacoes-fluviais-_-2020-_-14-dezembro-2020.pdf" target="_blank">
                    <button class="btn btn-primary dwnld-buttons" type="button">Todos os Horários</button>
                </a>
            </div>
        </div>

        <div class="d-flex justify-content-center">
            <button class="btn btn-primary slct-buttons" type="button" data-bs-toggle="collapse"
                    data-bs-target="#metro-collapse" aria-expanded="false" aria-controls="panelsStayOpen-collapseOne">
                Metropolitano de Lisboa
            </button>
        </div>
        <div id="metro-collapse" class="collapse">
            <div class="d-flex justify-content-center">
                <a href="https://www.metrolisboa.pt/viajar/horarios-e-frequencias/" target="_blank">
                    <button class="btn btn-primary dwnld-buttons" type="button">Todos os Horários</button>
                </a>
            </div>
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


</body>
</html>