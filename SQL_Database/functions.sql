=========================================================
-- 1. STRING FUNCTIONS
-- =========================================================

-- 1. CONCAT()
-- Combines first name and last name into a single customer name.
SELECT CONCAT(first_name, ' ', last_name) AS customer_name
FROM customers;


-- 2. UPPER()
-- Converts customer first names into uppercase.
SELECT UPPER(first_name) AS customer_name
FROM customers;


-- 3. LOWER()
-- Converts customer email addresses into lowercase.
SELECT LOWER(email) AS email
FROM customers;


-- 4. LENGTH()
-- Returns the length of the first name in bytes.
SELECT first_name, LENGTH(first_name) AS name_length
FROM customers;


-- 5. CHAR_LENGTH()
-- Returns the number of characters in the first name.
SELECT first_name, CHAR_LENGTH(first_name) AS name_length
FROM customers;

=========================================================
-- 2. NUMERIC FUNCTIONS
-- =========================================================

-- 11. ROUND()
-- Rounds the estimated rental amount to the nearest integer.
SELECT estimated_amount,
       ROUND(estimated_amount) AS rounded_amount
FROM rental_bookings;


-- 12. CEIL()
-- Rounds the rental amount upward to the next integer.
SELECT estimated_amount,
       CEIL(estimated_amount) AS rounded_up
FROM rental_bookings;


-- 13. FLOOR()
-- Rounds the rental amount downward to the previous integer.
SELECT estimated_amount,
       FLOOR(estimated_amount) AS rounded_down
FROM rental_bookings;

=========================================================
-- 3. DATE AND TIME FUNCTIONS
-- =========================================================

-- 18. CURRENT_DATE()
-- Returns the current date.
SELECT CURRENT_DATE() AS today;


-- 19. CURRENT_TIME()
-- Returns the current time.
SELECT CURRENT_TIME() AS current_time;

=========================================================
-- 4. AGGREGATE FUNCTIONS
-- =========================================================

-- 26. COUNT()
-- Counts the total number of customers.
SELECT COUNT(*) AS total_customers
FROM customers;


-- 27. SUM()
-- Calculates the total amount received from completed payments.
SELECT SUM(amount) AS total_revenue
FROM payments
WHERE payment_status = 'COMPLETED';

=========================================================
-- 6. NULL HANDLING FUNCTIONS
-- =========================================================

-- 33. IFNULL()
-- Replaces a NULL manager ID with 0.
SELECT
    employee_name,
    IFNULL(manager_id, 0) AS manager_id
FROM employees;


-- 34. COALESCE()
-- Displays 'No Manager' when an employee does not have a manager.
SELECT
    e.employee_name,
    COALESCE(m.employee_name, 'No Manager') AS manager_name
FROM employees e
LEFT JOIN employees m
ON e.manager_id = m.employee_id;

