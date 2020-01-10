import unittest, os, db_postgres, sequtils, strformat

let password = getEnv("password")
if password.len == 0:
  echo "Please set env of database password "
  quit(1)

suite "Test Postgis":
  echo "connect to pg"

  let db = open("localhost", "test", password, "test")

  test "check spatial_ref_sys table":
    let tables = db.getAllRows(sql"select tablename from pg_tables where schemaname='public'").mapIt(it[0])
    check "spatial_ref_sys" in tables

  test "create table with geometry":
    let createsql = sql"""
      create table if not exists cities(
        id serial primary key,
        name varchar(50) not null,
        lnglat geometry
      );
    """
    db.exec(createsql)
    let tables = db.getAllRows(sql"select tablename from pg_tables where schemaname='public'").mapIt(it[0])
    check "cities" in tables

  test "insert and query geometry data":
    let
      name = "huaian"
      wkt = "POINT(1 2)"
    let insertsql = fmt"insert into cities (name, lnglat) values ('{name}', st_geomfromtext('{wkt}'))"
    db.exec(sql(insertsql))
    let row = db.getRow(sql"select name, st_astext(lnglat) from cities")
    check row == [name, wkt]
