// Create a DirectionsRenderer object to display directions on the map (declare it outside the initMap function)
var directionsDisplay;

function initMap() {
    // Initialize the map and other map-related code here
    var map = new google.maps.Map(document.getElementById('map'), {
        center: {lat: 38.77547254777985, lng: -9.332182492067211},
        zoom: 12,
        mapTypeId: google.maps.MapTypeId.ROADMAP,
        streetViewControl: false,
        mapTypeControl: false,
        fullscreenControl: false,
        gestureHandling: 'cooperative'
    });

    // Create a DirectionsRenderer and set its map
    directionsDisplay = new google.maps.DirectionsRenderer();
    directionsDisplay.setMap(map);

    // Handle form submission when the "Calcular Rota" button is clicked
    document.getElementById('directionsForm').addEventListener('submit', function (event) {
        event.preventDefault(); // Prevent the form from submitting normally

        // Retrieve the user inputs
        var originInput = document.getElementById('origem1').value;
        var destinationInput = document.getElementById('destino1').value;

        // Clear previous directions before displaying new ones
        directionsDisplay.setDirections({routes: []});

        // Calculate and display directions using transit mode
        calculateAndDisplayDirections(originInput, destinationInput);
    });

    // Function to calculate and display directions
    function calculateAndDisplayDirections(origin, destination) {
        var directionsService = new google.maps.DirectionsService();

        var request = {
            origin: origin,
            destination: destination,
            travelMode: 'TRANSIT', // Use transit mode
            transitOptions: {
                modes: ['BUS', 'SUBWAY', 'TRAIN'], // Specify transit modes
                routingPreference: 'FEWER_TRANSFERS' // You can adjust this preference as needed
            },
            provideRouteAlternatives: true // Request multiple routes
        };

        directionsService.route(request, function (result, status) {
            if (status == 'OK') {
                // Display the first route (you can loop through other routes if needed)
                directionsDisplay.setDirections(result);
                displayRouteInstructions(result.routes[0]);
            }
        });
    }

    // Function to display step-by-step instructions for a route
    function displayRouteInstructions(route) {
        var instructions = document.getElementById('instructions');
        instructions.innerHTML = ''; // Clear previous instructions

        for (var i = 0; i < route.legs.length; i++) {
            var leg = route.legs[i];
            for (var j = 0; j < leg.steps.length; j++) {
                var step = leg.steps[j];
                var instruction = document.createElement('div');
                instruction.innerHTML = `Passo ${j+1}: ` + step.instructions;

                // Add distance and estimated time
                var distance = step.distance.text;
                var duration = step.duration.text;
                var info = document.createElement('div');
                info.innerHTML = `Distância: ${distance}, Tempo Estimado: ${duration}`;

                // Append both instruction and info to the container
                instructions.appendChild(instruction);
                instructions.appendChild(info);
            }
        }
    }
}