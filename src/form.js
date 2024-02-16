const searchField = document.getElementById("address-search");
const suggestionBox = document.getElementById("address-suggestion");
const form = document.getElementById("form");
const overlay = document.getElementById("overlay");
const helpBtn = document.getElementById("help-btn");
const formBtn = document.getElementById("filter-btn");
const closeBtn = document.getElementById("close-btn");
const helpPage = document.getElementById("help-page");
let timeout = null;
let helpIsOpen = false;
let formIsOpen = false;

async function fetchData() {
	const res = await fetch(
		`https://nominatim.openstreetmap.org/search?addressdetails=1&postalcode=${searchField.value}&countrycodes=de&format=jsonv2&limit=4`,
	);
	const searchRes = await res.json();
	fillSuggestionBox(searchRes);
}

function fillSuggestionBox(searchRes) {
	console.log(searchRes);
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
	console.log("closeBtn clicked");
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
		overlay.classList.toggle("hidden");
	}
});

helpBtn.addEventListener("click", () => {
	helpIsOpen = true;
	helpPage.classList.remove("hidden");
	if (formIsOpen) {
		formIsOpen = false;
		form.classList.add("hidden");
	} else {
		overlay.classList.toggle("hidden");
	}
});
