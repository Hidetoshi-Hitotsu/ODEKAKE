let map;

async function initMap() {
  // The location of Uluru
  const position = { lat: 34.922251, lng: 135.693376 };
  // Request needed libraries.
  //@ts-ignore
  const { Map } = await google.maps.importLibrary("maps");
  const { AdvancedMarkerView } = await google.maps.importLibrary("marker");

  map = new Map(document.getElementById("map"), {
    zoom: 13,
    center: position,
    mapId: "DEMO_MAP_ID",
  });

  const marker = new AdvancedMarkerView({
    map: map,
    position: position,
    title: "NagaokakyoCity",
  });
}

initMap();
34.922251,135.693376
