# Vehicle Rental Management System

## Database Design

## 1. Database Information

**Database Name:** `vehicle_rental_management`

**Database Type:** Relational Database

**Database Management System:** MySQL 8.0+

The database is designed to manage customers, vehicles, branches, employees, rental bookings, payments, and vehicle maintenance.

---

# 2. Database Tables

The system contains 8 main tables:

| No. | Table Name           | Purpose                                    |
| --- | -------------------- | ------------------------------------------ |
| 1   | `branches`           | Stores rental branch information           |
| 2   | `employees`          | Stores employee information                |
| 3   | `customers`          | Stores customer information                |
| 4   | `vehicle_categories` | Stores vehicle categories and rental rates |
| 5   | `vehicles`           | Stores vehicle information                 |
| 6   | `rental_bookings`    | Stores vehicle rental bookings             |
| 7   | `payments`           | Stores payment information                 |
| 8   | `maintenance`        | Stores vehicle maintenance records         |

---

# 3. Table Design

## 3.1 Branches

### Table Name: `branches`

**Purpose:** Stores information about different rental branches.

| Column        | Data Type    | Constraints               | Description           |
| ------------- | ------------ | ------------------------- | --------------------- |
| `branch_id`   | INT          | PK, AUTO_INCREMENT        | Unique branch ID      |
| `branch_name` | VARCHAR(100) | NOT NULL                  | Name of the branch    |
| `city`        | VARCHAR(50)  | NOT NULL                  | Branch city           |
| `state`       | VARCHAR(50)  | NOT NULL                  | Branch state          |
| `phone`       | VARCHAR(15)  | UNIQUE                    | Branch contact number |
| `email`       | VARCHAR(100) | UNIQUE                    | Branch email          |
| `created_at`  | TIMESTAMP    | DEFAULT CURRENT_TIMESTAMP | Branch creation time  |

### Primary Key

```text
branch_id
```

---

# 3.2 Employees

### Table Name: `employees`

**Purpose:** Stores employee details and their branch assignments.

| Column          | Data Type     | Constraints        | Description             |
| --------------- | ------------- | ------------------ | ----------------------- |
| `employee_id`   | INT           | PK, AUTO_INCREMENT | Unique employee ID      |
| `branch_id`     | INT           | FK, NOT NULL       | Employee's branch       |
| `manager_id`    | INT           | FK, NULL           | Manager of the employee |
| `employee_name` | VARCHAR(100)  | NOT NULL           | Employee name           |
| `email`         | VARCHAR(100)  | UNIQUE, NOT NULL   | Employee email          |
| `phone`         | VARCHAR(15)   | UNIQUE             | Employee phone          |
| `job_title`     | VARCHAR(50)   | NOT NULL           | Employee job title      |
| `salary`        | DECIMAL(10,2) | NOT NULL, CHECK    | Employee salary         |
| `hire_date`     | DATE          | NOT NULL           | Date of joining         |

### Primary Key

```text
employee_id
```

### Foreign Keys

```text
branch_id → branches(branch_id)

manager_id → employees(employee_id)
```

The `manager_id` creates a **self-referencing relationship** because an employee can manage other employees.

---

# 3.3 Customers

### Table Name: `customers`

**Purpose:** Stores customer personal and driving license information.

| Column                | Data Type    | Constraints        | Description                |
| --------------------- | ------------ | ------------------ | -------------------------- |
| `customer_id`         | INT          | PK, AUTO_INCREMENT | Unique customer ID         |
| `first_name`          | VARCHAR(50)  | NOT NULL           | Customer first name        |
| `last_name`           | VARCHAR(50)  | NOT NULL           | Customer last name         |
| `email`               | VARCHAR(100) | UNIQUE, NOT NULL   | Customer email             |
| `phone`               | VARCHAR(15)  | UNIQUE, NOT NULL   | Customer phone             |
| `date_of_birth`       | DATE         | NOT NULL           | Customer date of birth     |
| `driving_license`     | VARCHAR(30)  | UNIQUE, NOT NULL   | Driving license number     |
| `license_expiry_date` | DATE         | NOT NULL           | License expiry date        |
| `city`                | VARCHAR(50)  | NOT NULL           | Customer city              |
| `address`             | VARCHAR(200) | NULL               | Customer address           |
| `registration_date`   | DATE         | DEFAULT            | Customer registration date |

### Primary Key

```text
customer_id
```

### Unique Constraints

```text
email
phone
driving_license
```

---

# 3.4 Vehicle Categories

### Table Name: `vehicle_categories`

**Purpose:** Stores vehicle category and rental pricing information.

| Column             | Data Type     | Constraints        | Description          |
| ------------------ | ------------- | ------------------ | -------------------- |
| `category_id`      | INT           | PK, AUTO_INCREMENT | Unique category ID   |
| `category_name`    | VARCHAR(50)   | UNIQUE, NOT NULL   | Category name        |
| `description`      | VARCHAR(200)  | NULL               | Category description |
| `daily_rate`       | DECIMAL(10,2) | NOT NULL, CHECK    | Daily rental rate    |
| `weekly_rate`      | DECIMAL(10,2) | NOT NULL, CHECK    | Weekly rental rate   |
| `security_deposit` | DECIMAL(10,2) | DEFAULT 0, CHECK   | Security deposit     |

### Primary Key

```text
category_id
```

---

# 3.5 Vehicles

### Table Name: `vehicles`

**Purpose:** Stores information about individual rental vehicles.

| Column                | Data Type     | Constraints        | Description                   |
| --------------------- | ------------- | ------------------ | ----------------------------- |
| `vehicle_id`          | INT           | PK, AUTO_INCREMENT | Unique vehicle ID             |
| `category_id`         | INT           | FK, NOT NULL       | Vehicle category              |
| `branch_id`           | INT           | FK, NOT NULL       | Current branch                |
| `registration_number` | VARCHAR(20)   | UNIQUE, NOT NULL   | Vehicle registration number   |
| `vin_number`          | VARCHAR(50)   | UNIQUE, NOT NULL   | Vehicle identification number |
| `manufacturer`        | VARCHAR(50)   | NOT NULL           | Vehicle manufacturer          |
| `model_name`          | VARCHAR(50)   | NOT NULL           | Vehicle model                 |
| `model_year`          | YEAR          | NOT NULL           | Manufacturing year            |
| `color`               | VARCHAR(30)   | NULL               | Vehicle color                 |
| `mileage`             | DECIMAL(10,2) | DEFAULT 0, CHECK   | Vehicle mileage               |
| `fuel_type`           | VARCHAR(20)   | NOT NULL, CHECK    | Fuel type                     |
| `transmission_type`   | VARCHAR(20)   | NOT NULL, CHECK    | Transmission type             |
| `vehicle_status`      | VARCHAR(20)   | DEFAULT            | Current vehicle status        |
| `purchase_date`       | DATE          | NULL               | Vehicle purchase date         |

### Primary Key

```text
vehicle_id
```

### Foreign Keys

```text
category_id → vehicle_categories(category_id)

branch_id → branches(branch_id)
```

### Vehicle Status

```text
AVAILABLE
RENTED
MAINTENANCE
RESERVED
INACTIVE
```

### Fuel Types

```text
PETROL
DIESEL
HYBRID
ELECTRIC
```

### Transmission Types

```text
MANUAL
AUTOMATIC
```

---

# 3.6 Rental Bookings

### Table Name: `rental_bookings`

**Purpose:** Stores customer vehicle rental booking information.

| Column                 | Data Type     | Constraints               | Description                 |
| ---------------------- | ------------- | ------------------------- | --------------------------- |
| `booking_id`           | INT           | PK, AUTO_INCREMENT        | Unique booking ID           |
| `booking_reference`    | VARCHAR(20)   | UNIQUE, NOT NULL          | Booking reference           |
| `customer_id`          | INT           | FK, NOT NULL              | Customer making the booking |
| `vehicle_id`           | INT           | FK, NOT NULL              | Rented vehicle              |
| `pickup_branch_id`     | INT           | FK, NOT NULL              | Vehicle pickup branch       |
| `return_branch_id`     | INT           | FK, NOT NULL              | Vehicle return branch       |
| `booking_date`         | DATETIME      | DEFAULT CURRENT_TIMESTAMP | Booking creation date       |
| `pickup_date`          | DATE          | NOT NULL                  | Rental start date           |
| `expected_return_date` | DATE          | NOT NULL                  | Expected return date        |
| `booking_status`       | VARCHAR(20)   | DEFAULT                   | Booking status              |
| `estimated_amount`     | DECIMAL(10,2) | NOT NULL, CHECK           | Estimated rental amount     |

### Primary Key

```text
booking_id
```

### Foreign Keys

```text
customer_id → customers(customer_id)

vehicle_id → vehicles(vehicle_id)

pickup_branch_id → branches(branch_id)

return_branch_id → branches(branch_id)
```

### Booking Status

```text
PENDING
CONFIRMED
ACTIVE
COMPLETED
CANCELLED
```

---

# 3.7 Payments

### Table Name: `payments`

**Purpose:** Stores payment information associated with rental bookings.

| Column                  | Data Type     | Constraints               | Description           |
| ----------------------- | ------------- | ------------------------- | --------------------- |
| `payment_id`            | INT           | PK, AUTO_INCREMENT        | Unique payment ID     |
| `booking_id`            | INT           | FK, NOT NULL              | Related booking       |
| `payment_date`          | DATETIME      | DEFAULT CURRENT_TIMESTAMP | Payment date          |
| `amount`                | DECIMAL(10,2) | NOT NULL, CHECK           | Payment amount        |
| `payment_method`        | VARCHAR(20)   | NOT NULL, CHECK           | Payment method        |
| `payment_status`        | VARCHAR(20)   | DEFAULT, CHECK            | Payment status        |
| `transaction_reference` | VARCHAR(50)   | UNIQUE                    | Transaction reference |

### Primary Key

```text
payment_id
```

### Foreign Key

```text
booking_id → rental_bookings(booking_id)
```

### Payment Methods

```text
CASH
CARD
UPI
NET_BANKING
```

### Payment Status

```text
PENDING
COMPLETED
FAILED
REFUNDED
```

---

# 3.8 Maintenance

### Table Name: `maintenance`

**Purpose:** Stores vehicle maintenance and service records.

| Column               | Data Type     | Constraints        | Description                   |
| -------------------- | ------------- | ------------------ | ----------------------------- |
| `maintenance_id`     | INT           | PK, AUTO_INCREMENT | Unique maintenance ID         |
| `vehicle_id`         | INT           | FK, NOT NULL       | Vehicle being serviced        |
| `employee_id`        | INT           | FK, NULL           | Employee handling maintenance |
| `maintenance_date`   | DATE          | NOT NULL           | Maintenance date              |
| `maintenance_type`   | VARCHAR(50)   | NOT NULL           | Type of maintenance           |
| `description`        | VARCHAR(200)  | NULL               | Maintenance details           |
| `cost`               | DECIMAL(10,2) | NOT NULL, CHECK    | Maintenance cost              |
| `maintenance_status` | VARCHAR(20)   | DEFAULT, CHECK     | Maintenance status            |

### Primary Key

```text
maintenance_id
```

### Foreign Keys

```text
vehicle_id → vehicles(vehicle_id)

employee_id → employees(employee_id)
```

### Maintenance Status

```text
SCHEDULED
IN_PROGRESS
COMPLETED
```

---

# 4. Entity Relationships

## 4.1 Branches → Employees

**Relationship:** 1 : M

One branch can have many employees.

```text
BRANCHES
    1
    │
    │
    M
EMPLOYEES
```

---

## 4.2 Branches → Vehicles

**Relationship:** 1 : M

One branch can have many vehicles.

```text
BRANCHES
    1
    │
    │
    M
VEHICLES
```

---

## 4.3 Vehicle Categories → Vehicles

**Relationship:** 1 : M

One vehicle category can contain many vehicles.

```text
VEHICLE_CATEGORIES
        1
        │
        │
        M
     VEHICLES
```

---

## 4.4 Customers → Rental Bookings

**Relationship:** 1 : M

One customer can make multiple rental bookings.

```text
CUSTOMERS
    1
    │
    │
    M
RENTAL_BOOKINGS
```

---

## 4.5 Vehicles → Rental Bookings

**Relationship:** 1 : M

One vehicle can be used in many bookings over time.

```text
VEHICLES
    1
    │
    │
    M
RENTAL_BOOKINGS
```

---

## 4.6 Rental Bookings → Payments

**Relationship:** 1 : M

One booking can have multiple payment records.

```text
RENTAL_BOOKINGS
       1
       │
       │
       M
    PAYMENTS
```

---

## 4.7 Vehicles → Maintenance

**Relationship:** 1 : M

One vehicle can have multiple maintenance records.

```text
VEHICLES
    1
    │
    │
    M
MAINTENANCE
```

---

## 4.8 Employees → Maintenance

**Relationship:** 1 : M

One employee can handle multiple maintenance records.

```text
EMPLOYEES
    1
    │
    │
    M
MAINTENANCE
```

---

## 4.9 Employees → Employees

**Relationship:** Self Relationship

An employee can manage other employees.

```text
EMPLOYEES
    │
    │ manager_id
    └──────────────► EMPLOYEES
```

---

## 4.10 Branches → Rental Bookings

The `rental_bookings` table has two relationships with `branches`.

### Pickup Branch

```text
BRANCHES
    1
    │
    │ pickup_branch_id
    M
RENTAL_BOOKINGS
```

### Return Branch

```text
BRANCHES
    1
    │
    │ return_branch_id
    M
RENTAL_BOOKINGS
```

---

# 5. Relationship Summary

| Parent Table         | Child Table       | Foreign Key        | Relationship      |
| -------------------- | ----------------- | ------------------ | ----------------- |
| `branches`           | `employees`       | `branch_id`        | 1 : M             |
| `branches`           | `vehicles`        | `branch_id`        | 1 : M             |
| `branches`           | `rental_bookings` | `pickup_branch_id` | 1 : M             |
| `branches`           | `rental_bookings` | `return_branch_id` | 1 : M             |
| `employees`          | `employees`       | `manager_id`       | Self Relationship |
| `employees`          | `maintenance`     | `employee_id`      | 1 : M             |
| `customers`          | `rental_bookings` | `customer_id`      | 1 : M             |
| `vehicle_categories` | `vehicles`        | `category_id`      | 1 : M             |
| `vehicles`           | `rental_bookings` | `vehicle_id`       | 1 : M             |
| `vehicles`           | `maintenance`     | `vehicle_id`       | 1 : M             |
| `rental_bookings`    | `payments`        | `booking_id`       | 1 : M             |

---

# 6. Primary Key Summary

| Table                | Primary Key      |
| -------------------- | ---------------- |
| `branches`           | `branch_id`      |
| `employees`          | `employee_id`    |
| `customers`          | `customer_id`    |
| `vehicle_categories` | `category_id`    |
| `vehicles`           | `vehicle_id`     |
| `rental_bookings`    | `booking_id`     |
| `payments`           | `payment_id`     |
| `maintenance`        | `maintenance_id` |

---

# 7. Foreign Key Summary

| Table             | Foreign Key        | References                        |
| ----------------- | ------------------ | --------------------------------- |
| `employees`       | `branch_id`        | `branches(branch_id)`             |
| `employees`       | `manager_id`       | `employees(employee_id)`          |
| `vehicles`        | `category_id`      | `vehicle_categories(category_id)` |
| `vehicles`        | `branch_id`        | `branches(branch_id)`             |
| `rental_bookings` | `customer_id`      | `customers(customer_id)`          |
| `rental_bookings` | `vehicle_id`       | `vehicles(vehicle_id)`            |
| `rental_bookings` | `pickup_branch_id` | `branches(branch_id)`             |
| `rental_bookings` | `return_branch_id` | `branches(branch_id)`             |
| `payments`        | `booking_id`       | `rental_bookings(booking_id)`     |
| `maintenance`     | `vehicle_id`       | `vehicles(vehicle_id)`            |
| `maintenance`     | `employee_id`      | `employees(employee_id)`          |

---

# 8. Important Constraints

The database uses the following constraints to maintain data integrity:

### PRIMARY KEY

Uniquely identifies each record.

### FOREIGN KEY

Maintains relationships between tables.

### UNIQUE

Prevents duplicate values in important columns such as:

* Email
* Phone
* Driving license
* Registration number
* VIN number
* Booking reference

### NOT NULL

Ensures required information is provided.

### DEFAULT

Automatically provides values when no value is supplied.

Examples:

```text
CURRENT_TIMESTAMP
0
AVAILABLE
PENDING
```

### CHECK

Ensures that values satisfy specific conditions.

Examples:

```text
salary > 0
daily_rate > 0
amount > 0
cost >= 0
mileage >= 0
```

---

# 9. Database Design Summary

The Vehicle Rental Management System follows a relational database structure where each table represents a specific business entity.

The database is designed to minimize data duplication and maintain data consistency through primary keys, foreign keys, unique constraints, check constraints, and normalization.

The main flow of the database is:

```text
Customer
    ↓
Rental Booking
    ↓
Vehicle
    ↓
Payment

Vehicle
    ↓
Maintenance

Branch
    ↓
Employees
    ↓
Maintenance

Vehicle Category
    ↓
Vehicles
```

This design provides a structured foundation for managing vehicle rental operations and supports SQL queries, reports, stored procedures, functions, triggers, transactions, and database optimization.
