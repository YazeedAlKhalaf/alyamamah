package client

import (
	"crypto/tls"
	"crypto/x509"
	"encoding/base64"
	"encoding/json"
	"fmt"
	"net/http"

	"github.com/YazeedAlKhalaf/alyamamah/quasar/pkg/httpclient"
	"github.com/rs/zerolog/log"
)

type client struct {
	cli     httpclient.HTTPClient
	baseUrl string
}

func (c *client) Login(r *LoginRequest) (*LoginResponse, error) {
	url := fmt.Sprintf("%s%s", c.baseUrl, "/resources/common/commonServies/actorDetails/-1/1/2")

	credentials := fmt.Sprintf("%s:%s", r.Username, r.Password)
	encodedCredentials := base64.StdEncoding.EncodeToString([]byte(credentials))
	headers := map[string]string{
		"Authorization": fmt.Sprintf("Basic %s", encodedCredentials),
	}

	resp, err := c.cli.Get(url, headers)
	if err != nil {
		return nil, err
	}

	bodyDecoder := json.NewDecoder(resp.Body)
	var loginResponse LoginResponse
	err = bodyDecoder.Decode(&loginResponse)
	if err != nil {
		log.Err(err).Msg("failed to decode body")
		return nil, err
	}

	if loginResponse.CommonInfo.Status == false {
		return nil, fmt.Errorf("login failed")
	}

	return &loginResponse, nil
}

func NewClient(httpClient *http.Client, baseUrl string) Client {
	certPool := x509.NewCertPool()
	certPool.AppendCertsFromPEM([]byte(serverCert))
	certPool.AppendCertsFromPEM([]byte(intermediateCert))

	httpClient.Transport = &http.Transport{
		TLSClientConfig: &tls.Config{
			RootCAs: certPool,
		},
	}

	return &client{
		cli:     httpclient.NewClient(httpClient),
		baseUrl: baseUrl,
	}
}

var _ Client = (*client)(nil)

const serverCert = `-----BEGIN CERTIFICATE-----
MIIGyDCCBbCgAwIBAgIQBN3lxeyvaWgHhgv65AkMVDANBgkqhkiG9w0BAQsFADBZ
MQswCQYDVQQGEwJVUzEVMBMGA1UEChMMRGlnaUNlcnQgSW5jMTMwMQYDVQQDEypE
aWdpQ2VydCBHbG9iYWwgRzIgVExTIFJTQSBTSEEyNTYgMjAyMCBDQTEwHhcNMjMw
MzA5MDAwMDAwWhcNMjQwMzI1MjM1OTU5WjBUMQswCQYDVQQGEwJTQTEPMA0GA1UE
BxMGUml5YWRoMR4wHAYDVQQKExVBbC1ZYW1hbWFoIFVuaXZlcnNpdHkxFDASBgNV
BAMMCyoueXUuZWR1LnNhMIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEA
sHfVWvaxn7GskBW8rOR2E459pZkyppIyuBU4BqR09Z3D24wPrw3LxZvX+omPsAAs
vn8V7l9s8FGlVX6cBZoBrP7EFGra4D/vnJ6uoNDcA/i1Z2evT8ke2DDxo+UeZkW9
U6DgyhCg0xBHxctKsrXRxjtxmErArrotKhjx88vVHslIgINvKvGdO70Qa6NwvvvW
cYR7ap02AUMwzB3U2/tK9sjgRtIxf4u3T/exO64mrcfZqKOkOdqevsLtIHLNvdkm
9j3RvJ1vNdgy5sAQbWIlFk8Zqk2quEsa3vEIjGdK51EVzglEKGJ/vWY4wa501deC
S5w+YQWoafr4VOQ0jsewqQIDAQABo4IDjzCCA4swHwYDVR0jBBgwFoAUdIWAwGbH
3zfez70pN6oDHb7tzRcwHQYDVR0OBBYEFAYC1vWFCv+fBSDpJKesqtlsJDC7MCEG
A1UdEQQaMBiCCyoueXUuZWR1LnNhggl5dS5lZHUuc2EwDgYDVR0PAQH/BAQDAgWg
MB0GA1UdJQQWMBQGCCsGAQUFBwMBBggrBgEFBQcDAjCBnwYDVR0fBIGXMIGUMEig
RqBEhkJodHRwOi8vY3JsMy5kaWdpY2VydC5jb20vRGlnaUNlcnRHbG9iYWxHMlRM
U1JTQVNIQTI1NjIwMjBDQTEtMS5jcmwwSKBGoESGQmh0dHA6Ly9jcmw0LmRpZ2lj
ZXJ0LmNvbS9EaWdpQ2VydEdsb2JhbEcyVExTUlNBU0hBMjU2MjAyMENBMS0xLmNy
bDA+BgNVHSAENzA1MDMGBmeBDAECAjApMCcGCCsGAQUFBwIBFhtodHRwOi8vd3d3
LmRpZ2ljZXJ0LmNvbS9DUFMwgYcGCCsGAQUFBwEBBHsweTAkBggrBgEFBQcwAYYY
aHR0cDovL29jc3AuZGlnaWNlcnQuY29tMFEGCCsGAQUFBzAChkVodHRwOi8vY2Fj
ZXJ0cy5kaWdpY2VydC5jb20vRGlnaUNlcnRHbG9iYWxHMlRMU1JTQVNIQTI1NjIw
MjBDQTEtMS5jcnQwCQYDVR0TBAIwADCCAX4GCisGAQQB1nkCBAIEggFuBIIBagFo
AHYA7s3QZNXbGs7FXLedtM0TojKHRny87N7DUUhZRnEftZsAAAGGxgb/QgAABAMA
RzBFAiB3co5GrRQtuo0KcxLKwBMEdoIHI+MqfIKFDlBW/tyZygIhALdQ7TimTG78
ZGs9SIbhaXGDy2Q77L1hth2z2c3agKxmAHUAc9meiRtMlnigIH1HneayxhzQUV5x
GSqMa4AQesF3crUAAAGGxgb/iQAABAMARjBEAiAOpvDCChWEj3dwwJSoNY2MqI74
Zl4q0AkuI73s2agKKQIgfrtxN37PMOvI2vvwPgiVg/BWVL+jMUc191eOdEGwDCsA
dwBIsONr2qZHNA/lagL6nTDrHFIBy1bdLIHZu7+rOdiEcwAAAYbGBv9JAAAEAwBI
MEYCIQDUpmmKOtffL0I0HtV5T1zSK90iqShVnr0axCbwmNLv9wIhAK+z+sG4ol0h
In2Nfq49ZI/M18cndxvHxUHVHTt8tCipMA0GCSqGSIb3DQEBCwUAA4IBAQAWfmqc
TFMTX7VRusjZI9Xnd5Fn586oVR8y913zDeB2tj38r8ieTOKv33K2pWJVLxjxr4an
KunwIkNyaFwdnu14Tvh+qVHh+y2NDyftc4x/I2jramHuqXQR4YyXCrEw83pfMlqu
w/meN2j2DLDHRZEGZmsInKxHQg4kfHxUBLFKrHrrwH11hN7AoXas+rZQBHFowoHD
zh1rQENXyjYkSlJjT9K3XZGNtbnSDikp8eCHzM9XzD35YIf0c6mn3M/KytTXVLCB
ctH3orOVz6Pt70bVmSVbbKuoOz8/hwI4yYgKn51s9uS4R55Zzba1CNt8yMFToIiv
zd++rKVEaV3KDCRw
-----END CERTIFICATE-----`
const intermediateCert = `-----BEGIN CERTIFICATE-----
MIIEyDCCA7CgAwIBAgIQDPW9BitWAvR6uFAsI8zwZjANBgkqhkiG9w0BAQsFADBh
MQswCQYDVQQGEwJVUzEVMBMGA1UEChMMRGlnaUNlcnQgSW5jMRkwFwYDVQQLExB3
d3cuZGlnaWNlcnQuY29tMSAwHgYDVQQDExdEaWdpQ2VydCBHbG9iYWwgUm9vdCBH
MjAeFw0yMTAzMzAwMDAwMDBaFw0zMTAzMjkyMzU5NTlaMFkxCzAJBgNVBAYTAlVT
MRUwEwYDVQQKEwxEaWdpQ2VydCBJbmMxMzAxBgNVBAMTKkRpZ2lDZXJ0IEdsb2Jh
bCBHMiBUTFMgUlNBIFNIQTI1NiAyMDIwIENBMTCCASIwDQYJKoZIhvcNAQEBBQAD
ggEPADCCAQoCggEBAMz3EGJPprtjb+2QUlbFbSd7ehJWivH0+dbn4Y+9lavyYEEV
cNsSAPonCrVXOFt9slGTcZUOakGUWzUb+nv6u8W+JDD+Vu/E832X4xT1FE3LpxDy
FuqrIvAxIhFhaZAmunjZlx/jfWardUSVc8is/+9dCopZQ+GssjoP80j812s3wWPc
3kbW20X+fSP9kOhRBx5Ro1/tSUZUfyyIxfQTnJcVPAPooTncaQwywa8WV0yUR0J8
osicfebUTVSvQpmowQTCd5zWSOTOEeAqgJnwQ3DPP3Zr0UxJqyRewg2C/Uaoq2yT
zGJSQnWS+Jr6Xl6ysGHlHx+5fwmY6D36g39HaaECAwEAAaOCAYIwggF+MBIGA1Ud
EwEB/wQIMAYBAf8CAQAwHQYDVR0OBBYEFHSFgMBmx9833s+9KTeqAx2+7c0XMB8G
A1UdIwQYMBaAFE4iVCAYlebjbuYP+vq5Eu0GF485MA4GA1UdDwEB/wQEAwIBhjAd
BgNVHSUEFjAUBggrBgEFBQcDAQYIKwYBBQUHAwIwdgYIKwYBBQUHAQEEajBoMCQG
CCsGAQUFBzABhhhodHRwOi8vb2NzcC5kaWdpY2VydC5jb20wQAYIKwYBBQUHMAKG
NGh0dHA6Ly9jYWNlcnRzLmRpZ2ljZXJ0LmNvbS9EaWdpQ2VydEdsb2JhbFJvb3RH
Mi5jcnQwQgYDVR0fBDswOTA3oDWgM4YxaHR0cDovL2NybDMuZGlnaWNlcnQuY29t
L0RpZ2lDZXJ0R2xvYmFsUm9vdEcyLmNybDA9BgNVHSAENjA0MAsGCWCGSAGG/WwC
ATAHBgVngQwBATAIBgZngQwBAgEwCAYGZ4EMAQICMAgGBmeBDAECAzANBgkqhkiG
9w0BAQsFAAOCAQEAkPFwyyiXaZd8dP3A+iZ7U6utzWX9upwGnIrXWkOH7U1MVl+t
wcW1BSAuWdH/SvWgKtiwla3JLko716f2b4gp/DA/JIS7w7d7kwcsr4drdjPtAFVS
slme5LnQ89/nD/7d+MS5EHKBCQRfz5eeLjJ1js+aWNJXMX43AYGyZm0pGrFmCW3R
bpD0ufovARTFXFZkAdl9h6g4U5+LXUZtXMYnhIHUfoyMo5tS58aI7Dd8KvvwVVo4
chDYABPPTHPbqjc1qCmBaZx2vN4Ye5DUys/vZwP9BFohFrH/6j/f3IL16/RZkiMN
JCqVJUzKoZHm1Lesh3Sz8W2jmdv51b2EQJ8HmA==
-----END CERTIFICATE-----`
