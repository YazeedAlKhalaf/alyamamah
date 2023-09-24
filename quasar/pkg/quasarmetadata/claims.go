package quasarmetadata

import (
	"context"

	"github.com/YazeedAlKhalaf/alyamamah/quasar/pkg/tokens"
)

type claimsKey struct{}

func (n *quasarmetadata) ContextWithClaims(ctx context.Context, claims tokens.QuasarClaims) context.Context {
	return context.WithValue(ctx, claimsKey{}, &claims)
}

func (n *quasarmetadata) GetClaims(ctx context.Context) (*tokens.QuasarClaims, bool) {
	v, ok := ctx.Value(claimsKey{}).(*tokens.QuasarClaims)
	return v, ok
}
