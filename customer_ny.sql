CREATE DATABASE IF NOT EXISTS cnu_db1
LOCATION 'gs://cnuhdfsbucket2/cnusql/';

USE cnu_db1;

CREATE OR REPLACE TEMPORARY VIEW customer_ny_v
USING JSON
OPTIONS(path='gs://cnuhdfsbucket2/source/customer_ny.json');

CREATE TABLE IF NOT EXISTS cnu_db1.customer_ny
USING PARQUET
SELECT * FROM customer_ny_v;
