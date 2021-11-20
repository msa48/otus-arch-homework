FROM liquibase/liquibase:latest

WORKDIR /liquibase/changelog

COPY liquibase.docker.properties liquibase.properties
COPY . .

ENTRYPOINT ["/liquibase/liquibase"]
CMD ["update"]