<!DOCTYPE html>
<html lang="en">

<%@include file="header.jsp" %>
<head>
    <title>VIAS | Linhas</title>
    <link rel="stylesheet" href="/css/diagrams.css">
</head>
<body>
<div class="container">
    <a style="display: block" href="http://localhost:8080/home">
        <button class="arrowbutton">
            <img src="/images/backarrow.png" alt="Go back!" width="30px">
        </button>
    </a>
    <p class="title">Linhas</p>


<%--
    <div class="accordion" id="accordionPanelsStayOpenExample">
        <div class="accordion-item">
            <h2 class="accordion-header">
                <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse"
                        data-bs-target="#panelsStayOpen-collapseTwo" aria-expanded="false"
                        aria-controls="panelsStayOpen-collapseTwo">
                    Accordion Item #2
                </button>
            </h2>
            <div id="panelsStayOpen-collapseTwo" class="accordion-collapse collapse">
                <div class="accordion-body">
                    <strong>This is the second item's accordion body.</strong> It is hidden by default, until the
                    collapse plugin adds the appropriate classes that we use to style each element. These classes
                    control the overall appearance, as well as the showing and hiding via CSS transitions. You can
                    modify any of this with custom CSS or overriding our default variables. It's also worth noting that
                    just about any HTML can go within the <code>.accordion-body</code>, though the transition does limit
                    overflow.
                </div>
            </div>
        </div>
        <div class="accordion-item">
            <h2 class="accordion-header">
                <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse"
                        data-bs-target="#panelsStayOpen-collapseThree" aria-expanded="false"
                        aria-controls="panelsStayOpen-collapseThree">
                    Accordion Item #3
                </button>
            </h2>
            <div id="panelsStayOpen-collapseThree" class="accordion-collapse collapse">
                <div class="accordion-body">
                    <strong>This is the third item's accordion body.</strong> It is hidden by default, until the
                    collapse plugin adds the appropriate classes that we use to style each element. These classes
                    control the overall appearance, as well as the showing and hiding via CSS transitions. You can
                    modify any of this with custom CSS or overriding our default variables. It's also worth noting that
                    just about any HTML can go within the <code>.accordion-body</code>, though the transition does limit
                    overflow.
                </div>
            </div>
        </div>
    </div>
--%>


    <div class="d-grid">
        <div class="d-flex justify-content-center">
            <a href="https://www.cp.pt/StaticFiles/Passageiros/3_viajar/0_servicos/lx/ligacao-cp-metro-lisboa-baixa.pdf" target="_blank">
        <button class="btn btn-primary slct-buttons" type="button">CP - Comboios de Portugal</button>
            </a>
        </div>
        <div id="cp-collapse" class="collapse">
            <div class="d-flex justify-content-center">
                <button class="btn btn-primary dwnld-buttons" type="button">Linha de Cascais</button>
            </div>
            <div class="d-flex justify-content-center">
                <button class="btn btn-primary dwnld-buttons" type="button">Linha de Sintra</button>
            </div>
            <div class="d-flex justify-content-center">
                <button class="btn btn-primary dwnld-buttons" type="button">Linha de Azambuja</button>
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
                <button class="btn btn-primary dwnld-buttons" type="button">Linha de</button>
            </div>
            <div class="d-flex justify-content-center">
                <button class="btn btn-primary dwnld-buttons" type="button">Linha de</button>
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
                <button class="btn btn-primary dwnld-buttons" type="button">Linha de Cascais</button>
            </div>
            <div class="d-flex justify-content-center">
                <button class="btn btn-primary dwnld-buttons" type="button">Linha de Sintra</button>
            </div>
        </div>

        <div class="d-flex justify-content-center">
        <button class="btn btn-primary slct-buttons" type="button" data-bs-toggle="collapse"
                data-bs-target="#ttsl-collapse" aria-expanded="false" aria-controls="panelsStayOpen-collapseOne">TTSL -
            Transtejo Soflusa
        </button>
        </div>
        <div id="ttsl-collapse" class="collapse">
            <div class="d-flex justify-content-center">
                <button class="btn btn-primary dwnld-buttons" type="button">Linha de</button>
            </div>
            <div class="d-flex justify-content-center">
                <button class="btn btn-primary dwnld-buttons" type="button">Linha de</button>
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
                <button class="btn btn-primary dwnld-buttons" type="button">Linha de Cascais</button>
            </div>
            <div class="d-flex justify-content-center">
                <button class="btn btn-primary dwnld-buttons" type="button">Linha de Sintra</button>
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