<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!doctype html>
<html lang="en">
<%@include file="header.jsp"%>
<head>
    <title>Bem-vindo à VIAS</title>
    <link rel="stylesheet" href="/css/template.css">
    <link rel="stylesheet" href="/css/home.css">
    <link rel="stylesheet" href="/css/traveldetails.css">
    <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyDDHXeHO_gegeY8AJ_QRvjVv2D_KTQ82Bs"></script>

</head>
<body class="home-body" onload="initDirectionsService()">
<button class="arrowbutton" style="z-index: 1000" onclick="window.history.back()">
    <img src="/images/backarrow.png" alt="Go back!" width="30px">
</button>
<div class="home-container">

    <div class="mapbox">
        <iframe
                width=100%
                height=100%
                style="border:0"
                loading="lazy"
                allowfullscreen
                referrerpolicy="no-referrer-when-downgrade"
                src="https://www.google.com/maps/embed/v1/view?key=AIzaSyDDHXeHO_gegeY8AJ_QRvjVv2D_KTQ82Bs
    &center=38.77851493507939, -9.33226675574515
    &zoom=12">
        </iframe>
    </div>

    <div class="home-content" style="margin: -70px 0 0 0;">
        <div class="imageDesktop">
            <footer>
                <img class="imageTopLeft" src="images/logo_nobg.png" alt="">
            </footer>
        </div>
        <div class="button-box">
            <button class="button">Origem</button>
            <button class="button">Destino</button>
        </div>
        <div class="suggestions-box">
            <div class="card" id="suggestions-small-card">

                <div>

                    <h1 style="font-size: 1.375rem;">
                    <span>15H37 - 15H59</span>
                    <span class="totalDuration">(22 min)</span>
                        ${leg.getDistance()}
                    </h1>

                </div>

                <div>

                    <div>

                        <div>
                            <span>
                                <img src="//maps.gstatic.com/mapfiles/transit/iw2/svg/bus2.svg" alt="" width="15px" height="15px">
                            </span>
                            <span class="lineNumber">3721</span>
                            <span>
                                <img src="https://maps.gstatic.com/tactile/directions/cards/arrow-right-1x.png">
                            </span>
                            <span>
                                <img src="//maps.gstatic.com/mapfiles/transit/iw2/svg/walk.svg" width="15px" height="15px">
                            </span>

                        </div>

                        <div>

                            <div>
                                <span> 15H37 from Pragal (Portagem)</span>
                            </div>

                            <span> <img src="//maps.gstatic.com/mapfiles/transit/iw2/svg/walk.svg" width="15px" height="15px"> 3 min </span>

                        </div>



                    </div>

                </div>


            </div>


            <div class="detailed-card">
                <div class="detailed-card-box">
               <div>
                   <div class="eachStepDiv">
                       <div class="left-column">
                           <div class="firstLine">
                               <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" width="20px" height="20px"><path d="M12 2a8 8 0 0 0-7.992 8A12.816 12.816 0 0 0 12 22a12.816 12.816 0 0 0 7.988-12A8 8 0 0 0 12 2zm0 11a3 3 0 1 1 3-3 3 3 0 0 1-3 3z"/></svg>
                           </div>
                           <div class="secondLine">
                                 15H37
                           </div>
                       </div>
                       <div class="right-column">
                           <div class="firstLine">
                               Pragal (Portagem)
                           </div>
                           <div class="secondLine">
                               Almada
                           </div>
                       </div>
                   </div>
               </div>
                </div>
            </div>
            <div style="display: flex; justify-content: center;">
                <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 25 25" style="width: 15px;"><path style="fill:#232326" d="m18.294 16.793-5.293 5.293V1h-1v21.086l-5.295-5.294-.707.707L12.501 24l6.5-6.5-.707-.707z"/></svg>
            </div>
            <div class="detailed-card">
                <div class="detailed-card-box">
                    <div>
                        <div class="eachStepDiv">
                            <div class="left-column">
                               <img src="//maps.gstatic.com/mapfiles/transit/iw2/svg/bus2.svg" width="20px" height="20px">
                            </div>
                            <div class="right-column">
                                <div class="firstLine">
                                    Lisboa (Sete Rios)
                                </div>
                                <div class="secondLine">
                                   18 mins (8 stops)
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div style="display: flex; justify-content: center;">
                <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 25 25" style="width: 15px;"><path style="fill:#232326" d="m18.294 16.793-5.293 5.293V1h-1v21.086l-5.295-5.294-.707.707L12.501 24l6.5-6.5-.707-.707z"/></svg>
            </div>
            <div class="detailed-card">
                <div class="detailed-card-box">
                    <div>
                        <div class="eachStepDiv">
                            <div class="left-column">
                                15H56
                            </div>
                            <div class="right-column">
                                <div class="firstLine">
                                    Sete Rios (Estação)
                                </div>
                                <div class="secondLine">
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div style="display: flex; justify-content: center;">
                <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 25 25" style="width: 15px;"><path style="fill:#232326" d="m18.294 16.793-5.293 5.293V1h-1v21.086l-5.295-5.294-.707.707L12.501 24l6.5-6.5-.707-.707z"/></svg>
            </div>
            <div class="detailed-card">
                <div class="detailed-card-box">
                    <div>
                        <div class="eachStepDiv">
                            <div class="left-column">
                                <img src="//maps.gstatic.com/mapfiles/transit/iw2/svg/walk.svg" width="20px" height="20px">
                            </div>
                            <div class="right-column">
                                <div class="firstLine">
                                    Andar a pé
                                </div>
                                <div class="secondLine">
                                    Cerca de 3 mins, 150m
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div style="display: flex; justify-content: center;">
                <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 25 25" style="width: 15px;"><path style="fill:#232326" d="m18.294 16.793-5.293 5.293V1h-1v21.086l-5.295-5.294-.707.707L12.501 24l6.5-6.5-.707-.707z"/></svg>
            </div>
            <div class="detailed-card">
                <div class="detailed-card-box">
                    <div>
                        <div class="eachStepDiv">
                            <div class="left-column">
                                <div class="firstLine">
                                    <svg xmlns="http://www.w3.org/2000/svg" width="20" height="20"><path d="M2 15h9v3h8V5h-8V2H2V0H0v23h2zM8 4v3h3v3h3V7h3v3h-3v3h3v3h-3v-3h-3v-3H8v3H5v-3H2V7h3V4z"/><path d="M5 7h3v3H5z"/></svg>
                                </div>
                                <div class="secondLine">
                                    15H59
                                </div>

                            </div>
                            <div class="right-column">
                                <div class="firstLine">
                                    ${leg.getDuration()}
                                    Sete Rios
                                </div>
                                <div class="secondLine">
                                    Chegou ao seu destino
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <div class="button-box-travel">
                <button class="button-travel btn btn-primary buttons" style="margin-left: 12px">Começar Viagem</button>
                <button class="button-travel btn btn-primary buttons">Cancelar</button>
                <button class="button-travel btn btn-primary buttons">Simular Viagem</button>
            </div>


        </div>
        <div class="footerlogo">
            <footer>
                <img class="footerimage" src="images/logo_nobg.png" alt="">
            </footer>
        </div>

    </div>
</div>


</body>
</html>