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
                <a href="http://localhost:8080">
                    <button class="arrowbutton">
                        <img src="/images/backarrow.png" alt="Go back!" width="40px">
                    </button>
                </a>
                <img class="imagelogo center-img" src="images/vias_league.v3.png" width="200px">
                <%--<div class="d-grid">
                    <div class="btn-group" style="margin-top: 30px">
                        <button type="button" class="btn btn-primary-outline">
                            <img src="/images/my_league_small_logo.png" width="20px">My League
                        </button>
                        <button type="button" class="btn btn-primary-outline">
                            <img src="/images/leaderboard_small_logo.png" width="20px">Leaderboard
                        </button>
                    </div>
                </div>--%>
                <div class="switches-container">
                    <input type="radio" id="switchLeague" name="switchPlan" value="My League Logo" checked="checked"/>
                    <input type="radio" id="switchLeaderboard" name="switchPlan" value="Leaderboard"/>
                    <label for="switchLeague">
                        <div class="centered-content">
                            <img src="/images/my_league_small_logo.png" alt="My League Logo">
                            <span>My League</span>
                        </div>
                    </label>
                    <label for="switchLeaderboard">
                        <div class="centered-content">
                            <img src="/images/leaderboard_small_logo.png" alt="My Leaderboard Logo">
                            <span>Leaderboard</span>
                        </div>
                    </label>
                    <div class="switch-wrapper">
                        <div class="switch">
                            <div class="centered-content">
                                <img src="/images/my_league_small_logo.png">
                                <span> My League </span>
                            </div>
                            <div class="centered-content">
                                <img src="/images/leaderboard_small_logo.png">
                                <span> Leaderboard</span>
                            </div>
                        </div>
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
                                <td>João Antão</td>
                                <td>
                                    <div class="points">
                                        <div class="points-number">1020</div>
                                        <div class="points-text">pontos</div>
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <th scope="row">2</th>
                                <td>
                                    <div class="circle">
                                        <img src="https://avatars.steamstatic.com/1049039bc4e85be4f93ecd09f6398d7c7a9442ba_full.jpg" alt="av1" width="5px">
                                    </div>
                                </td>
                                <td>Pipa</td>
                                <td>
                                    <div class="points">
                                        <div class="points-number">150</div>
                                        <div class="points-text">pontos</div>
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <th scope="row">3</th>
                                <td>
                                    <div class="circle">
                                        <img src="https://avatars.steamstatic.com/1049039bc4e85be4f93ecd09f6398d7c7a9442ba_full.jpg" alt="av1" width="5px">
                                    </div>
                                </td>
                                <td>Ricardo</td>
                                <td>
                                    <div class="points">
                                        <div class="points-number">30</div>
                                        <div class="points-text">pontos</div>
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <th scope="row">4</th>
                                <td>
                                    <div class="circle">
                                        <img src="https://avatars.steamstatic.com/1049039bc4e85be4f93ecd09f6398d7c7a9442ba_full.jpg" alt="av1" width="5px">
                                    </div>
                                </td>
                                <td>Gui</td>
                                <td>
                                    <div class="points">
                                        <div class="points-number">20</div>
                                        <div class="points-text">pontos</div>
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <th scope="row">5</th>
                                <td>
                                    <div class="circle">
                                        <img src="https://avatars.steamstatic.com/1049039bc4e85be4f93ecd09f6398d7c7a9442ba_full.jpg" alt="av1" width="5px">
                                    </div>
                                </td>
                                <td>Nuno</td>
                                <td>
                                    <div class="points">
                                        <div class="points-number">10</div>
                                        <div class="points-text">pontos</div>
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <th scope="row">6</th>
                                <td>
                                    <div class="circle">
                                        <img src="https://avatars.steamstatic.com/1049039bc4e85be4f93ecd09f6398d7c7a9442ba_full.jpg" alt="av1" width="5px">
                                    </div>
                                </td>
                                <td>Tiago</td>
                                <td>
                                    <div class="points">
                                        <div class="points-number">5</div>
                                        <div class="points-text">pontos</div>
                                    </div>
                                </td>
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