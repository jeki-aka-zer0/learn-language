package cmd

import (
	parse "github.com/jeki-aka-zer0/learn-language/pkg/parse"

	"github.com/spf13/cobra"
)

var parseCmd = &cobra.Command{
	Use:   "parse /Users/zero/Downloads/words.txt",
	Short: "Run parse",
	Long:  "Parse words",
	Run: func(cmd *cobra.Command, args []string) {
		parse.Parse()
	},
}

func init() {
	RootCmd.AddCommand(parseCmd)
}
