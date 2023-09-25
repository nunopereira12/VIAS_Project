<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!doctype html>
<html lang="en">
<%@include file="../header.jsp" %>
<head>
    <title>VIAS - VIAS League</title>
    <link rel="stylesheet" href="/css/template.css">
    <link rel="stylesheet" href="/css/vias_league.css">
</head>
<body>

<div class="container">
    <div class="white-container">
        <button class="arrowbutton" onclick="window.location.href='/home';">
            <img src="/images/backarrow.png" alt="Go back!" width="30px">
        </button>

        <img class="imagelogo center-img" src="images/vias_league.v3.png" width="200px">

    </div>

    <div class="buttons-container">
        <div class="icon-container">
            <button class="icon-button" data-bs-toggle="modal" data-bs-target="#exampleModal">
                <img src="/images/vias_league/info_icon.png" alt="Button Image" class="icon">
            </button>
        </div>
        <form id="filterForm" action="/vias_league" method="get">
            <label id="opcao" for="filter" style="font-size: 18px;">Selecione uma leaderboard:</label>
            <br>
            <select id="filter" name="filter" onchange="saveSelectedFilter()" size="1">
                <option value="My League" ${selected_filter eq 'My League' ? 'selected' : ''}
                        class="highlighted-option">
                    My League
                </option>
                <option value="Global League" ${selected_filter eq 'Global League' ? 'selected' : ''}
                        class="highlighted-option">Global League
                </option>
                <option value="Distância Percorrida a Andar" ${selected_filter eq 'Distância Percorrida a Andar' ? 'selected' : ''}>
                    Distância Percorrida a Andar
                </option>
                <option value="Distância Percorrida Transportes" ${selected_filter eq 'Distância Percorrida Transportes' ? 'selected' : ''}>
                    Distância Percorrida Transportes
                </option>
                <option value="Tempo Despendido a Andar" ${selected_filter eq 'Tempo Despendido a Andar' ? 'selected' : ''}>
                    Tempo Despendido a Andar
                </option>
                <option value="Tempo Despendido Transportes" ${selected_filter eq 'Tempo Despendido Transportes' ? 'selected' : ''}>
                    Tempo Despendido Transportes
                </option>
                <option value="Viagens Completas" ${selected_filter eq 'Viagens Completas' ? 'selected' : ''}>Viagens
                    Completas
                </option>
            </select>
        </form>

    </div>

    <div class="list-container" id="list1">
        <div class="container-liga">

            <c:if test="${selected_filter eq 'My League'}">
                <c:choose>
                    <c:when test="${user.getCurrent_league().getId() eq '1'}">

                        <div class="left">
                            <img class="image_badge center-img" src="images/vias_league/bronze_badge.png" width="65px"
                                 alt="Bronze Image"/>
                            <div class="liga"><strong>Liga Bronze</strong></div>
                        </div>
                    </c:when>
                    <c:when test="${user.getCurrent_league().getId() eq '2'}">
                        <div class="left">
                            <img class="image_badge center-img" src="images/vias_league/silver_badge.png" width="65px"
                                 alt="Silver Image"/>
                            <div class="liga"><strong>Liga Prata</strong></div>
                        </div>
                    </c:when>
                    <c:when test="${user.getCurrent_league().getId() eq '3'}">
                        <div class="left">
                            <img class="image_badge center-img" src="images/vias_league/gold_badge.png" width="65px"
                                 alt="Gold Image"/>
                            <div class="liga"><strong>Liga Ouro</strong></div>
                        </div>
                    </c:when>
                    <c:when test="${user.getCurrent_league().getId() eq '4'}">
                        <div class="left">
                            <img class="image_badge center-img" src="images/vias_league/platinum_badge.png" width="65px"
                                 alt="Platinum Image"/>
                            <div class="liga"><strong>Liga Platina</strong></div>
                        </div>
                    </c:when>
                    <c:when test="${user.getCurrent_league().getId() eq '5'}">
                        <div class="left">
                            <img class="image_badge center-img" src="images/vias_league/diamond_badge.png" width="65px"
                                 alt="Diamond Image"/>
                            <div class="liga"><strong>Liga Diamante</strong></div>
                        </div>
                    </c:when>
                </c:choose>
                <div class="right">
                    <img class="clock center-img" src="images/vias_league/small_clock.png" width="25px"
                         alt="Clock Image"/>
                    <div id="countdown" class="countdown-container">
                        <div class="countdown-item">
                            <div class="countdown-circle">
                                <span id="days"></span>
                            </div>
                            <div class="countdown-label">Dias</div>
                        </div>
                        <div class="countdown-item">
                            <div class="countdown-circle">
                                <span id="hours"></span>
                            </div>
                            <div class="countdown-label">Horas</div>
                        </div>
                        <div class="countdown-item">
                            <div class="countdown-circle">
                                <span id="minutes"></span>
                            </div>
                            <div class="countdown-label">Min</div>
                        </div>
                        <div class="countdown-item">
                            <div class="countdown-circle">
                                <span id="seconds"></span>
                            </div>
                            <div class="countdown-label">Seg</div>
                        </div>
                    </div>
                    <div class="container-update">
                        <span>Última semana:</span>
                        <c:choose>
                            <c:when test="${user.getPrevious_league().getId() eq '1'}">
                                <img class="image_badge center-img" src="images/vias_league/bronze_badge.png"
                                     width="20px"
                                     alt="Bronze Image"/>
                            </c:when>
                            <c:when test="${user.getPrevious_league().getId() eq '2'}">
                                <img class="image_badge center-img" src="images/vias_league/silver_badge.png"
                                     width="20px"
                                     alt="Silver Image"/>
                            </c:when>
                            <c:when test="${user.getPrevious_league().getId() eq '3'}">
                                <img class="image_badge center-img" src="images/vias_league/gold_badge.png" width=20px"
                                     alt="Gold Image"/>
                            </c:when>
                            <c:when test="${user.getPrevious_league().getId() eq '4'}">
                                <img class="image_badge center-img" src="images/vias_league/platinum_badge.png"
                                     width="20px"
                                     alt="Platinum Image"/>
                            </c:when>
                            <c:when test="${user.getPrevious_league().getId() eq '5'}">
                                <img class="image_badge center-img" src="images/vias_league/diamond_badge.png"
                                     width="20px"
                                     alt="Diamond Image"/>
                            </c:when>
                        </c:choose>
                        <img src="/images/vias_league/cool_arrow.png" width="15px">

                        <c:choose>
                            <c:when test="${user.getCurrent_league().getId() eq '1'}">
                                <img class="image_badge center-img" src="images/vias_league/bronze_badge.png"
                                     width="20px"
                                     alt="Bronze Image"/>
                            </c:when>
                            <c:when test="${user.getCurrent_league().getId() eq '2'}">
                                <img class="image_badge center-img" src="images/vias_league/silver_badge.png"
                                     width="20px"
                                     alt="Silver Image"/>
                            </c:when>
                            <c:when test="${user.getCurrent_league().getId() eq '3'}">
                                <img class="image_badge center-img" src="images/vias_league/gold_badge.png" width=20px"
                                     alt="Gold Image"/>
                            </c:when>
                            <c:when test="${user.getCurrent_league().getId() eq '4'}">
                                <img class="image_badge center-img" src="images/vias_league/platinum_badge.png"
                                     width="20px"
                                     alt="Platinum Image"/>
                            </c:when>
                            <c:when test="${user.getCurrent_league().getId() eq '5'}">
                                <img class="image_badge center-img" src="images/vias_league/diamond_badge.png"
                                     width="20px"
                                     alt="Diamond Image"/>
                            </c:when>
                        </c:choose>
                    </div>


                </div>
            </c:if>
        </div>

        <c:choose>
            <c:when test="${selected_filter eq 'Global League'}">
                <img class="image_badge center-img" src="images/vias_league/leaderboard.v2.png"
                     width="65px" style="margin-top: -22px"
                     alt="Bronze Image"/>
                <div class="leaderboard" style="margin-bottom: -2px"><strong>${selected_filter}</strong></div>
            </c:when>
            <c:when test="${selected_filter eq 'Distância Percorrida a Andar'}">
                <img class="image_badge center-img" src="images/vias_league/man_walking.png"
                     width="90px" style="margin-top: -30px; margin-bottom: -10px"
                     alt="Bronze Image"/>
                <div class="leaderboard" style="margin-bottom: -3px"><strong>${selected_filter}</strong></div>
            </c:when>
            <c:when test="${selected_filter eq 'Distância Percorrida Transportes'}">
                <img class="image_badge center-img" src="images/vias_league/train_icon.png"
                     width="150px" style="margin-top: -60px; margin-bottom: -20px"
                     alt="Bronze Image"/>
                <div class="leaderboard" style="margin-bottom: -3px"><strong>${selected_filter}</strong></div>
            </c:when>
            <c:when test="${selected_filter eq 'Tempo Despendido a Andar'}">
                <img class="image_badge center-img" src="images/vias_league/man_walking.png"
                     width="90px" style="margin-top: -30px; margin-bottom: -10px"
                     alt="Bronze Image"/>
                <div class="leaderboard" style="margin-bottom: -8px"><strong>${selected_filter}</strong></div>
            </c:when>
            <c:when test="${selected_filter eq 'Tempo Despendido Transportes'}">
                <img class="image_badge center-img" src="images/vias_league/train_icon.png"
                     width="150px" style="margin-top: -60px; margin-bottom: -20px"
                     alt="Bronze Image"/>
                <div class="leaderboard" style="margin-bottom: -3px"><strong>${selected_filter}</strong></div>
            </c:when>
            <c:when test="${selected_filter eq 'Viagens Completas'}">
                <img class="image_badge center-img" src="images/vias_league/travel_trip.png"
                     width="100px" style="margin-top: -30px; margin-bottom: -10px"
                     alt="Bronze Image"/>
                <div class="leaderboard" style="margin-bottom: -3px"><strong>${selected_filter}</strong></div>
            </c:when>
        </c:choose>

        <hr>
        <div class="table-container">

            <table class="table">
                <tbody>
                <c:forEach var="player" items="${players}" varStatus="loopStatus">
                    <tr class="${target_username == player.getUsername() ? 'highlighted-row' : ''}">
                        <td id="num1">
                            <c:choose>
                                <c:when test="${loopStatus.index + 1 eq '1'}">
                                    <img class="image_badge center-img" id="gold_small"
                                         src="images/vias_league/gold_small.png"
                                         width="40px"
                                         alt="Bronze Image"/>
                                </c:when>
                                <c:when test="${loopStatus.index + 1 eq '2'}">
                                    <img class="image_badge center-img" id="silver_small"
                                         src="images/vias_league/silver_small.png"
                                         width="33px"
                                         alt="Silver Image"/>
                                </c:when>
                                <c:when test="${loopStatus.index + 1 eq '3'}">
                                    <img class="image_badge center-img" id="bronze_small"
                                         src="images/vias_league/bronze_small.png" width=26px"
                                         alt="Gold Image"/>
                                </c:when>
                                <c:otherwise>
                                    ${loopStatus.index + 1}
                                </c:otherwise>
                            </c:choose>

                        </td>
                        <td>
                            <div class="circle">
                                <img src=/uploads/${player.getProfile_picture()}  alt="av1" width="5px">
                            </div>
                        </td>
                        <td id="username1">${player.getUsername()}</td>
                        <td>
                            <div class="points">
                                <div class="points-number">
                                    <c:choose>
                                        <c:when test="${selected_filter eq 'My League'}">
                                            ${player.getUser_stats().getWeekly_points()}
                                            <div class="points-text">
                                                pontos
                                            </div>
                                        </c:when>
                                        <c:when test="${selected_filter eq 'Global League'}">
                                            ${player.getUser_stats().getTotal_points()}
                                            <div class="points-text">
                                                pontos
                                            </div>
                                        </c:when>
                                        <c:when test="${selected_filter eq 'Distância Percorrida a Andar'}">
                                            ${player.getUser_stats().getTotal_distance_walking()}
                                            <div class="points-text">
                                                metros
                                            </div>
                                        </c:when>
                                        <c:when test="${selected_filter eq 'Distância Percorrida Transportes'}">
                                            ${player.getUser_stats().getTotal_distance_transit()}
                                            <div class="points-text">
                                                km
                                            </div>
                                        </c:when>
                                        <c:when test="${selected_filter eq 'Tempo Despendido a Andar'}">
                                            ${player.getUser_stats().getTotal_time_walking()}
                                            <div class="points-text">
                                                minutos
                                            </div>
                                        </c:when>
                                        <c:when test="${selected_filter eq 'Tempo Despendido Transportes'}">
                                            ${player.getUser_stats().getTotal_time_transit()}
                                            <div class="points-text">
                                                minutos
                                            </div>
                                        </c:when>
                                        <c:when test="${selected_filter eq 'Viagens Completas'}">
                                            ${player.getUser_stats().getTrips_done()}
                                        </c:when>
                                    </c:choose>
                                </div>
                            </div>
                        </td>
                    </tr>
                </c:forEach>


                </tbody>
            </table>
        </div>
    </div>
</div>

<div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered">
        <div class="modal-content">
            <div class="modal-header">
                <h1 class="modal-title fs-5" id="exampleModalLabel"
                    style="text-align: justify; margin-left: 15px; margin-right: 15px">VIAS League</h1>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body" style="text-align: justify; margin-left: 15px; margin-right: 15px">
                <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Mauris viverra sem ut elit fermentum,
                    ullamcorper egestas ante pulvinar. Nam scelerisque pulvinar aliquet. Interdum et malesuada fames ac
                    ante ipsum primis in faucibus. Mauris placerat hendrerit risus, quis faucibus purus ultrices at.
                    Integer sollicitudin tellus non elementum maximus. Nam suscipit condimentum lacus nec lobortis.
                    Integer ut venenatis nulla. Phasellus vestibulum sem erat, eget luctus turpis auctor vitae. In hac
                    habitasse platea dictumst. Proin ac arcu neque. Vestibulum feugiat euismod pellentesque. Class
                    aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. </p>

                <p> Amanhã escrever aquiiii </p>


                <div class="modal-footer">
                    <button type="button" class="btn btn-primary buttons" data-bs-dismiss="modal">Vamos a isso!</button>
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

    const select = document.getElementById("filter");

    select.addEventListener("change", function () {
        // Submit the form when a change occurs
        document.getElementById("filterForm").submit();
    });

    function saveSelectedFilter() {
        var selectedFilter = document.getElementById("filter").value;

        // Store the selected filter in localStorage (you can also use cookies or session storage)
        localStorage.setItem("selected_filter", selectedFilter);
    }


    var targetDate = new Date("${formatted_date}");
    console.log("${formatted_date}")

    function updateCountdown() {
        var now = new Date();
        var timeDifference = targetDate - now;

        if (timeDifference <= 0) {
            document.getElementById("countdown").innerHTML = "Countdown expired!";
        } else {
            var days = Math.floor(timeDifference / (1000 * 60 * 60 * 24));
            var hours = Math.floor((timeDifference % (1000 * 60 * 60 * 24)) / (1000 * 60 * 60));
            var minutes = Math.floor((timeDifference % (1000 * 60 * 60)) / (1000 * 60));
            var seconds = Math.floor((timeDifference % (1000 * 60)) / 1000);

            // Display the countdown values in their respective elements
            document.getElementById("days").textContent = days;
            document.getElementById("hours").textContent = hours;
            document.getElementById("minutes").textContent = minutes;
            document.getElementById("seconds").textContent = seconds;
        }
    }

    updateCountdown();

    setInterval(updateCountdown, 1000);

    var modal = document.getElementById("myModal");

    var button = document.querySelector(".icon-button");

    button.addEventListener("click", function () {
        modal.style.display = "block";
    });

    window.addEventListener("click", function (event) {
        if (event.target === modal) {
            modal.style.display = "none";
        }
    });

    function closeModal() {
        var modal = new bootstrap.Modal(document.getElementById('exampleModal'));
        modal.hide();
    }

    if (!localStorage.getItem("visited_before")) {
        // Open the modal
        var modal = new bootstrap.Modal(document.getElementById('exampleModal'));
        modal.show();

        // Set a flag in localStorage to indicate that the user has visited
        localStorage.setItem("visited_before", "true");
    }

</script>

</body>
</html>