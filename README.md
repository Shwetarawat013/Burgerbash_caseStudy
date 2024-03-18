# Burgerbash_caseStudy
The Burgerbash is the burger selling company and the owner want to know the preferences of their customer.The burgerbash Contained the tables.
customer_orders :  Customer orders table contain the record of the customers like order_id, customer_id, 	burger_id, 	exclusions,extras, Order_time.
runner_orders   :  runner orders table contain the record of  order delivered by them order_id, runner_id, pickup_time, distance, duration, cancellation.
burger_runners  :  Burger runners order contain the record of the orders recevied on different dates.
burger_names    : The burger_name  containing the burger which burgerbash having in thier MENU.

We will analyse the burgerbash data in this burgerbash menu. We will start by creating the relevant tables and the database. Following the creation of the table, we will use SQL queries to address the business problem and respond to the owner's inquiries:
**For Creating Database:**
  Create database burgerbash;

  Creating and Inserting Data into Tables;
  **Table1**
  Create table customer_orders(
order_id int,
customer_id int,
burger_id int,
exclusions varchar(50),
extras varchar(78),
order_time timestamp);

Insert into customer_orders 
VALUES ('1', '101', '1', 'NULL', 'NULL','2021-01-01 18:05:02'),
('2', '101', '1', 'NULL', 'NULL', '2021-01-01 19:00:52'),
('3', '102', '1', 'NULL', 'NULL', '2021-01-02 23:51:23'),
('3', '102','2','NULL', 'NULL','2021-01-02 23:51:23'),
('4', '103', '1', '4', 'NULL','2021-01-04 13:23:46'),
('4', '103', '1', '4', 'NULL', '2021-01-04 13:23:46'),
('4', '103', '2', '4', 'NULL', '2021-01-04 13:23:46'),
('5', '104', '1', 'Null', '1', '2021-01-08 21:00:29'),
('6', '101', '2', 'Null','Null', '2021-01-08 21:03:13'),
('7', '105', '2', 'Null', '1', '2021-01-08 21:20:29'),
('8', '102', '1', 'Null', 'Null', '2021-01-09 23:54:33'),
('9', '103', '1', '4', '1,5', '2021-01-10 11:22:59'),
('10', '104', '1', 'Null', 'Null', '2021-01-11 18:34:49'),
('10', '104', '1', '2,6', '1,4', '2021-01-11 18:34:49');

**Table2:**
Create table runner_orders(
order_id int,
runner_id int,
pickup_time timestamp,
distance varchar(50),
duration varchar(45),
cancellation varchar(80));

INSERT INTO runner_orders 
VALUES (1,1,'2021-01-01 18:15:34','20km','32 minutes',NULL);
INSERT INTO runner_orders VALUES (2,1,'2021-01-01 19:10:54','20km','27 minutes',NULL);
INSERT INTO runner_orders VALUES (3,1,'2021-01-03 00:12:37','13.4km','20 mins',NULL);
INSERT INTO runner_orders VALUES (4,2,'2021-01-04 13:53:03','23.4','40',NULL);
INSERT INTO runner_orders VALUES (5,3,'2021-01-08 21:10:57','10','15',NULL);
INSERT INTO runner_orders VALUES (6,3,NULL,NULL,NULL,'Restaurant Cancellation');
INSERT INTO runner_orders VALUES (7,2,'2021-01-08 21:30:45','25km','25mins',NULL);
INSERT INTO runner_orders VALUES (8,2,'2021-01-10 00:15:02','23.4 km','15 minute',NULL);
INSERT INTO runner_orders VALUES (9,2,NULL,NULL,NULL,'Customer Cancellation');
INSERT INTO runner_orders VALUES (10,1,'2021-01-11 18:50:20','10km','10minutes',NULL);

**Table3:**
Create table burger_runner(
runner_id int,
registration_date date);

INSERT INTO burger_runner
VALUES ('1','2021-01-01'),
	   ('2','2021-01-03'),
	   ('3','2021-01-08'),
	   ('4','2021-01-15');

**Table4:**
Create table burger_names(
burger_id int,
burger_name varchar(54));

Insert into burger_names
Values ('1', 'Meatlovers'),
('2', 'Vegetarian');

**BurgerBash_Case Study;**
**How many burgers were ordered?**
Select Count(order_id) as total_orders
from runner_orders;

**How many unique customer orders were made?**
Select count(distinct order_ID) as unique_customer 
from runner_orders;

**How many successful orders were delivered by each runner?**
Select runner_id, Count( distinct order_id) as sucessfull_orders
from runner_orders
WHERE cancellation IS NULL
group by runner_id;

**How many of each type of burger was delivered?** 
SELECT p.burger_name, COUNT(c.burger_id) AS delivered_burger_count
FROM customer_orders AS c
JOIN runner_orders AS r
ON c.order_id = r.order_id
JOIN burger_names AS p
ON c.burger_id = p.burger_id
WHERE r.distance  IS NOT NULL
GROUP BY p.burger_name;

**How many Vegetarian and Meatlovers were ordered by each customer?**
SELECT c.customer_id, p.burger_name, COUNT(p.burger_name) AS order_count
FROM customer_orders AS c
JOIN burger_names AS p
 ON c.burger_id= p.burger_id
GROUP BY c.customer_id, p.burger_name
ORDER BY c.customer_id;  

**What was the maximum number of burgers delivered in a single order?**
WITH burger_count  AS(
 SELECT c.order_id, COUNT(c.burger_id) AS burger_per_order
 FROM customer_orders AS c
 JOIN runner_orders AS r
  ON c.order_id = r.order_id
 WHERE r.distance IS NOT NULL
 GROUP BY c.order_id)
 
SELECT MAX(burger_per_order) AS burger_count
FROM burger_count;

**NOTE: FILES IS ATTACHED FOR YOUR REFERENCE**


