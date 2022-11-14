package quiz

import (
	"database/sql"
	"fmt"

	data "github.com/jeki-aka-zer0/learn-language/pkg/data"
)

var db *sql.DB

func init() {
	data.Connect()
	db = data.GetDb()
}

func Quiz() {
	var version string

	err2 := db.QueryRow("SELECT VERSION()").Scan(&version)

	if err2 != nil {
		fmt.Println(err2)
	}

	fmt.Printf("MySQL version is: %s. ", version)
	fmt.Println("Here will be some words and phrases")
}
