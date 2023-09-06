<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="en">

<%@include file="header.jsp"%>

<head>
    <title>VIAS | A minha carteira</title>
    <link rel="stylesheet" href="css/wallet.css">
</head>

<body id="walletpage">

<!-- Modal -->
<div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered">
        <div class="modal-content">
            <div class="modal-header">
                <h1 class="modal-title fs-5" id="exampleModalLabel">Detalhes do título de transporte</h1>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <form action="">
            <div class="modal-body">
                <label for="nameOwner" class="modal-label">Nome do Titular</label>
                <input type="text" id="nameOwner" class="form-control" placeholder="Introduza o nome do titular">


                <label for="numberTitle" class="modal-label">Número do Título</label>
                <input type="text" class="form-control" id="numberTitle" placeholder="Introduza o número do título">


                <label for="expiringDate" class="modal-label">Data de Validade</label>
                <input type="date" class="form-control" id="expiringDate" placeholder="Data de Validade">
            </div>
            <div class="modal-footer">
                <button type="Reset" class="btn btn-secondary buttons-error">Limpar</button>
                <button type="button" class="btn btn-primary buttons">Guardar</button>
            </div>
            </form>
        </div>
    </div>
</div>


<div class="wrapper">

    <div class="container mt-5 walletbox">
        <div class="row">
            <div class="col-md-auto">
                <button class="arrowbutton">
                    <img src="/images/backarrow.png" width="40px">
                </button>
            </div>
            <div class="col">
                <h1 class="wallet-title">Carteira</h1>
            </div>
            <div class="switches-container">
                <input type="radio" id="switchTitulos" name="switchPlan" value="Titulos Activos" checked="checked"/>
                <input type="radio" id="switchHistorico" name="switchPlan" value="Historico"/>
                <label for="switchTitulos">Títulos Activos</label>
                <label for="switchHistorico">Histórico</label>
                <div class="switch-wrapper">
                    <div class="switch">
                        <div>Títulos Activos</div>
                        <div>Histórico</div>
                    </div>
                </div>
            </div>

            <div class="data-container">
                <%-- FUTURE DATA   --%>

                <%--FUTURE DATA --%>

            </div>

            <div id="addbutton-container">
                <button class="addbutton" data-bs-toggle="modal" data-bs-target="#exampleModal"> Adicionar Título de Transporte</button>
            </div>

        </div>

    </div>
    <div class="col-md-auto text-center">
        <div class="footerlogo">
            <jsp:include page="footer.jsp"/>
        </div>
    </div>
</div>


</body>
</html>