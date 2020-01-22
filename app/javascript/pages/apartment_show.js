import 'lightgallery.js';
import 'jquery-ui-bundle';

const initApartmentShow = () => {

  if ($(".apartment_show_page").length) {
    lightGallery(document.getElementById('gallery')); 

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
    const apartment_center = { lat: Number(map_data[0].dataset.latitude), lng: Number(map_data[0].dataset.longtitude) };
    
    const map = new google.maps.Map(
      document.getElementById('map'), {
        zoom: 17,
        center: apartment_center,
        mapTypeControl: false,
        zoomControl: true,
        zoomControlOptions: {
            position: google.maps.ControlPosition.RIGHT_CENTER
        },
        fullscreenControl: false,
        streetViewControl: false,
      });

    const infoWindow = new google.maps.InfoWindow();


    for (let i = 0; i < places.length; i++) {

      const data = places[i];
      const myLatlng = new google.maps.LatLng(data.lat, data.lng);

      const marker = new google.maps.Marker({

        position: myLatlng,
        map: map,
        title: data.title

      });

      //same infowindow as index version, except removed the <a> part
      (function (marker, data) {
          google.maps.event.addListener(marker, "click", function (e) {
              infoWindow.setContent("<div  class='apartment-marker'><img src='"+ data.img + "'><div class='apartment-marker-text'>"+data.address+"</div></div>");
              infoWindow.open(map, marker);
          });
      })(marker, data);

    }
  }

}
export { initApartmentShow };
