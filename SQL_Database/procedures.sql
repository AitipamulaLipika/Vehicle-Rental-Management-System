use vehicle_rental_management;
-- =========================================================
-- PROCEDURE 1: DISPLAY ALL CUSTOMERS
-- =========================================================

DROP PROCEDURE IF EXISTS get_all_customers;

DELIMITER //

CREATE PROCEDURE get_all_customers()
BEGIN
    SELECT *
    FROM customers;
END //

DELIMITER ;

-- Call the procedure
CALL get_all_customers();


-- =========================================================
-- PROCEDURE 2: DISPLAY AVAILABLE VEHICLES
-- =========================================================

DROP PROCEDURE IF EXISTS get_available_vehicles;

DELIMITER //

CREATE PROCEDURE get_available_vehicles()
BEGIN
    SELECT *
    FROM vehicles
    WHERE vehicle_status = 'AVAILABLE';
END //

DELIMITER ;

-- Call the procedure
CALL get_available_vehicles();

-- =========================================================
-- PROCEDURE 3: FIND CUSTOMER BY ID
-- =========================================================

DROP PROCEDURE IF EXISTS get_customer_by_id;

DELIMITER //

CREATE PROCEDURE get_customer_by_id(
    IN p_customer_id INT
)
BEGIN
    SELECT *
    FROM customers
    WHERE customer_id = p_customer_id;
END //

DELIMITER ;

-- Call the procedure
CALL get_customer_by_id(1);