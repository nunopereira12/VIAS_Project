<!DOCTYPE html>
<html lang="en">
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="../header.jsp" %>
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
        <div class="footerimage" style="margin-top: 12px">
            <svg width="115" height="25" viewBox="0 0 196 45" fill="none" xmlns="http://www.w3.org/2000/svg">
                <path d="M18.24 45L-0.896 0.199997H12.8L28.928 38.984H20.864L37.376 0.199997H49.92L30.72 45H18.24ZM52.5425 45V0.199997H65.2145V45H52.5425ZM68.854 45L88.63 0.199997H101.11L120.95 45H107.766L92.278 6.408H97.27L81.782 45H68.854ZM79.67 36.296L82.934 26.952H104.822L108.086 36.296H79.67Z" fill="white"/>
                <path d="M177.001 24.6667L176.998 43.3333L196 38.0027L190.46 34.1147C193.142 30.656 194.643 26.408 194.64 22C194.64 10.9733 185.51 1.99999 174.284 1.99999C158.892 1.99999 155.246 16.3226 154.049 21.032C151.3 31.832 147.294 34 141.714 34C134.98 34 129.5 28.616 129.5 22C129.5 19.272 130.482 16.664 132.189 14.5547L138.999 19.3333V0.666656L120 5.99999L125.54 9.88532C122.858 13.344 121.357 17.592 121.357 22C121.357 33.0293 130.488 42 141.714 42C155.512 42 159.869 31.1413 161.948 22.968C164.849 11.5733 169.591 9.99999 174.284 9.99999C181.018 9.99999 186.498 15.3867 186.498 22.0054C186.5 24.7307 185.518 27.3387 183.811 29.448L177.001 24.6667Z" fill="#A3DD41"/>
            </svg>
        </div>
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