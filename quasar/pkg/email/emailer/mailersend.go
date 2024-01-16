package emailer

import (
	"context"

	"github.com/YazeedAlKhalaf/alyamamah/quasar/pkg/email/template"
	mailersend "github.com/mailersend/mailersend-go"
	"github.com/rs/zerolog/log"
)

const (
	noReplyEmail = "no-reply@yu.alkhalaf.dev"
)

type mailersendEmailer struct {
	mailersend mailersend.Mailersend
}

func (e *mailersendEmailer) SendFromTemplate(ctx context.Context, template template.Template, to string) error {
	from := mailersend.From{
		Name:  "Al Yamamah app",
		Email: noReplyEmail,
	}
	recepients := []mailersend.Recipient{
		{
			Email: to,
		},
	}

	message := e.mailersend.Email.NewMessage()
	message.SetFrom(from)
	message.SetRecipients(recepients)
	message.SetSubject(template.Subject)
	message.SetHTML(template.HTML)

	_, err := e.mailersend.Email.Send(ctx, message)
	if err != nil {
		log.Ctx(ctx).Error().Err(err).Msg("failed to send email")
		return err
	}

	log.Ctx(ctx).Info().Msg("email sent")

	return nil
}

func NewMailersendEmailer(mailersend mailersend.Mailersend) Emailer {
	return &mailersendEmailer{
		mailersend: mailersend,
	}
}
