const initApartmentForm = () => {

    if ($(".apartment_form").length) {

        let places = [];

        let latField = document.querySelector('input[name="apartment[latitude]"]');
        let lngField = document.querySelector('input[name="apartment[longtitude]"]');

        let lat = Number(latField.value);
        let lng = Number(lngField.value);

        let zoom_level;
        let map_center;

        if (latField.value !== "" && lngField.value !== "") {   // if lat or lng is not empty
            zoom_level = 17;                                    // zoom in
            map_center = { lat, lng };                          // set marker to provided latlng
        }
        else{
            zoom_level = 11;                                    // zoom out
            lat = 22.35;
            lng = 114.12;
            map_center = { lat, lng };                          // set marker to center of HK
            latField.value = lat;
            lngField.value = lng;
        }

        const map = new google.maps.Map(
            document.getElementById('map'), {
                zoom: zoom_level,
                center: map_center,
                mapTypeControl: false,
                zoomControl: true,
                zoomControlOptions: {
                    position: google.maps.ControlPosition.RIGHT_CENTER
                },
                fullscreenControl: false,
                streetViewControl: false,
            });

        const myLatlng = new google.maps.LatLng(lat, lng);
        
        const marker = new google.maps.Marker({

            position: myLatlng,
            map: map,

            draggable:true,
            title:"Drag mark to edit Apartment position"

        });
        
        // update form value (hidden) when marker is dragged
        marker.addListener('dragend', function(e) {
            latField.value = e.latLng.lat();
            lngField.value = e.latLng.lng();
        });
    }



}
export { initApartmentForm };
