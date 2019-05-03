<html>
<head>
<script src="jquery-2.1.4.js"></script>
<link rel="stylesheet" type="text/css" href="styles.css">
<style>
      #map {
        height: 500px;
      }
</style>
</head>
<body>
<div id="navbar"><span>Google Maps - Javascript API</span></div>
<div id="wrapper">
<div id="map"></div>
    <script>
      var map;
      function initMap() {
        map = new google.maps.Map(document.getElementById('map'), {
          center: {lat: -34.397, lng: 150.644},
          zoom: 9
        });
		
	var marker = new google.maps.Marker({
    position: {lat: -34.397, lng: 150.644},
    map: map,
    title: 'Hello World!',
	icon: 'pin.png',
	animation: google.maps.Animation.BOUNCE,
	draggable: true
  });
	}
	  
    </script>
    <script src="https://maps.googleapis.com/maps/api/js?key=API_KEY&callback=initMap"
    async defer></script>
</div>
</body>
</html>