package parse

import (
	"bufio"
	"os"

	"github.com/fatih/color"
	"github.com/jeki-aka-zer0/learn-language/pkg/data"
	"github.com/jeki-aka-zer0/learn-language/pkg/prompt"
)

func Parse() {
	file, err := os.OpenFile("/Users/zero/Downloads/words.txt", os.O_RDONLY, os.ModePerm)
	error := color.New(color.FgRed).Add(color.Bold)

	if err != nil {
		error.Println("There is no /Users/zero/Downloads/words.txt 🤷️")
		return
	}
	defer file.Close()

	scanner := bufio.NewScanner(file)
	for scanner.Scan() {
		if data.IsWordExists(scanner.Text()) {
			continue
		}

		translate := prompt.PromptGetInput(prompt.PromptContent{
			ErrorMsg: "Provide translation.",
			Label:    "Translation for: " + scanner.Text(),
		})
		example := prompt.PromptGetInput(prompt.PromptContent{
			ErrorMsg: "Provide example.",
			Label:    "Example for: " + scanner.Text(),
		})

		word := data.Word{
			Word:      scanner.Text(),
			Translate: translate,
			Example:   example,
			Lang:      "en",
		}
		word.Create()
	}

	if err := scanner.Err(); err != nil {
		error.Println("Scanner error %s", err)
		return
	}
}
