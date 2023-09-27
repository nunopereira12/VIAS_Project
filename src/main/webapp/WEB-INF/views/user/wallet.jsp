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
    <button class="arrowbutton" onclick="window.location.href='/home'">
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
                            <img src="/images/vias_card.v2.png" class="d-block w-100" alt="...">

                        </div>
                    </div>
                </div>
                <div id="validationAndInformation" class="carousel slide" data-bs-ride="false" data-bs-touch="false">
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
                <div id="ValidateButtons" class="carousel slide" data-bs-ride="false" data-bs-touch="false">
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
                <div id="chargeOrBuy" class="carousel slide" data-bs-ride="false" data-bs-touch="false">
                    <div class="carousel-inner">
                        <div class="carousel-item active" style="padding-top: 1px;padding-left: 1px;padding-right: 1px;padding-bottom: 1px;">
                            <div class="addbutton-container">
                                <c:choose>
                                <c:when test="${navegante == null}">
                                <button class="addbutton" data-bs-toggle="modal" data-bs-target="#exampleModal"><span class="addspan">Adicionar Título de Transporte</span></button>
                                </c:when>
                                    <c:when test="${navegante != null && navegante.getExpiration_date().compareTo(today) > 0 &&  navegante.isValid_next_month()}">
                                        <div class="button-placeholder" ></div>
                                </c:when>
                                <c:when test="${navegante != null && navegante.getExpiration_date().compareTo(today) > 0 && !navegante.isValid_next_month()}">
                                    <form method="POST" action="/checkout_navegante">
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
                                <form method="POST" action="/checkout_vias_card">
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