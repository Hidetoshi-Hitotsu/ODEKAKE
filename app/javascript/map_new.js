let map;
let geocoder;

document.addEventListener("turbo:load", async function initMap() {
  // The location of NagaokakyoCity
  const position = { lat: 34.922251, lng: 135.693376 };
  const { Map } = await google.maps.importLibrary("maps");
  const { AdvancedMarkerElement } = await google.maps.importLibrary("marker");

  geocoder = new google.maps.Geocoder();
  map = new Map(document.getElementById("map"), {
    zoom: 13,
    center: position,
    mapId: "DEMO_MAP_ID",
  });

  var marker = new AdvancedMarkerElement({
    map: map,
    position: position,
    title: "NagaokakyoCity",
  });

  map.addListener("click", (event) => {
    addMarker(event.latLng);
  });

  function addMarker(position) {
    marker.setMap(null);
    marker = new google.maps.Marker({
    position,
    map,
    });

    document.getElementById('lat').value = position.lat();
    document.getElementById('lng').value = position.lng();
    geocoder.geocode({ location: position }).then((response) => {
      if (response.results[0]){
        document.getElementById('add').value = response.results[0].formatted_address.replace(/^日本、/, '');
      } else {
        window.alert("No results found");
      }
    })
    .catch((e) => window.alert("Geocoder failed due to: " + e));
  }

  function codeAddress(){
    let inputAddress = document.getElementById('address').value;

    geocoder.geocode( { 'address': inputAddress}, function(results, status) {
      if (status == 'OK') {
        marker.setMap(null);
        map.setCenter(results[0].geometry.location);
        marker = new google.maps.Marker({
          map: map,
          position: results[0].geometry.location,
          draggable:true,
        });
        document.getElementById('searchName').value = document.getElementById('address').value
        document.getElementById('add').value = results[0].formatted_address.replace(/^日本、/, '');
        document.getElementById('lat').value = results[0].geometry.location.lat();
        document.getElementById('lng').value = results[0].geometry.location.lng();
      } else {
        alert('該当する結果がありませんでした：' + status);
      }
    });
  }
  document.getElementById('searchButton').addEventListener('click', e => {
    codeAddress();
  });
})

initMap();
