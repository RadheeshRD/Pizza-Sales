-- 1.Retrieve the total number of orders placed.
select count(*) as Total_orders from orders;

-- 2.Calculate the total revenue generated from pizza sales.

SELECT ROUND(SUM(o.quantity * p.price)) AS Total_revenue FROM
order_details o LEFT JOIN pizzas p ON o.pizza_id = p.pizza_id;
    
-- 3. Identify the highest-priced pizza.   

select pt.name,max(p.price) as hi from pizza_types pt join pizzas p on pt.pizza_type_id =p.pizza_type_id
group by pt.name order by hi desc limit 1; 

-- 4.Identify the most common pizza size ordered.

select p.size,count(od.order_deatils_id) as total_order from pizzas p join order_details od on
p.pizza_id=od.pizza_id group by p.size order by total_order desc limit 1 ;

-- 5.List the top 5 most ordered pizza types along with their quantities.

select pt.name,sum(od.quantity) as quantities from pizzas p join pizza_types pt on p.pizza_type_id=pt.pizza_type_id 
join order_details od on od.pizza_id=p.pizza_id group by pt.name order by quantities desc limit 5;

-- 6.Join the necessary tables to find the total quantity of each pizza category ordered.

select pt.category,sum(od.quantity) from pizza_types pt join pizzas p on pt.pizza_type_id=p.pizza_type_id 
join order_details od on od.pizza_id=p.pizza_id group by pt.category;

-- 7.Determine the distribution of orders by hour of the day.

select hour(order_time) as hours ,count(order_id) from orders group by hours;

-- 8.Join relevant tables to find the category-wise distribution of pizzas.

select category, count(name) from pizza_types group by category;

-- 9.Group the orders by date and calculate the average number of pizzas ordered per day.

select round (avg(quantity),0) as avg_pizzas_per_day from
(select orders.order_date, sum(order_details.quantity) as quantity
from orders join order_details
on orders.order_id = order_details.order_id
group by orders.order_date) as order_quantity ;


-- 10.Determine the top 3 most ordered pizza types based on revenue.

select pizza_types.name,
sum(order_details.quantity * pizzas.price) as revenue
from pizza_types join pizzas
on pizzas.pizza_type_id = pizza_types.pizza_type_id
join order_details
on order_details.pizza_id = pizzas.pizza_id
group by pizza_types.name order by revenue desc limit 3;


-- 10.Calculate the percentage contribution of each pizza type to total revenue.

SELECT 
    pizza_types.category,
    ROUND(
        SUM(order_details.quantity * pizzas.price) * 100.0 /
        (
            SELECT SUM(order_details.quantity * pizzas.price)
            FROM order_details
            JOIN pizzas 
                ON pizzas.pizza_id = order_details.pizza_id
        ),
        2
    ) AS revenue_percentage
FROM pizza_types
JOIN pizzas
    ON pizza_types.pizza_type_id = pizzas.pizza_type_id
JOIN order_details
    ON order_details.pizza_id = pizzas.pizza_id
GROUP BY pizza_types.category
ORDER BY revenue_percentage DESC;

-- 11.Analyze the cumulative revenue generated over time. 

SELECT 
    order_date,
    SUM(revenue) OVER (ORDER BY order_date) AS cum_revenue
FROM
(
    SELECT 
        orders.order_date,
        SUM(order_details.quantity * pizzas.price) AS revenue
    FROM order_details
    JOIN pizzas
        ON order_details.pizza_id = pizzas.pizza_id
    JOIN orders
        ON orders.order_id = order_details.order_id
    GROUP BY orders.order_date
) AS sales;

-- 12.Determine the top 3 most ordered pizza types based on revenue for each pizza category.

SELECT *
FROM
(
    SELECT 
        category,
        name,
        revenue,
        RANK() OVER (
            PARTITION BY category
            ORDER BY revenue DESC
        ) AS rn
    FROM
    (
        SELECT 
            pizza_types.category,
            pizza_types.name,
            SUM(order_details.quantity * pizzas.price) AS revenue
        FROM pizza_types
        JOIN pizzas
            ON pizza_types.pizza_type_id = pizzas.pizza_type_id
        JOIN order_details
            ON order_details.pizza_id = pizzas.pizza_id
        GROUP BY 
            pizza_types.category,
            pizza_types.name
    ) AS a
) AS b
WHERE rn <= 3;



