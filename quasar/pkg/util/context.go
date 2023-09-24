package util

import (
	"context"

	"github.com/YazeedAlKhalaf/alyamamah/quasar/pkg/audience"
	"github.com/rs/zerolog/log"
)

func AddAudienceToLoggerCtx(ctx context.Context, aud audience.Audience) context.Context {
	currentLogger := log.Ctx(ctx)
	updatedLogger := currentLogger.With().Str("audience", string(aud)).Logger()
	return updatedLogger.WithContext(ctx)
}
