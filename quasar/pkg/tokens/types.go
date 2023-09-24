package tokens

import (
	"github.com/YazeedAlKhalaf/alyamamah/quasar/pkg/audience"
	"github.com/golang-jwt/jwt"
)

type Payload struct {
	Username string `json:"username"`
}

type QuasarClaims struct {
	Payload Payload `json:"payload"`
	jwt.StandardClaims
}

type Tokens interface {
	NewToken(username string, aud audience.Audience) (*string, error)
	ParseToken(token string) (*QuasarClaims, error)
}
