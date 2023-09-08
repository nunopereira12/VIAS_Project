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
            <form action="">
                <div class="modal-body">
                    <label for="nameOwner" class="modal-label">Nome do Titular</label>
                    <input type="text" id="nameOwner" class="form-control" placeholder="Introduza o nome do titular">


                    <label for="numberTitle" class="modal-label">Número do Título</label>
                    <input type="text" class="form-control" id="numberTitle" placeholder="Introduza o número do título">


                    <label for="expiringDate" class="modal-label">Data de Validade</label>
                    <input type="date" class="form-control" id="expiringDate" placeholder="Data de Validade">
                </div>
                <div class="modal-footer">
                    <button type="Reset" class="btn btn-secondary buttons-error">Limpar</button>
                    <button type="button" class="btn btn-primary buttons">Guardar</button>
                </div>
            </form>
        </div>
    </div>
</div>


<%-- END OF MODAL SECTION --%>




<div class="container">
    <a style="display: block" href="http://localhost:8080">
        <button class="arrowbutton">
            <img src="/images/backarrow.png" alt="Go back!" width="30px">
        </button>
    </a>
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
                            <img src="/images/new_card.png" class="d-block w-100" alt="..." >
                        </div>
                        <div class="carousel-item ">
                            <img src="/images/vias_card.png" class="d-block w-100" alt="...">
                        </div>
                    </div>
                </div>


            <%--FUTURE DATA --%>

        </div>
        <div id="addbutton-container">
            <button class="addbutton" data-bs-toggle="modal" data-bs-target="#exampleModal"> Adicionar Título de Transporte</button>
        </div>
    </div>




</div>


<div class="footerlogo">
        <jsp:include page="footer.jsp" />
</div>

<script>
    const switchNavigante = document.getElementById('switchNavigante');
    const switchVIASCard = document.getElementById('switchVIAS-Card');
    const carousel = new bootstrap.Carousel(document.getElementById('carouselExampleControls'));

    switchNavigante.addEventListener('change', () => {
        if (switchNavigante.checked) {
            // Show the first slide with Bootstrap Carousel method
            carousel.to(0);
        }
    });

    switchVIASCard.addEventListener('change', () => {
        if (switchVIASCard.checked) {
            // Show the second slide with Bootstrap Carousel method
            carousel.to(1);
        }
    });

    // Listen to the carousel slide event and update the toggle switch accordingly
    carousel._element.addEventListener('slide.bs.carousel', (event) => {
        const currentIndex = event.to; // Index of the currently active slide
        if (currentIndex === 0) {
            // Update the toggle switch to Navegante
            switchNavigante.checked = true;
            switchVIASCard.checked = false;
        } else if (currentIndex === 1) {
            // Update the toggle switch to VIAS Card
            switchNavigante.checked = false;
            switchVIASCard.checked = true;
        }
    });
</script>
</body>
</html>