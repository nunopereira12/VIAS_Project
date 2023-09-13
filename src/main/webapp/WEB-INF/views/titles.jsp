<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!doctype html>
<html lang="en">
<%@include file="header.jsp"%>
<head>
    <title>VIAS | Títulos</title>
    <link rel="stylesheet" href="/css/titles.css">
</head>
<body>

<div class="container">
    <div class="mapa-container">
        <button class="arrowbutton" onclick="window.location.href='/home';">
            <img src="/images/backarrow.png" alt="Go back!" width="30px">
        </button>

        <img class="mapa mapa-shadow" src="/images/vias_card.v2.png" alt="~~api inbound">
    </div>

    <div class="info-container">
        <div class="nome">
            <p>Os seus bilhetes, <span>${user.getFirstName()}:</span></p>

                <%--<div class="user-tickets">
                    <h2>User Tickets:</h2>
                    <c:forEach var="ticket" items="${userTickets}">
                        <p>${ticket.ticketInfo}</p>

                    </c:forEach>
                </div>--%>
            </div>
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