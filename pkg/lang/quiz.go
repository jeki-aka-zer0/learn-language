package quiz

import (
	"database/sql"
	"fmt"

	data "github.com/jeki-aka-zer0/learn-language/pkg/data"
	prompt "github.com/jeki-aka-zer0/learn-language/pkg/prompt"
)

var db *sql.DB

type Word struct {
	Id         int
	Word       string
	Translate  string
	Example    string
	Lang       string
	Status     int
	AskedTimes int
}

func init() {
	data.Connect()
	db = data.GetDb()
}

func Quiz() {
	var word Word

	err := db.QueryRow(`
		SELECT id,
			word,
			translate,
			example,
			lang,
			status,
			asked_times
		FROM words
		WHERE status < 3
		ORDER BY status, asked_times DESC, RAND()
		LIMIT 1;
	`).Scan(&word.Id, &word.Word, &word.Translate, &word.Example, &word.Lang, &word.Status, &word.AskedTimes)

	switch err {
	case sql.ErrNoRows:
		fmt.Println("There is no worlds yet.")
		return
	case nil:
		wordPromptContent := prompt.PromptContent{
			ErrorMsg: "Please provide a word.",
			Label:    "Translate the following: " + word.Word,
		}
		inputWord := prompt.PromptGetInput(wordPromptContent)

		fmt.Printf("You entered: '%s'", inputWord)
	default:
		panic(err)
	}
}
