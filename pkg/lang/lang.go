package lang

import (
	"strings"
)

type Lang int

const (
	en Lang = iota
	fr
)

var langMap = map[string]Lang{
	"en": en,
	"fr": fr,
}

func (l Lang) String() string {
	for label, val := range langMap {
		if val == l {
			return label
		}
	}

	panic("Cannot detect language")
}

func ParseLang(langRaw interface{}) Lang {
	if langRawString, ok := langRaw.(string); ok {
		if lang, ok := langMap[strings.ToLower(langRawString)]; ok {
			return lang
		}
	}

	return en
}
