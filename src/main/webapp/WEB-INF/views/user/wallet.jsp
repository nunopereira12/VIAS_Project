<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!doctype html>
<html lang="en">
<%@include file="../header.jsp"%>
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
                    <input type="text" class="form-control" name="navegante_number" id="numberTitle" placeholder="Introduza o número do título" pattern="[0-9]{12}" title="Por favor insira um número com 12 digitos" required>


                    <label for="expiringDate" class="modal-label">Data de Validade</label>
                    <input type="date" class="form-control" name="expiration_date" id="expiringDate" placeholder="Data de Validade">
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
                            <p class="validuntil">

                                <c:if test="${!navegante.isValid()}">
                                    Título Inválido
                                </c:if>
                               <c:if test="${navegante.isValid() && !navegante.isValid_next_month()}">
                                   Válido até: ${current_date}
                               </c:if>

                                <c:if test="${navegante.isValid_next_month()}">
                                    Válido até: ${next_month}
                                </c:if>
                            </p>
                            </c:when>
                                <c:when test="${navegate == null}">
                                    <div class="text-placeholder"></div>
                                </c:when>
                            </c:choose>


                        </div>
                        <div class="carousel-item ">
                            <p class="validuntil">Saldo atual: ${vias_card.getBalance()}€</p>
                        </div>
                    </div>
                </div>
                <div id="ValidateButtons" class="carousel slide" data-bs-ride="false" data-bs-touch="true">
                    <div class="carousel-inner">
                        <div class="carousel-item active" style="padding-top: 1px;padding-left: 1px;padding-right: 1px;padding-bottom: 1px;">
                            <div class="validate-button-container">
                                <c:choose>
                                <c:when test="${navegante != null && navegante.getExpiration_date().compareTo(today) > 0}">

                                    <form method="post" action="/show_ticket">
                                        <input type="hidden" name="card" value="NaveCard${navegante.getCard_number()}">
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
                                <form method="post" action="/show_ticket">
                                    <input type="hidden" name="card" value="ViasCard${vias_card.getCard_number()}">
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
                                    <form method="POST" action="/payments">
                                        <input type="hidden" name="navegante_id" value="${navegante.getCard_number()}">
                                    <button class="addbutton" type="submit"><span class="addspan">Carregar Navegante</span></button>
                                    </form>
                                </c:when>
                                    <c:when test="${navegante != null && navegante.getExpiration_date().compareTo(today) < 0}">
                                        <button class="addbutton"  data-bs-toggle="modal" data-bs-target="#exampleModal" ><span class="addspan">Adicionar Novo Título</span></button>
                                    </c:when>
                                </c:choose>
                            </div>
                        </div>
                        <div class="carousel-item ">
                            <div class="addbutton-container" style="padding-top: 1px;padding-left: 1px;padding-right: 1px;padding-bottom: 1px;">
                                <form method="POST" action="/payments">
                                    <input type="hidden" name="vias_card_id" value="${vias_card.getCard_number()}">
                                <button class="addbutton" type="submit"><span class="addspan">Carregar VIAS Card</span></button>
                                    </form>
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
        <jsp:include page="../footer.jsp" />
</div>

<script>

    // Function to save the selected toggle state to localStorage
    function saveToggleState(selectedToggleState) {
        localStorage.setItem('selectedToggleState', selectedToggleState);
    }

    // Function to retrieve the selected toggle state from localStorage
    function getToggleState() {
        return localStorage.getItem('selectedToggleState');
    }

    // Function to update the information carousel based on the selected radio button
    function updateInformationCarousel(index) {
        informationCarousel.to(index);
        validateButtons.to(index);
        chargeOrBuy.to(index);
    }

    // Function to update the carousel and toggle switch based on the selected toggle state
    function updateCarouselAndToggle(selectedToggleState) {
        if (selectedToggleState === 'Navegante') {
            // Show the first slide with Bootstrap Carousel method
            carousel.to(0);
            updateInformationCarousel(0);
        } else if (selectedToggleState === 'VIAS Card') {
            // Show the second slide with Bootstrap Carousel method
            carousel.to(1);
            updateInformationCarousel(1);
        }
    }

    const switchNavigante = document.getElementById('switchNavigante');
    const switchVIASCard = document.getElementById('switchVIAS-Card');
    const carousel = new bootstrap.Carousel(document.getElementById('carouselExampleControls'));
    const informationCarousel = new bootstrap.Carousel(document.getElementById('validationAndInformation'));
    const validateButtons = new bootstrap.Carousel(document.getElementById('ValidateButtons'));
    const chargeOrBuy = new bootstrap.Carousel(document.getElementById('chargeOrBuy'));

    // Event listener for the radio buttons
    switchNavigante.addEventListener('change', () => {
        if (switchNavigante.checked) {
            saveToggleState('Navegante'); // Save the selected toggle state
            updateCarouselAndToggle('Navegante'); // Update the carousel
        }
    });

    switchVIASCard.addEventListener('change', () => {
        if (switchVIASCard.checked) {
            saveToggleState('VIAS Card'); // Save the selected toggle state
            updateCarouselAndToggle('VIAS Card'); // Update the carousel
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

    // Initialize the page on DOMContentLoaded
    document.addEventListener('DOMContentLoaded', () => {
        const selectedToggleState = getToggleState();

        if (selectedToggleState === 'Navegante' || selectedToggleState === 'VIAS Card') {
            // Update the carousel and toggle switch based on the saved state
            updateCarouselAndToggle(selectedToggleState);
        } else {
            // Default to 'Navegante' if no state is saved
            saveToggleState('Navegante');
        }
    });
</script>
</body>
</html>