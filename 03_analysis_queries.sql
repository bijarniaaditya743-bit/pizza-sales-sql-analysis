USE pizzahut;

-- 1) Retrieve the total number of orders placed.

SELECT COUNT(order_id) as total_order
FROM orders;
    

-- 2) Calculate the total revenue generated from pizza sales.

SELECT 
	ROUND(SUM(p.price*od.quantity),2)AS total_revenue
FROM pizzas p
	JOIN order_details od
	ON p.pizza_id=od.pizza_id;


-- 3) Identify the highest-priced pizza.

SELECT 
	pt.name AS pizza_name ,p.price 
FROM pizzas p 
	JOIN pizza_types pt
	ON p.pizza_type_id=pt.pizza_type_id
ORDER BY p.price DESC
LIMIT 1;


-- 4) Identify the most common pizza size ordered.

SELECT 
	p.size ,
    SUM(od.quantity) AS total_quantity
FROM order_details od
	JOIN pizzas p
	ON od.pizza_id=p.pizza_id
GROUP BY p.size
ORDER BY total_quantity DESC
LIMIT 1;


-- 5)  Identify the most ordered pizza types along with their quantities.
SELECT 
	pt.name AS pizza_name,
    SUM(od.quantity) AS total_quantity
FROM order_details od
	JOIN pizzas p
	ON od.pizza_id=p.pizza_id
	JOIN pizza_types pt
	ON p.pizza_type_id=pt.pizza_type_id
GROUP BY pizza_name
ORDER BY total_quantity DESC 
LIMIT 1;


-- 6) Determine the distribution of orders by hour of the day.

SELECT 
	HOUR(o.time) AS order_hour,
    COUNT(od.quantity) AS total_orders
FROM orders o
	JOIN order_details od
	ON o.order_id=od.order_id
GROUP BY order_hour
ORDER BY order_hour;


-- 7) Join the relevant tables to find the category-wise distribution of pizzas.

SELECT 
	pt.category,
    sum(od.quantity) AS total_pizza
FROM order_details od
	JOIN pizzas p
	ON od.pizza_id=p.pizza_id
	JOIN pizza_types pt
	ON p.pizza_type_id=pt.pizza_type_id
GROUP BY pt.category
ORDER BY total_order DESC;


-- 8) Group the orders by date and calculate the average number of pizzas ordered per day.

SELECT
	ROUND(AVG(daily_pizza),2) AS avg_pizza_per_day
FROM(
	SELECT 
		o.date,
		sum(od.quantity) AS daily_pizza
	FROM orders o
		JOIN order_details od
		ON o.order_id=od.order_id
	GROUP BY o.date) t;
    
    
-- 9) Identify the top 3 pizzas based on revenue.

SELECT 
	pt.name AS pizza_name,
    ROUND(sum(od.quantity*p.price),2) AS total_revenue
FROM order_details od 
	JOIN pizzas p 
	ON od.pizza_id=p.pizza_id
	JOIN pizza_types pt
	ON p.pizza_type_id=pt.pizza_type_id
GROUP BY pizza_name
ORDER BY total_revenue DESC
LIMIT 3;


-- 10) Calculate the percentage contribution of each pizza type to total revenue.

SELECT
	pt.name AS pizza_name,
    ROUND(sum(od.quantity*p.price)*100/
		(SELECT
			ROUND(sum(od.quantity*p.price),2) AS TOTAL_REVENUE
		FROM order_details od
			JOIN pizzas p
			ON od.pizza_id=p.pizza_id),2) AS percentage_revenue
FROM order_details od
	JOIN pizzas p
	ON od.pizza_id=p.pizza_id
	JOIN pizza_types pt
	ON p.pizza_type_id=pt.pizza_type_id
GROUP BY pizza_name
ORDER BY percentage_revenue DESC
;


-- 11) Calculate the cumulative revenue generated over time.

SELECT *,
	sum(daily_revenue) OVER(order by date) AS running_revenue
FROM(
	SELECT
		o.date,
		sum(od.quantity*p.price) AS daily_revenue
	FROM orders o
		JOIN order_details od 
		ON o.order_id=od.order_id
		JOIN pizzas p
		ON od.pizza_id=p.pizza_id
	GROUP BY o.date
)t
ORDER BY date;


-- 12) Determine the top 3 revenue-generating pizzas for each pizza category.

SELECT *
FROM(
	SELECT
		pt.category AS category,
		pt.name AS pizza_name,
		ROUND(sum(od.quantity*p.price),2) AS revenue,
    
		DENSE_RANK() OVER(
			PARTITION BY pt.category
			ORDER BY sum(od.quantity*p.price) DESC
		) AS revenue_rank
    
	FROM order_details od
		JOIN pizzas p
		ON od.pizza_id=p.pizza_id
		JOIN pizza_types pt
		ON p.pizza_type_id=pt.pizza_type_id
	GROUP BY category,pizza_name
)t
WHERE revenue_rank<=3
ORDER BY category,revenue_rank;
