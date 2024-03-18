BurgerBash_Case Study;
/*How many burgers were ordered?*/
Select Count(order_id) as total_orders
from runner_orders;

/* How many unique customer orders were made*/
Select count(distinct order_ID) as unique_customer 
from runner_orders;

/*How many successful orders were delivered by each runner*/
Select runner_id, Count( distinct order_id) as sucessfull_orders
from runner_orders
WHERE cancellation IS NULL
group by runner_id;

/*How many of each type of burger was delivered*/
SELECT p.burger_name, COUNT(c.burger_id) AS delivered_burger_count
FROM customer_orders AS c
JOIN runner_orders AS r
ON c.order_id = r.order_id
JOIN burger_names AS p
ON c.burger_id = p.burger_id
WHERE r.distance  IS NOT NULL
GROUP BY p.burger_name;

/*How many Vegetarian and Meatlovers were ordered by each customer*/
SELECT c.customer_id, p.burger_name, COUNT(p.burger_name) AS order_count
FROM customer_orders AS c
JOIN burger_names AS p
 ON c.burger_id= p.burger_id
GROUP BY c.customer_id, p.burger_name
ORDER BY c.customer_id;  

/*What was the maximum number of burgers delivered in a single order*/
WITH burger_count  AS
(
 SELECT c.order_id, COUNT(c.burger_id) AS burger_per_order
 FROM customer_orders AS c
 JOIN runner_orders AS r
  ON c.order_id = r.order_id
 WHERE r.distance != 0
 GROUP BY c.order_id
)
SELECT MAX(burger_per_order) AS burger_count
FROM burger_count;



