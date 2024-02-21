package main

import (
	"encoding/xml"
	"fmt"
	"os"
	"strconv"
	"strings"

	"github.com/everystreet/go-proj/v8/proj"
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
	WeissglasCount           int      `xml:"Weissglas-Depotcontainer"`
	WertstoffCount           int      `xml:"Wertstoff-Depotcontainer"`
	ElektrokleinGeraeteCount int      `xml:"Elektrokleingeräte-Depotcontainer"`
	AlttextilCount           int      `xml:"Alttextil-Depotcontainer"`
	Geo                      Geometry `xml:"geom"`
}

type Geometry struct {
	Point Point `xml:"Point"`
}

type Point struct {
	Pos string `xml:"pos"`
}

func main() {
	// Open your GML file
	file, err := os.Open("container.gml")
	if err != nil {
		panic(err)
	}
	defer file.Close()

	// Decode the XML
	var fc FeatureCollection
	decoder := xml.NewDecoder(file)
	err = decoder.Decode(&fc)
	if err != nil {
		panic(err)
	}

	ToEPSG25832(fc.FeatureMember[0].RecyclingPoint.Geo.Point.Pos, "EPSG:25832")
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
		P:     pgtype.Vec2{X: x, Y: y},
		Valid: true,
	}

	return &point, err
}
