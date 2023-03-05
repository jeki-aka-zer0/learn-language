package data

import (
	"bytes"
	"io"
	"net/http"
	"testing"
)

type MockClient struct {
	DoFunc func(req *http.Request) (*http.Response, error)
}

var (
	// GetDoFunc fetches the mock client's `Do` func
	GetDoFunc func(req *http.Request) (*http.Response, error)
)

// Do is the mock client's `Do` func
func (m *MockClient) Do(req *http.Request) (*http.Response, error) {
	return GetDoFunc(req)
}

func TestTranslate(t *testing.T) {
	tests := []struct {
		name     string
		wantResp *Translations
		wantErr  error
	}{
		{
			name: "test",
			wantResp: &Translations{
				Translations: []Translation{{
					DetectedSourceLanguage: "EN",
					Text:                   "Здравствуй, мир!",
				}},
			},
			wantErr: nil,
		},
	}

	// build response JSON
	json := `{"translations": [{"detected_source_language": "EN","text": "Здравствуй, мир!"}]}`
	// create a new reader with that JSON
	GetDoFunc = func(*http.Request) (*http.Response, error) {
		return &http.Response{
			StatusCode: 200,
			Body:       io.NopCloser(bytes.NewReader([]byte(json))),
		}, nil
	}

	SUT := NewTranslator("TEST", &MockClient{})
	for _, tt := range tests {
		t.Run(tt.name, func(t *testing.T) {
			got, err := SUT.Translate(En, Ru, "Hello, world!")

			if got.Translations[0].Text != tt.wantResp.Translations[0].Text || err != tt.wantErr {
				t.Errorf("Translate() = %v, %v, want %v, %v", got, err, tt.wantResp, tt.wantErr)
			}
		})
	}
}
