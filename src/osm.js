import L from "leaflet";
import "leaflet/dist/leaflet.css";

let map = L.map("map").setView([53.49967738513314, 10.0028454236408], 17);

L.tileLayer("https://tile.openstreetmap.org/{z}/{x}/{y}.png", {
	maxZoom: 19,
	attribution:
		"&copy; <a href='http://www.openstreetmap.org/copyright'>OpenStreetMap</a>",
}).addTo(map);
