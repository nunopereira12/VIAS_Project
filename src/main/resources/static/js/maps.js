let map;

async function initMap() {
    const { Map } = await google.maps.importLibrary("maps");

    map = new Map(document.getElementById("map"), {
        center: { lat: 38.77547254777985, lng: -9.332010830689072 },
        zoom: 12,
    });
}

initMap();