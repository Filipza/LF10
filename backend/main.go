package main

import (
	"fmt"
	"net/http"

	"github.com/jackc/pgx/v5/pgtype"
)

type Location struct {
	Id              int          `json:"id"`
	DepotNr         string       `json:"depotNr"`
	City            string       `json:"city"`
	PostalCode      int          `json:"postalCode"`
	Street          string       `json:"street"`
	Coordinates     pgtype.Point `json:"coordinates"`
	PaperCount      int          `json:"paperCount"`
	WhiteGlasCount  int          `json:"whiteGlasCount"`
	GreenGlassCount int          `json:"greenGlasCount"`
	BrownGlasCount  int          `json:"brownGlasCount"`
	ElectroCount    int          `json:"electroCount"`
	ClothCount      int          `json:"clothCount"`
	Rating          int          `json:"rating"`
	Info            string       `json:"info"`
}

func main() {
	// db, err := NewDB()
	// if err != nil {
	// 	log.Fatal("Failed to connect to db")
	// }

	// location1 := Location{}

	mux := http.NewServeMux()
	mux.HandleFunc("POST /locations", func(w http.ResponseWriter, r *http.Request) {
		// enableCors(&w)
		w.Header().Set("Access-Control-Allow-Origin", "*")
		r.ParseForm()

		plz := r.Form.Get("plz")
		fmt.Println(plz)
		// plz := r.FormValue("plz")
		// altkleider := r.FormValue("altkleider")
		// altglas := r.FormValue("altglas")
		// recycling := r.FormValue("recyclinghoefe")
		// electroDevices := r.FormValue("elektrokleingereate")
		// paper := r.FormValue("altpapier")
		// radius := r.FormValue("radius")
		fmt.Println(r.Form)
		fmt.Println(r.PostForm)

		// db query
		// 	err := db.conn.QueryRow(context.Background(), "SELECT * FROM locations LIMIT 1").Scan(
		// 		&location1.Id,
		// 		&location1.DepotNr,
		// 		&location1.City,
		// 		&location1.PostalCode,
		// 		&location1.Street,
		// 		&location1.Coordinates,
		// 		&location1.PaperCount,
		// 		&location1.WhiteGlasCount,
		// 		&location1.GreenGlassCount,
		// 		&location1.BrownGlasCount,
		// 		&location1.ElectroCount,
		// 		&location1.ClothCount,
		// 		&location1.Rating,
		// 		&location1.Info,
		// 	)
		// 	if err != nil {
		// 		log.Fatal(err)
		// 	}

		// 	// return json
		// 	fmt.Println(location1)
	})

	http.ListenAndServe("localhost:9000", mux)
}

// func enableCors(w *http.ResponseWriter) {
// 	(*w).Header().Set("Access-Control-Allow-Origin", "http://localhost:5173")
// }
