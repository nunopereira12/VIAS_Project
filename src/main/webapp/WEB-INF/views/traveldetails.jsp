<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!doctype html>
<html lang="en">
<%@include file="header.jsp"%>
<head>
    <title>VIAS | Rota Detalhada</title>
    <link rel="stylesheet" href="/css/template.css">
    <link rel="stylesheet" href="/css/home.css">
    <link rel="stylesheet" href="/css/traveldetails.css">



</head>
<body class="home-body" onload="initMap()">
<form id="directionsForm" method="POST" action="/perform_travel">
<button class="arrowbutton" style="z-index: 1000" onclick="window.history.back()">
    <input type="hidden" name="origem" value="${leg.getStart_address()}">
    <input type="hidden" name="destino" value="${leg.getEnd_address()}">
    <img src="/images/backarrow.png" alt="Go back!" width="30px">
</button>
</form>
<div class="home-container">

    <div class="mapbox">
        <div id="map"></div>
    </div>

    <div class="home-content" style="margin: -70px 0 0 0;">

        <div class="imageDesktop">
            <footer>
                <img class="imageTopLeft" src="images/logo_nobg.png" alt="">
            </footer>
        </div>
        <div class="button-box">
            <button class="button" style="font-size: 14px"><svg style="margin:auto 7px auto" xmlns="http://www.w3.org/2000/svg" width="25" height="25" viewBox="0 0 40 40" fill="none">
                <mask id="mask0_27_208" style="mask-type:alpha" maskUnits="userSpaceOnUse" x="0" y="0" width="40" height="40">
                    <path d="M0 0H40V40H0V0Z" fill="#D9D9D9"/>
                </mask>
                <g mask="url(#mask0_27_208)">
                    <path d="M21.7083 36.5834V33.8056C22.9306 33.6389 24.1181 33.3149 25.2708 32.8334C26.4236 32.3519 27.5046 31.7223 28.5139 30.9445L30.4583 32.9722C29.1713 34.0185 27.7963 34.8403 26.3333 35.4375C24.8704 36.0347 23.3287 36.4167 21.7083 36.5834ZM32.9305 30.4445L30.9583 28.5278C31.6991 27.5556 32.3102 26.5023 32.7917 25.3681C33.2732 24.2338 33.6065 23.0185 33.7917 21.7222H36.625C36.4028 23.4074 35.9792 24.9838 35.3542 26.4514C34.7292 27.919 33.9213 29.25 32.9305 30.4445ZM33.7917 18.2778C33.6065 16.9723 33.2732 15.757 32.7917 14.632C32.3102 13.507 31.6991 12.4537 30.9583 11.4722L32.9305 9.55556C33.9861 10.8889 34.8079 12.2593 35.3958 13.6667C35.9838 15.0741 36.3935 16.6111 36.625 18.2778H33.7917ZM18.2361 36.5834C13.9861 36.1019 10.4468 34.2871 7.61804 31.1389C4.78935 27.9908 3.375 24.2778 3.375 20C3.375 15.713 4.78935 11.9954 7.61804 8.84723C10.4468 5.69909 13.9861 3.88891 18.2361 3.41669V6.19444C14.7546 6.66666 11.8704 8.20833 9.58333 10.8194C7.29628 13.4306 6.15275 16.4908 6.15275 20C6.15275 23.5093 7.29628 26.5671 9.58333 29.1736C11.8704 31.7801 14.7546 33.3241 18.2361 33.8056V36.5834ZM28.5695 9.05556C27.5139 8.30556 26.4074 7.68983 25.25 7.20835C24.0926 6.72685 22.9305 6.38888 21.7639 6.19444V3.41669C23.3102 3.61113 24.8241 4.00696 26.3055 4.60419C27.787 5.20141 29.1713 6.00928 30.4583 7.02781L28.5695 9.05556ZM20 28.6389C18.3519 27.2408 16.7963 25.7361 15.3333 24.125C13.8704 22.5139 13.1389 20.6389 13.1389 18.5C13.1389 16.5556 13.8032 14.8935 15.132 13.5139C16.4607 12.1343 18.0833 11.4445 20 11.4445C21.9167 11.4445 23.5393 12.1343 24.868 13.5139C26.1968 14.8935 26.8611 16.5556 26.8611 18.5C26.8611 20.6389 26.1296 22.5139 24.6667 24.125C23.2037 25.7361 21.6481 27.2408 20 28.6389ZM20 20.0556C20.5185 20.0556 20.956 19.8773 21.3125 19.5209C21.669 19.1644 21.8472 18.7269 21.8472 18.2084C21.8472 17.7361 21.669 17.3102 21.3125 16.9306C20.956 16.551 20.5185 16.3611 20 16.3611C19.4815 16.3611 19.044 16.551 18.6875 16.9306C18.331 17.3102 18.1528 17.7361 18.1528 18.2084C18.1528 18.7269 18.331 19.1644 18.6875 19.5209C19.044 19.8773 19.4815 20.0556 20 20.0556Z" fill="white"/>
                </g>
            </svg><span style="margin: auto auto auto 0">${leg.getStart_address()}</span></button>
            <button class="button" style="font-size: 14px">
                <svg style="margin:auto 7px auto" xmlns="http://www.w3.org/2000/svg" width="25" height="25" viewBox="0 0 40 40" fill="none">
                    <mask id="mask0_27_251" style="mask-type:alpha" maskUnits="userSpaceOnUse" x="0" y="0" width="40" height="40">
                        <rect width="40" height="40" fill="#D9D9D9"/>
                    </mask>
                    <g mask="url(#mask0_27_251)">
                        <path d="M20 20C20.9166 20 21.7013 19.6736 22.3541 19.0208C23.0069 18.368 23.3333 17.5833 23.3333 16.6666C23.3333 15.75 23.0069 14.9653 22.3541 14.3125C21.7013 13.6597 20.9166 13.3333 20 13.3333C19.0833 13.3333 18.2986 13.6597 17.6458 14.3125C16.993 14.9653 16.6666 15.75 16.6666 16.6666C16.6666 17.5833 16.993 18.368 17.6458 19.0208C18.2986 19.6736 19.0833 20 20 20ZM20 32.25C23.3888 29.1389 25.9027 26.3125 27.5416 23.7708C29.1805 21.2291 30 18.9722 30 17C30 13.9722 29.0347 11.493 27.1041 9.56248C25.1736 7.63192 22.8055 6.66665 20 6.66665C17.1944 6.66665 14.8263 7.63192 12.8958 9.56248C10.9652 11.493 9.99996 13.9722 9.99996 17C9.99996 18.9722 10.8194 21.2291 12.4583 23.7708C14.0972 26.3125 16.6111 29.1389 20 32.25ZM20 36.6666C15.5277 32.8611 12.1875 29.3264 9.97913 26.0625C7.77079 22.7986 6.66663 19.7778 6.66663 17C6.66663 12.8333 8.0069 9.51387 10.6875 7.04165C13.368 4.56942 16.4722 3.33331 20 3.33331C23.5277 3.33331 26.6319 4.56942 29.3125 7.04165C31.993 9.51387 33.3333 12.8333 33.3333 17C33.3333 19.7778 32.2291 22.7986 30.0208 26.0625C27.8125 29.3264 24.4722 32.8611 20 36.6666Z" fill="white"/>
                    </g>
                </svg><span style="margin: auto auto auto 0 ">${leg.getEnd_address()}</span></button>
        </div>
        <div class="suggestions-box">
            <div class="card" id="suggestions-small-card" style="margin-bottom: 10px;">
                <h4 class="yourRoute">A sua rota:</h4>
                <div>
                    <h1 style="font-size: 1.375rem;">
                    <span>${leg.getDeparture_time()} - ${leg.getArrival_time()}</span>
                    <span class="totalDuration">(${leg.getDuration()})</span>
                        <p>${leg.getDistance()}</p>

                    </h1>

                </div>


                <div>

                    <div class="time-travel-box">
                        <div class="travel-box">
                            <c:forEach var="step" items="${leg.getSteps()}" varStatus="loop" >
                                <c:if test="${step.getTravel_mode().equals('WALKING')}">
                                    <div class="icon-box"><img class="icon" src="${step.getIcon()}"></div>
                                </c:if>
                                <c:if test="${!step.getTravel_mode().equals('WALKING')}">
                                    <div class="icon-box"><img class="icon" src="${step.getIcon()}"></div>
                                    <div class="travel-text"
                                         style="background-color: ${step.getLine().getColor()}; color: ${step.getLine().getText_color()}">
                                        <span style="margin: 0 2px">${step.getLine().getName()}</span></div>
                                </c:if>
                                <c:if test="${!loop.last}">
                                    <div class="icon-box">
                                        <svg xmlns="http://www.w3.org/2000/svg" width="7" height="11"
                                             viewBox="0 0 7 11" fill="none">
                                            <path d="M4.33562 5.54835L0.502289 1.71502L1.66896 0.548355L6.66896 5.54835L1.66896 10.5484L0.502289 9.38169L4.33562 5.54835Z"
                                                  fill="#3C4043"/>
                                        </svg>
                                    </div>
                                </c:if>
                            </c:forEach>
                        </div>
                    </div>
                </div>
            </div>


            <div class="detailed-card" style="padding-bottom: 20px;margin-bottom: 30px;padding-top: 30px;margin-top: 5px;">
                <div class="detailed-card-box">
               <div>
                   <div class="eachStepDiv">
                       <div class="left-column">
                           <div class="firstLine">
                               <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" width="20px" height="20px"><path d="M12 2a8 8 0 0 0-7.992 8A12.816 12.816 0 0 0 12 22a12.816 12.816 0 0 0 7.988-12A8 8 0 0 0 12 2zm0 11a3 3 0 1 1 3-3 3 3 0 0 1-3 3z"/></svg>
                           </div>
                           <div class="secondLine">
                               ${leg.getDeparture_time()}
                           </div>
                       </div>
                       <div class="right-column" style="padding-left: 0px;margin-left: 30px;">
                           <div class="firstLine">
                                 ${leg.getStart_address()}
                           </div>
                           <div class="secondLine">

                           </div>
                       </div>
                   </div>
               </div>
                </div>
            </div>

            <%--<div style="display: flex; justify-content: center;">
                <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 25 25" style="width: 15px;"><path style="fill:#232326" d="m18.294 16.793-5.293 5.293V1h-1v21.086l-5.295-5.294-.707.707L12.501 24l6.5-6.5-.707-.707z"/></svg>
            </div>--%>




            <c:forEach var="step" items="${leg.getSteps()}" varStatus="loop">
                <c:choose>
                    <c:when test="${!step.getTravel_mode().equals('WALKING')}">


            <div class="detailed-card" style="margin-top: 20px;padding-bottom: 30px;margin-bottom: 20px;">
                <div class="detailed-card-box">
                    <div>
                        <div class="eachStepDiv">
                            <div class="left-column">
                                <div class="firstLine">
                                        Hora de partida:
                                </div>
                                <div class="secondLine" >
                                        ${step.getDeparture_time()}


                                </div>
                            </div>
                            <div class="right-column" style="padding-left: 0px;margin-left: 30px;">
                                <div class="firstLine">
                                            ${step.getDeparture_stop()} até ${step.getArrival_stop()} (${step.num_stops}
                                                <c:if test="${step.num_stops == 1}">
                                                    paragem)
                                                </c:if>
                                                <c:if test="${step.num_stops != 1}">
                                                    paragens)
                                                </c:if>


                                </div>
                                <div class="secondLine">
                                    <p>${step.getHtml_instructions()};</p>
                                        <p>Duração da viagem: ${step.getDuration()};</p>
                                        <p>Hora prevista de chegada: ${step.getArrival_time()};</p>

                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <%--<div style="display: flex; justify-content: center;">
                <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 25 25" style="width: 15px;"><path style="fill:#232326" d="m18.294 16.793-5.293 5.293V1h-1v21.086l-5.295-5.294-.707.707L12.501 24l6.5-6.5-.707-.707z"/></svg>
            </div>--%>
                    </c:when>


                <c:when test="${step.getTravel_mode().equals('WALKING')}">
                <div class="detailed-card walkingbox" style="margin-top: 20px;padding-bottom: 30px;margin-bottom: 20px;">
                    <div class="detailed-card-box">
                        <div>
                            <div class="eachStepDiv">
                                <div class="left-column">
                                    <div class="firstLine">
                                        <img src="${step.getIcon()}" width="20px" height="20px">
                                    </div>
                                    <div class="secondLine">
                                            ${step.getDuration()}
                                    </div>
                                </div>
                                <div class="right-column" style="padding-left: 0px;margin-left: 30px;">
                                    <div class="firstLine">
                                            ${step.getHtml_instructions()}
                                    </div>
                                    <div class="secondLine" >
                                            Cerca de ${step.getDistance()}

                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
               <%-- <div style="display: flex; justify-content: center;">
                    <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 25 25" style="width: 15px;"><path style="fill:#232326" d="m18.294 16.793-5.293 5.293V1h-1v21.086l-5.295-5.294-.707.707L12.501 24l6.5-6.5-.707-.707z"/></svg>
                </div>--%>
                </c:when>
                </c:choose>
            </c:forEach>



            <div class="detailed-card" style="margin-top: 20px;padding-bottom: 50px;margin-bottom: 30px;">
                <div class="detailed-card-box">
                    <div>
                        <div class="eachStepDiv">
                            <div class="left-column">
                                <div class="firstLine">
                                    <svg xmlns="http://www.w3.org/2000/svg" width="20" height="20"><path d="M2 15h9v3h8V5h-8V2H2V0H0v23h2zM8 4v3h3v3h3V7h3v3h-3v3h3v3h-3v-3h-3v-3H8v3H5v-3H2V7h3V4z"/><path d="M5 7h3v3H5z"/></svg>
                                </div>
                                <div class="secondLine">
                                    ${leg.getArrival_time()}
                                </div>
                            </div>
                            <div class="right-column" style="padding-left: 0px;margin-left: 30px;">
                                <div class="firstLine">
                                    ${leg.getEnd_address()}
                                </div>
                                <div class="secondLine">
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <c:forEach var="step" items="${leg.getSteps()}" varStatus="status">
                <c:choose>
                    <c:when test="${step.getTravel_mode().equals('WALKING')}">
                        <input type="hidden" id="polylineWalkingInput_${status.index}" value="${step.getPolyline()}">
                    </c:when>
                    <c:otherwise>
                        <input type="hidden" id="polylineOtherInput_${status.index}" value="${step.getPolyline()}">
                        <input type="hidden" id="polylineColors_${status.index}" value="${step.getLine().getColor()}">
                    </c:otherwise>
                </c:choose>
            </c:forEach>

            <div class="button-box-travel">
                <button class="button-travel btn btn-primary buttons" style="margin-left: 12px">Começar Viagem</button>
                <button class="button-travel btn btn-primary buttons" style=" margin-left: 0px;">Cancelar</button>
                <form method="post" action="/simulate_trip">
                    <input type="hidden" name="id" value="${leg.getId()}">
                <button class="button-travel btn btn-primary buttons" type="submit">Simular Viagem</button>
                </form>
            </div>


        </div>
        <div class="footerlogo">
            <footer>
                <img class="footerimage" src="images/logo_nobg.png" alt="">
            </footer>
        </div>
    </div>
</div>

<script>

    let map;
    let walkingPolylines = []; // Declare an array to hold walking Polylines
    let otherPolylines = []; // Declare an array to hold non-walking Polylines

    async function initMap() {
        const { Map, Polyline, LatLng, SymbolPath } = await google.maps.importLibrary("maps");

        map = new Map(document.getElementById("map"), {
            center: { lat: 38.77851493507939, lng: -9.33226675574515 },
            zoom: 12,
            streetViewControl: false, // Disable street view
            mapTypeControl: false, // Disable map/satellite buttons
            styles: [
                {
                    featureType: "poi",
                    elementType: "labels",
                    stylers: [{ visibility: "off" }], // Hide location labels
                },
            ],
        });

        // Define a custom symbol for walking polylines (gray circle)
        const walkingSymbol = {
            path: google.maps.SymbolPath.CIRCLE,
            fillColor: "#1F7EB2", // Gray color for circle
            fillOpacity: 0.6, // Reduced opacity
            scale: 4, // Adjust the scale to control circle size
            strokeWeight: 0, // No border
        };

        // Find all hidden input elements with IDs starting with "polylineWalkingInput_"
        const walkingInputs = document.querySelectorAll('[id^="polylineWalkingInput_"]');

        // Iterate through the hidden input elements for walking steps
        walkingInputs.forEach((input) => {
            const polylineString = input.value;

            if (polylineString) {
                const decodedPath = google.maps.geometry.encoding.decodePath(polylineString);

                // Create an array to hold LatLng objects
                const path = [];
                for (const point of decodedPath) {
                    path.push(new google.maps.LatLng(point.lat(), point.lng()));
                }

                // Create a Polyline with a series of custom symbols (circles) for walking steps
                const walkingPolyline = new google.maps.Polyline({
                    path: path,
                    map: map,
                    icons: [
                        {
                            icon: walkingSymbol,
                            offset: "0%",
                            repeat: "3%", // Adjust the repeat value to control circle spacing
                        },
                    ],
                    strokeOpacity: 0.2,
                });

                walkingPolylines.push(walkingPolyline); // Add the walking polyline to the walkingPolylines array
            }
        });

        // Find all hidden input elements with IDs starting with "polylineOtherInput_"
        const otherInputs = document.querySelectorAll('[id^="polylineOtherInput_"]');

        // Iterate through the hidden input elements for non-walking steps
        otherInputs.forEach((input) => {
            const polylineString = input.value;
            const colorInput = input.nextElementSibling; // Get the next input element (color input)
            const color = colorInput ? colorInput.value : "#FF0000"; // Default color if not specified

            if (polylineString) {
                const decodedPath = google.maps.geometry.encoding.decodePath(polylineString);

                // Create an array to hold LatLng objects
                const path = [];
                for (const point of decodedPath) {
                    path.push(new google.maps.LatLng(point.lat(), point.lng()));
                }

                // Create a Polyline with the specified color for non-walking steps
                const otherPolyline = new google.maps.Polyline({
                    path: path,
                    map: map,
                    strokeColor: color, // Use the specified color
                    strokeOpacity: 1, // Full opacity for connecting line
                    strokeWeight: 4,
                });

                otherPolylines.push(otherPolyline); // Add the main polyline to the otherPolylines array

                // Create a duplicate polyline behind the main one for the outline effect
                const outlinePolyline = new google.maps.Polyline({
                    path: path,
                    map: map,
                    strokeColor: "#000000", // Outline color
                    strokeOpacity: 0.3, // Full opacity for outline
                    strokeWeight: 7, // Adjust the thickness of the outline
                });

                outlinePolyline.setMap(map); // Add the outline polyline to the map

                // Set a lower zIndex for the main polyline to ensure it's displayed on top of the outline
                otherPolyline.setOptions({ zIndex: google.maps.Marker.MAX_ZINDEX + 1 });
            }
        });

        // Create an array to hold all polyline paths
        const allPolylinePaths = walkingPolylines.concat(otherPolylines).map((polyline) => polyline.getPath());

        // Automatically fit the map to the bounds of all the polylines (both walking and non-walking)
        const bounds = new google.maps.LatLngBounds();
        allPolylinePaths.forEach((path) => {
            path.forEach((point) => bounds.extend(point));
        });
        map.fitBounds(bounds);
    }

    initMap();


</script>


<script async
        src="https://maps.googleapis.com/maps/api/js?key=AIzaSyDDHXeHO_gegeY8AJ_QRvjVv2D_KTQ82Bs&libraries=drawing,geometry,core&callback=initMap">
</script>




<%--<script async
        src="https://maps.googleapis.com/maps/api/js?key=AIzaSyDDHXeHO_gegeY8AJ_QRvjVv2D_KTQ82Bs&callback=initMap">
</script>--%>





</body>
</html>