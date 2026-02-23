/*============================================================*/

-- Joins the fact table with all dimension tables --

SELECT * FROM fact_swiggy_orders f
JOIN dim_date d 
    ON f.date_id = d.date_id
JOIN dim_location l 
    ON f.location_id = l.location_id
JOIN dim_restaurant r 
    ON f.restaurant_id = r.restaurant_id
JOIN dim_category c 
    ON f.category_id = c.category_id
JOIN dim_dish di 
    ON f.dish_id = di.dish_id;

	-- Star Schema is built successfully --
----------------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------------
SELECT * FROM fact_swiggy_orders;

-- KPI's 
-- 1) Total Orders
SELECT COUNT(*) As Total_orders
from fact_swiggy_orders;

-- Total_orders :- 197401

-- 2) Total Revenue ( INR Million )
SELECT 
FORMAT(SUM(CONVERT(Float,Price_INR))/1000000, 'N2')+ ' INR Million'
As Total_Revenue
from fact_swiggy_orders;

-- Total_Revenue :- 53 INR Million

-- 3) Average Dish Price --
SELECT 
FORMAT(AVG(CONVERT(Float,Price_INR)), 'N2')+ ' INR'
As Average_Dish_Price
from fact_swiggy_orders;

-- Average Dish Price :- 268.50 INR

-- 4) Average Rating --
SELECT 
ROUND(AVG(Rating),2) As Average_Rating
from fact_swiggy_orders;

-- Average_Rating :- 4.34

----------------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------------
-- Deep Dive Business Analysis --

--  Monthly order Trends --
SELECT
d.Year,
d.month,
d.Month_Name,
count(*) As Total_orders
FROM fact_swiggy_orders f
JOIN dim_date d 
ON f.date_id = d.date_id
GROUP BY d.Year, d.Month, d.Month_Name;

--  Monthly Revenue Trends --
SELECT
d.Year,
d.month,
d.Month_Name,
SUM(Price_INR) As Total_Monthly_Revenue
FROM fact_swiggy_orders f
JOIN dim_date d 
ON f.date_id = d.date_id
GROUP BY d.Year, d.Month, d.Month_Name;

-- Quarterly order trends
SELECT
d.Year,
d.Quarter,
count(*) As Total_orders
FROM fact_swiggy_orders f
JOIN dim_date d 
ON f.date_id = d.date_id
GROUP BY d.Year, d.Quarter
ORDER BY count(*) DESC;


-- Year-wise growth
SELECT
d.Year,
count(*) As Total_orders
FROM fact_swiggy_orders f
JOIN dim_date d 
ON f.date_id = d.date_id
GROUP BY d.Year;


-- Day-of-week patterns ( Mon - Sun )
SELECT
		DATENAME(WEEKDAY, d.Full_Date ) As Day_Name,
		COUNT(*) As Total_Orders
		FROM  fact_swiggy_orders f
		JOIN dim_date d 
		ON f.date_id = d.date_id
GROUP BY DATENAME(WEEKDAY, d.Full_Date ), DATEPART(WEEKDAY, d.Full_Date )
ORDER BY DATEPART(WEEKDAY, d.Full_Date );

-- Location-Based Analysis -- 
-- Top 10 cities by order volume
SELECT TOP 10
dl.City,
COUNT(*) As Total_Orders
from fact_swiggy_orders f
JOIN dim_location dl
ON f.location_id = dl.location_id
GROUP BY dl.City
ORDER BY COUNT(*) DESC;

-- Bottom 10 cities by order volume
SELECT TOP 10
dl.City,
COUNT(*) As Total_Orders
from fact_swiggy_orders f
JOIN dim_location dl
ON f.location_id = dl.location_id
GROUP BY dl.City
ORDER BY COUNT(*) ASC;

-- Top 10 cities by Revenue 
SELECT TOP 10
dl.City,
SUM(f.Price_INR) As Total_Revenue
from fact_swiggy_orders f
JOIN dim_location dl
ON f.location_id = dl.location_id
GROUP BY dl.City
ORDER BY SUM(f.Price_INR) DESC;

-- Revenue contribution by states
SELECT 
dl.State,
SUM(f.Price_INR) As Total_Revenue
from fact_swiggy_orders f
JOIN dim_location dl
ON f.location_id = dl.location_id
GROUP BY dl.State
ORDER BY SUM(f.Price_INR) DESC;

-- Food Performance -- 
-- Top 10 restaurants by orders
SELECT TOP 10
dr.Restaurant_name,
COUNT(*) As Total_Orders
from fact_swiggy_orders f
JOIN dim_restaurant dr
ON f.restaurant_id = dr.restaurant_id
GROUP BY dr.Restaurant_name
ORDER BY COUNT(*) DESC;


-- Top categories by order (Indian, Chinese, etc.)
SELECT  
dc.Category,
COUNT(*) As Total_Orders
from fact_swiggy_orders f
JOIN dim_category dc
ON f.category_id = dc.category_id
GROUP BY dc.Category
ORDER BY COUNT(*) DESC;


-- Most ordered dishes
SELECT 
dd.Dish_Name As Most_Ordered_Dishes,
COUNT(*) As Total_Orders
from fact_swiggy_orders f
JOIN dim_dish dd
ON f.dish_id = dd.dish_id
GROUP BY dd.Dish_Name
ORDER BY COUNT(*) DESC;

-- TOP 20 Most Ordered Dishes
SELECT TOP 20
dd.Dish_Name As Most_Ordered_Dishes,
COUNT(*) As Total_Orders
from fact_swiggy_orders f
JOIN dim_dish dd
ON f.dish_id = dd.dish_id
GROUP BY dd.Dish_Name
ORDER BY COUNT(*) DESC;


-- Cuisine performance → Orders + Avg Rating
SELECT 
dc.Category,
COUNT(*) As Total_Orders,
ROUND(AVG(CONVERT(float, f.Rating)),2) As Avg_Rating
from fact_swiggy_orders f
JOIN dim_category dc
ON f.category_id = dc.category_id
GROUP BY dc.Category
ORDER BY Total_Orders DESC;

-- Customer Spending Insights --
-- Buckets of customer spend:
-- Under 100
-- 100–199
-- 200–299
-- 300–499
-- 500+

--  With total order distribution across these ranges.
-- Total Orders by Price Range
SELECT
    CASE
        WHEN CONVERT(FLOAT, price_inr) < 100 THEN 'Under 100'
        WHEN CONVERT(FLOAT, price_inr) BETWEEN 100 AND 199 THEN '100 - 199'
        WHEN CONVERT(FLOAT, price_inr) BETWEEN 200 AND 299 THEN '200 - 299'
        WHEN CONVERT(FLOAT, price_inr) BETWEEN 300 AND 499 THEN '300 - 499'
        ELSE '500+'
    END AS price_range,
    COUNT(*) AS total_orders
FROM fact_swiggy_orders
GROUP BY
    CASE
        WHEN CONVERT(FLOAT, price_inr) < 100 THEN 'Under 100'
        WHEN CONVERT(FLOAT, price_inr) BETWEEN 100 AND 199 THEN '100 - 199'
        WHEN CONVERT(FLOAT, price_inr) BETWEEN 200 AND 299 THEN '200 - 299'
        WHEN CONVERT(FLOAT, price_inr) BETWEEN 300 AND 499 THEN '300 - 499'
        ELSE '500+'
    END
ORDER BY total_orders DESC;

-- Ratings Analysis -- 
-- Distribution of dish ratings from 1–5.
SELECT
Rating,
COUNT(*) As Rating_Count
FROM fact_swiggy_orders 
GROUP BY Rating
ORDER BY Rating DESC;

/* ============================================================
   PROJECT COMPLETION: SWIGGY SALES ANALYSIS 
   ============================================================
   ✔ Performed data cleaning & validation (null check, blank check)
   ✔ Identified and removed duplicate records using ROW_NUMBER()
   ✔ Designed and implemented Star Schema (Fact + Dimensions)
   ✔ Loaded fact table with resolved foreign keys
   ✔ Developed business KPIs:
        - Total Orders
        - Total Revenue
        - Average Price & Rating
        - Monthly & Quarterly Trends
        - Location-Based Analysis
        - Cuisine & Dish Performance
        - Price Range Distribution
        - Ratings Distribution
   ✔ Ensured proper data types and optimized aggregations

   Tools Used: SQL Server
   Concepts Applied: Data Validation, Data Cleaning, Window Functions,
                     Dimensional Modeling, Aggregations, Joins,
                     Business KPI Development....

   Project Status: Successfully Completed
   ============================================================ */
/*============================================================*/
