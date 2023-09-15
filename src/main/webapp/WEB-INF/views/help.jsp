<!DOCTYPE html>
<html lang="en">
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="header.jsp" %>
<head>
    <meta charset="UTF-8">
    <title>VIAS | Ajuda</title>
    <link rel="stylesheet" href="/css/help.css">
</head>
<body>
<div class="container">

        <button class="arrowbutton" onclick="window.history.back();">
            <img src="/images/backarrow.png" alt="Go back!" width="30px">
        </button>

    <p class="title">FAQs</p>

    <div class="d-grid">

        <div class="row">
            <div class="col-12">
                <button class="btn btn-primary slct-buttons max-height-button" type="button" data-bs-toggle="collapse"
                        data-bs-target="#1-collapse" aria-expanded="false" aria-controls="1-collapse"
                        onclick="toggleButtonColor(this)" >
                    Como planeio a minha viagem?
                </button>
            </div>
            <div class="col-12">
                <div id="1-collapse" class="collapse text-containerr">
                    <ol>
                        <li>Abrir a aplicação VIAS.</li>
                        <li>Na página principal, selecione a sua origem e destino.</li>
                        <li>Selecione a data e horário da viagem.</li>
                        <li>Selecione uma das opções apresentadas.</li>
                        <li>Selecione "Iniciar Viagem".</li>
                    </ol>
                </div>
            </div>
        </div>

        <div class="row">
            <div class="col-12">
                <button class="btn btn-primary slct-buttons" type="button" data-bs-toggle="collapse"
                        data-bs-target="#2-collapse" aria-expanded="false" aria-controls="2-collapse"
                        onclick="toggleButtonColor(this)">
                    Posso usar a VIAS para viajar em Portugal?
                </button>
            </div>
            <div class="col-12">
                <div id="2-collapse" class="collapse text-containerr">
                    <p><strong>Resposta:</strong> A VIAS atualmente oferece serviços para viagens dentro da
                        Área Metropolitana de Lisboa. No entanto, estamos a trabalhar para expandir os nossos serviços
                        para incluir viagens nacionais no futuro.</p>
                </div>
            </div>
        </div>

        <div class="row">
            <div class="col-12">
                <button class="btn btn-primary slct-buttons" type="button" data-bs-toggle="collapse"
                        data-bs-target="#3-collapse" aria-expanded="false" aria-controls="3-collapse"
                        onclick="toggleButtonColor(this)">
                    Quais são as opções de transporte oferecidas pela VIAS?
                </button>
            </div>
            <div class="col-12">
                <div id="3-collapse" class="collapse text-containerr">
                    <p>A VIAS oferece uma variedade de opções de transporte, incluindo autocarros,
                        comboios, metro e barcos(?). Pode escolher o modo de transporte que melhor
                        atende às suas necessidades de viagem ao planear a sua viagem.</p>
                </div>
            </div>
        </div>

        <div class="row">
            <div class="col-12">
                <button class="btn btn-primary slct-buttons" type="button" data-bs-toggle="collapse"
                        data-bs-target="#4-collapse" aria-expanded="false" aria-controls="4-collapse"
                        onclick="toggleButtonColor(this)">
                    Como faço para atualizar o meu perfil na aplicação VIAS?
                </button>
            </div>
            <div class="col-12">
                <div id="4-collapse" class="collapse text-containerr">
                    <ol>
                        <li>Faça login na aplicação VIAS.</li>
                        <li>Na página principal, abra o menu lateral.</li>
                        <li>Selecione a sua imagem de perfil/nome.</li>
                        <li>No seu perfil, clique no seu nome completo.</li>
                        <li>Faça as alterações pretendidas e selecione a opção "Confirmar Alterações".</li>
                    </ol>
                </div>
            </div>
        </div>

        <div class="row">
            <div class="col-12">
                <button class="btn btn-primary slct-buttons" type="button" data-bs-toggle="collapse"
                        data-bs-target="#5-collapse" aria-expanded="false" aria-controls="5-collapse"
                        onclick="toggleButtonColor(this)">
                    Onde posso encontrar informações sobre horários de transporte?
                </button>
            </div>
            <div class="col-12">
                <div id="5-collapse" class="collapse text-containerr">
                    <p> Poderá encontrar informações detalhadas sobre horários de transporte
                        na nossa aplicação, basta selecionar a opção "Horários" no menu lateral da página principal.</p>
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

<script>
    function toggleButtonColor(button) {
        const isSelected = button.classList.contains('selected-button');

        if (!isSelected) {
            // Set to selected state
            button.classList.add('selected-button');
            button.style.backgroundColor = '#041F48';
            button.style.color = 'white';
        } else {
            // Revert to original state
            button.classList.remove('selected-button');
            button.style.backgroundColor = 'white';
            button.style.color = '#041F48';
        }
    }

</script>


</body>
</html>