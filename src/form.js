import { map } from "./osm";
import L from "leaflet";

const searchField = document.getElementById("plz-search");
const suggestionBox = document.getElementById("plz-suggestion");
const form = document.getElementById("form");
const overlay = document.getElementById("overlay");
const helpBtn = document.getElementById("help-btn");
const formBtn = document.getElementById("filter-btn");
const closeBtn = document.getElementById("close-btn");
const helpPage = document.getElementById("help-page");
const submitBtn = document.getElementById("submit-btn");
const layerGroup = L.layerGroup();
let timeout = null;
let helpIsOpen = false;
let formIsOpen = false;
let desktop = false;
let searchRes;

if (window.innerWidth >= 991) {
	desktop = true;
}

async function fetchData() {
	const res = await fetch(
		`https://nominatim.openstreetmap.org/search?addressdetails=1&postalcode=${searchField.value}&countrycodes=de&format=jsonv2&limit=4`,
	);
	searchRes = await res.json();
	fillSuggestionBox(searchRes);
}

function fillSuggestionBox(searchRes) {
	let plz = searchRes[0]?.address?.postcode;
	let suburb = searchRes[0]?.address?.suburb ?? searchRes[0]?.address?.city_district;
	let city = searchRes[0]?.address?.city ?? searchRes[0]?.address?.town;

	if (typeof plz == "undefined") {
		suggestionBox.innerText = "Unbekannte Adresse 😢";
	} else {
		suggestionBox.innerText = `Es wird gesucht in: ${plz} ${suburb}, ${city}`;
	}
}

searchField.addEventListener("input", () => {
	clearTimeout(timeout);
	timeout = setTimeout(() => {
		if (searchField.value.length >= 5) {
			fetchData();
		}
	}, 800);
});

document.getElementById("resetBtn").addEventListener("click", () => {
	suggestionBox.innerText = "";
});

closeBtn.addEventListener("click", () => {
	formIsOpen = false;
	form.classList.add("hidden");
	overlay.classList.add("hidden");
});

formBtn.addEventListener("click", () => {
	formIsOpen = true;
	form.classList.toggle("hidden");
	if (helpIsOpen) {
		helpIsOpen = false;
		helpPage.classList.add("hidden");
	} else {
		if (!desktop) {
			overlay.classList.toggle("hidden");
		}
	}
});

helpBtn.addEventListener("click", () => {
	helpIsOpen = true;
	helpPage.classList.remove("hidden");
	if (formIsOpen) {
		formIsOpen = false;
		form.classList.add("hidden");
	} else {
		if (!desktop) {
			overlay.classList.toggle("hidden");
		}
	}
});

overlay.addEventListener("click", () => {
	helpIsOpen = false;
	formIsOpen = false;

	form.classList.add("hidden");
	helpPage.classList.add("hidden");
	overlay.classList.add("hidden");
});

submitBtn.addEventListener("click", async (e) => {
	if (window.innerWidth < 990) {
		formIsOpen = false;
		overlay.classList.toggle("hidden");
		form.classList.add("hidden");
	}
	e.preventDefault();
	layerGroup.clearLayers();

	const formData = new FormData(form);

	const res = await fetch("http://localhost:9000/locations", {
		method: "POST",
		body: formData,
	});

	const locations = await res.json();

	if (locations.length === 0) {
		alert("Keine Ergebnisse");
	}

	console.log(locations);

	for (const location of locations) {
		const marker = L.marker([location.x, location.y]).addTo(map);
		marker.bindPopup(`
			<p class="popup-containernumber font-bold">Depotnummer: ${location.depotNr}</p>
			<p>
				<div class="mb-1 font-bold">Adresse:</div>
				<div class="mb-1">${location.street}</div>
				<div class="mb-1">${location.postalCode}, ${location.city}</div>
				<div class="mb-1">(${location.info})</div>
			</p>
			<div class="mb-1 font-bold">Anzahl Container:</div>
			<ul>
				<li class="flex justify-between">
					<span>Altpapier:</span><span>${location.paperCount}</span>
				</li>
				<li class="flex justify-between">
					<span>Weißglas:</span><span>${location.whiteGlasCount}</span>
				</li>
				<li class="flex justify-between">
					<span>Grünglas:</span><span>${location.greenGlasCount}</span>
				</li>
				<li class="flex justify-between">
					<span>Braunglas:</span><span>${location.greenGlasCount}</span>
				</li>
				<li class="flex justify-between">
					<span>Altkleider:</span><span>${location.clothCount}</span>
				</li>
				<li class="flex justify-between">
					<span class="mr-3">Elektrokleingeräte:</span><span>${location.electroCount}</span>
				</li>
			</ul>
		`);
		layerGroup.addLayer(marker).addTo(map);
	}

	if (searchRes.length > 0) {
		map.setView([searchRes[0].lat, searchRes[0].lon], 13);
	}
});
