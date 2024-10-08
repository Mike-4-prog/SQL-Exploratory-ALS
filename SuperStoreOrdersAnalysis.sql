
--- overview of supestore dataset
SELECT
COUNT(order_id) AS Total_orders,
COUNT(DISTINCT country) AS Total_countries,
COUNT(DISTINCT product_name) AS Total_prodcuts,
COUNT(DISTINCT category) AS Total_categories,
COUNT(DISTINCT sub_category) AS Total_subcategories,
COUNT(DISTINCT year) AS Total_years,
SUM(sales) AS Total_sales,
SUM(quantity) AS Total_quantity_sold,
AVG(profit) AS Avg_profit,
AVG(discount) AS Total_discount
FROM dbo.SuperStoreOrders;
--- Sales performance Analysis---
SELECT TOP 10
product_name,
category,
SUM(sales) AS Total_sales,
SUM(quantity) AS Total_quantity_sold
FROM dbo.SuperStoreOrders
GROUP BY
product_name, category
ORDER BY
SUM(sales) DESC;
--- Sales Trends over the years---
SELECT
year,
SUM(sales) AS Total_sales_year
FROM dbo.SuperStoreOrders
GROUP BY year
ORDER BY SUM(sales) DESC;
--- Customer segmentation based on purchasing behaviour---
SELECT
segment,
COUNT(DISTINCT customer_name) AS Total_customers,
SUM(sales) AS Total_sales
FROM dbo.SuperStoreOrders
GROUP BY segment
ORDER BY SUM(sales) DESC;
---shipping and order analysis---
SELECT
ship_mode,
AVG(shipping_cost) AS Avg_shipping_cost,
AVG(profit) AS Avg_profit
FROM dbo.SuperStoreOrders
GROUP BY ship_mode
ORDER BY AVG(profit);
---Time analysis---
SELECT
ship_mode,
AVG(DATEDIFF(DAY, TRY_CAST( order_date AS DATE),TRY_CAST( ship_date AS DATE))) AS Avg_time_gap
FROM dbo.SuperStoreOrders
GROUP BY ship_mode
--- profitability and cost analysis---
SELECT
product_name,
category,
sub_category,
AVG(profit) AS Avg_profit,
AVG(discount) AS Avg_discount
FROM dbo.SuperStoreOrders
GROUP BY
product_name,
category,
sub_category
ORDER BY AVG(profit) DESC;
---Global sales and quantity of product overview---
SELECT
country,
SUM(sales) AS Total_sales,
SUM(quantity) AS Total_quantity
FROM dbo.SuperStoreOrders
GROUP BY country
ORDER BY SUM(sales) DESC;
---Most sold product per country---
SELECT
country,
product_name,
SUM(quantity) AS Total_quantity_sold,
SUM(sales) AS Total_sales
FROM dbo.SuperStoreOrders
GROUP BY 
product_name,
country
ORDER BY SUM(sales) DESC;
---state level category analysis and exploration
SELECT
state,
product_name,
category,
SUM(quantity) AS Total_quantity_sold
FROM dbo.SuperStoreOrders
GROUP BY product_name, category,state
ORDER BY SUM(quantity) DESC;
---Regional subcategory analysis---
SELECT
region,
sub_category,
SUM(quantity) AS Total_quantity_sold
FROM dbo.SuperStoreOrders
GROUP BY region, sub_category
ORDER BY SUM(quantity) DESC;