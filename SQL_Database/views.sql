/* =========================================================
   14. VIEWS
   ========================================================= */


/* View 1: Vehicle details */

CREATE OR REPLACE VIEW vehicle_details_view AS
SELECT
    v.vehicle_id,
    v.registration_number,
    v.manufacturer,
    v.model_name,
    v.model_year,
    vc.category_name,
    vc.daily_rate,
    br.branch_name,
    br.city,
    v.vehicle_status
FROM vehicles v
JOIN vehicle_categories vc
ON v.category_id = vc.category_id
JOIN branches br
ON v.branch_id = br.branch_id;


/* Test View */

SELECT *
FROM vehicle_details_view;


/* View 2: Booking details */

CREATE OR REPLACE VIEW booking_details_view AS
SELECT
    b.booking_id,
    b.booking_reference,
    CONCAT(c.first_name,' ',c.last_name) AS customer_name,
    c.phone,
    v.manufacturer,
    v.model_name,
    b.pickup_date,
    b.expected_return_date,
    b.booking_status,
    b.estimated_amount
FROM rental_bookings b
JOIN customers c
ON b.customer_id = c.customer_id
JOIN vehicles v
ON b.vehicle_id = v.vehicle_id;


/* Test View */

SELECT *
FROM booking_details_view;


/* View 3: Revenue report */

CREATE OR REPLACE VIEW revenue_report_view AS
SELECT
    DATE(payment_date) AS payment_date,
    payment_method,
    SUM(amount) AS total_revenue
FROM payments
WHERE payment_status = 'COMPLETED'
GROUP BY DATE(payment_date), payment_method;


/* Test View */

SELECT *
FROM revenue_report_view;

