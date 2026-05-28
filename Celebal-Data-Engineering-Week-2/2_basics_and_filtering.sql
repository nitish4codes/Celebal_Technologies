USE ShopEase_DB;

-- SECTION A: SQL BASICS


-- Q1: Display all rows and columns from the customers table
SELECT * FROM customers;

-- Q2: Retrieve specific personal detail coordinates
SELECT first_name, last_name, city FROM customers;

-- Q3: List distinct categories available in stock
SELECT DISTINCT category FROM products;

-- Q6: Attempt constraint validation (Triggers expected check constraint failure)
-- INSERT INTO products VALUES (209, 'Invalid Price Item', 'Electronics', 'TestBrand', -50.00, 10);
-- Error Note: Prevents insertion because unit_price is constrained to values > 0.


-- SECTION B: FILTERING & OPTIMIZATION


-- Q7: Retrieve orders marked as Delivered
SELECT * FROM orders WHERE status = 'Delivered';

-- Q8: High-value electronics filtering
SELECT * FROM products WHERE category = 'Electronics' AND unit_price > 2000;

-- Q9: Maharashtra regional growth acquisition tracking for 2024
SELECT * FROM customers WHERE state = 'Maharashtra' AND join_date BETWEEN '2024-01-01' AND '2024-12-31';

-- Q10: Track non-cancelled active pipeline logs in date range
SELECT * FROM orders WHERE order_date BETWEEN '2024-08-10' AND '2024-08-25' AND status <> 'Cancelled';

-- Q12: SARGable index optimization query rewrite
SELECT * FROM customers WHERE join_date >= '2024-01-01' AND join_date <= '2024-12-31';