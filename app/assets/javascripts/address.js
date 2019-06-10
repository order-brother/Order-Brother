
function initMap() {
    var markers = [];
    var infoWindows = [];
    var myLocation = null;
    
    //  取得瀏覽器定位座標 keyword: geolocation html5
    if ("geolocation" in navigator) {
        /* geolocation is available */
        navigator.geolocation.getCurrentPosition(

            // success 的時候執行
            // position = 取得結果
            function (position) {
                
                // 取得 user 座標
                let myLocation = Object.assign(
                    {},
                    {
                        lat: position.coords.latitude,
                        lng: position.coords.longitude
                    }
                );

                var map = new google.maps.Map(document.getElementById("map"), {
                    center: myLocation,
                    zoom: 18
                });
                var geocoder = new google.maps.Geocoder();

                geocoder.geocode({ 'address': '五倍紅寶石' }, function (results, status) {
                    console.log(results)
                });

                

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
                

                //設定 Info window 內容

                info_config.forEach(function (e, i) {
                    infoWindows[i] = new google.maps.InfoWindow({
                        content: e
                    });
                });

                //標出 marker 資訊 
                marker_config.forEach(function (e, i) {
                    markers[i] = new google.maps.Marker(e);
                    markers[i].setMap(map);
                    markers[i].addListener("click", function () {
                        infoWindows[i].open(map, markers[i]);
                    });
                });

                // 可暫時忽略
                function _geocoder(address) {
                    geocoder.geocode(
                        {
                            address: address
                        },
                        function (results, status) {
                            if (status == google.maps.GeocoderStatus.OK) {
                                LatLng = results[0].geometry.location;
                                return results;
                            }
                        }
                    );
                }
            },

            // failed 的時候執行
            function (error) {
                console.log(error);
            }
        );
    } else {
        /* geolocation IS NOT available */
    }

    // console.log(_geocoder());
}
function searchAddress() {
    var _v = document.getElementById('searchAddress').value;
    console.log(_v)
    document.getElementById('searchAddress').value = '';
}
