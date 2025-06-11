select * from [dbo].[pizza_sales]

select sum(total_price) [Total Revenue] from pizza_sales

Select SUM(total_price) / COUNT(DISTINCT order_id) [Average Order Value] from pizza_sales

Select SUM(quantity) [Total Pizza Sold] from pizza_sales

Select COUNT(DISTINCT order_id) [Total Order] from pizza_sales

Select CAST(CAST(SUM(quantity) AS DECIMAL(10,2)) / 
CAST(COUNT(DISTINCT order_id) AS DECIMAL(10,2)) AS DECIMAL(10,2)) [Average Pizzas Per Order] from pizza_sales

--DAILY TREND
SELECT DATENAME(DW, order_date) [Order day], COUNT(DISTINCT order_id) [Total orders]
FROM pizza_sales
GROUP BY DATENAME(DW, order_date)

--HOURLY TRED
SELECT DATEPART(HOUR, order_time) [Order Hours], COUNT(DISTINCT order_id) [Total orders]
FROM pizza_sales
GROUP BY DATEPART(HOUR, order_time)
ORDER BY DATEPART(HOUR, order_time)

SELECT pizza_category, SUM(total_price) * 100 / 
(SELECT SUM(total_price) FROM pizza_sales WHERE MONTH(order_date) = 1) [PCT]
FROM pizza_sales 
WHERE MONTH(order_date) = 1
GROUP BY pizza_category

SELECT pizza_size, CAST(SUM(total_price) * 100 / 
(SELECT SUM(total_price) FROM pizza_sales WHERE DATEPART(QUARTER, order_date) = 1) AS DECIMAL(10,2)) [PCT]
FROM pizza_sales 
WHERE DATEPART(QUARTER, order_date) = 1
GROUP BY pizza_size
ORDER BY PCT DESC

SELECT pizza_category, SUM(quantity) [Total Pizza]
FROM pizza_sales
GROUP BY pizza_category

SELECT TOP 5 pizza_name, SUM(quantity) [Total Pizzas]
FROM pizza_sales
GROUP BY pizza_name
ORDER BY SUM(quantity) DESC

SELECT TOP 5 pizza_name, SUM(quantity) [Total Pizzas]
FROM pizza_sales
GROUP BY pizza_name
ORDER BY SUM(quantity) 




