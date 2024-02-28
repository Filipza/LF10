import L from "leaflet";
import "leaflet/dist/leaflet.css";
import { setMarkersForLocations } from "./form";

const form = document.getElementById("form");

export let map = L.map("map").setView([53.49967738513314, 10.0028454236408], 16);

navigator.geolocation.getCurrentPosition(async (position) => {
	let lat = position.coords.latitude;
	let lon = position.coords.longitude;
	map.flyTo([lat, lon], 13);

	const formData = new FormData(form);
	formData.set("lat", lat);
	formData.set("lon", lon);
	try {
		const res = await fetch("http://localhost:9000/locations", {
			method: "POST",
			body: formData,
		});
		const locations = await res.json();
		setMarkersForLocations(locations, [lat, lon]);
	} catch (e) {
		setMarkersForLocations([], [lat, lon]);
		console.error(e);
	}
});

L.tileLayer("https://maps.geoapify.com/v1/tile/osm-bright/{z}/{x}/{y}.png?apiKey=0ddccd73675a444fb31f35acdb4e0619", {
	maxZoom: 19,
	attribution: "&copy; <a href='http://www.openstreetmap.org/copyright'>OpenStreetMap</a>",
}).addTo(map);
