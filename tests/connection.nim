import os, db_postgres

let password = getEnv("password")

let db = open("localhost", "test", password, "test")
let tables = db.getAllRows(sql"select tablename from pg_tables")
echo tables