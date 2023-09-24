package tokens

import (
	"crypto/rsa"
	"time"

	"github.com/YazeedAlKhalaf/alyamamah/quasar/pkg/audience"
	"github.com/golang-jwt/jwt"
)

const tokenValidity = time.Hour * 3

type tokens struct {
	PublicKey  *rsa.PublicKey
	PrivateKey *rsa.PrivateKey
}

func (t tokens) NewToken(username string, aud audience.Audience) (*string, error) {
	expiresAt := time.Now().UTC().Add(tokenValidity)
	claims := QuasarClaims{
		Payload{
			Username: username,
		},
		jwt.StandardClaims{
			Audience:  string(aud),
			ExpiresAt: expiresAt.Unix(),
		},
	}
	token := jwt.NewWithClaims(jwt.SigningMethodRS256, claims)

	signedToken, err := token.SignedString(t.PrivateKey)
	if err != nil {
		return nil, err
	}

	return &signedToken, nil
}

func (t tokens) ParseToken(token string) (*QuasarClaims, error) {
	claims := QuasarClaims{}
	_, err := jwt.ParseWithClaims(token, &claims, func(token *jwt.Token) (interface{}, error) {
		return t.PublicKey, nil
	})
	if err != nil {
		return nil, err
	}

	return &claims, nil
}

func NewTokens(publicKey *rsa.PublicKey, privateKey *rsa.PrivateKey) Tokens {
	return &tokens{
		PublicKey:  publicKey,
		PrivateKey: privateKey,
	}
}
