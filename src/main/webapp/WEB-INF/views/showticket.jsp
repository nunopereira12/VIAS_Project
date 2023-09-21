<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!doctype html>
<html lang="en">
<%@include file="header.jsp"%>
<head>
    <title>VIAS - Validar título</title>
    <link rel="stylesheet" href="/css/template.css">
    <link rel="stylesheet" href="/css/id_pica.css">
    <link rel="stylesheet" href="/css/showticket.css">

</head>
<body>

<div class="container container-pica">
    <button class="arrowbutton" onclick="window.history.back()">
        <img src="/images/backarrow.png" alt="Go back!" width="30px">
    </button>
    <p class="title">Validar título</p>
    <div class="content">
        <div class="pica-box">
           <%-- <svg xmlns="http://www.w3.org/2000/svg" width="200" height="200" viewBox="0 0 200 200" fill="none" style="margin:auto">
                <mask id="mask0_334_800" style="mask-type:alpha" maskUnits="userSpaceOnUse" x="0" y="0" width="200" height="200">
                    <rect width="200" height="200" fill="#D9D9D9"/>
                </mask>
                <g mask="url(#mask0_334_800)">
                    <path d="M16.6666 58.3333V16.6666H58.3333V33.3333H33.3333V58.3333H16.6666ZM16.6666 183.333V141.667H33.3333V166.667H58.3333V183.333H16.6666ZM141.667 183.333V166.667H166.667V141.667H183.333V183.333H141.667ZM166.667 58.3333V33.3333H141.667V16.6666H183.333V58.3333H166.667ZM145.833 145.833H158.333V158.333H145.833V145.833ZM145.833 120.833H158.333V133.333H145.833V120.833ZM133.333 133.333H145.833V145.833H133.333V133.333ZM120.833 145.833H133.333V158.333H120.833V145.833ZM108.333 133.333H120.833V145.833H108.333V133.333ZM133.333 108.333H145.833V120.833H133.333V108.333ZM120.833 120.833H133.333V133.333H120.833V120.833ZM108.333 108.333H120.833V120.833H108.333V108.333ZM158.333 41.6666V91.6666H108.333V41.6666H158.333ZM91.6666 108.333V158.333H41.6666V108.333H91.6666ZM91.6666 41.6666V91.6666H41.6666V41.6666H91.6666ZM79.1666 145.833V120.833H54.1666V145.833H79.1666ZM79.1666 79.1666V54.1666H54.1666V79.1666H79.1666ZM145.833 79.1666V54.1666H120.833V79.1666H145.833Z" fill="#041F48"/>
                </g>
            </svg>--%>
            <img class="qr-code" src="/generateQRCode/${cardqr}">
        </div>

    </div>

</div>


<div class="footerlogo">
    <footer>
        <img class="footerimage" src="images/logo_nobg.png" alt="">
    </footer>
</div>
</body>
</html>