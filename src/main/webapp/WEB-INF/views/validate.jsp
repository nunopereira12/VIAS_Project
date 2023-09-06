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
            <button type="button" class="btn btn-primary button-validate">Leitor NFC</button>
            <button type="button" class="btn btn-primary button-validate">Leitor QR</button>
    </div>

    <div class="col-md-auto text-center">
        <div class="footerlogo">
            <jsp:include page="footer.jsp" />
        </div>
    </div>

</body>
</html>
