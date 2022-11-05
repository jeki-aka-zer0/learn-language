package lang

import (
	quiz "github.com/jeki-aka-zer0/learn-language/pkg/lang"
	"github.com/spf13/cobra"
)

var quizCmd = &cobra.Command{
	Use:   "quiz",
	Short: "Run quiz",
	Long:  "Ask a previously remembered word or phrase",
	Run: func(cmd *cobra.Command, args []string) {
		quiz.Quiz()
	},
}

func init() {
	rootCmd.AddCommand(quizCmd)
}
