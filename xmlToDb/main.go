package main

import (
	"encoding/xml"
	"fmt"

	"github.com/everystreet/go-proj/v8/proj"
)

type FeatureCollection struct {
	XMLName       xml.Name        `xml:"FeatureCollection"`
	FeatureMember []FeatureMember `xml:"featureMember"`
}

type FeatureMember struct {
	RecyclingPoint RecyclingPoint `xml:"abfall_recycling_1_papier"`
}

type RecyclingPoint struct {
	ID                       string `xml:"id,attr"`
	Depotnummer              string `xml:"Depotnummer"`
	Ortsteil                 string `xml:"Ortsteil"`
	Strasse                  string `xml:"Strasse"`
	PLZ                      string `xml:"PLZ"`
	AltpapierCount           int    `xml:"Altpapier-Depotcontainer"`
	GruenglasCount           int    `xml:"Grünglas-Depotcontainer"`
	WeissglasCount           int    `xml:"Weissglas-Depotcontainer"`
	WertstoffCount           int    `xml:"Wertstoff-Depotcontainer"`
	ElektrokleinGeraeteCount int    `xml:"Elektrokleingeräte-Depotcontainer"`
	AlttextilCount           int    `xml:"Alttextil-Depotcontainer"`
}

type Point struct {
	Pos string `xml:"pos"`
}

func main() {

}

// ToEPSG25832(562609.232, 5935944.481, "EPSG:25832")
func ToEPSG25832(x, y float64, projDefinition string) (float64, float64) {
	coord := proj.XY{X: x, Y: y}

	err := proj.CRSToCRS(
		projDefinition,
		"EPSG:4326",
		func(pj proj.Projection) {
			proj.TransformForward(pj, &coord)
			// transform more coordinates
		},
	)

	if err != nil {
		return 0, 0
	}

	fmt.Println(coord.Y, coord.X)
	return coord.Y, coord.X
}
