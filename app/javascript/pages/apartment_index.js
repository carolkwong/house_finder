const initApartmentIndex = () => {

  if ($(".apartment_index_page").length) {
    $('#map').css({ height: window.innerHeight - 66 });


    //get map data rendered in apartments#index
    let places = [];
    const map_data = document.querySelectorAll("li.map-data");
    map_data.forEach( function(data) {
      const place_data = {
        id: data.dataset.id,
        address: data.dataset.address,
        lat: data.dataset.latitude,
        lng: data.dataset.longtitude,
        img: data.dataset.img,
      }
      places.push(place_data);
    })


    //display google map
    const hk_center = { lat: 22.35, lng: 114.12 };
    
    const map = new google.maps.Map(
      document.getElementById('map'), {
        zoom: 11,
        center: hk_center,
        mapTypeControl: false,
        zoomControl: true,
        zoomControlOptions: {
            position: google.maps.ControlPosition.RIGHT_CENTER
        },
        fullscreenControl: false,
        streetViewControl: false,
      });

    //infoWindow to display upon clicking a marker
    const infoWindow = new google.maps.InfoWindow();

    for (let i = 0; i < places.length; i++) {

      const data = places[i];
      const myLatlng = new google.maps.LatLng(data.lat, data.lng);

      const marker = new google.maps.Marker({

        position: myLatlng,
        map: map,
        title: data.title

      });

      (function (marker, data) {
          google.maps.event.addListener(marker, "click", function (e) {
              infoWindow.setContent("<div  class='apartment-marker'><a href='../../apartments/" + data.id+ "'><img src='"+ data.img + "'><div class='apartment-marker-text'>"+data.address+"</div></a></div>");
              infoWindow.open(map, marker);
          });
      })(marker, data);

    }
  }

}
export { initApartmentIndex };
