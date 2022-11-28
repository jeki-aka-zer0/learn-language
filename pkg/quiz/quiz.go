package quiz

import (
	"fmt"

	"github.com/fatih/color"
	data "github.com/jeki-aka-zer0/learn-language/pkg/data"
	lang "github.com/jeki-aka-zer0/learn-language/pkg/lang"
	"github.com/manifoldco/promptui"
)

func Quiz(langRaw interface{}) {
	lang := lang.ParseLang(langRaw)
	ask(lang)
}

func ask(lang lang.Lang) {
	fmt.Printf("Lang is: %s\n", lang.String())

	word := data.GetRandomWord(lang)
	error := color.New(color.FgRed).Add(color.Bold)

	if word == nil {
		error.Println("There is no worlds 🤷‍♂️")
		return
	}

	fmt.Print("Translate the following: ")
	important := color.New(color.FgGreen).Add(color.Bold)
	important.Println(word.Word)

	prompt := promptui.Select{
		Label: "Repeat?",
		Items: []string{"Always", "Sometimes", "Never"},
	}
	_, repeat, err := prompt.Run()

	if err != nil {
		important.Println("Good bye 👋")
		return
	}

	label := color.New(color.Faint)
	value := color.New(color.FgCyan)
	label.Print("Translation: ")
	value.Println(word.Translate)
	if len(word.Example) > 0 {
		label.Print("    Example: ")
		value.Println(word.Example)
	}

	switch repeat {
	case "Always":
		fmt.Println("Ok, let's continue learning")
		word.RepeatAllways()
	case "Sometimes":
		fmt.Println("I will ask you this from time to time")
		word.RepeatSometimes()
	case "Never":
		fmt.Println("Congratulations! You have learned it")
		word.RepeatNever()
	default:
		fmt.Printf("Unexpected response %q\n", repeat)
		return
	}

	ask(lang)
}
