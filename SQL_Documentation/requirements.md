# 🚗 Vehicle Rental Management System

A **MySQL-based Vehicle Rental Management System** designed to manage the core operations of a vehicle rental business. The project provides a structured relational database for managing customers, vehicles, branches, employees, rental bookings, payments, and vehicle maintenance.

The project demonstrates practical implementation of **MySQL database design, SQL queries, relationships, constraints, functions, stored procedures, views, triggers, transactions, indexing, and normalization**.

---

## 📌 Project Overview

The Vehicle Rental Management System helps a rental company efficiently manage its day-to-day rental operations.

The database maintains information about:

* 🏢 Branches
* 👨‍💼 Employees
* 👤 Customers
* 🚘 Vehicle Categories
* 🚗 Vehicles
* 📋 Rental Bookings
* 💳 Payments
* 🔧 Vehicle Maintenance

The system helps track vehicle availability, customer bookings, rental payments, and vehicle maintenance records.

## ✨ Features

### 👤 Customer Management

* Add and manage customer details.
* Store driving license information.
* Maintain customer contact details.
* Search customers by ID.
* View customer rental history.

### 🚗 Vehicle Management

* Add and manage vehicles.
* Store registration and VIN details.
* Maintain vehicle category information.
* Track fuel type and transmission.
* Track vehicle mileage.
* Track vehicle availability.

### 📋 Rental Booking Management

* Create rental bookings.
* Assign vehicles to customers.
* Store pickup and return dates.
* Track booking status.
* Calculate estimated rental amounts.
* Support pickup and return branches.

### 💳 Payment Management

* Record rental payments.
* Store payment method.
* Track payment status.
* Store transaction references.
* Generate revenue reports.

### 🔧 Maintenance Management

* Record vehicle maintenance.
* Store maintenance type and description.
* Track maintenance costs.
* Track maintenance status.
* Assign maintenance work to employees.

### 🏢 Branch & Employee Management

* Manage multiple rental branches.
* Maintain employee information.
* Assign employees to branches.
* Support employee-manager relationships.

---

## 🛠️ Technologies Used

| Technology          | Purpose                                       |
| ------------------- | --------------------------------------------- |
| **MySQL 8.0+**      | Database                                      |
| **MySQL Workbench** | Database development and execution            |
| **SQL**             | Database operations and queries               |
| **Git**             | Version control                               |
| **GitHub**          | Source code hosting and project documentation |

---

## 🗄️ Database Structure

The project contains **8 main tables**.

| # | Table                | Description                                |
| - | -------------------- | ------------------------------------------ |
| 1 | `branches`           | Stores rental branch information           |
| 2 | `employees`          | Stores employee information                |
| 3 | `customers`          | Stores customer information                |
| 4 | `vehicle_categories` | Stores vehicle categories and rental rates |
| 5 | `vehicles`           | Stores vehicle details and availability    |
| 6 | `rental_bookings`    | Stores rental booking information          |
| 7 | `payments`           | Stores payment information                 |
| 8 | `maintenance`        | Stores vehicle maintenance records         |

---

## 📁 Project Structure

```text
Vehicle-Rental-Management-System/
│
├── database/
│   ├── 01_database.sql
│   ├── 02_tables.sql
│   ├── 03_insert_data.sql
│   ├── 04_queries.sql
│   ├── 05_functions.sql
│   ├── 06_procedures.sql
│   └── 07_views.sql
│
├── documentation/
│   ├── requirements.md
│   ├── database-design.md
│   └── ER_Diagram.md
│
└── README.md
```

---

## ⚙️ Installation

### Prerequisites

Make sure you have:

* MySQL Server 8.0 or above
* MySQL Workbench
* Git (optional, for GitHub)

---

## 🚀 Setup Instructions

### Step 1: Clone the Repository

```bash
git clone https://github.com/your-username/vehicle-rental-management-system.git
```

### Step 2: Open MySQL Workbench

Open **MySQL Workbench** and connect to your MySQL server.

### Step 3: Create the Database

Open:

```text
database/01_database.sql
```

Execute the script.

This creates:

```text
vehicle_rental_management
```

### Step 4: Create Tables

Execute:

```text
database/02_tables.sql
```

This creates all 8 tables and their relationships.

### Step 5: Insert Sample Data

Execute:

```text
database/03_sample_data.sql
```

This inserts sample records into the database.

### Step 6: Execute Queries

Run:

```text
database/04_queries.sql
```

This file contains SQL queries for retrieving and analyzing data.

### Step 7: Execute Functions

Run:

```text
database/05_functions.sql
```

This file contains MySQL built-in function examples and stored functions.

### Step 8: Execute Procedures

Run:

```text
database/06_procedures.sql
```

This creates stored procedures for common operations.

### Step 9: Execute Triggers

Run:

```text
database/07_triggers.sql
```

This creates database triggers for automatic actions.

---

## 💻 How to Execute SQL Files

You can execute the SQL files using **MySQL Workbench**.

1. Open MySQL Workbench.
2. Connect to your MySQL server.
3. Open the required `.sql` file.
4. Make sure the correct database is selected.
5. Click the ⚡ **Execute** button.
6. Check the output/results panel.

The recommended execution order is:

```text
01_database.sql
        ↓
02_tables.sql
        ↓
03_sample_data.sql
        ↓
04_queries.sql
        ↓
05_functions.sql
        ↓
06_procedures.sql
        ↓
07_triggers.sql
```

---

# 🔍 Sample Queries

## 1. Display All Customers

```sql
SELECT *
FROM customers;
```

## 2. Display Available Vehicles

```sql
SELECT *
FROM vehicles
WHERE vehicle_status = 'AVAILABLE';
```

## 3. Display Completed Bookings

```sql
SELECT *
FROM rental_bookings
WHERE booking_status = 'COMPLETED';
```

## 4. Find Total Customers

```sql
SELECT COUNT(*) AS total_customers
FROM customers;
```

## 5. Find Total Revenue

```sql
SELECT SUM(amount) AS total_revenue
FROM payments
WHERE payment_status = 'COMPLETED';
```

## 6. Find Average Employee Salary

```sql
SELECT AVG(salary) AS average_salary
FROM employees;
```

## 7. Display Customer Bookings

```sql
SELECT
    c.first_name,
    c.last_name,
    rb.booking_reference,
    rb.booking_status,
    rb.estimated_amount
FROM customers c
INNER JOIN rental_bookings rb
    ON c.customer_id = rb.customer_id;
```

## 8. Display Available Vehicles With Category

```sql
SELECT
    v.vehicle_id,
    v.manufacturer,
    v.model_name,
    vc.category_name,
    v.vehicle_status
FROM vehicles v
INNER JOIN vehicle_categories vc
    ON v.category_id = vc.category_id
WHERE v.vehicle_status = 'AVAILABLE';
```

---

# 🔧 Stored Procedures

The project includes simple stored procedures for commonly used operations.

### Get All Customers

```sql
CALL get_all_customers();
```

### Get Available Vehicles

```sql
CALL get_available_vehicles();
```

### Find Customer by ID

```sql
CALL get_customer_by_id(1);
```

Stored procedures help avoid writing the same SQL query repeatedly.

---

# 🧮 SQL Concepts Demonstrated

This project covers the following SQL concepts:

### Basic SQL

* `CREATE DATABASE`
* `CREATE TABLE`
* `INSERT`
* `UPDATE`
* `DELETE`
* `SELECT`

### Constraints

* Primary Key
* Foreign Key
* `UNIQUE`
* `NOT NULL`
* `DEFAULT`
* `CHECK`

### Filtering

* `WHERE`
* `AND`
* `OR`
* `NOT`
* `LIKE`
* `BETWEEN`
* `IN`
* `NOT IN`
* `IS NULL`
* `IS NOT NULL`

### Sorting & Limiting

* `ORDER BY`
* `LIMIT`
* `OFFSET`
* `DISTINCT`

### Functions

* String functions
* Numeric functions
* Date and time functions
* Aggregate functions
* Conditional functions
* NULL handling functions
* Conversion functions

### Advanced Queries

* `GROUP BY`
* `HAVING`
* `INNER JOIN`
* `LEFT JOIN`
* `RIGHT JOIN`
* Self Join
* Subqueries
* Correlated Subqueries
* `EXISTS`
* `NOT EXISTS`
* `CASE`
* `COALESCE`
* `UNION`
* `UNION ALL`

### Advanced Database Features

* Views
* Stored Functions
* Stored Procedures
* Triggers
* Transactions
* `COMMIT`
* `ROLLBACK`
* `SAVEPOINT`
* Indexing
* `EXPLAIN`
* Normalization

---

# 📈 Business Reports

The database can be used to generate reports such as:

* Total number of customers
* Total number of vehicles
* Available vehicles
* Rented vehicles
* Total bookings
* Completed bookings
* Pending bookings
* Monthly revenue
* Total payment amount
* Highest booking amount
* Lowest booking amount
* Average booking amount
* Vehicle maintenance cost
* Customer rental summary
* Branch-wise vehicle summary

---

# 🔐 Data Integrity

The database uses different constraints to maintain data accuracy.

Examples include:

```text
PRIMARY KEY
FOREIGN KEY
UNIQUE
NOT NULL
DEFAULT
CHECK
```

These constraints help prevent invalid, duplicate, or inconsistent data.

---

# 📐 Normalization

The database is designed following normalization principles.

### First Normal Form (1NF)

* Each column contains atomic values.
* No repeating groups are used.

### Second Normal Form (2NF)

* Tables are organized to avoid partial dependency.

### Third Normal Form (3NF)

* Non-key attributes depend on the primary key.
* Unnecessary duplication is reduced.

---

# 🚀 Future Enhancements

The project can be extended in the future with:

* Online customer registration.
* Web-based rental booking system.
* Customer login and authentication.
* Online payment gateway integration.
* Email and SMS booking notifications.
* Automatic vehicle availability updates.
* Advanced revenue dashboards.
* Admin dashboard.
* Mobile application.
* Integration with GPS/vehicle tracking systems.
* Automated invoice generation.
* Customer feedback and rating system.

---

# 📚 Documentation

Additional project documentation is available in the `documentation` folder.

```text
documentation/
│
├── requirements.md
├── database-design.md
└── ER_Diagram.md
```

---

# 👩‍💻 Author

**Aitipamula Lipika**

B.Tech Graduate | Java & SQL Learner

---

# ⭐ Project Purpose

This project was developed as a practical **MySQL database project** to demonstrate relational database design and SQL skills using a real-world **Vehicle Rental Management System**.

If you find this project useful, feel free to ⭐ the repository.
