package data

import (
	"database/sql"

	_ "github.com/go-sql-driver/mysql"
)

var db *sql.DB

func Connect() {
	d, err := sql.Open("mysql", "root:password@tcp(localhost:3306)/learn_language")

	if err != nil {
		panic(err)
	}

	db = d
}

func GetDb() *sql.DB {
	return db
}
