package data

import (
	"database/sql"
	"time"

	_ "github.com/go-sql-driver/mysql"
)

var db *sql.DB

func init() {
	connect()
}

func connect() {
	d, err := sql.Open("mysql", "root:password@tcp(localhost:3306)/learn_language")

	if err != nil {
		panic(err)
	}

	db = d
}

type Word struct {
	Id         int
	Word       string
	Translate  string
	Example    string
	Lang       string
	Status     int
	AskedTimes int
}

func (word *Word) RepeatAllways() {
	word.Status = 0
	updateWord(word)
}

func (word *Word) RepeatSometimes() {
	word.Status = 1
	updateWord(word)
}

func (word *Word) RepeatNever() {
	word.Status = 2
	updateWord(word)
}

func GetRandomWord() *Word {
	word := &Word{}

	err := db.QueryRow(`
		SELECT id,
			word,
			translate,
			example,
			lang,
			status,
			asked_times
		FROM words
		WHERE status < 2
		ORDER BY status, RAND()
		LIMIT 1;
	`).Scan(&word.Id, &word.Word, &word.Translate, &word.Example, &word.Lang, &word.Status, &word.AskedTimes)

	switch err {
	case sql.ErrNoRows:
		return nil
	case nil:
		return word
	default:
		panic(err)
	}
}

func updateWord(word *Word) {
	word.AskedTimes++
	_, err := db.Exec(`
			UPDATE words
			SET status = ?, asked_times = ?, updated_at = ?
			WHERE id = ?
		`, word.Status, word.AskedTimes, time.Now(), word.Id)

	if err != nil {
		panic(err)
	}
}
