use vehicle_rental_management;
/* =========================================================
   2. CREATE TABLES
   ========================================================= */


/* ---------------------------------------------------------
   TABLE 1: BRANCHES
   --------------------------------------------------------- */

CREATE TABLE branches (
    branch_id INT AUTO_INCREMENT PRIMARY KEY,
    branch_name VARCHAR(100) NOT NULL,
    city VARCHAR(50) NOT NULL,
    state VARCHAR(50) NOT NULL,
    phone VARCHAR(15) UNIQUE,
    email VARCHAR(100) UNIQUE,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);


/* ---------------------------------------------------------
   TABLE 2: EMPLOYEES
   --------------------------------------------------------- */

CREATE TABLE employees (
    employee_id INT AUTO_INCREMENT PRIMARY KEY,
    branch_id INT NOT NULL,
    manager_id INT NULL,
    employee_name VARCHAR(100) NOT NULL,
    email VARCHAR(100) NOT NULL UNIQUE,
    phone VARCHAR(15) UNIQUE,
    job_title VARCHAR(50) NOT NULL,
    salary DECIMAL(10,2) NOT NULL,
    hire_date DATE NOT NULL,

    CONSTRAINT chk_employee_salary
        CHECK (salary > 0),

    CONSTRAINT fk_employee_branch
        FOREIGN KEY (branch_id)
        REFERENCES branches(branch_id),

    CONSTRAINT fk_employee_manager
        FOREIGN KEY (manager_id)
        REFERENCES employees(employee_id)
);


/* ---------------------------------------------------------
   TABLE 3: CUSTOMERS
   --------------------------------------------------------- */

CREATE TABLE customers (
    customer_id INT AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    email VARCHAR(100) NOT NULL UNIQUE,
    phone VARCHAR(15) NOT NULL UNIQUE,
    date_of_birth DATE NOT NULL,
    driving_license VARCHAR(30) NOT NULL UNIQUE,
    license_expiry_date DATE NOT NULL,
    city VARCHAR(50) NOT NULL,
    address VARCHAR(200),
    registration_date DATE DEFAULT (CURRENT_DATE),

    CONSTRAINT chk_license_expiry
        CHECK (license_expiry_date > date_of_birth)
);


/* ---------------------------------------------------------
   TABLE 4: VEHICLE CATEGORIES
   --------------------------------------------------------- */

CREATE TABLE vehicle_categories (
    category_id INT AUTO_INCREMENT PRIMARY KEY,
    category_name VARCHAR(50) NOT NULL UNIQUE,
    description VARCHAR(200),
    daily_rate DECIMAL(10,2) NOT NULL,
    weekly_rate DECIMAL(10,2) NOT NULL,
    security_deposit DECIMAL(10,2) DEFAULT 0,

    CONSTRAINT chk_daily_rate
        CHECK (daily_rate > 0),

    CONSTRAINT chk_weekly_rate
        CHECK (weekly_rate > 0),

    CONSTRAINT chk_security_deposit
        CHECK (security_deposit >= 0)
);


/* ---------------------------------------------------------
   TABLE 5: VEHICLES
   --------------------------------------------------------- */

CREATE TABLE vehicles (
    vehicle_id INT AUTO_INCREMENT PRIMARY KEY,
    category_id INT NOT NULL,
    branch_id INT NOT NULL,
    registration_number VARCHAR(20) NOT NULL UNIQUE,
    vin_number VARCHAR(50) NOT NULL UNIQUE,
    manufacturer VARCHAR(50) NOT NULL,
    model_name VARCHAR(50) NOT NULL,
    model_year YEAR NOT NULL,
    color VARCHAR(30),
    mileage DECIMAL(10,2) DEFAULT 0,
    fuel_type VARCHAR(20) NOT NULL,
    transmission_type VARCHAR(20) NOT NULL,
    vehicle_status VARCHAR(20) DEFAULT 'AVAILABLE',
    purchase_date DATE,

    CONSTRAINT chk_mileage
        CHECK (mileage >= 0),

    CONSTRAINT chk_fuel_type
        CHECK (fuel_type IN
        ('PETROL','DIESEL','HYBRID','ELECTRIC')),

    CONSTRAINT chk_transmission
        CHECK (transmission_type IN
        ('MANUAL','AUTOMATIC')),

    CONSTRAINT chk_vehicle_status
        CHECK (vehicle_status IN
        ('AVAILABLE','RENTED','MAINTENANCE','RESERVED','INACTIVE')),

    CONSTRAINT fk_vehicle_category
        FOREIGN KEY (category_id)
        REFERENCES vehicle_categories(category_id),

    CONSTRAINT fk_vehicle_branch
        FOREIGN KEY (branch_id)
        REFERENCES branches(branch_id)
);


/* ---------------------------------------------------------
   TABLE 6: RENTAL BOOKINGS
   --------------------------------------------------------- */

CREATE TABLE rental_bookings (
    booking_id INT AUTO_INCREMENT PRIMARY KEY,
    booking_reference VARCHAR(20) NOT NULL UNIQUE,
    customer_id INT NOT NULL,
    vehicle_id INT NOT NULL,
    pickup_branch_id INT NOT NULL,
    return_branch_id INT NOT NULL,
    booking_date DATETIME DEFAULT CURRENT_TIMESTAMP,
    pickup_date DATE NOT NULL,
    expected_return_date DATE NOT NULL,
    booking_status VARCHAR(20) DEFAULT 'PENDING',
    estimated_amount DECIMAL(10,2) NOT NULL,

    CONSTRAINT chk_booking_dates
        CHECK (expected_return_date >= pickup_date),

    CONSTRAINT chk_booking_amount
        CHECK (estimated_amount >= 0),

    CONSTRAINT chk_booking_status
        CHECK (booking_status IN
        ('PENDING','CONFIRMED','ACTIVE','COMPLETED','CANCELLED')),

    CONSTRAINT fk_booking_customer
        FOREIGN KEY (customer_id)
        REFERENCES customers(customer_id),

    CONSTRAINT fk_booking_vehicle
        FOREIGN KEY (vehicle_id)
        REFERENCES vehicles(vehicle_id),

    CONSTRAINT fk_booking_pickup_branch
        FOREIGN KEY (pickup_branch_id)
        REFERENCES branches(branch_id),

    CONSTRAINT fk_booking_return_branch
        FOREIGN KEY (return_branch_id)
        REFERENCES branches(branch_id)
);


/* ---------------------------------------------------------
   TABLE 7: PAYMENTS
   --------------------------------------------------------- */

CREATE TABLE payments (
    payment_id INT AUTO_INCREMENT PRIMARY KEY,
    booking_id INT NOT NULL,
    payment_date DATETIME DEFAULT CURRENT_TIMESTAMP,
    amount DECIMAL(10,2) NOT NULL,
    payment_method VARCHAR(20) NOT NULL,
    payment_status VARCHAR(20) DEFAULT 'PENDING',
    transaction_reference VARCHAR(50) UNIQUE,

    CONSTRAINT chk_payment_amount
        CHECK (amount > 0),

    CONSTRAINT chk_payment_method
        CHECK (payment_method IN
        ('CASH','CARD','UPI','NET_BANKING')),

    CONSTRAINT chk_payment_status
        CHECK (payment_status IN
        ('PENDING','COMPLETED','FAILED','REFUNDED')),

    CONSTRAINT fk_payment_booking
        FOREIGN KEY (booking_id)
        REFERENCES rental_bookings(booking_id)
);


/* ---------------------------------------------------------
   TABLE 8: MAINTENANCE
   --------------------------------------------------------- */

CREATE TABLE maintenance (
    maintenance_id INT AUTO_INCREMENT PRIMARY KEY,
    vehicle_id INT NOT NULL,
    employee_id INT NULL,
    maintenance_date DATE NOT NULL,
    maintenance_type VARCHAR(50) NOT NULL,
    description VARCHAR(200),
    cost DECIMAL(10,2) NOT NULL,
    maintenance_status VARCHAR(20) DEFAULT 'COMPLETED',

    CONSTRAINT chk_maintenance_cost
        CHECK (cost >= 0),

    CONSTRAINT chk_maintenance_status
        CHECK (maintenance_status IN
        ('SCHEDULED','IN_PROGRESS','COMPLETED')),

    CONSTRAINT fk_maintenance_vehicle
        FOREIGN KEY (vehicle_id)
        REFERENCES vehicles(vehicle_id),

    CONSTRAINT fk_maintenance_employee
        FOREIGN KEY (employee_id)
        REFERENCES employees(employee_id)
);
show tables;
