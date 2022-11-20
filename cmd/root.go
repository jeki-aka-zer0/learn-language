package cmd

import (
	"fmt"
	"os"

	"github.com/spf13/cobra"
)

var (
	RootCmd = &cobra.Command{
		Use:   "lang",
		Short: "Remember and repeat",
		Long:  "This is an application that helps you to learn words and phrases",
	}
)

func Execute() {
	if err := RootCmd.Execute(); err != nil {
		fmt.Fprintf(os.Stderr, "Whoops. There was an error '%s'", err)
		os.Exit(1)
	}
}
