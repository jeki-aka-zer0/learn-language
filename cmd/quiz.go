package cmd

import (
	quiz "github.com/jeki-aka-zer0/learn-language/pkg/quiz"
	"github.com/spf13/cobra"
)

var quizCmd = &cobra.Command{
	Use:   "quiz",
	Short: "Run quiz",
	Long:  "Ask a previously remembered word or phrase",
	Run: func(cmd *cobra.Command, args []string) {
		var langRaw string
		if len(args) > 0 {
			langRaw = args[0]
		}
		quiz.Quiz(langRaw)
	},
}

func init() {
	RootCmd.AddCommand(quizCmd)
}
