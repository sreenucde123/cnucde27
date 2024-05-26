CREATE DATABASE IF NOT EXISTS cnu_db1
LOCATION 'gs://cnuhdfsbucket2/cnusql';

USE cnu_db1;

CREATE OR REPLACE TEMPORARY VIEW orders_v
USING JSON
OPTIONS(path='gs://cnuhdfsbucket2/source/orders.json');

CREATE TABLE IF NOT EXISTS cnu_db1.orders
USING PARQUET
SELECT * FROM orders_v;
