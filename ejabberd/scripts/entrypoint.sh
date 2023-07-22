#!/bin/sh

# Set the default configuration file path
CONFIG_FILE_PATH="/opt/ejabberd/conf/ejabberd.yml"

# Update the ejabberd.yml with the environment variables
yq -i ".sql_server = env(SQL_SERVER)" $CONFIG_FILE_PATH
yq -i ".sql_port = env(SQL_PORT)" $CONFIG_FILE_PATH
yq -i ".sql_database = env(SQL_DATABASE)" $CONFIG_FILE_PATH
yq -i ".sql_username = env(SQL_USERNAME)" $CONFIG_FILE_PATH
yq -i ".sql_password = env(SQL_PASSWORD)" $CONFIG_FILE_PATH

# Start ejabberd
exec /opt/ejabberd-23.04/bin/ejabberdctl "$@"