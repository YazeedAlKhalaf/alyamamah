package util

import (
	"testing"

	"github.com/stretchr/testify/assert"
)

func TestCreateDbSource_ShouldGetStringWhenAllPropertiesProvided(t *testing.T) {
	dbSource := CreateDbSource("dbUser", "dbPassword", "dbHost", "dbPort", "dbName", "dbSSLMode")
	expected := "user='dbUser' password='dbPassword' host='dbHost' port='dbPort' dbname='dbName' sslmode='dbSSLMode'"

	assert.Equal(t, expected, dbSource)
}
