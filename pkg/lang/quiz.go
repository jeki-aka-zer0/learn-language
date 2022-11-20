package quiz

import (
	"database/sql"
	"fmt"
	"time"

	"github.com/fatih/color"
	data "github.com/jeki-aka-zer0/learn-language/pkg/data"
	"github.com/manifoldco/promptui"
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
		WHERE status < 2
		ORDER BY status, RAND()
		LIMIT 1;
	`).Scan(&word.Id, &word.Word, &word.Translate, &word.Example, &word.Lang, &word.Status, &word.AskedTimes)

	switch err {
	case sql.ErrNoRows:
		fmt.Println("There is no worlds yet.")
		return
	case nil:
		fmt.Print("Translate the following: ")
		c := color.New(color.FgGreen).Add(color.Bold)
		c.Println(word.Word)

		prompt := promptui.Select{
			Label: "Repeat?",
			Items: []string{"Always", "Sometimes", "Never"},
		}
		_, repeat, err := prompt.Run()

		if err != nil {
			fmt.Printf("Prompt failed %v\n", err)
			return
		}

		label := color.New(color.Faint)
		value := color.New(color.FgCyan)
		label.Print("Translation: ")
		color.New(color.FgCyan).Println(word.Translate)
		if len(word.Example) > 0 {
			label.Print("    Example: ")
			value.Println(word.Example)
		}

		switch repeat {
		case "Always":
			fmt.Println("Ok, let's continue learning")
			word.Status = 0
		case "Sometimes":
			fmt.Println("I will ask you this from time to time")
			word.Status = 1
		case "Never":
			fmt.Printf("Congratulations! You have learned it")
			word.Status = 2
		default:
			fmt.Printf("Unexpected reposne %q\n", repeat)
			return
		}
		word.AskedTimes++

		_, errUpdate := db.Exec(`
			UPDATE words
			SET status = ?, asked_times = ?, updated_at = ?
			WHERE id = ?
		`, word.Status, word.AskedTimes, time.Now(), word.Id)

		if errUpdate != nil {
			fmt.Printf("Prompt failed %v\n", errUpdate)
			return
		}
	default:
		panic(err)
	}
}
