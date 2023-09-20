<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!doctype html>
<html lang="en">
<%@include file="header.jsp"%>
<head>
    <title>VIAS | A minha carteira</title>
    <link rel="stylesheet" href="/css/wallet.css">
</head>
<body id="walletpage">



<%-- MODAL SECTION --%>


<div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered">
        <div class="modal-content">
            <div class="modal-header">
                <h1 class="modal-title fs-5" id="exampleModalLabel">Detalhes do título de transporte</h1>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <form action="/add_navegante" method="post">
                <div class="modal-body">
                    <%--<label for="nameOwner" class="modal-label">Nome do Titular</label>
                    <input type="text" id="nameOwner" class="form-control" placeholder="Introduza o nome do titular">--%>


                    <label for="numberTitle" class="modal-label">Número do Título</label>
                    <input type="number" class="form-control" name="naveganteNumber" id="numberTitle" placeholder="Introduza o número do título">


                    <label for="expiringDate" class="modal-label">Data de Validade</label>
                    <input type="date" class="form-control" name="expirationDate" id="expiringDate" placeholder="Data de Validade">
                </div>
                <div class="modal-footer">
                    <button type="Reset" class="btn btn-secondary buttons-error">Limpar</button>
                    <button type="submit" class="btn btn-primary buttons">Guardar</button>
                </div>
            </form>
        </div>
    </div>
</div>


<%-- END OF MODAL SECTION --%>




<div class="container">
    <button class="arrowbutton" onclick="window.history.back()">
        <img src="/images/backarrow.png" alt="Go back!" width="30px">
    </button>
    <p class="title">Carteira</p>


    <div class="content">

        <div class="switches-container">
            <input type="radio" id="switchNavigante" name="switchPlan" value="Navegante" checked="checked"/>
            <input type="radio" id="switchVIAS-Card" name="switchPlan" value="VIAS Card"/>
            <label for="switchNavigante">Navegante</label>
            <label for="switchVIAS-Card">VIAS Card</label>
            <div class="switch-wrapper">
                <div class="switch">
                    <div>Navegante</div>
                    <div>VIAS Card</div>
                </div>
            </div>
        </div>

        <div class="data-container">
            <%-- FUTURE DATA   --%>


                <div id="carouselExampleControls" class="carousel slide" data-bs-ride="false" data-bs-touch="true">
                    <div class="carousel-inner">
                        <div class="carousel-item active">

                            <c:choose>

                            <c:when test="${navegante == null}">
                            <img src="/images/new_card.png" class="d-block w-100" alt="..." data-bs-toggle="modal" data-bs-target="#exampleModal">
                            </c:when>
                            <c:when test="${navegante != null && navegante.getExpiration_date().compareTo(today) < 0 }">
                            <img src="/images/invalidNavegante.png" class="d-block w-100" alt="...">
                            </c:when>
                            <c:when test="${navegante != null && navegante.getExpiration_date().compareTo(today) > 0}">
                            <img src="/images/validNavegante.png" class="d-block w-100" alt="...">
                            </c:when>

                            </c:choose>

                        </div>
                        <div class="carousel-item ">
                            <img src="/images/vias_card.png" class="d-block w-100" alt="...">

                        </div>
                    </div>
                </div>
                <div id="validationAndInformation" class="carousel slide" data-bs-ride="false" data-bs-touch="true">
                    <div class="carousel-inner">
                        <div class="carousel-item active">
                            <c:choose>
                            <c:when test="${navegante != null && navegante.getExpiration_date().compareTo(today) < 0 }">
                            <p class="validuntil">Título Expirado</p>
                            </c:when>
                            <c:when test="${navegante != null && navegante.getExpiration_date().compareTo(today) > 0 }">
                            <p class="validuntil">Válido até: ${currentDate}</p>
                            </c:when>
                                <c:when test="${navegate == null}">
                                    <div class="text-placeholder"></div>
                                </c:when>
                            </c:choose>


                        </div>
                        <div class="carousel-item ">
                            <p class="validuntil">Saldo atual: ${viascard.getBalance()}€</p>
                        </div>
                    </div>
                </div>
                <div id="ValidateButtons" class="carousel slide" data-bs-ride="false" data-bs-touch="true">
                    <div class="carousel-inner">
                        <div class="carousel-item active" style="padding-top: 1px;padding-left: 1px;padding-right: 1px;padding-bottom: 1px;">
                            <div class="validate-button-container">
                                <c:choose>
                                <c:when test="${navegante != null && navegante.getExpiration_date().compareTo(today) > 0}">

                                    <form method="post" action="/showticket">
                                        <input type="hidden" name="card" value="NaveganteCard:${navegante.getCard_number()}">
                                    <button type="submit" class="addbutton" ><span class="addspan">Validar Título</span></button>
                                    </form>


                                </c:when>
                                <c:when test="${navegante == null}">
                                    <div class="button-placeholder"></div> <!-- Empty placeholder for the button -->
                                </c:when>
                                <c:when test="${navegante != null && navegante.getExpiration_date().compareTo(today) < 0}">
                                    <div class="button-placeholder" ></div>
                                </c:when>
                                </c:choose>
                            </div>
                        </div>
                        <div class="carousel-item " style="padding-top: 1px;padding-left: 1px;padding-right: 1px;padding-bottom: 1px;">

                            <div class="validate-button-container">
                                <form method="post" action="/showticket">
                                    <input type="hidden" name="card" value="ViasCard:${viascard.getCard_number()}">
                                    <button type="submit" class="addbutton" ><span class="addspan">Validar Título</span></button>
                                </form>


                            </div>
                        </div>
                    </div>
                </div>
                <div id="chargeOrBuy" class="carousel slide" data-bs-ride="false" data-bs-touch="true">
                    <div class="carousel-inner">
                        <div class="carousel-item active" style="padding-top: 1px;padding-left: 1px;padding-right: 1px;padding-bottom: 1px;">
                            <div class="addbutton-container">
                                <c:choose>
                                <c:when test="${navegante == null}">
                                <button class="addbutton" data-bs-toggle="modal" data-bs-target="#exampleModal"><span class="addspan">Adicionar Título de Transporte</span></button>
                                </c:when>
                                <c:when test="${navegante != null && navegante.getExpiration_date().compareTo(today) > 0}">
                                    <button class="addbutton" ><span class="addspan">Carregar Título</span></button>
                                </c:when>
                                    <c:when test="${navegante != null && navegante.getExpiration_date().compareTo(today) < 0}">
                                        <button class="addbutton" ><span class="addspan">Adicionar Novo Título</span></button>
                                    </c:when>
                                </c:choose>
                            </div>
                        </div>
                        <div class="carousel-item ">
                            <div class="addbutton-container" style="padding-top: 1px;padding-left: 1px;padding-right: 1px;padding-bottom: 1px;">
                                <button class="addbutton" data-bs-toggle="modal" data-bs-target="#exampleModal"><span class="addspan">Carregar VIAS Card</span></button>
                            </div>
                        </div>
                    </div>
                </div>
        </div>





            <%--FUTURE DATA --%>

       <%-- </div>
        <div id="addbutton-container">
            <button class="addbutton" data-bs-toggle="modal" data-bs-target="#exampleModal"><span class="addspan">Adicionar Título de Transporte</span></button>
        </div>
    </div>--%>




</div>
</div>



<div class="footerlogo">
        <jsp:include page="footer.jsp" />
</div>

<script>
    const switchNavigante = document.getElementById('switchNavigante');
    const switchVIASCard = document.getElementById('switchVIAS-Card');
    const carousel = new bootstrap.Carousel(document.getElementById('carouselExampleControls'));
    const informationCarousel = new bootstrap.Carousel(document.getElementById('validationAndInformation'));
    const validateButtons = new bootstrap.Carousel(document.getElementById('ValidateButtons'));
    const chargeOrBuy = new bootstrap.Carousel(document.getElementById('chargeOrBuy'));

    // Function to update the information carousel based on the selected radio button
    function updateInformationCarousel(index) {
        informationCarousel.to(index);
        validateButtons.to(index);
        chargeOrBuy.to(index);
    }

    switchNavigante.addEventListener('change', () => {
        if (switchNavigante.checked) {
            // Show the first slide with Bootstrap Carousel method
            carousel.to(0);
            updateInformationCarousel(0);

        }
    });

    switchVIASCard.addEventListener('change', () => {
        if (switchVIASCard.checked) {
            // Show the second slide with Bootstrap Carousel method
            carousel.to(1);
            updateInformationCarousel(1);
        }
    });

    // Listen to the carousel slide event and update the toggle switch and information carousel accordingly
    carousel._element.addEventListener('slide.bs.carousel', (event) => {
        const currentIndex = event.to; // Index of the currently active slide
        if (currentIndex === 0) {
            // Update the toggle switch to Navegante
            switchNavigante.checked = true;
            switchVIASCard.checked = false;
            updateInformationCarousel(0);
        } else if (currentIndex === 1) {
            // Update the toggle switch to VIAS Card
            switchNavigante.checked = false;
            switchVIASCard.checked = true;
            updateInformationCarousel(1);
        }
    });
</script>
</body>
</html>