package emailer

import (
	"context"

	"github.com/YazeedAlKhalaf/alyamamah/quasar/pkg/email/template"
	"github.com/rs/zerolog/log"
)

type stdoutEmailer struct {
}

func (e *stdoutEmailer) SendFromTemplate(ctx context.Context, template template.Template, to string) error {
	log.Ctx(ctx).Info().Msgf("Sending email to '%s', with subject: '%s', and html: '%s'", to, template.Subject, template.HTML)

	return nil
}

func NewStdoutEmailer() Emailer {
	return &stdoutEmailer{}
}
