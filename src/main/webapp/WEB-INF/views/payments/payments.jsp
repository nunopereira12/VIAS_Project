<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!doctype html>
<html lang="en">
<%@include file="../header.jsp" %>
<head>
    <title>VIAS | Compra</title>
    <link rel="stylesheet" href="/css/payments.css">
</head>
<body>

<div class="container">
    <button class="arrowbutton" onclick="window.history.back()">
        <img src="/images/backarrow.png" alt="Go back!" width="30px">
    </button>
    </a>
    <p class="title">Título(s) de Transporte</p>
    <p class="subtitle">Seleccionar opção</p>
    <div class="content">
        <c:choose>
            <c:when test="${vias != null}">
                <p class="typeOfPurchase" style="margin-bottom: 1rem;">
                    <button id=valueSelection class="choice-button" value="5.00"> 5.00 €</button>
                    <button id=valueSelection1 class="choice-button" value="10.00"> 10.00 €</button>
                    <button id=valueSelection2 class="choice-button" value="15.00"> 15.00 €</button>
                </p>
                <p>
                    <input type="number" id="newValueInput" class="form-control formtext" placeholder="0€" required min="5" max="1000">

                </p>

            </c:when>
            <c:when test="${navegante != null}">
                <p class="typeOfPurchase" style="margin-bottom: 1rem;">
                    <button id=valueSelectionNav class="choice-button" value="40.00">Carregar título - 40.00 €</button>
                </p>
            </c:when>
        </c:choose>

        <div class="totalContainer">
            <span class="subTotal left">Subtotal</span>
            <c:choose>
                <c:when test="${vias != null}">
                    <span id=valueDisplay class="subTotal right"></span>
                </c:when>
                <c:when test="${navegante != null}">
                    <span id=valueDisplay class="subTotal right"> 40.00 €</span>
                </c:when>
            </c:choose>
        </div>
        <div id="tx" class="totalContainer">
            <span class="subTotal left">Taxas</span>
            <span class="subTotal right">0.00€</span>
        </div>

        <div class="center-container" style="padding-top: 1rem;padding-bottom: 1rem;">
            <span class="addPromo">Adicionar Promoção</span> <img src="/images/sell.png">
        </div>

        <div class="totalContainer">
            <span class="totalData left">Total</span>
            <c:choose>
                <c:when test="${vias != null}">
                    <span id=valueDisplay1 class="totalData right"></span>
                </c:when>
                <c:when test="${navegante != null}">
                    <span id=valueDisplay1 class="totalData right">40.00 €</span>
                </c:when>
            </c:choose>
        </div>
        <div class="payment-container">
            <span class="typeOfPurchase">Métodos de Pagamento</span>

            <div class="paymentMethods">
                <div class="paymentMethod">
                    <label>
                        <input type="radio" class="paymentOption" name="paymentMethod" value="mbway" checked>
                        <img src="/images/mbway.png" alt="">
                    </label>
                </div>
                <div class="paymentMethod">
                    <label>
                        <input type="radio" class="paymentOption" name="paymentMethod" value="mastercard">
                        <img src="/images/mastercard.png" alt="">
                    </label>
                </div>
                <div class="paymentMethod">
                    <label>
                        <input type="radio" class="paymentOption" name="paymentMethod" value="paypal">
                        <img src="/images/paypal.png" alt="">
                    </label>
                </div>
            </div>
        </div>
        <div class="d-grid" style="justify-content: center">
            <form method="POST" action="/payment_success" id="payment_form">
                <input id=valuePurchase type="hidden" name="value" value="">
                <c:if test="${navegante != null}">
                    <input type="hidden" name="navegante_id" value="${navegante.getCard_number()}">
                </c:if>
                <c:if test="${vias != null}">
                    <input type="hidden" name="vias_card_id" value="${vias.getCard_number()}">
                </c:if>
                <button style="width: 100%" type="submit" class="btn btn-primary buttons">Confirmar Pagamento</button>
            </form>
        </div>
    </div>

</div>

<div class="footerlogo">
    <footer>
        <img class="footerimage" src="images/logo_nobg.png" alt="">
    </footer>
</div>
<script>
    const selectButton = document.getElementById('valueSelection');
    const selectButton1 = document.getElementById('valueSelection1');
    const selectButton2 = document.getElementById('valueSelection2');
    const selectButton3 = document.getElementById('valueSelection3')

    const selectButton4 = document.getElementById('newValueInput');

    const valueDisplay = document.getElementById('valueDisplay');
    const valueDisplay1 = document.getElementById('valueDisplay1');
    const valuePurchase = document.getElementById('valuePurchase')

    valueDisplay.textContent = '5.00€';
    valueDisplay1.textContent = '5.00€';
    valuePurchase.value = '5.00'; // Set the initial value


    selectButton.addEventListener('click', () => {
        const selectedValue = selectButton.value;
        valueDisplay.textContent = selectedValue + '€';
        valueDisplay1.textContent = selectedValue + '€';
        valuePurchase.value = selectedValue;
    });

    selectButton1.addEventListener('click', () => {
        const selectedValue = selectButton1.value;
        valueDisplay.textContent = selectedValue + '€';
        valueDisplay1.textContent = selectedValue + '€';
        valuePurchase.value = selectedValue;
    });

    selectButton2.addEventListener('click', () => {
        const selectedValue = selectButton2.value;
        valueDisplay.textContent = selectedValue + '€';
        valueDisplay1.textContent = selectedValue + '€';
        valuePurchase.value = selectedValue;
    });

    selectButton2.addEventListener('click', () => {
        const selectedValue = selectButton3.value;
        valueDisplay.textContent = selectedValue + '€';
        valuePurchase.value = selectedValue;
    });


    newValueInput.addEventListener('input', () => {
        const selectedValue = newValueInput.value;
        valueDisplay.textContent = selectedValue + '€';
        valueDisplay1.textContent = selectedValue + '€';
        valuePurchase.value = selectedValue;
    });

    newValueInput.addEventListener('input', () => {
        if (newValueInput.value === '0' || newValueInput.value === '-') {
            newValueInput.value = '';
        }
    });

    newValueInput.addEventListener('keydown', (event) => {
        if (event.key === '-') {
            event.preventDefault();
        }
    });


    function handleButtonClick(button) {
        // Remove the 'active' class from all buttons
        selectButton.classList.remove('active');
        selectButton1.classList.remove('active');
        selectButton2.classList.remove('active');
        selectButton4.classList.remove('active')

        // Add the 'active' class to the clicked button
        button.classList.add('active');
    }

    // Add click event listeners to the buttons
    selectButton.addEventListener('click', () => {
        handleButtonClick(selectButton);
    });

    selectButton1.addEventListener('click', () => {
        handleButtonClick(selectButton1);
    });

    selectButton2.addEventListener('click', () => {
        handleButtonClick(selectButton2);
    });

    selectButton4.addEventListener('click', () => {
        handleButtonClick(selectButton4);
    });

    newValueInput.addEventListener('input', () => {
        const enteredValue = newValueInput.value.trim(); // Remove leading/trailing spaces

        if (enteredValue === '') {
            valueDisplay.textContent = '5€';
            valueDisplay1.textContent = '5€';
            valuePurchase.value = '5.00';
        } else {
            const parsedValue = parseFloat(enteredValue);

            if (!isNaN(parsedValue) && parsedValue >= 5) {
                const formattedValue = parsedValue.toFixed(2) + '€';
                valueDisplay.textContent = formattedValue;
                valueDisplay1.textContent = formattedValue;

                valuePurchase.value = parsedValue.toFixed(2);
            } else {
                valueDisplay.textContent = '5.00€';
                valueDisplay1.textContent = '5.00€';
                valuePurchase.value = '5.00';
            }
        }
    });

</script>
</body>
</html>