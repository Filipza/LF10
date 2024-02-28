import L from "leaflet";
import "leaflet/dist/leaflet.css";

export let map = L.map("map").setView([53.49967738513314, 10.0028454236408], 17);

navigator.geolocation.getCurrentPosition((position) => {
	let lat = position.coords.latitude
	let lon = position.coords.longitude;
	map.setView([lat, lon], 17)
});


L.tileLayer("https://maps.geoapify.com/v1/tile/osm-bright/{z}/{x}/{y}.png?apiKey=0ddccd73675a444fb31f35acdb4e0619", {
	maxZoom: 19,
	attribution: "&copy; <a href='http://www.openstreetmap.org/copyright'>OpenStreetMap</a>",
}).addTo(map);
