package main

import (
	"fmt"

	"github.com/everystreet/go-proj/v8/proj"
)

func main() {
	ToEPSG25832(562609.232, 5935944.481, "EPSG:25832")

}

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
