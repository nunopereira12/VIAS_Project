<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="en">
<%@include file="header.jsp" %>
<head>

    <title>Vias League</title>

    <link rel="stylesheet" href="/css/vias_league.css">
</head>
<body>
<div class="container mt-5 vias_leaguebox">
    <div class="row justify-content-center">
        <div class="col-md-auto">

            <div class="vias_league-container">
                <img class="imagelogo center-img" src="images/vias_league.v3.png" width="200px">
                <div class="d-grid">
                    <div class="btn-group" style="margin-top: 30px">
                        <button type="button" class="btn btn-primary-outline">
                            <img src="/images/my_league_small_logo.png" width="20px">My League
                        </button>
                        <button type="button" class="btn btn-primary-outline">
                            <img src="/images/leaderboard_small_logo.png" width="20px">Leaderboard
                        </button>
                    </div>
                </div>

                <div class="list-container">
                    <img class="image_badge center-img" src="/images/badge_gold.png" width="45px">
                    <div id="liga"><p>Liga de Ouro</p></div>
                    <hr>
                    <div class="table-container">

                        <table class="table">
                            <thead>
                            <tr>
                                <th scope="col"><%--#--%></th>
                                <th scope="col"><%--Avatar--%></th>
                                <th scope="col"><%--Nome--%></th>
                                <th scope="col"><%--Pontos--%></th>
                            </tr>
                            </thead>
                            <tbody>
                            <tr>
                                <th scope="row">1</th>
                                <td>
                                    <div class="circle">
                                        <img src="https://avatars.steamstatic.com/1049039bc4e85be4f93ecd09f6398d7c7a9442ba_full.jpg" alt="av1" width="5px">
                                    </div>
                                </td>
                                <td>Otto</td>
                                <td>@mdo</td>
                            </tr>
                            <tr>
                                <th scope="row">2</th>
                                <td>Jacob</td>
                                <td>Thornton</td>
                                <td>@fat</td>
                            </tr>
                            <tr>
                                <th scope="row">3</th>
                                <td>Larry</td>
                                <td>the Bird</td>
                                <td>@twitter</td>
                            </tr>
                            <tr>
                                <th scope="row">3</th>
                                <td>Larry</td>
                                <td>the Bird</td>
                                <td>@twitter</td>
                            </tr>
                            <tr>
                                <th scope="row">3</th>
                                <td>Larry</td>
                                <td>the Bird</td>
                                <td>@twitter</td>
                            </tr>
                            <tr>
                                <th scope="row">3</th>
                                <td>Larry</td>
                                <td>the Bird</td>
                                <td>@twitter</td>
                            </tr>
                            <tr>
                                <th scope="row">3</th>
                                <td>Larry</td>
                                <td>the Bird</td>
                                <td>@twitter</td>
                            </tr>
                            <tr>
                                <th scope="row">3</th>
                                <td>Larry</td>
                                <td>the Bird</td>
                                <td>@twitter</td>
                            </tr>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>

            <div class="col-md-auto text-center">
                <div class="footerlogo">
                    <jsp:include page="footer.jsp"/>
                </div>
            </div>
        </div>
    </div>
</div>

</body>
</html>