# debezium-rails-sample
## How to start
```shell
# start servers
$ docker compose-up

# setup debezium connector
$ curl --location --request POST 'localhost:8083/connectors/' \
--header 'Accept: application/json' \
--header 'Content-Type: application/json' \
--data-raw '{
    "name": "test-connector",
    "config": {
        "connector.class": "io.debezium.connector.postgresql.PostgresConnector",
        "tasks.max": "1",
        "database.hostname": "postgres",
        "database.port": "5432",
        "database.user": "raksul",
        "database.password": "password",
        "database.dbname": "old_app_development",
        "database.server.name": "old_app_development",
        "plugin.name": "pgoutput"
    }
}'
```
Open http://localhost:3000/users and operate some action (create, edit).
Then the data will be synchronized to http://localhost/3001/users.