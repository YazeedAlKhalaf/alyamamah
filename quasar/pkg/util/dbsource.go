package util

import "fmt"

func CreateDbSource(
	dbUser string,
	dbPassword string,
	dbHost string,
	dbPort string,
	dbName string,
	dbSSLMode string,
) string {
	dbSource := fmt.Sprintf(
		"user='%s' password='%s' host='%s' port='%s' dbname='%s' sslmode='%s'",
		dbUser,
		dbPassword,
		dbHost,
		dbPort,
		dbName,
		dbSSLMode,
	)

	return dbSource
}
