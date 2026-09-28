/* =========================================================
   3. INSERT SAMPLE DATA
   ========================================================= */


/* ---------------------------------------------------------
   BRANCHES - 10 RECORDS
   --------------------------------------------------------- */

INSERT INTO branches
(branch_name, city, state, phone, email)
VALUES
('Hyderabad Central','Hyderabad','Telangana','9876500001','hydcentral@vrent.com'),
('Banjara Hills','Hyderabad','Telangana','9876500002','banjarahills@vrent.com'),
('Secunderabad','Secunderabad','Telangana','9876500003','secunderabad@vrent.com'),
('Kukatpally','Hyderabad','Telangana','9876500004','kukatpally@vrent.com'),
('Gachibowli','Hyderabad','Telangana','9876500005','gachibowli@vrent.com'),
('Warangal','Warangal','Telangana','9876500006','warangal@vrent.com'),
('Vijayawada','Vijayawada','Andhra Pradesh','9876500007','vijayawada@vrent.com'),
('Bengaluru Central','Bengaluru','Karnataka','9876500008','blrcentral@vrent.com'),
('Chennai Central','Chennai','Tamil Nadu','9876500009','chennai@vrent.com'),
('Pune Central','Pune','Maharashtra','9876500010','pune@vrent.com');


/* ---------------------------------------------------------
   EMPLOYEES - 10 RECORDS
   --------------------------------------------------------- */

INSERT INTO employees
(branch_id, manager_id, employee_name, email, phone,
 job_title, salary, hire_date)
VALUES
(1,NULL,'Rajesh Kumar','rajesh@vrent.com','9000000001',
 'Branch Manager',55000,'2022-01-10'),

(1,1,'Anil Sharma','anil@vrent.com','9000000002',
 'Rental Executive',35000,'2023-03-15'),

(2,NULL,'Priya Reddy','priya@vrent.com','9000000003',
 'Branch Manager',58000,'2021-06-20'),

(2,3,'Sneha Rao','sneha@vrent.com','9000000004',
 'Rental Executive',34000,'2023-07-12'),

(3,NULL,'Kiran Patel','kiran@vrent.com','9000000005',
 'Branch Manager',56000,'2022-09-18'),

(4,NULL,'Arjun Mehta','arjun@vrent.com','9000000006',
 'Branch Manager',57000,'2022-11-05'),

(5,NULL,'Divya Singh','divya@vrent.com','9000000007',
 'Branch Manager',59000,'2021-12-01'),

(6,NULL,'Ravi Teja','raviteja@vrent.com','9000000008',
 'Branch Manager',50000,'2023-01-25'),

(7,NULL,'Meena Devi','meena@vrent.com','9000000009',
 'Branch Manager',52000,'2022-05-14'),

(8,NULL,'Vikram Rao','vikram@vrent.com','9000000010',
 'Branch Manager',60000,'2021-08-30');


/* ---------------------------------------------------------
   CUSTOMERS - 10 RECORDS
   --------------------------------------------------------- */

INSERT INTO customers
(first_name,last_name,email,phone,date_of_birth,
 driving_license,license_expiry_date,city,address)
VALUES
('Amit','Sharma','amit@gmail.com','9100000001',
 '1995-04-12','DL10001','2030-04-12','Hyderabad','Madhapur'),

('Priya','Reddy','priya@gmail.com','9100000002',
 '1997-08-20','DL10002','2031-08-20','Hyderabad','Kukatpally'),

('Rahul','Verma','rahul@gmail.com','9100000003',
 '1994-02-10','DL10003','2029-02-10','Bengaluru','Whitefield'),

('Sneha','Patel','sneha@gmail.com','9100000004',
 '1998-11-05','DL10004','2032-11-05','Pune','Baner'),

('Arjun','Kumar','arjun@gmail.com','9100000005',
 '1996-06-18','DL10005','2030-06-18','Chennai','T Nagar'),

('Neha','Singh','neha@gmail.com','9100000006',
 '1995-09-22','DL10006','2030-09-22','Hyderabad','Gachibowli'),

('Karthik','Rao','karthik@gmail.com','9100000007',
 '1993-12-30','DL10007','2028-12-30','Warangal','Hanamkonda'),

('Divya','Reddy','divya@gmail.com','9100000008',
 '1999-01-15','DL10008','2033-01-15','Vijayawada','Benz Circle'),

('Suresh','Naidu','suresh@gmail.com','9100000009',
 '1992-05-25','DL10009','2028-05-25','Hyderabad','Secunderabad'),

('Pooja','Mehta','pooja@gmail.com','9100000010',
 '1997-10-10','DL10010','2031-10-10','Pune','Hinjewadi');


/* ---------------------------------------------------------
   VEHICLE CATEGORIES - 10 RECORDS
   --------------------------------------------------------- */

INSERT INTO vehicle_categories
(category_name,description,daily_rate,weekly_rate,security_deposit)
VALUES
('Hatchback','Small and economical cars',1500,8500,5000),
('Sedan','Comfortable family cars',2200,12000,7000),
('SUV','Sport utility vehicles',3500,19000,10000),
('Luxury Sedan','Premium luxury cars',5000,28000,15000),
('Luxury SUV','Premium SUV vehicles',6500,35000,20000),
('Compact SUV','Compact utility vehicles',3000,16500,9000),
('Electric','Electric vehicles',2800,15000,8000),
('Premium Hatchback','Premium hatchback cars',2000,11000,6000),
('MUV','Multi utility vehicles',3800,21000,12000),
('Convertible','Open roof premium cars',7000,39000,25000);


/* ---------------------------------------------------------
   VEHICLES - 10 RECORDS
   --------------------------------------------------------- */

INSERT INTO vehicles
(category_id,branch_id,registration_number,vin_number,
 manufacturer,model_name,model_year,color,mileage,
 fuel_type,transmission_type,vehicle_status,purchase_date)
VALUES
(1,1,'TS01AB1001','VIN100001','Maruti','Swift',2023,
 'White',18000,'PETROL','MANUAL','AVAILABLE','2023-02-10'),

(2,1,'TS01AB1002','VIN100002','Honda','City',2022,
 'Black',25000,'PETROL','AUTOMATIC','RENTED','2022-04-15'),

(3,2,'TS01AB1003','VIN100003','Hyundai','Creta',2023,
 'Blue',16000,'DIESEL','AUTOMATIC','AVAILABLE','2023-05-20'),

(4,2,'TS01AB1004','VIN100004','Mercedes','C-Class',2022,
 'Silver',22000,'PETROL','AUTOMATIC','AVAILABLE','2022-06-18'),

(5,3,'TS01AB1005','VIN100005','BMW','X5',2023,
 'Black',14000,'DIESEL','AUTOMATIC','AVAILABLE','2023-07-25'),

(6,4,'TS01AB1006','VIN100006','Kia','Seltos',2024,
 'Red',10000,'PETROL','AUTOMATIC','AVAILABLE','2024-01-12'),

(7,5,'TS01AB1007','VIN100007','Tata','Nexon EV',2024,
 'Green',8000,'ELECTRIC','AUTOMATIC','AVAILABLE','2024-03-15'),

(8,6,'TS01AB1008','VIN100008','Hyundai','i20',2023,
 'Grey',19000,'PETROL','MANUAL','AVAILABLE','2023-04-20'),

(9,7,'TS01AB1009','VIN100009','Toyota','Innova',2022,
 'White',30000,'DIESEL','MANUAL','AVAILABLE','2022-08-10'),

(10,8,'TS01AB1010','VIN100010','BMW','Z4',2023,
 'Blue',12000,'PETROL','AUTOMATIC','MAINTENANCE','2023-09-05');


/* ---------------------------------------------------------
   RENTAL BOOKINGS - 20 RECORDS
   --------------------------------------------------------- */

INSERT INTO rental_bookings
(booking_reference,customer_id,vehicle_id,
 pickup_branch_id,return_branch_id,
 pickup_date,expected_return_date,
 booking_status,estimated_amount)
VALUES

('BK1001',1,1,1,1,'2026-01-05','2026-01-08','COMPLETED',4500),

('BK1002',2,2,1,1,'2026-01-10','2026-01-13','COMPLETED',6600),

('BK1003',3,3,2,2,'2026-01-15','2026-01-18','COMPLETED',10500),

('BK1004',4,4,2,2,'2026-01-20','2026-01-22','COMPLETED',10000),

('BK1005',5,5,3,3,'2026-02-02','2026-02-05','COMPLETED',19500),

('BK1006',6,6,4,4,'2026-02-05','2026-02-08','COMPLETED',9000),

('BK1007',7,7,5,5,'2026-02-10','2026-02-13','COMPLETED',8400),

('BK1008',8,8,6,6,'2026-02-15','2026-02-18','COMPLETED',6000),

('BK1009',9,9,7,7,'2026-02-20','2026-02-23','COMPLETED',11400),

('BK1010',10,10,8,8,'2026-03-01','2026-03-04','CANCELLED',21000),

('BK1011',1,3,2,2,'2026-03-05','2026-03-08','COMPLETED',10500),

('BK1012',2,1,1,1,'2026-03-10','2026-03-12','COMPLETED',3000),

('BK1013',3,6,4,4,'2026-03-15','2026-03-18','COMPLETED',9000),

('BK1014',4,7,5,5,'2026-03-20','2026-03-23','COMPLETED',8400),

('BK1015',5,8,6,6,'2026-04-01','2026-04-04','CONFIRMED',6000),

('BK1016',6,9,7,7,'2026-04-05','2026-04-08','CONFIRMED',11400),

('BK1017',7,1,1,1,'2026-04-10','2026-04-12','PENDING',3000),

('BK1018',8,2,1,1,'2026-04-15','2026-04-18','PENDING',6600),

('BK1019',9,3,2,2,'2026-04-20','2026-04-23','ACTIVE',10500),

('BK1020',10,4,2,2,'2026-04-25','2026-04-28','CONFIRMED',15000);


/* ---------------------------------------------------------
   PAYMENTS - 20 RECORDS
   --------------------------------------------------------- */

INSERT INTO payments
(booking_id,amount,payment_method,payment_status,transaction_reference)
VALUES

(1,4500,'UPI','COMPLETED','TXN1001'),
(2,6600,'CARD','COMPLETED','TXN1002'),
(3,10500,'UPI','COMPLETED','TXN1003'),
(4,10000,'CARD','COMPLETED','TXN1004'),
(5,19500,'NET_BANKING','COMPLETED','TXN1005'),
(6,9000,'UPI','COMPLETED','TXN1006'),
(7,8400,'CASH','COMPLETED','TXN1007'),
(8,6000,'CARD','COMPLETED','TXN1008'),
(9,11400,'UPI','COMPLETED','TXN1009'),
(10,5000,'CARD','REFUNDED','TXN1010'),
(11,10500,'UPI','COMPLETED','TXN1011'),
(12,3000,'CASH','COMPLETED','TXN1012'),
(13,9000,'CARD','COMPLETED','TXN1013'),
(14,8400,'UPI','COMPLETED','TXN1014'),
(15,3000,'CARD','COMPLETED','TXN1015'),
(16,5000,'UPI','PENDING','TXN1016'),
(17,3000,'CASH','PENDING','TXN1017'),
(18,6600,'CARD','PENDING','TXN1018'),
(19,10500,'UPI','COMPLETED','TXN1019'),
(20,15000,'CARD','COMPLETED','TXN1020');


/* ---------------------------------------------------------
   MAINTENANCE - 10 RECORDS
   --------------------------------------------------------- */

INSERT INTO maintenance
(vehicle_id,employee_id,maintenance_date,
 maintenance_type,description,cost,maintenance_status)
VALUES

(1,2,'2026-01-12','Oil Change',
 'Engine oil and filter replacement',2500,'COMPLETED'),

(2,2,'2026-01-20','Brake Service',
 'Brake pad replacement',4500,'COMPLETED'),

(3,4,'2026-02-05','Tyre Replacement',
 'Four tyres replaced',18000,'COMPLETED'),

(4,4,'2026-02-15','General Service',
 'Full vehicle inspection',6000,'COMPLETED'),

(5,5,'2026-02-20','Oil Change',
 'Engine oil replacement',3000,'COMPLETED'),

(6,6,'2026-03-01','AC Service',
 'Air conditioning service',3500,'COMPLETED'),

(7,7,'2026-03-10','Battery Service',
 'Battery inspection',2500,'COMPLETED'),

(8,8,'2026-03-15','General Service',
 'Routine maintenance',5000,'COMPLETED'),

(9,9,'2026-03-20','Brake Service',
 'Brake inspection and repair',7000,'COMPLETED'),

(10,10,'2026-04-01','Major Service',
 'Major vehicle service',25000,'IN_PROGRESS');

