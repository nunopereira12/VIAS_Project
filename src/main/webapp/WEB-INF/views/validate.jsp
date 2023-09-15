<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!doctype html>
<html lang="en">
<%@include file="header.jsp"%>
<head>
    <title>VIAS - Validar Títulos</title>
    <link rel="stylesheet" href="/css/template.css">
    <link rel="stylesheet" href="/css/validate.css">

</head>
<body>

<div class="container">
    <button class="arrowbutton" onclick="window.history.back()">
        <img src="/images/backarrow.png" alt="Go back!" width="30px">
    </button>
    <p class="title">Validar Títulos</p>
    <div class="content">
        <div class="div-button">
            <button class="validate-button"><svg xmlns="http://www.w3.org/2000/svg" width="30" height="30" viewBox="0 0 30 30" fill="none">
                <mask id="mask0_341_1247" style="mask-type:alpha" maskUnits="userSpaceOnUse" x="0" y="0" width="30" height="30">
                    <rect width="30" height="30" fill="#D9D9D9"/>
                </mask>
                <g mask="url(#mask0_341_1247)">
                    <path d="M2.5 8.75V2.5H8.75V5H5V8.75H2.5ZM2.5 27.5V21.25H5V25H8.75V27.5H2.5ZM21.25 27.5V25H25V21.25H27.5V27.5H21.25ZM25 8.75V5H21.25V2.5H27.5V8.75H25ZM21.875 21.875H23.75V23.75H21.875V21.875ZM21.875 18.125H23.75V20H21.875V18.125ZM20 20H21.875V21.875H20V20ZM18.125 21.875H20V23.75H18.125V21.875ZM16.25 20H18.125V21.875H16.25V20ZM20 16.25H21.875V18.125H20V16.25ZM18.125 18.125H20V20H18.125V18.125ZM16.25 16.25H18.125V18.125H16.25V16.25ZM23.75 6.25V13.75H16.25V6.25H23.75ZM13.75 16.25V23.75H6.25V16.25H13.75ZM13.75 6.25V13.75H6.25V6.25H13.75ZM11.875 21.875V18.125H8.125V21.875H11.875ZM11.875 11.875V8.125H8.125V11.875H11.875ZM21.875 11.875V8.125H18.125V11.875H21.875Z" fill="white"/>
                </g>
            </svg><span style="margin: 10px">Validar</span>
            </button>
        </div>
        <div class="validate-box">

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