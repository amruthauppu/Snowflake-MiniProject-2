create database sales_data

create schema raw_data

create schema flatten_data

create table raw_data.sales_raw
(
json_data variant
)

create table flatten_data.SALES_FLATTEN
(
COMPANIES STRING,

SALES_PERIOD STRING,

TOTAL_REVENUE FLOAT,

TOTAL_UNITS_SOLD FLOAT,

REGIONS STRING,

TOTAL_SALES FLOAT,

PRODUCTS STRING,

UNITS_SOLD FLOAT,

REVENUE FLOAT
)

create stage raw_data.sales_stage

list @raw_data.sales_stage

CREATE OR REPLACE FILE FORMAT raw_data.json_format
TYPE = 'JSON';


copy into  sales_data.raw_data.sales_raw
from @sales_data.raw_data.sales_stage/sales_data.json
FILE_FORMAT = (FORMAT_NAME = raw_data.json_format)

truncate table flatten_data.SALES_FLATTEN

insert into flatten_data.SALES_FLATTEN
select
    c.key as COMPANIES,
    c.value:sales_period::STRING as SALES_PERIOD,
    c.value:total_revenue::FLOAT as TOTAL_REVENUE,
    c.value:total_units_sold::FLOAT as TOTAL_UNITS_SOLD,
    r.key as REGIONS,
    r.value:total_sales::FLOAT as TOTAL_SALES,
    p.key as PRODUCTS,
    p.value:units_sold::FLOAT as UNITS_SOLD,
    p.value:revenue::FLOAT as REVENUE
from raw_data.sales_raw,
     lateral flatten(input => json_data:companies) c,        -- flatten companies
     lateral flatten(input => c.value:regions) r,           -- flatten regions
     lateral flatten(input => r.value:products) p           -- flatten products
where COMPANIES is not null;

select * from flatten_data.SALES_FLATTEN
