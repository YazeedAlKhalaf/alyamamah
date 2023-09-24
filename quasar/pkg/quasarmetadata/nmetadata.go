package quasarmetadata

import (
	"context"

	"github.com/YazeedAlKhalaf/alyamamah/quasar/pkg/tokens"
)

type QuasarMetadata interface {
	ContextWithClaims(ctx context.Context, claims tokens.QuasarClaims) context.Context
	GetClaims(ctx context.Context) (*tokens.QuasarClaims, bool)
}

type quasarmetadata struct{}

func NewQuasarMetadata() QuasarMetadata {
	return &quasarmetadata{}
}
