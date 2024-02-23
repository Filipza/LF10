package main

import (
	"context"

	"github.com/jackc/pgx/v5"
)

type DB struct {
	conn *pgx.Conn
}

func NewDB() (*DB, error) {
	conn, err := pgx.Connect(context.Background(), "postgres://admin:admin@localhost:5432/lf10")
	if err != nil {
		return nil, err
	}

	return &DB{conn: conn}, nil
}
