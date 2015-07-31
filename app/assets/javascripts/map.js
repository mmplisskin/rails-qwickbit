var initialize

$(document).ready(function(){
  $('.static_pages.locations').ready(function (){
    $("#googleMapSearch").hide();
    initialize = function(e) {
      console.log("init running")
      var url = window.location.origin + "/businesses" + ".json";
      $.get(url, function(results){
        navigator.geolocation.getCurrentPosition(function(pos) {
          var lat = pos.coords.latitude
          var long = pos.coords.longitude
          var myCenter = new google.maps.LatLng(lat,long);
          var mapProp = {
            center: myCenter,
            zoom:12,
            styles: [{"featureType":"landscape.natural","elementType":"geometry.fill","stylers":[{"visibility":"on"},{"color":"#e0efef"}]},{"featureType":"poi","elementType":"geometry.fill","stylers":[{"visibility":"on"},{"hue":"#1900ff"},{"color":"#c0e8e8"}]},{"featureType":"road","elementType":"geometry","stylers":[{"lightness":100},{"visibility":"simplified"}]},{"featureType":"road","elementType":"labels","stylers":[{"visibility":"off"}]},{"featureType":"transit.line","elementType":"geometry","stylers":[{"visibility":"on"},{"lightness":700}]},{"featureType":"water","elementType":"all","stylers":[{"color":"#7dcdcd"}]}]
          };
          var map = new google.maps.Map(document.getElementById("googleMap"),mapProp);

          $("#googleMapSearch").show();
          $(".locations .progress").hide();

          var markers = []

      		for (i = 0; i < results.length; i++) {
      			var markerPosition = new google.maps.LatLng(results[i]["latitude"], results[i]["longitude"])
            var infowindow = new google.maps.InfoWindow({});
            var bitcoin_icon = {
              url: 'http://i.imgur.com/yuqNP88.png',
              size: new google.maps.Size(30,30)
            }
            var marker = new google.maps.Marker({
              position: markerPosition,
              animation: google.maps.Animation.DROP,
              icon: bitcoin_icon
            })
            markers.push(markerPosition)
            console.log(results[i].name)
            google.maps.event.addListener(marker, 'click', (function (marker, i) {
              return function () {
                var contentString = "<a>" + results[i].name + "</a><p>" + results[i].address + "</p><p>" + results[i].phone_number + "</p>";
                map.panTo(marker.getPosition());
                infowindow.setContent(contentString)
                infowindow.open(map, marker)
                console.log(marker)
              }
            })(marker, i))
            marker.setMap(map)
          }

          var resultWrapper = $(".googleMapSearch-results");
          function allBusiness(url) {
            $.ajax({
              type:"GET",
              dataType: "json",
              url: url,
              success: function (data) {
                data.forEach(function (element) {
                  var resultString = "<div class='result z-depth-1'><h5>" + element.name + "</h5><p>" + element.address + "</p><input type='hidden' value='" + element.latitude + "," + element.longitude + "'/>" + "</div>"
                  resultWrapper.append(resultString);
                })
                var results = $(".result");
                results.on("click", function () {
                  var inputValue = $(this).find("input").val().split(",");
                  var latlng = new google.maps.LatLng(parseFloat(inputValue[0]), parseFloat(inputValue[1]));
                  map.panTo(latlng);
                })
              }
            })
          }
          allBusiness("/businesses");
          $("#searchForm").on("submit", function (e) {
            var searchInput = $("#search").val();
            resultWrapper.empty();
            e.preventDefault("/businesses");
            console.log(searchInput);
            if (searchInput === null || searchInput.length === 0) {
              allBusiness("/businesses");
            } else {
              allBusiness("/search.json?utf=✓&search=" + searchInput);
            }
          })

          console.log(markers)
          $('.businesses_locations').each(function(e){
            $(this).click( function() {
              console.log(e)
            })
          });
        })
      })
    }
  });
  google.maps.event.addDomListener(window, 'load', initialize);
})
