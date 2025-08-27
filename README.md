# Snowflake-MiniProject-2
Unstructured Data - Netsed JSON + Internal Stage + Copy Command 
Project Overview
In this mini project, I will:

Load sales data from a JSON file into a raw table in Snowflake using the internal stage.

Perform JSON flattening on the raw table and create a flatten table 

Perform data analysis on the flatten data

Objectives
Learn how to work with Snowflake's internal stages for file storage.

Use the COPY INTO command to load unstructured data into the Snowflake table.

Perform Netsed JSON Flattening in snowflake.

Set up raw and flatten tables in Snowflake for analytics purposes.

Tools/Technologies Used
Snowflake: Cloud-based data warehouse

Snowflake Web UI: SQL execution environment

JSON File: Sample Sales data

 

High Level Step-by-Step Implementation
Create a Database & Schema

Database : SALES_DATA

Schema : RAW_DATA

Schema : FLATTEN_DATA

Create Raw Table in the RAW_DATA schema

Table : 

Database: SALES_DATA

Schema: RAW_DATA

Name: SALES_RAW 

Table structure

JSON_DATA VARIANT

Create flatten table in the FLATTEN_DATA schema

Table Name : 

Database: SALES_DATA

Schema: FLATTEN_DATA

Name: SALES_FLATTEN 

Table structure

COMPANIES STRING

SALES_PERIOD STRING

TOTAL_REVENUE FLOAT

TOTAL_UNITS_SOLD FLOAT

REGIONS STRING

TOTAL_SALES FLOAT

PRODUCTS STRING

UNITS_SOLD FLOAT

REVENUE FLOAT



Upload the JSON File to an Internal Stage

Create an Internal Stage in the RAW_DATA schema

Database: SALES_DATA

Schema: RAW_DATA

Name: SALES_STAGE

Upload the sales json data file in the internal stage

List the file in the internal stage




Load Data from the Stage into the Raw Table

To load the raw sales data into the SALES_RAW table, use the COPY INTO command

 
Perform JSON flattening and insert data into the flatten table

Extract the required columns from the raw table and load into the flatten table by flattening the JSON data. Here we need to use the LATERAL FLATTEN functionality of snowflake

 

