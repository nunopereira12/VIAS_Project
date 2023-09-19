<!DOCTYPE html>
<html lang="en">

<%@include file="header.jsp" %>
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

<div class="footerlogo">
    <footer>
        <img class="footerimage" src="images/logo_nobg.png" alt="">
    </footer>
</div>


</body>
</html>