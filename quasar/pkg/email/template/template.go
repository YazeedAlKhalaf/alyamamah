package template

import "fmt"

type Template struct {
	Subject string
	HTML    string
}

type Templates interface {
	VerifyEmailTemplate(code string) Template
}

type templates struct{}

func (t *templates) VerifyEmailTemplate(code string) Template {
	return Template{
		Subject: "Verify Your Email",
		HTML: fmt.Sprintf(`
<html>
	<body>
		<h1>Verify Email</h1>
		<p>%s is your code</p>

		<p>If you didn't create an account, you can ignore this email.</p>

		<p>Thanks,</p>
		<p>Your colleague at Al Yamamah</p>
	</body>
</html>
	`, code),
	}
}

func NewTemplates(domain string) Templates {
	return &templates{}
}
