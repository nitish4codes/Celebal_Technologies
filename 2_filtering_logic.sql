-- STEP 3: APPLYING WHERE FILTERS (Region, Category, Sales)
USE Celebal_Sales_Analysis;

-- Filtering for high-value sales in the Technology category
SELECT `Order ID`, Customer_Name, Product_Name, Sales 
FROM `sample-superstore` 
WHERE Category = 'Technology' AND Sales > 1000;

-- Filtering orders from the South region
SELECT * FROM `sample-superstore` 
WHERE Region = 'South';

-- Filtering for orders made in a specific year (Example: 2017)
SELECT COUNT(`Order ID`) AS Orders_2017 
FROM `sample-superstore` 
WHERE `Order Date` LIKE '%2017%';