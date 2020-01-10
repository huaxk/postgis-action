import os, db_postgres

let password = getEnv("password")

let db = open("localhost", "test", "test", "test")
let createsql = sql"""
  create table if not exsits cities(
    id serial primary key,
    name varchar(50) not null,
    lnglat geometry
  );
"""
db.exec(createsql)
let tables = db.getAllRows(sql"select tablename from pg_tables where schemaname='public'")
echo tables