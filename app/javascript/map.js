let map;
let geocoder;

document.addEventListener("turbo:load", async function initMap() {
  // The location of NagaokakyoCity
  const position = { lat: 34.922251, lng: 135.693376 };
  const { Map, InfoWindow } = await google.maps.importLibrary("maps");
  const { AdvancedMarkerElement, PinElement } = await google.maps.importLibrary("marker");
  const infoWindow = new InfoWindow();
  const image =
    "https://developers.google.com/maps/documentation/javascript/examples/full/images/beachflag.png";
  const glyphImg = document.createElement("img");
  glyphImg.src =
    "https://developers.google.com/maps/documentation/javascript/examples/full/images/google_logo_g.svg";
  const pinViewOptions = new google.maps.marker.PinView({
    background: "warning",
    glyph: glyphImg,
    borderColor: "orange",
  })

  map = new Map(document.getElementById("map"), {
    zoom: 13,
    center: position,
    mapId: "DEMO_MAP_ID",
  });

  let places = gon.places
  places.forEach(function(place){
    var markerLatLng = { lat: place[1], lng: place[2] };
    let marker = new AdvancedMarkerElement({
      position: markerLatLng,
      map: map,
    });
  });

  marker.addListener("click", () => {
    infoWindow.open({
      anchor: marker,
      map,
    });
  });
})

initMap();
