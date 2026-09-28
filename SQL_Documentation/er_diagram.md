                    VEHICLE RENTAL MANAGEMENT SYSTEM
                              ER DIAGRAM


┌─────────────────────┐
│      BRANCHES       │
├─────────────────────┤
│ PK branch_id        │
│ branch_name         │
│ city                │
│ state               │
│ phone               │
│ email               │
└──────────┬──────────┘
           │ 1
           │
           │ M
           ▼
┌─────────────────────┐
│     EMPLOYEES       │
├─────────────────────┤
│ PK employee_id      │
│ FK branch_id        │
│ FK manager_id       │
│ employee_name       │
│ email               │
│ phone               │
│ job_title           │
│ salary              │
│ hire_date           │
└─────────────────────┘
           │
           │ 1
           │
           │ M
           ▼
┌─────────────────────┐
│     MAINTENANCE     │
├─────────────────────┤
│ PK maintenance_id   │
│ FK vehicle_id       │
│ FK employee_id      │
│ maintenance_date    │
│ maintenance_type    │
│ description         │
│ cost                │
│ maintenance_status  │
└─────────────────────┘


┌─────────────────────┐
│ VEHICLE_CATEGORIES  │
├─────────────────────┤
│ PK category_id      │
│ category_name       │
│ description         │
│ daily_rate          │
│ weekly_rate         │
│ security_deposit    │
└──────────┬──────────┘
           │ 1
           │
           │ M
           ▼
┌─────────────────────┐
│      VEHICLES       │
├─────────────────────┤
│ PK vehicle_id       │
│ FK category_id      │
│ FK branch_id        │
│ registration_number │
│ vin_number          │
│ manufacturer        │
│ model_name          │
│ model_year          │
│ color               │
│ mileage             │
│ fuel_type           │
│ transmission_type   │
│ vehicle_status      │
│ purchase_date       │
└──────────┬──────────┘
           │ 1
           │
           │ M
           ▼
┌─────────────────────┐
│   RENTAL_BOOKINGS   │
├─────────────────────┤
│ PK booking_id       │
│ booking_reference   │
│ FK customer_id      │
│ FK vehicle_id       │
│ FK pickup_branch_id │
│ FK return_branch_id │
│ booking_date        │
│ pickup_date         │
│ expected_return_date│
│ booking_status      │
│ estimated_amount    │
└───────┬─────────────┘
        │
        │ 1
        │
        │ M
        ▼
┌─────────────────────┐
│      PAYMENTS       │
├─────────────────────┤
│ PK payment_id       │
│ FK booking_id       │
│ payment_date        │
│ amount              │
│ payment_method      │
│ payment_status      │
│ transaction_reference│
└─────────────────────┘


┌─────────────────────┐
│      CUSTOMERS      │
├─────────────────────┤
│ PK customer_id      │
│ first_name          │
│ last_name           │
│ email               │
│ phone               │
│ date_of_birth       │
│ driving_license     │
│ license_expiry_date │
│ city                │
│ address             │
│ registration_date   │
└──────────┬──────────┘
           │ 1
           │
           │ M
           ▼
     RENTAL_BOOKINGS


Relationships:

BRANCHES            1 ─────── M EMPLOYEES
BRANCHES            1 ─────── M VEHICLES
EMPLOYEES           1 ─────── M MAINTENANCE
VEHICLE_CATEGORIES  1 ─────── M VEHICLES
VEHICLES            1 ─────── M RENTAL_BOOKINGS
CUSTOMERS           1 ─────── M RENTAL_BOOKINGS
RENTAL_BOOKINGS     1 ─────── M PAYMENTS
VEHICLES            1 ─────── M MAINTENANCE

EMPLOYEES
   │
   └──── manager_id ────► EMPLOYEES
             (Self Relationship)