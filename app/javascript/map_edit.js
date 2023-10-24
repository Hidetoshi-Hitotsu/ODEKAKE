let map;
let geocoder;

document.addEventListener("turbo:load", async function initMap() {
  let lat = gon.latitude;
  let lng = gon.longitude;
  const position = { lat: lat, lng: lng };
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
  });

  function codeAddress(){
    let inputAddress = document.getElementById('address').value;

    geocoder.geocode( { 'address': inputAddress}, function(results, status) {
      if (status == 'OK') {
        marker.setMap(null);
        map.setCenter(results[0].geometry.location);
        marker = new google.maps.Marker({
          map: map,
          position: results[0].geometry.location,
        });
        document.getElementById('searchName').value = document.getElementById('address').value
        document.getElementById('add').value = results[0].formatted_address;
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
