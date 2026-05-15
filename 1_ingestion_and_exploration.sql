-- STEP 1: LOADING DATASET INTO A SQL DATABASE
-- The dataset was sourced from Kaggle (Superstore Sales).
-- Data was ingested using the MySQL Workbench Table Data Import Wizard.

CREATE DATABASE IF NOT EXISTS Celebal_Sales_Analysis;

USE Celebal_Sales_Analysis;
-- During ingestion, the character encoding was set to 'latin1' to ensure maximum data integrity. 
-- 9,694 rows were successfully imported.

SELECT COUNT(*) AS total_rows_ingested FROM `sample-superstore`;
-- verify that the total number of rows ingested are 9,694 as expected.


-- STEP 2: EXPLORING TABLE (SCHEMA & SAMPLE DATA)

-- View the structure of the table
DESCRIBE `sample-superstore`;

-- View the first 10 rows to verify data alignment
SELECT * FROM `sample-superstore` LIMIT 10;

