$('.businesses.index').ready(function () {

function initialize() {


  var url = window.location.origin + window.location.pathname + ".json";

  $.get(url, function(results){

    var my_content = results[0]

    var lat = my_content["latitude"];
    var long = my_content["longitude"];

    console.log(lat,long)
    var myCenter = new google.maps.LatLng(lat,long);
    var marker;

    var mapProp = {
      center: myCenter,
      zoom:12,
      zoomControl:false,
      panControl:false,
      mapTypeId:google.maps.MapTypeId.HYBRID
    };
    var map = new google.maps.Map(document.getElementById("googleMap"),mapProp);

    var marker = new google.maps.Marker({
      position:myCenter

    });

    marker.setMap(map);

    google.maps.event.addListener(marker,'click', function() {
      map.setZoom(16);
      map.setCenter(marker.getPosition());
    });

    var infowindow = new google.maps.InfoWindow({
      content: my_content
    });

    infowindow.open(map,marker);

  })
}

initialize();
google.maps.event.addDomListener(window, 'load', initialize);
});
