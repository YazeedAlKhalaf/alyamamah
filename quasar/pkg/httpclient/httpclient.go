package httpclient

import (
	"bytes"
	"encoding/json"
	"net/http"
)

type HTTPClient interface {
	Get(url string, headers map[string]string) (*http.Response, error)
	Post(url string, body interface{}, headers map[string]string) (*http.Response, error)
}

type client struct {
	httpClient *http.Client
}

func (c *client) Get(url string, headers map[string]string) (*http.Response, error) {
	req, err := http.NewRequest(http.MethodGet, url, nil)
	if err != nil {
		return nil, err
	}

	for k, v := range headers {
		req.Header.Set(k, v)
	}

	return c.httpClient.Do(req)
}

func (c *client) Post(url string, body interface{}, headers map[string]string) (*http.Response, error) {
	jsonData, err := json.Marshal(body)
	if err != nil {
		return nil, err
	}

	req, err := http.NewRequest(http.MethodPost, url, bytes.NewBuffer(jsonData))
	if err != nil {
		return nil, err
	}

	for k, v := range headers {
		req.Header.Set(k, v)
	}

	return c.httpClient.Do(req)
}

func NewClient(httpClient *http.Client) HTTPClient {
	return &client{
		httpClient: httpClient,
	}
}
