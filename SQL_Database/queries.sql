/* =========================================================
   4. BASIC SELECT QUERIES
   ========================================================= */


/* 1. Display all customers */

SELECT *
FROM customers;


/* 2. Display all vehicles */

SELECT *
FROM vehicles;


/* 3. Display selected columns */

SELECT first_name, last_name, city
FROM customers;


/* 4. DISTINCT cities */

SELECT DISTINCT city
FROM customers;


/* 5. Available vehicles */

SELECT *
FROM vehicles
WHERE vehicle_status = 'AVAILABLE';


/* 6. Vehicles with mileage below 20000 */

SELECT *
FROM vehicles
WHERE mileage < 20000;


/* 7. Customers from Hyderabad */

SELECT *
FROM customers
WHERE city = 'Hyderabad';


/* 8. Customers whose name starts with A */

SELECT *
FROM customers
WHERE first_name LIKE 'A%';


/* 9. Customers whose name contains 'a' */

SELECT *
FROM customers
WHERE first_name LIKE '%a%';


/* 10. Vehicles with mileage between 10000 and 20000 */

SELECT *
FROM vehicles
WHERE mileage BETWEEN 10000 AND 20000;


/* 11. Vehicles with selected fuel types */

SELECT *
FROM vehicles
WHERE fuel_type IN ('PETROL','ELECTRIC');


/* 12. Vehicles excluding diesel */

SELECT *
FROM vehicles
WHERE fuel_type NOT IN ('DIESEL');


/* 13. Employees with salary above 50000 */

SELECT employee_name, salary
FROM employees
WHERE salary > 50000;


/* 14. Sort vehicles by mileage */

SELECT *
FROM vehicles
ORDER BY mileage DESC;


/* 15. Top 5 vehicles by mileage */

SELECT *
FROM vehicles
ORDER BY mileage DESC
LIMIT 5;


/* 16. LIMIT with OFFSET */

SELECT *
FROM vehicles
ORDER BY vehicle_id
LIMIT 5 OFFSET 2;


/* 17. IS NULL */

SELECT *
FROM employees
WHERE manager_id IS NULL;


/* 18. IS NOT NULL */

SELECT *
FROM employees
WHERE manager_id IS NOT NULL;


/* 19. AND condition */

SELECT *
FROM vehicles
WHERE fuel_type = 'PETROL'
AND transmission_type = 'AUTOMATIC';


/* 20. OR condition */

SELECT *
FROM customers
WHERE city = 'Hyderabad'
OR city = 'Pune';


/* =========================================================
   5. AGGREGATE FUNCTIONS
   ========================================================= */


/* 21. Total customers */

SELECT COUNT(*) AS total_customers
FROM customers;


/* 22. Total vehicles */

SELECT COUNT(*) AS total_vehicles
FROM vehicles;


/* 23. Average vehicle mileage */

SELECT AVG(mileage) AS average_mileage
FROM vehicles;


/* 24. Highest vehicle mileage */

SELECT MAX(mileage) AS highest_mileage
FROM vehicles;


/* 25. Lowest vehicle mileage */

SELECT MIN(mileage) AS lowest_mileage
FROM vehicles;


/* 26. Total revenue */

SELECT SUM(amount) AS total_revenue
FROM payments
WHERE payment_status = 'COMPLETED';


/* =========================================================
   6. GROUP BY AND HAVING
   ========================================================= */


/* 27. Number of vehicles by fuel type */

SELECT fuel_type, COUNT(*) AS total_vehicles
FROM vehicles
GROUP BY fuel_type;


/* 28. Number of bookings by status */

SELECT booking_status, COUNT(*) AS total_bookings
FROM rental_bookings
GROUP BY booking_status;


/* 29. Average salary by job title */

SELECT job_title, AVG(salary) AS average_salary
FROM employees
GROUP BY job_title;


/* 30. Customers with more than one booking */

SELECT customer_id, COUNT(*) AS booking_count
FROM rental_bookings
GROUP BY customer_id
HAVING COUNT(*) > 1;


/* =========================================================
   7. JOINS
   ========================================================= */


/* 31. INNER JOIN customers and bookings */

SELECT
    c.customer_id,
    CONCAT(c.first_name,' ',c.last_name) AS customer_name,
    b.booking_reference,
    b.booking_status
FROM customers c
INNER JOIN rental_bookings b
ON c.customer_id = b.customer_id;


/* 32. INNER JOIN vehicles and categories */

SELECT
    v.vehicle_id,
    v.manufacturer,
    v.model_name,
    vc.category_name,
    vc.daily_rate
FROM vehicles v
INNER JOIN vehicle_categories vc
ON v.category_id = vc.category_id;


/* 33. Multiple table JOIN */

SELECT
    b.booking_reference,
    CONCAT(c.first_name,' ',c.last_name) AS customer_name,
    v.manufacturer,
    v.model_name,
    b.estimated_amount
FROM rental_bookings b
INNER JOIN customers c
ON b.customer_id = c.customer_id
INNER JOIN vehicles v
ON b.vehicle_id = v.vehicle_id;


/* 34. LEFT JOIN */

SELECT
    c.customer_id,
    CONCAT(c.first_name,' ',c.last_name) AS customer_name,
    b.booking_reference
FROM customers c
LEFT JOIN rental_bookings b
ON c.customer_id = b.customer_id;


/* 35. RIGHT JOIN */

SELECT
    b.booking_reference,
    v.manufacturer,
    v.model_name
FROM rental_bookings b
RIGHT JOIN vehicles v
ON b.vehicle_id = v.vehicle_id;


/* 36. SELF JOIN - employees and managers */

SELECT
    e.employee_name AS employee,
    m.employee_name AS manager
FROM employees e
LEFT JOIN employees m
ON e.manager_id = m.employee_id;


/* =========================================================
   8. SUBQUERIES
   ========================================================= */


/* 37. Vehicles with mileage above average */

SELECT *
FROM vehicles
WHERE mileage >
(
    SELECT AVG(mileage)
    FROM vehicles
);


/* 38. Employees earning above average salary */

SELECT employee_name, salary
FROM employees
WHERE salary >
(
    SELECT AVG(salary)
    FROM employees
);


/* 39. Vehicle with highest mileage */

SELECT *
FROM vehicles
WHERE mileage =
(
    SELECT MAX(mileage)
    FROM vehicles
);


/* 40. Second highest salary */

SELECT MAX(salary) AS second_highest_salary
FROM employees
WHERE salary <
(
    SELECT MAX(salary)
    FROM employees
);


/* 41. Customers who have bookings */

SELECT *
FROM customers
WHERE customer_id IN
(
    SELECT customer_id
    FROM rental_bookings
);


/* 42. Customers who have no bookings */

SELECT *
FROM customers c
WHERE NOT EXISTS
(
    SELECT 1
    FROM rental_bookings b
    WHERE b.customer_id = c.customer_id
);
