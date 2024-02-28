package main

import (
	"context"
	"encoding/json"
	"fmt"
	"log"
	"net/http"
	"os"
	"strings"

	"github.com/jackc/pgx/v5/pgtype"
)

type Location struct {
	Id              int          `json:"id"`
	DepotNr         string       `json:"depotNr"`
	City            string       `json:"city"`
	PostalCode      int          `json:"postalCode"`
	Street          string       `json:"street"`
	Coordinates     pgtype.Point `json:"coordinates"`
	X               float64      `json:"x"`
	Y               float64      `json:"y"`
	PaperCount      int          `json:"paperCount"`
	WhiteGlasCount  int          `json:"whiteGlasCount"`
	GreenGlassCount int          `json:"greenGlasCount"`
	BrownGlasCount  int          `json:"brownGlasCount"`
	ElectroCount    int          `json:"electroCount"`
	ClothCount      int          `json:"clothCount"`
	Rating          int          `json:"rating"`
	Info            string       `json:"info"`
	Distance        string       `json:"distance"`
}

func main() {
	db, err := NewDB()
	if err != nil {
		log.Fatal("Failed to connect to db")
	}

	mux := http.NewServeMux()
	mux.HandleFunc("POST /locations", func(w http.ResponseWriter, r *http.Request) {
		enableCors(&w)

		var query strings.Builder
		var conditions []string

		lat := r.FormValue("lat")
		lon := r.FormValue("lon")
		radius := r.FormValue("radius")
		altglas := r.FormValue("altglas")
		paper := r.FormValue("altpapier")
		altkleider := r.FormValue("altkleider")
		electroDevices := r.FormValue("elektrokleingereate")

		coordString := fmt.Sprintf("SELECT *, (coordinates <-> point '(%v, %v)') AS distance FROM locations WHERE ", lat, lon)

		query.WriteString(coordString)
		queryString := fmt.Sprintf("earth_box(ll_to_earth(%v, %v), %v) @> ll_to_earth(coordinates[0], coordinates[1]) ", lat, lon, radius)
		query.WriteString(queryString)

		if altkleider == "on" {
			conditions = append(conditions, "clothcount > 0")
		}

		if altglas == "on" {
			conditions = append(conditions, "(whiteglasscount > 0 OR greenglasscount > 0 OR brownglasscount > 0)")
		}

		if electroDevices == "on" {
			conditions = append(conditions, "electrocount > 0")
		}

		if paper == "on" {
			conditions = append(conditions, "paperCount > 0")
		}

		if altkleider != "on" && altglas != "on" && electroDevices != "on" && paper != "on" {
			writeJson(&w, []Location{})
			return
		}

		if len(conditions) > 0 {
			query.WriteString(" AND (")
		}

		for i, condition := range conditions {
			if i > 0 {
				query.WriteString(" OR")
			}

			query.WriteString(" ")
			query.WriteString(condition)
		}

		if len(conditions) > 0 {
			query.WriteString(")")
		}

		var locations []Location
		rows, err := db.conn.Query(context.Background(), query.String())

		for rows.Next() {
			var location Location
			err := rows.Scan(&location.Id,
				&location.DepotNr,
				&location.City,
				&location.PostalCode,
				&location.Street,
				&location.Coordinates,
				&location.PaperCount,
				&location.WhiteGlasCount,
				&location.GreenGlassCount,
				&location.BrownGlasCount,
				&location.ElectroCount,
				&location.ClothCount,
				&location.Rating,
				&location.Info,
				&location.Distance,
			)

			location.X = location.Coordinates.P.X
			location.Y = location.Coordinates.P.Y

			if err != nil {
				log.Fatal(err)
			}
			locations = append(locations, location)
		}

		if err != nil {
			log.Fatal(err)
		}

		writeJson(&w, locations)
	})

	err = http.ListenAndServe(":9000", mux)
	if err != nil {
		fmt.Println("Could not start server")
		os.Exit(1)
	}

	fmt.Println("Server is running...")
}

func enableCors(w *http.ResponseWriter) {
	(*w).Header().Set("Access-Control-Allow-Origin", "http://localhost:5173")
}

func writeJson(w *http.ResponseWriter, locations []Location) {
	(*w).Header().Set("Content-Type", "application/json")
	json.NewEncoder(*w).Encode(locations)
}
