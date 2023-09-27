<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!doctype html>
<html lang="en">
<%@include file="../header.jsp"%>
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

    <div class="home-content" style="margin: 170px 0 0 0;">

        <div class="suggestions-box">
            <div class="title-route">
            <h3 class="yourRoute">Rota detalhada:</h3></div>

            <div class="card" id="suggestions-small-card" style="margin:40px 10px 10px 10px;">
                <div>
                    <h3 style="font-size: 1.15rem; font-weight: 600"><span><svg style="margin-right: 10px" xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none">
                        <mask id="mask0_904_7" style="mask-type:alpha" maskUnits="userSpaceOnUse" x="0" y="0" width="24" height="24"><rect width="24" height="24" fill="#D9D9D9"/>
                        </mask><g mask="url(#mask0_904_7)"><path d="M12.975 21.95V19.95C13.675 19.85 14.3542 19.6583 15.0125 19.375C15.6708 19.0917 16.2917 18.7333 16.875 18.3L18.325 19.75C17.5417 20.3667 16.7 20.8625 15.8 21.2375C14.9 21.6125 13.9583 21.85 12.975 21.95ZM19.725 18.3L18.325 16.9C18.7583 16.35 19.1083 15.7458 19.375 15.0875C19.6417 14.4292 19.825 13.7333 19.925 13H21.975C21.8417 14.0333 21.5875 14.9958 21.2125 15.8875C20.8375 16.7792 20.3417 17.5833 19.725 18.3ZM19.925 11C19.825 10.25 19.6417 9.54582 19.375 8.88749C19.1083 8.22915 18.7583 7.63332 18.325 7.09999L19.725 5.69999C20.3583 6.43332 20.8708 7.24999 21.2625 8.14999C21.6542 9.04999 21.8917 9.99999 21.975 11H19.925ZM10.975 21.95C8.425 21.65 6.29583 20.5583 4.5875 18.675C2.87917 16.7917 2.025 14.5667 2.025 12C2.025 9.41665 2.87917 7.18332 4.5875 5.29999C6.29583 3.41665 8.425 2.33332 10.975 2.04999V4.04999C8.975 4.33332 7.31667 5.22499 6 6.72499C4.68333 8.22499 4.025 9.98332 4.025 12C4.025 14.0167 4.68333 15.7708 6 17.2625C7.31667 18.7542 8.975 19.65 10.975 19.95V21.95ZM16.925 5.69999C16.325 5.24999 15.6917 4.88332 15.025 4.59999C14.3583 4.31665 13.675 4.13332 12.975 4.04999V2.04999C13.9583 2.13332 14.9 2.36249 15.8 2.73749C16.7 3.11249 17.5417 3.61665 18.325 4.24999L16.925 5.69999ZM12 17C11.0333 16.1833 10.125 15.3083 9.275 14.375C8.425 13.4417 8 12.35 8 11.1C8 9.96665 8.3875 8.99999 9.1625 8.19999C9.9375 7.39999 10.8833 6.99999 12 6.99999C13.1167 6.99999 14.0625 7.39999 14.8375 8.19999C15.6125 8.99999 16 9.96665 16 11.1C16 12.35 15.575 13.4417 14.725 14.375C13.875 15.3083 12.9667 16.1833 12 17ZM12 12C12.3 12 12.5542 11.8958 12.7625 11.6875C12.9708 11.4792 13.075 11.225 13.075 10.925C13.075 10.6417 12.9708 10.3917 12.7625 10.175C12.5542 9.95832 12.3 9.84999 12 9.84999C11.7 9.84999 11.4458 9.95832 11.2375 10.175C11.0292 10.3917 10.925 10.6417 10.925 10.925C10.925 11.225 11.0292 11.4792 11.2375 11.6875C11.4458 11.8958 11.7 12 12 12Z" fill="#1C1B1F"/>
                    </g></svg>${leg.getStart_address()}</span></h3>
                    <h3 style="font-size: 1.15rem; font-weight: 600"><span><svg style="margin-right: 10px; margin-left: 5px" xmlns="http://www.w3.org/2000/svg" width="19" height="23"><path d="M2 15h9v3h8V5h-8V2H2V0H0v23h2zM8 4v3h3v3h3V7h3v3h-3v3h3v3h-3v-3h-3v-3H8v3H5v-3H2V7h3V4z"/><path d="M5 7h3v3H5z"/></svg>${leg.getEnd_address()}</span></h3>
                    <h1 style="font-size: 1.1rem; margin-top: 20px">
                    <span>${leg.getDeparture_time()} - ${leg.getArrival_time()}</span>
                    <span class="totalDuration">(${leg.getDuration()})</span>
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
                                         style="background-color: ${step.getLine().getColor()}; color: ${step.getLine().getText_color()}; padding: 0 2px 0 2px">
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
                    <div>
                        <p style="font-weight: 400"><span style="font-weight: 500">Distância total: </span>${leg.getDistance()}</p>
                        <span style="font-weight: 500">VIAS Card: </span> ${leg.getFare()}<span>€</span>
                    </div>
                </div>
            </div>

            <div class="detailed-box">
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


            <div class="detailed-card" style="margin-left: 10px; margin-right: 10px;padding-bottom: 30px;">
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

                                        <span>
                                            ${step.getDeparture_stop()} até ${step.getArrival_stop()} (${step.num_stops}
                                                <c:if test="${step.num_stops == 1}">
                                                    paragem)
                                                </c:if>
                                                <c:if test="${step.num_stops != 1}">
                                                    paragens)
                                                </c:if>
                                                </span>
                                                <div class="travel-box">
                                                <div class="travel-text"
                                                     style="background-color: ${step.getLine().getColor()}; color: ${step.getLine().getText_color()}; padding: 0 2px 0 2px">
                                                    <span style="margin: 0 2px">${step.getLine().getName()}</span></div></div>



                                </div>
                                <div class="secondLine">
                                    <p >${step.getHtml_instructions()}</p>
                                    <p><span style="font-weight: 600" >Duração da viagem:</span><br> ${step.getDuration()}</p>
                                    <p><span style="font-weight: 600">Hora prevista de chegada:</span> ${step.getArrival_time()}</p>

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


            <input type="hidden" id="polylineLeg" value="${leg.getOverview_polyline()}">

            <div class="button-box-travel">

                <form id="directionsForm" method="POST" action="/perform_travel">
                    <button class="button-travel btn btn-primary buttons">
                        <input type="hidden" name="origem" value="${leg.getStart_address()}">
                        <input type="hidden" name="destino" value="${leg.getEnd_address()}">
                        Cancelar</button>
                </form>
                <c:if test="${user != null}">
                <button class="button-travel btn btn-primary buttons">Começar Viagem</button>
                </c:if>
                <c:if test="${user != null}">
                <form method="post" action="/simulate_trip">
                    <input type="hidden" name="id" value="${leg.getId()}">
                <button class="button-travel btn btn-primary buttons" type="submit">Simular Viagem</button>
                </form>
                </c:if>
            </div>
            </div>
        </div>
        <div class="footerlogo">
            <footer>
                <div class="footerimage" style="margin-bottom: 20px">
                    <svg width="115" height="25" viewBox="0 0 196 45" fill="none" xmlns="http://www.w3.org/2000/svg">
                        <path d="M18.24 45L-0.896 0.199997H12.8L28.928 38.984H20.864L37.376 0.199997H49.92L30.72 45H18.24ZM52.5425 45V0.199997H65.2145V45H52.5425ZM68.854 45L88.63 0.199997H101.11L120.95 45H107.766L92.278 6.408H97.27L81.782 45H68.854ZM79.67 36.296L82.934 26.952H104.822L108.086 36.296H79.67Z" fill="white"/>
                        <path d="M177.001 24.6667L176.998 43.3333L196 38.0027L190.46 34.1147C193.142 30.656 194.643 26.408 194.64 22C194.64 10.9733 185.51 1.99999 174.284 1.99999C158.892 1.99999 155.246 16.3226 154.049 21.032C151.3 31.832 147.294 34 141.714 34C134.98 34 129.5 28.616 129.5 22C129.5 19.272 130.482 16.664 132.189 14.5547L138.999 19.3333V0.666656L120 5.99999L125.54 9.88532C122.858 13.344 121.357 17.592 121.357 22C121.357 33.0293 130.488 42 141.714 42C155.512 42 159.869 31.1413 161.948 22.968C164.849 11.5733 169.591 9.99999 174.284 9.99999C181.018 9.99999 186.498 15.3867 186.498 22.0054C186.5 24.7307 185.518 27.3387 183.811 29.448L177.001 24.6667Z" fill="#A3DD41"/>
                    </svg>
                </div>
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
            zoomControl: false, // Disable zoom in/out buttons
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



        const encodedPolyline = document.getElementById("polylineLeg").value;
        const path = google.maps.geometry.encoding.decodePath(encodedPolyline);


        const svgMarkerStart = {
            path: "M12 2a8 8 0 0 0-7.992 8A12.816 12.816 0 0 0 12 22a12.816 12.816 0 0 0 7.988-12A8 8 0 0 0 12 2zm0 11a3 3 0 1 1 3-3 3 3 0 0 1-3 3z",
            opacity: 1,
            strokeColor: '#041F48',
                fillColor: '#041F48',
            fillOpacity: 1,
            anchor: new google.maps.Point(12, 22),
            scale: 1.2


        };

        // Create start and end markers for the polyline
        const startMarker = new google.maps.Marker({
            position: path[0], // Start of the polyline
            map: map,
            icon: svgMarkerStart,



        });

        const svgMakerEnd = {
            path: "M2 15h9v3h8V5h-8V2H2V0H0v23h2zM8 4v3h3v3h3V7h3v3h-3v3h3v3h-3v-3h-3v-3H8v3H5v-3H2V7h3V4z M4 7h3v3H5z",
            opacity: 1,
            strokeColor: '#041F48',
            fillColor: '#041F48',
            fillOpacity: 1,
            anchor: new google.maps.Point(2, 24),
            scale: 1.4,
            strokeWeight: 0.1,


        };

        const endMarker = new google.maps.Marker({
            position: path[path.length - 1], // End of the polyline
            map: map,
            icon: svgMakerEnd,
        });


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