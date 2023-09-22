<!DOCTYPE html>
<html lang="en">

<%@include file="../header.jsp" %>
<head>
    <title>VIAS | Linhas</title>
    <link rel="stylesheet" href="/css/diagrams.css">
</head>
<body>
<div class="container">
    <button class="arrowbutton" onclick="window.history.back();">
        <img src="/images/backarrow.png" alt="Go back!" width="30px">
    </button>
    <p class="title">Linhas</p>


    <div class="d-grid">
        <div class="d-flex justify-content-center">
            <a href="https://www.cp.pt/StaticFiles/Passageiros/3_viajar/0_servicos/lx/ligacao-cp-metro-lisboa-baixa.pdf"
               target="_blank">
                <button class="btn btn-primary slct-buttons" type="button">CP - Comboios de Portugal</button>
            </a>
        </div>


        <div class="d-flex justify-content-center">
            <button class="btn btn-primary slct-buttons" type="button" data-bs-toggle="collapse"
                    data-bs-target="#fert-collapse" aria-expanded="false" aria-controls="panelsStayOpen-collapseOne">
                Fertagus
            </button>
        </div>
        <div id="fert-collapse" class="collapse">
            <div class="d-flex justify-content-center">
                <a href="https://www.fertagus.pt/portals/0/diagrama.jpg" target="_blank">
                    <button class="btn btn-primary dwnld-buttons" type="button">Rede Fertagus</button>
                </a>
            </div>
            <div class="d-flex justify-content-center">
                <a href="https://www.fertagus.pt/Fertagus-pt/Viajar/Mapa-de-Rede/Mapa-de-Rede-Fertagus" target="_blank">
                    <button class="btn btn-primary dwnld-buttons" type="button">Mapa de Rede Fertagus</button>
                </a>
            </div>
            <div class="d-flex justify-content-center">
                <a href="https://www.fertagus.pt/portals/0/Images/Mapa%20de%20rede%20AML/MapaRedeIntegrada.png"
                   target="_blank">
                    <button class="btn btn-primary dwnld-buttons" type="button">Mapa de Rede Integrada</button>
                </a>
            </div>
        </div>

        <div class="d-flex justify-content-center">
            <a href="https://ttsl.pt/wp-content/uploads/2018/08/ttsl_diagrama_da_rede.png" target="_blank">
                <button class="btn btn-primary slct-buttons" type="button" data-bs-toggle="collapse"
                        data-bs-target="#ttsl-collapse" aria-expanded="false"
                        aria-controls="panelsStayOpen-collapseOne">
                    TTSL - Transtejo Soflusa
                </button>
            </a>
        </div>

        <div class="d-flex justify-content-center">
            <button class="btn btn-primary slct-buttons" type="button" data-bs-toggle="collapse"
                    data-bs-target="#metro-collapse" aria-expanded="false" aria-controls="panelsStayOpen-collapseOne">
                Metropolitano de Lisboa
            </button>
        </div>
        <div id="metro-collapse" class="collapse">
            <div class="d-flex justify-content-center">
                <a href="https://www.metrolisboa.pt/wp-content/uploads/2022/06/Metropolitano-De_Lisboa_Diagrama-da-Rede_maio2022.pdf" target="_blank">
                    <button class="btn btn-primary dwnld-buttons" type="button">Diagrama de Rede</button>
                </a>
            </div>
            <div class="d-flex justify-content-center">
                <a href="https://www.metrolisboa.pt/wp-content/uploads/2022/06/Mapa-da-Cidade_maio2022_pdownload.png" target="_blank">
                    <button class="btn btn-primary dwnld-buttons" type="button">Mapa de Rede</button>
                </a>
            </div>
            <div class="d-flex justify-content-center">
                    <button class="btn btn-primary dwnld-buttons" type="button" data-bs-toggle="collapse"
                            data-bs-target="#linhas-collapse" aria-expanded="false" aria-controls="panelsStayOpen-collapseOne">Linhas
                    </button>
            </div>
            <div id="linhas-collapse" class="collapse">
                <div class="d-flex justify-content-center">
                    <a href="https://www.metrolisboa.pt/wp-content/uploads/2019/04/DLE-H-Linha-Azul-2019-Linha-completa.png" target="_blank">
                        <button class="btn btn-primary third-buttons" type="button">Linha Azul</button>
                    </a>
                </div>
                <div class="d-flex justify-content-center">
                    <a href="https://www.metrolisboa.pt/wp-content/uploads/2019/04/DLE-H-Linha-Amarela-2019-completa-01.png" target="_blank">
                        <button class="btn btn-primary third-buttons" type="button">Linha Amarela</button>
                    </a>
                </div>
                <div class="d-flex justify-content-center">
                    <a href="https://www.metrolisboa.pt/wp-content/uploads/2021/10/DLEs_home-site_horizontal_verde_T.png" target="_blank">
                        <button class="btn btn-primary third-buttons" type="button">Linha Verde</button>
                    </a>
                </div>
                <div class="d-flex justify-content-center">
                    <a href="https://www.metrolisboa.pt/wp-content/uploads/2019/04/DLE-H-Linha-Vermelha-completa-01.png" target="_blank">
                        <button class="btn btn-primary third-buttons" type="button">Linha Vermelha</button>
                    </a>
                </div>
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