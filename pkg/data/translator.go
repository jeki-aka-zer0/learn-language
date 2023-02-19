package data

import (
	"bytes"
	"encoding/json"
	"fmt"
	"io/ioutil"
	"log"
	"net/http"
	"net/url"
	"strings"
)

func Translate() string {
	PROD := false

	type Translation struct {
		Detected_source_language string `json:"detected_source_language"`
		Text                     string `json:"text"`
	}
	type Translations struct {
		Translations []Translation `json:"translations"`
	}
	var resp *http.Response

	if PROD {
		// Set up the request data
		apiURL := "https://api-free.deepl.com/v2/translate"
		authKey := "XXX"
		sourceLang := "EN"
		text := "Hello, world!"
		targetLang := "RU"

		// Set up the request body
		data := url.Values{}
		data.Set("source_lang", sourceLang)
		data.Set("text", text)
		data.Set("target_lang", targetLang)
		body := strings.NewReader(data.Encode())

		// Set up the request
		req, err := http.NewRequest("POST", apiURL, body)
		if err != nil {
			panic(err)
		}

		req.Header.Set("Content-Type", "application/x-www-form-urlencoded")
		req.Header.Set("Authorization", "DeepL-Auth-Key "+authKey)

		// Send the request
		client := &http.Client{}
		resp, err = client.Do(req)
		if err != nil {
			panic(err)
		}

		defer resp.Body.Close()

		// Check the status code
		if resp.StatusCode != http.StatusOK {
			panic(fmt.Errorf("error: %s", resp.Status))
		}
	} else {
		mockedRes := Translations{
			Translations: []Translation{
				{
					Detected_source_language: "EN",
					Text:                     "Здравствуй, мир!!!",
				},
			},
		}

		// Marshal a JSON-encoded version of mockedRes
		b, err := json.Marshal(mockedRes)
		if err != nil {
			log.Panic("Error reading a mockedRes from mocked client", err)
		}

		resp = &http.Response{Body: ioutil.NopCloser(bytes.NewBuffer(b))}
	}

	post := &Translations{}
	derr := json.NewDecoder(resp.Body).Decode(post)
	if derr != nil {
		panic(derr)
	}

	for _, a := range post.Translations {
		fmt.Println("Text:", a.Text)
		fmt.Println("Detected_source_language:", a.Detected_source_language)
	}

	// fmt.Println("Title:", post.Title)
	// fmt.Println("Body:", post.Body)
	// fmt.Println("UserId:", post.UserId)

	return "done"
}
