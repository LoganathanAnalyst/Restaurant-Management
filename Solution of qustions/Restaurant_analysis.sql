-- Hi all, I am Loganathan.
-- This project contains SQL-based analysis performed on a Restaurant Management dataset.
-- The database includes two main tables: `menu_items` and `order_details`.
-- These tables contain information about menu categories, pricing, order history, 
-- and customer purchasing behavior.

-- In this project, I have solved multiple real-world business questions covering:
-- viewing and exploring tables, aggregations, date analysis, category-wise breakdown,
-- JOIN operations, subqueries, and spending analysis.
--
-- Each SQL query is structured clearly to help understand menu trends,
-- customer ordering patterns, popular dishes, category-level performance,
-- and revenue insights

create database restaurant_db;
use restaurant_db;

-- Objective 1

-- 1. View the menu_items table.
select * from menu_items;

-- 2. Find the number of items on the menu.
 select count(*) FROM menu_items;
 
-- 3. What are the least and most expensive items on the menu?
SELECT * FROM menu_items
ORDER BY price DESC;

-- 4. How many Italian dishes are on the menu?
SELECT count(*) as Italian_dish FROM menu_items
WHERE category= "Italian";

-- 5 . What are the least and most expensive Italian dishes on the menu?
SELECT MAX(price) as Costly ,MIN(price) as budget
FROM  menu_items
WHERE category = "Italian"
ORDER BY price DESC;

-- 6. How many dishes are in each category?
select * from menu_items;
SELECT category ,count(menu_item_id) as Num_Dishes
FROM menu_items
group by category ;


-- 7. What is the average dish price within each category

SELECT category ,item_name,AVG(price) as AVG_PRICE
FROM menu_items
group by category ;

-- OBJECTIVE 2
-- 1. View the order_details table.

SELECT * FROM order_details;

-- 2. What is the date range of the table?
SELECT max(order_date) ,MIN(order_date) FROM order_details;

-- 3 How many orders were made within this date range?
SELECT distinct(order_details_id) FROM order_details;

-- 4. How many items were ordered within this date range?
SELECT count(*) FROM order_details;

-- 5. Which orders had the most number of items?
select order_id,count(item_id) as Num_items
FROM order_details
GROUP BY order_id 
ORDER by Num_items DESC;

-- 6. How many orders had more than 12 items?
SELECT order_id,count(item_id) as Num_items
FROM order_details
GROUP BY order_id 
having Num_items > 12;

-- Objects 3
-- 1. Combine the menu_items and order_details tables into a single table.

SELECT * FROM 
order_details od LEFT JOIN menu_item mi 
      ON od.item_id =mi.menu_item_id;


-- 2.hat were the least and most ordered items? What categories were they in?

SELECT item_name,category ,count(order_details_id)AS Num_purchase
From order_details od LEFT JOIN menu_item mi 
     ON od.item_id =mi.menu_item_id
 GROUP BY item_name,Category
 ORDER BY Num_purchase;

-- 3. What were the top 5 orders that spent the most money?
SELECT order_id ,sum( price) AS Total_spend
From order_details od LEFT JOIN menu_item mi 
     ON od.item_id =mi.menu_item_id
GROUP BY order_id
ORDER BY Total_spend
LIMIT 5;

-- 4. View the details of the highest spend order. What insights can you gather from the results?
SELECT category ,count(item_id) as Num_items
From order_details od LEFT JOIN menu_item mi 
     ON od.item_id =mi.menu_item_id
WHERE order_id =440
GROUP BY  category;

-- 5. View the details of the top 5 highest spend orders. What insights can you gather from the results?
SELECT category ,order_id,count(item_id) as Num_items
From order_details od LEFT JOIN menu_item mi 
     ON od.item_id =mi.menu_item_id
WHERE order_id =(440,2075,1957,330,2675)
GROUP BY  category,order_id;

-- Thank you for reviewing my SQL project.
-- Feedback and suggestions are always welcome to improve and expand this analysis.
-- Happy Learning! 🙂

