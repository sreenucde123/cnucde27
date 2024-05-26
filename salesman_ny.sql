CREATE DATABASE IF NOT EXISTS cnu_db1
LOCATION 'gs://cnuhdfsbucket2/cnusql';

USE cnu_db1;

CREATE OR REPLACE TEMPORARY VIEW salesman_ny_v
USING JSON
OPTIONS(path='gs://cnuhdfsbucket2/source/salesman_ny.json');

CREATE TABLE IF NOT EXISTS cnu_db1.salesman_ny
USING PARQUET
SELECT * FROM salesman_ny_v;
