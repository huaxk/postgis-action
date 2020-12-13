# PostgreSQL with Postgis GitHub Action
This [GitHub Action](https://github.com/features/actions) setup a PostgreSQL database with Postgis.  
Inspired by https://github.com/Harmon758/postgresql-action, @Harmon758 Thanks!

# Usage

Basic:
```yaml
steps:
- uses: huaxk/postgis-action@v1
  with:
    postgresql version: '11'  # See https://hub.docker.com/r/mdillon/postgis for available versions, if it is not specified, use the default value 'latest'
    postgresql password: ${{ secrets.DatabasePassword }}   # This environment variable sets the superuser password for PostgreSQL, maybe string or secrets, the default superuser is defined by the input environment variable: postgresql user.
    postgresql user: 'test'  # This optional environment variable is used in conjunction with postgresql password to set a user and its password. This variable will create the specified user with superuser power and a database with the same name. If it is not specified, then the default user of 'postgres' will be used.
    postgresql db: 'test'  # This optional environment variable can be used to define a different name for the default database that is created when the image is first started. If it is not specified, then the value of postgresql user will be used.
```

Client params:
* host: "localhost"
* user: "test"
* password: ***
* database: "test"
* port: 5432

# License

The scripts and documentation in this project are released under the [MIT License](LICENSE)
