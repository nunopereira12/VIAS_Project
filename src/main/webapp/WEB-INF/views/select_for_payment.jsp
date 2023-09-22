<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!doctype html>
<html lang="en">
<%@include file="header.jsp"%>
<head>
    <title>Finalizar compra</title>
    <link rel="stylesheet" href="/css/payments.css">
</head>
<body>

<div class="container">
    <button class="arrowbutton" onclick="window.history.back()">
        <img src="/images/backarrow.png" alt="Go back!" width="30px">
    </button>
    </a>
    <p class="title">Finalizar compra</p>
    <p class="subtitle">Título(s) de Transporte</p>
    <div class="content">
        <p class="typeOfPurchase" style="margin-bottom: 1rem;">
            <button id=valueSelection class="choice-button" value="5.00"> 5.00 €</button>
            <button id=valueSelection1 class="choice-button" value="10.00"> 10.00 €</button>
            <button id=valueSelection2 class="choice-button" value="15.00"> 15.00 €</button></p>
        <div class="totalContainer">
            <span class="subTotal left">Subtotal</span>
            <span id=valueDisplay class="subTotal right"></span>
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
            <span id=valueDisplay1 class="totalData right"></span>
        </div>


        <div class="payment-container">
            <span class="typeOfPurchase">Métodos de Pagamento</span>

            <div class="paymentMethods">
                <div class="paymentMethod">
                    <label>
                        <input type="radio" class="paymentOption" name="paymentMethod" value="mbway">
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
        <div class="d-grid">
            <form>
                <input id=valuePurchase type="hidden" name="valuePurchase" value="">
                <input type="hidden" name="cardID" value="${card.getID()}">
                <button type="submit" class="btn btn-primary buttons">Prosseguir</button>
            </form>
        </div>

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
        const valueDisplay = document.getElementById('valueDisplay');
        const valueDisplay1 = document.getElementById('valueDisplay1');
        const valuePurchase = document.getElementById('valuePurchase')

        selectButton.addEventListener('click', () => {
        const selectedValue = selectButton.value;
            valueDisplay.textContent = selectedValue+'€';
            valueDisplay1.textContent = selectedValue+'€';
            valuePurchase.value = selectedValue;
        });

        selectButton1.addEventListener('click', () => {
        const selectedValue = selectButton1.value;
            valueDisplay.textContent = selectedValue+'€';
            valueDisplay1.textContent = selectedValue+'€';
            valuePurchase.value = selectedValue;
        });

        selectButton2.addEventListener('click', () => {
        const selectedValue = selectButton2.value;
            valueDisplay.textContent = selectedValue+'€';
            valueDisplay1.textContent = selectedValue+'€';
            valuePurchase.value = selectedValue;
        });

</script>
</body>
</html>