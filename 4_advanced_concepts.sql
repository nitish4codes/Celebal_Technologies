USE ShopEase_DB;


-- SECTION E: ADVANCED LOGICAL SCHEMAS & ATOMICITY


-- Q24: Item catalog value categorization tier index matrix using CASE
SELECT product_name, unit_price,
       CASE 
           WHEN unit_price < 1000 THEN 'Budget'
           WHEN unit_price BETWEEN 1000 AND 3000 THEN 'Mid-Range'
           ELSE 'Premium'
       END AS price_tier
FROM products;

-- Q25: Row-level evaluation counting pipeline status arrays in a single line
SELECT 
    SUM(CASE WHEN status = 'Delivered' THEN 1 ELSE 0 END) AS Delivered_Count,
    SUM(CASE WHEN status <> 'Delivered' THEN 1 ELSE 0 END) AS Not_Delivered_Count
FROM orders;

-- Q27: Secure Multi-Table Atomic Transaction Blueprint
START TRANSACTION;

-- 1. Register transaction root data details
INSERT INTO orders (order_id, customer_id, order_date, status, total_amount)
VALUES (1011, 102, CURDATE(), 'Pending', 1598.00);

-- 2. Link items associated with transaction record entries
INSERT INTO order_items (item_id, order_id, product_id, quantity, unit_price, discount_pct) VALUES 
(5016, 1011, 206, 1, 1299.00, 0),
(5017, 1011, 208, 1, 599.00, 0);

-- 3. Adjust active stock levels to prevent inventory mismatches
UPDATE products SET stock_qty = stock_qty - 1 WHERE product_id = 206;
UPDATE products SET stock_qty = stock_qty - 1 WHERE product_id = 208;

-- 4. Complete safe validation check routine step
COMMIT;