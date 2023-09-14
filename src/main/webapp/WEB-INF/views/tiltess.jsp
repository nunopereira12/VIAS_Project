<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>


<!doctype html>
<html lang="en">
<%@include file="header.jsp" %>
<head>
    <title>VIAS | Títulos</title>
    <link rel="stylesheet" href="/css/titless.css">
</head>
<body>

<div class="container">
    <div class="mapa-container">
        <button class="arrowbutton" onclick="window.location.href='/home';">
            <img src="/images/backarrow.png" alt="Go back!" width="30px">
        </button>
        <p class="title">Títulos</p>
    </div>
    <hr>
    <div class="mid-container">
        <p id="primeiro-nome"><strong>${user.getFirstName()}</strong>,</p>
        <p>tem <strong>${fn:length(userTickets)}</strong> bilhetes ativos na sua conta.</p>

    </div>

    <div class="info-container">
        <div class="carousel-container">

            <button class="prev-button" onclick="prevSlide()"><</button>
            <button class="next-button" onclick="nextSlide()">></button>

            <div class="carousel">
                <c:forEach var="ticket" items="${userTickets}" varStatus="loopStatus">
                    <div class="carousel-item carousel-item-transition">
                        <%--<div class="cartaoIteracao">Cartão #${loopStatus.index +1}</div>--%>
                        <!-- Display ticket information for each row -->
                        <p id="nrCartao">Nº Cartão - ${ticket.getCardNumber()}</p>
                        <p id="tipoCartao">${ticket.getType()}</p>
                        <p id="validadeCartao">Data de validade: ${ticket.formatDateToDDMMYY(ticket.getExpirationDate())}</p>

                        <!-- Add more ticket information as needed -->
                        <div class="ticket-image">
                            <img src="/images/vias_card.v2.png" alt="Image Description">
                        </div>

                        <div id="nrCartao2">
                            Cartão #${loopStatus.index + 1} - ${ticket.getType()}
                        </div>
                    </div>

                </c:forEach>


            </div>
        </div>

        <div class="validate-button-container">
            <button class="validate-button" onclick="window.location.href='/validatetitle'">Validar</button>
        </div>
    </div>

</div>


<div class="footerlogo">
    <footer>
        <img class="footerimage" src="images/logo_nobg.png" alt="">
    </footer>
</div>

<script>
    //FALTA O VALIDATECARDDDDD*/

    let currentSlide = 0;
    const slides = document.querySelectorAll(".carousel-item");

    function showSlide(slideIndex) {
        slides.forEach((slide, index) => {
            if (index === slideIndex) {
                slide.classList.add("active");
            } else {
                slide.classList.remove("active");
            }
        });
    }

    function prevSlide() {
        currentSlide = (currentSlide - 1 + slides.length) % slides.length;
        showSlide(currentSlide);
    }

    function nextSlide() {
        currentSlide = (currentSlide + 1) % slides.length;
        showSlide(currentSlide);
    }

    // Show the initial slide
    showSlide(currentSlide);



</script>

</body>
</html>