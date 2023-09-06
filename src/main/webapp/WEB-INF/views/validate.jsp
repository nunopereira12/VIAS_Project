<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!doctype html>
<html lang="en">

    <%@include file="header.jsp"%>
<head>
    <title>VIAS | Estamos na via</title>
    <link rel="stylesheet" href="/css/validate.css">
</head>
<body id="validate-page">
    <div class="validate-container">
        <h2 class="validate-title">Validar Títulos</h2>
        <div class="div-buttons">
            <button type="button" class="button-validate"><svg xmlns="http://www.w3.org/2000/svg" width="30" height="30" viewBox="0 0 30 30" fill="none">
                <mask id="mask0_172_659" style="mask-type:alpha" maskUnits="userSpaceOnUse" x="0" y="0" width="30" height="30">
                    <rect width="30" height="30" fill="#D9D9D9"/>
                </mask>
                <g mask="url(#mask0_172_659)">
                    <path d="M8.75 21.25H21.25V8.75H16.25C15.5625 8.75 14.974 8.99479 14.4844 9.48438C13.9948 9.97396 13.75 10.5625 13.75 11.25V12.875C13.3333 13.1042 13.0208 13.3958 12.8125 13.75C12.6042 14.1042 12.5 14.5208 12.5 15C12.5 15.6875 12.7448 16.276 13.2344 16.7656C13.724 17.2552 14.3125 17.5 15 17.5C15.6875 17.5 16.276 17.2552 16.7656 16.7656C17.2552 16.276 17.5 15.6875 17.5 15C17.5 14.5208 17.3854 14.1042 17.1563 13.75C16.9271 13.3958 16.625 13.1042 16.25 12.875V11.25H18.75V18.75H11.25V11.25H12.5V8.75H8.75V21.25ZM6.25 26.25C5.5625 26.25 4.97396 26.0052 4.48438 25.5156C3.99479 25.026 3.75 24.4375 3.75 23.75V6.25C3.75 5.5625 3.99479 4.97396 4.48438 4.48438C4.97396 3.99479 5.5625 3.75 6.25 3.75H23.75C24.4375 3.75 25.026 3.99479 25.5156 4.48438C26.0052 4.97396 26.25 5.5625 26.25 6.25V23.75C26.25 24.4375 26.0052 25.026 25.5156 25.5156C25.026 26.0052 24.4375 26.25 23.75 26.25H6.25ZM6.25 23.75H23.75V6.25H6.25V23.75Z" fill="white"/>
                </g>
            </svg><span>Leitor NFC</span></button>
            <button type="button" class="button-validate"><svg xmlns="http://www.w3.org/2000/svg" width="30" height="30" viewBox="0 0 30 30" fill="none">
                <mask id="mask0_172_647" style="mask-type:alpha" maskUnits="userSpaceOnUse" x="0" y="0" width="30" height="30">
                    <rect width="30" height="30" fill="#D9D9D9"/>
                </mask>
                <g mask="url(#mask0_172_647)">
                    <path d="M2.5 8.75V2.5H8.75V5H5V8.75H2.5ZM2.5 27.5V21.25H5V25H8.75V27.5H2.5ZM21.25 27.5V25H25V21.25H27.5V27.5H21.25ZM25 8.75V5H21.25V2.5H27.5V8.75H25ZM21.875 21.875H23.75V23.75H21.875V21.875ZM21.875 18.125H23.75V20H21.875V18.125ZM20 20H21.875V21.875H20V20ZM18.125 21.875H20V23.75H18.125V21.875ZM16.25 20H18.125V21.875H16.25V20ZM20 16.25H21.875V18.125H20V16.25ZM18.125 18.125H20V20H18.125V18.125ZM16.25 16.25H18.125V18.125H16.25V16.25ZM23.75 6.25V13.75H16.25V6.25H23.75ZM13.75 16.25V23.75H6.25V16.25H13.75ZM13.75 6.25V13.75H6.25V6.25H13.75ZM11.875 21.875V18.125H8.125V21.875H11.875ZM11.875 11.875V8.125H8.125V11.875H11.875ZM21.875 11.875V8.125H18.125V11.875H21.875Z" fill="white"/>
                </g>
            </svg><span>Leitor QR</span></button>
        </div>
            <div class="validate-box">
                <svg xmlns="http://www.w3.org/2000/svg" width="200" height="200" viewBox="0 0 200 200" fill="none">
                    <mask id="mask0_172_770" style="mask-type:alpha" maskUnits="userSpaceOnUse" x="0" y="0" width="200" height="200">
                        <rect width="200" height="200" fill="#D9D9D9"/>
                    </mask>
                    <g mask="url(#mask0_172_770)">
                        <path d="M16.6667 58.3333V16.6666H58.3333V33.3333H33.3333V58.3333H16.6667ZM16.6667 183.333V141.667H33.3333V166.667H58.3333V183.333H16.6667ZM141.667 183.333V166.667H166.667V141.667H183.333V183.333H141.667ZM166.667 58.3333V33.3333H141.667V16.6666H183.333V58.3333H166.667ZM145.833 145.833H158.333V158.333H145.833V145.833ZM145.833 120.833H158.333V133.333H145.833V120.833ZM133.333 133.333H145.833V145.833H133.333V133.333ZM120.833 145.833H133.333V158.333H120.833V145.833ZM108.333 133.333H120.833V145.833H108.333V133.333ZM133.333 108.333H145.833V120.833H133.333V108.333ZM120.833 120.833H133.333V133.333H120.833V120.833ZM108.333 108.333H120.833V120.833H108.333V108.333ZM158.333 41.6666V91.6666H108.333V41.6666H158.333ZM91.6667 108.333V158.333H41.6667V108.333H91.6667ZM91.6667 41.6666V91.6666H41.6667V41.6666H91.6667ZM79.1667 145.833V120.833H54.1667V145.833H79.1667ZM79.1667 79.1666V54.1666H54.1667V79.1666H79.1667ZM145.833 79.1666V54.1666H120.833V79.1666H145.833Z" fill="#041F48"/>
                    </g>
                </svg>
            </div>
        <div class="col-md-auto text-center">
            <div class="footerlogo">
                <jsp:include page="footer.jsp" />
            </div>
        </div>
    </div>

</body>
</html>
