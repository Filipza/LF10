package main

import (
	"context"
	"encoding/xml"
	"fmt"
	"os"
	"strconv"
	"strings"

	"github.com/everystreet/go-proj/v8/proj"
	"github.com/jackc/pgx/v5"
	"github.com/jackc/pgx/v5/pgtype"
)

type FeatureCollection struct {
	XMLName       xml.Name        `xml:"FeatureCollection"`
	FeatureMember []FeatureMember `xml:"featureMember"`
}

type FeatureMember struct {
	RecyclingPoint RecyclingPoint `xml:"abfall_recycling_1_papier"`
}

type RecyclingPoint struct {
	ID                       string   `xml:"id,attr"`
	Depotnummer              string   `xml:"Depotnummer"`
	Ortsteil                 string   `xml:"Ortsteil"`
	Strasse                  string   `xml:"Strasse"`
	PLZ                      string   `xml:"PLZ"`
	AltpapierCount           int      `xml:"Altpapier-Depotcontainer"`
	GruenglasCount           int      `xml:"Grünglas-Depotcontainer"`
	BraunglasCount           int      `xml:"Braunglas-Depotcontainer"`
	WeissglasCount           int      `xml:"Weissglas-Depotcontainer"`
	WertstoffCount           int      `xml:"Wertstoff-Depotcontainer"`
	ElektrokleinGeraeteCount int      `xml:"Elektrokleingeräte-Depotcontainer"`
	AlttextilCount           int      `xml:"Alttextil-Depotcontainer"`
	Geo                      Geometry `xml:"geom"`
	Langtext                 string   `xml:"Langtext"`
}

type Geometry struct {
	Point Point `xml:"Point"`
}

type Point struct {
	Pos string `xml:"pos"`
}

func main() {
	file, err := os.Open("container.gml")
	if err != nil {
		panic(err)
	}
	defer file.Close()

	var fc FeatureCollection
	decoder := xml.NewDecoder(file)
	err = decoder.Decode(&fc)
	if err != nil {
		panic(err)
	}

	dbURL := "postgres://admin:admin@localhost:5432/lf10"
	conn, err := pgx.Connect(context.Background(), dbURL)
	if err != nil {
		fmt.Fprintf(os.Stderr, "Unable to connect to database: %v\n", err)
		os.Exit(1)
	}
	defer conn.Close(context.Background())

	for _, recylingPoint := range fc.FeatureMember {
		var depotNr string
		houseNr := ""

		if strings.Contains(recylingPoint.RecyclingPoint.Depotnummer, "-") {
			depotNr = strings.Split(recylingPoint.RecyclingPoint.Depotnummer, "-")[0]
			houseNr = strings.Split(recylingPoint.RecyclingPoint.Depotnummer, "-")[1]
		} else {
			depotNr = recylingPoint.RecyclingPoint.Depotnummer
		}

		fmt.Println(depotNr)
		coords, err := ToEPSG25832(recylingPoint.RecyclingPoint.Geo.Point.Pos, "EPSG:25832")
		if err != nil {
			fmt.Printf("Skipping %s, failed to parse coords\n", depotNr)
			continue
		}

		var id *int
		row := conn.QueryRow(context.Background(), "SELECT id FROM locations WHERE depotNr=$1", depotNr)
		err = row.Scan(&id)
		if err == nil {
			continue
		}

		tag, err := conn.Exec(context.Background(),
			`INSERT INTO locations (depotNr, city, postalcode, street, coordinates, paperCount, whiteGlassCount, greenGlassCount, brownGlassCount, electroCount, clothCount, rating, info)
			VALUES ($1, $2, $3, $4, $5, $6, $7, $8, $9, $10, $11, $12, $13)`,
			depotNr,
			"Hamburg",
			recylingPoint.RecyclingPoint.PLZ,
			recylingPoint.RecyclingPoint.Strasse+" "+houseNr,
			coords,
			recylingPoint.RecyclingPoint.AltpapierCount,
			recylingPoint.RecyclingPoint.WeissglasCount,
			recylingPoint.RecyclingPoint.GruenglasCount,
			recylingPoint.RecyclingPoint.BraunglasCount,
			recylingPoint.RecyclingPoint.ElektrokleinGeraeteCount,
			recylingPoint.RecyclingPoint.AlttextilCount,
			5,
			recylingPoint.RecyclingPoint.Langtext,
		)
		fmt.Println(tag, err)
	}
}

// ToEPSG25832(562609.232, 5935944.481, "EPSG:25832")
func ToEPSG25832(coords string, projDefinition string) (*pgtype.Point, error) {
	coordsSplitted := strings.Split(coords, " ")

	x, err := strconv.ParseFloat(coordsSplitted[0], 64)

	if err != nil {
		fmt.Println("failed to parse x coordinate")
		return nil, nil
	}

	y, err := strconv.ParseFloat(coordsSplitted[1], 64)
	if err != nil {
		fmt.Println("failed to parse y coordinate")
		return nil, nil
	}

	coord := proj.XY{X: x, Y: y}

	err = proj.CRSToCRS(
		projDefinition,
		"EPSG:4326",
		func(pj proj.Projection) {
			proj.TransformForward(pj, &coord)
		},
	)

	if err != nil {
		fmt.Println("failed to convert to other CRS")
		return nil, nil
	}

	point := pgtype.Point{
		P:     pgtype.Vec2{X: coord.Y, Y: coord.X},
		Valid: true,
	}

	return &point, err
}
