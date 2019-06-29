var map;

// document.addEventListener('turbolinks:load', function() {

function initMap() {
  var markers = [];
  var infoWindows = [];
  var myLocation = null;

  //  取得瀏覽器定位座標 keyword: geolocation html5
  if ("geolocation" in navigator) {
    /* geolocation is available */
    navigator.geolocation.getCurrentPosition(
      // position = 取得結果
      function(position) {
        // 取得 user 座標
        let myLocation = Object.assign(
          {},
          {
            lat: position.coords.latitude,
            lng: position.coords.longitude
          }
        );
        // ---------- 畫地圖 ------------
        map = new google.maps.Map(document.getElementById("map"), {
          center: myLocation,
          zoom: 18
        });

        var input = document.getElementById("address");

        // Create the search box and link it to the UI element.
        var searchBox = new google.maps.places.SearchBox(input);

        // 移動 searchBox 的位置 非必要
        //map.controls[google.maps.ControlPosition.TOP_LEFT].push(input);

        // Bias the SearchBox results towards current map's viewport.
        map.addListener("bounds_changed", function() {
          searchBox.setBounds(map.getBounds());
        });

        searchBox.addListener("places_changed", function() {
          var places = searchBox.getPlaces();

          if (places.length == 0) {
            return;
          }

          // Clear out the old markers.
          markers.forEach(function(marker) {
            marker.setMap(null);
          });
          markers = [];

          // For each place, get the icon, name and location.
          var bounds = new google.maps.LatLngBounds();
          places.forEach(function(place) {
            if (!place.geometry) {
              console.log("Returned place contains no geometry");
              return;
            }
            var icon = {
              url: place.icon,
              size: new google.maps.Size(71, 71),
              origin: new google.maps.Point(0, 0),
              anchor: new google.maps.Point(17, 34),
              scaledSize: new google.maps.Size(25, 25)
            };

            // Create a marker for each place.
            markers.push(
              new google.maps.Marker({
                map: map,
                icon: icon,
                title: place.name,
                position: place.geometry.location
              })
            );

            if (place.geometry.viewport) {
              // Only geocodes have viewport.
              bounds.union(place.geometry.viewport);
            } else {
              bounds.extend(place.geometry.location);
            }
          });
          map.fitBounds(bounds);
        });

        // ----------  ------------
        // var geocoder = new google.maps.Geocoder();

        // geocoder.geocode({ 'address': '五倍紅寶石' }, function (results, status) {
        //     console.log(results)
        // });

        //info windows
        var info_config = [];

        //建立地圖 marker 的集合
        // 要在地圖上顯示的座標 都放在這
        var marker_config = [
          {
            position: myLocation,
            map: map,
            title: "媽 我在這"
          }
        ];

        // 1. 從db取回資料
        // 2. 將資料塞到 marker_config

        // for(var i = 0; i < dbData.length ; i++){
        //     marker_config.push(dbData[i]);
        // }
        info_config.forEach(function(e, i) {
          infoWindows[i] = new google.maps.InfoWindow({
            content: e
          });
        });

        //標出 marker 資訊
        marker_config.forEach(function(e, i) {
          markers[i] = new google.maps.Marker(e);
          markers[i].setMap(map);
          markers[i].addListener("click", function() {
            infoWindows[i].open(map, markers[i]);
          });
        });
      },

      // failed 的時候執行
      function(error) {
        console.log(error);
      }
    );
  } else {
    /* geolocation IS NOT available */
  }
}

// FIXME submit button function not define yet.
$("#submit").on("click", function() {});
// debugger
  // geocodeAddress(geocoder, map);
  // function searchAddress() {
  // let searchLocation = document.getElementById("address").value;
  // document.getElementById('address').value = '';
  // }
  // searchAddress();
  function _geocoder(searchLocation) {
    geocoder.geocode(
      {
        address: searchLocation
      },  function(results, status) {
        if (status == google.maps.GeocoderStatus.OK) {
          map.setCenter(results[0].geometry.location);
          let marker = new google.maps.Marker({
            map: map,
            position: result[0].geometry.location
          });
        } else {
          console.log(status);
        }
      }
    );
  }

