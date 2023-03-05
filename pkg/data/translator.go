package data

import (
	"encoding/json"
	"fmt"
	"net/http"
	"net/url"
	"strings"
)

type LangCode int

const (
	En LangCode = iota
	Ru

	translateUrl string = "https://api-free.deepl.com/v2/translate"
)

func (lc LangCode) String() string {
	return []string{"EN", "RU"}[lc]
}

type HTTPClient interface {
	Do(req *http.Request) (*http.Response, error)
}

func NewTranslator(authKey string, client HTTPClient) *Translator {
	return &Translator{
		AuthKey: authKey,
		client:  client,
	}
}

type Translator struct {
	AuthKey string
	client  HTTPClient
}

type Translation struct {
	DetectedSourceLanguage string `json:"detected_source_language"`
	Text                   string `json:"text"`
}

type Translations struct {
	Translations []Translation `json:"translations"`
}

func (t *Translator) Translate(sourceLang, targetLang LangCode, text string) (*Translations, error) {
	var resp *http.Response

	// &http.Client{}
	//sourceLang = En
	//targetLang = Ru
	//text = "Hello, world!"

	// Set up the request body
	data := url.Values{}
	data.Set("source_lang", sourceLang.String())
	data.Set("text", text)
	data.Set("target_lang", targetLang.String())
	body := strings.NewReader(data.Encode())

	// Set up the request
	req, err := http.NewRequest("POST", translateUrl, body)
	if err != nil {
		return nil, err
	}

	req.Header.Set("Content-Type", "application/x-www-form-urlencoded")
	req.Header.Set("Authorization", "DeepL-Auth-Key "+t.AuthKey)

	// Send the request
	resp, err = t.client.Do(req)
	if err != nil {
		return nil, err
	}

	defer resp.Body.Close()

	// Check the status code
	if resp.StatusCode != http.StatusOK {
		return nil, fmt.Errorf("cannot translate, status code is: %s", resp.Status)
	}

	post := &Translations{}
	err = json.NewDecoder(resp.Body).Decode(post)
	if err != nil {
		return nil, err
	}

	return post, nil
}
