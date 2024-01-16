package emailer

import (
	"context"

	"github.com/YazeedAlKhalaf/alyamamah/quasar/pkg/email/template"
)

type EmailerName string

const (
	Stdout EmailerName = "stdout"
	Resend EmailerName = "resend"
)

type Emailer interface {
	SendFromTemplate(ctx context.Context, template template.Template, email string) error
}
