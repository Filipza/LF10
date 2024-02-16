package main

import (
	"context"
	"fmt"
	"os"

	"github.com/jackc/pgx/v5"
	"github.com/jackc/pgx/v5/pgtype"
)

type Location struct {
	Id          int `json: "id"`
	Address     string
	Coordinates pgtype.Point
	RecType     string
	Rating      int
	Info        string
}

func main() {
	dbURL := "postgres://admin:admin@localhost:5432/lf10"
	conn, err := pgx.Connect(context.Background(), dbURL)
	if err != nil {
		fmt.Fprintf(os.Stderr, "Unable to connect to database: %v\n", err)
		os.Exit(1)
	}
	defer conn.Close(context.Background())

	location1 := Location{}

	err = conn.QueryRow(context.Background(), "select * from locations where id=$1", 1).Scan(&location1.Id, &location1.Address, &location1.Coordinates, &location1.RecType, &location1.Rating, &location1.Info)
	if err != nil {
		fmt.Fprintf(os.Stderr, "QueryRow failed: %v\n", err)
		os.Exit(1)
	}

	fmt.Println(location1.Coordinates.Valid)
}
