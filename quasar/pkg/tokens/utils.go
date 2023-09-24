package tokens

import (
	"crypto/rsa"
	"encoding/base64"

	"github.com/golang-jwt/jwt"
)

func ParseRSAPublicKey(k string) (*rsa.PublicKey, error) {
	keyDecoded, err := base64.StdEncoding.DecodeString(k)
	if err != nil {
		return nil, err
	}

	pk, err := jwt.ParseRSAPublicKeyFromPEM(keyDecoded)
	if err != nil {
		return nil, err
	}

	return pk, nil
}

func ParseRSAPrivateKey(k string) (*rsa.PrivateKey, error) {
	keyDecoded, err := base64.StdEncoding.DecodeString(k)
	if err != nil {
		return nil, err
	}

	pk, err := jwt.ParseRSAPrivateKeyFromPEM(keyDecoded)
	if err != nil {
		return nil, err
	}

	return pk, nil
}
