package util

import "github.com/spf13/viper"

// Config stores all configuration of the application.
// The values are read by viper from a config file or environment variables.
type Config struct {
	Port          string `mapstructure:"PORT"`
	DBDriver      string `mapstructure:"DB_DRIVER"`
	DBUser        string `mapstructure:"DB_USER"`
	DBPassword    string `mapstructure:"DB_PASSWORD"`
	DBHost        string `mapstructure:"DB_HOST"`
	DBPort        string `mapstructure:"DB_PORT"`
	DBSSLMode     string `mapstructure:"DB_SSL_MODE"`
	JWTPublicKey  string `mapstructure:"JWT_PUBLIC_KEY"`
	JWTPrivateKey string `mapstructure:"JWT_PRIVATE_KEY"`
}

// LoadConfig reads configuration from the provided path or environment variables.
func LoadConfig(path string) (config Config, err error) {
	viper.AddConfigPath(path)
	viper.SetConfigName("app")
	viper.SetConfigType("env")
	viper.AutomaticEnv()

	err = viper.ReadInConfig()
	if err != nil {
		return
	}

	err = viper.Unmarshal(&config)
	return
}
