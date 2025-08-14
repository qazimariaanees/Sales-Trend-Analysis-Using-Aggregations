create database task_06;
use task_06;

SELECT * 
FROM online_sales_extended;
-- Example Output (first 5 rows):
-- order_id | order_date  | customer_id | product_id | quantity | amount | payment_method   | status
-- -------- | ----------- | ----------- | ---------- | -------- | ------ | ---------------- | ----------
-- O1000    | 27-02-2024  | C28         | P110       | 8        | 264    | UPI              | Delivered
-- O1001    | 25-03-2024  | C29         | P118       | 5        | 2623   | UPI              | Delivered
-- O1002    | 24-03-2024  | C4          | P104       | 6        | 3574   | Cash on Delivery | Delivered
-- O1003    | 31-03-2024  | C27         | P106       | 1        | 2147   | Cash on Delivery | Returned
-- O1004    | 13-02-2024  | C26         | P117       | 10       | 3148   | Credit Card      | Processing
-- Summary: Displays raw data before cleaning.


-- Add a new DATE column to store cleaned dates
ALTER TABLE online_sales_extended
ADD COLUMN order_date_clean DATE;


-- Convert string dates (dd-mm-yyyy) to proper DATE format
UPDATE online_sales_extended
SET order_date_clean = STR_TO_DATE(order_date, '%d-%m-%Y');
-- Example Output:
-- (No visible result —  all order_date_clean cells now contain DATE values internally as YYYY-MM-DD)
-- Summary: Converts date strings into MySQL DATE type for proper date functions.


-- Remove the old string date column
ALTER TABLE online_sales_extended DROP COLUMN order_date;

-- Rename the cleaned date column to order_date
ALTER TABLE online_sales_extended CHANGE order_date_clean order_date DATE;
-- Example Output:
-- (No visible result — table structure updated)
-- Summary: Old date column removed, clean DATE column now called order_date.

-- Display dates in dd-mm-yy format with selected columns
SELECT 
    order_id,
    DATE_FORMAT(order_date, '%d-%m-%y') AS formatted_date,
    amount
FROM online_sales_extended;
-- Example Output (first 5 rows):
-- order_id | formatted_date | amount
-- -------- | -------------- | ------
-- O1000    | 27-02-24       | 264
-- O1001    | 25-03-24       | 2623
-- O1002    | 24-03-24       | 3574
-- O1003    | 31-03-24       | 2147
-- O1004    | 13-02-24       | 3148
-- Summary: Dates are stored as DATE type but displayed in dd-mm-yy style.


-- View the full cleaned table
select * from online_sales_extended;
-- Example Output (first 5 rows):
-- order_id | order_date | customer_id | product_id | quantity | amount | payment_method   | status
-- O1000    | 2024-02-27 | C28         | P110       | 8        | 264    | UPI              | Delivered
-- O1001    | 2024-03-25 | C29         | P118       | 5        | 2623   | UPI              | Delivered
-- O1002    | 2024-03-24 | C4          | P104       | 6        | 3574   | Cash on Delivery | Delivered
-- O1003    | 2024-03-31 | C27         | P106       | 1        | 2147   | Cash on Delivery | Returned
-- O1004    | 2024-02-13 | C26         | P117       | 10       | 3148   | Credit Card      | Processing
-- Summary: Confirms that dates are in proper MySQL format (YYYY-MM-DD).


-- Calculate monthly revenue and total orders
SELECT 
    EXTRACT(YEAR FROM order_date) AS order_year,
    EXTRACT(MONTH FROM order_date) AS order_month,
    SUM(amount) AS total_revenue,
    COUNT(DISTINCT order_id) AS total_orders
FROM online_sales_extended
GROUP BY order_year, order_month
ORDER BY order_year, order_month;
-- Example Output:
-- order_year | order_month | total_revenue | total_orders
-- ---------- | ----------- | ------------- | ------------
-- 2024       | 2           | 6550          | 3
-- 2024       | 3           | 8344          | 4
-- Summary: Shows total revenue and unique order count for each month, sorted chronologically.

