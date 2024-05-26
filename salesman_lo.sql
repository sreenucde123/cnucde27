CREATE DATABASE IF NOT EXISTS cnu_db1
LOCATION 'gs://cnuhdfsbucket2/cnusql';

USE cnu_db1;

CREATE OR REPLACE TEMPORARY VIEW salesman_lo_v
USING JSON
OPTIONS(path='gs://cnuhdfsbucket2/source/salesman_lo.json');

CREATE TABLE IF NOT EXISTS cnu_db1.salesman_lo
USING PARQUET
SELECT * FROM salesman_lo_v;
