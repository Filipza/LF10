const searchField = document.getElementById("address-search");
let timeout = null;
const suggestionBox = document.getElementById("address-suggestion");

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

	suggestionBox.innerText = `${plz} ${suburb}, ${city}`;
}

searchField.addEventListener("input", () => {
	clearTimeout(timeout);
	timeout = setTimeout(() => {
		if (searchField.value.length >= 5) {
			fetchData();
		}
	}, 800);
});
