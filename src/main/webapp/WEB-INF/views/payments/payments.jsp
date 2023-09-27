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
    <p class="subtitle">Seleccione uma opção</p>
    <div class="content">
        <c:choose>
            <c:when test="${vias != null}">
                <p class="typeOfPurchase" style="margin-bottom: 1rem;">
                    <button id=valueSelection class="choice-button" value="5.00"> 5.00 €</button>
                    <button id=valueSelection1 class="choice-button" value="10.00"> 10.00 €</button>
                    <button id=valueSelection2 class="choice-button" value="15.00"> 15.00 €</button>
                </p>
                <p class="subtitle" style="margin-bottom: 0px">Ou insira um montante:</p>
                <p>
                    <input type="text" id="newValueInput" oninput="restrictToDigits(this)" onblur="validateAmount()" class="form-control formtext money-input" placeholder="--- €">
                <div class="alert alert-danger" style="display: none" id="errorText" role="alert">

                </div>
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
                    <span id=valueDisplay class="subTotal right"> 40.00 € </span>
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
            <form method="POST" action="/payment_success" onsubmit="return validateForm()" id="payment_form">
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
        <div class="footerimage" style="margin-top: 12px">
            <svg width="115" height="25" viewBox="0 0 196 45" fill="none" xmlns="http://www.w3.org/2000/svg">
                <path d="M18.24 45L-0.896 0.199997H12.8L28.928 38.984H20.864L37.376 0.199997H49.92L30.72 45H18.24ZM52.5425 45V0.199997H65.2145V45H52.5425ZM68.854 45L88.63 0.199997H101.11L120.95 45H107.766L92.278 6.408H97.27L81.782 45H68.854ZM79.67 36.296L82.934 26.952H104.822L108.086 36.296H79.67Z" fill="white"/>
                <path d="M177.001 24.6667L176.998 43.3333L196 38.0027L190.46 34.1147C193.142 30.656 194.643 26.408 194.64 22C194.64 10.9733 185.51 1.99999 174.284 1.99999C158.892 1.99999 155.246 16.3226 154.049 21.032C151.3 31.832 147.294 34 141.714 34C134.98 34 129.5 28.616 129.5 22C129.5 19.272 130.482 16.664 132.189 14.5547L138.999 19.3333V0.666656L120 5.99999L125.54 9.88532C122.858 13.344 121.357 17.592 121.357 22C121.357 33.0293 130.488 42 141.714 42C155.512 42 159.869 31.1413 161.948 22.968C164.849 11.5733 169.591 9.99999 174.284 9.99999C181.018 9.99999 186.498 15.3867 186.498 22.0054C186.5 24.7307 185.518 27.3387 183.811 29.448L177.001 24.6667Z" fill="#A3DD41"/>
            </svg>
        </div>
    </footer>
</div>
<script>
    const selectButton = document.getElementById('valueSelection');
    const selectButton1 = document.getElementById('valueSelection1');
    const selectButton2 = document.getElementById('valueSelection2');

    const valueDisplay = document.getElementById('valueDisplay');
    const valueDisplay1 = document.getElementById('valueDisplay1');
    const valuePurchase = document.getElementById('valuePurchase')


    if (${navegante != null}) {
        valuePurchase.value = '40.00';
        valueDisplay.textContent = '40.00€';
        valueDisplay1.textContent = '40.00€';
    } else {
        valuePurchase.value = '5.00';
        valueDisplay.textContent = '5.00€';
        valueDisplay1.textContent = '5.00€';
    }


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


    function handleButtonClick(button) {
        // Remove the 'active' class from all buttons
        selectButton.classList.remove('active');
        selectButton1.classList.remove('active');
        selectButton2.classList.remove('active');

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



</script>
<script>

    function validateAmount() {
        const amountInput = document.getElementById("newValueInput");
        const amount = parseFloat(amountInput.value);
        const errorText = document.getElementById("errorText");
        const valueDisplay = document.getElementById('valueDisplay');
        const valueDisplay1 = document.getElementById('valueDisplay1');
        const valuePurchase = document.getElementById('valuePurchase')


        if (isNaN(amount) || amount < 5 || amount > 1000) {
            errorText.textContent = "Insira um valor válido entre 10€ e 1000€";
            amountInput.value = "";
            errorText.style.display = 'block';
            valueDisplay.textContent = "0.00 €";
            valueDisplay1.textContent = "0.00 €";
        } else {
            errorText.textContent = "";
            errorText.style.display = 'none';
            valueDisplay.textContent = amount + "€";
            valueDisplay1.textContent = amount + "€";
            valuePurchase.value = amount;
        }
    }

    function validateForm() {
        const valueForm = parseFloat(document.getElementById('valuePurchase').value);
        return !(isNaN(valueForm) ||  valueForm < 5 ||  valueForm > 1000);
    }

</script>
<script>
    function restrictToDigits(input) {
    input.value = input.value.replace(/\D/g, '');
}
</script>
</body>
</html>