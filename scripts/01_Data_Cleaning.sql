/*============================================================*/

-- Data Validation & Cleaning --
-- Null checks
SELECT
		SUM(CASE WHEN State IS NULL THEN 1 ELSE 0 END) As null_state,
		SUM(CASE WHEN City IS NULL THEN 1 ELSE 0 END) As null_city,
		SUM(CASE WHEN Order_Date IS NULL THEN 1 ELSE 0 END) As null_orderdate,
		SUM(CASE WHEN Restaurant_Name IS NULL THEN 1 ELSE 0 END) As null_restaurant,
		SUM(CASE WHEN Location IS NULL THEN 1 ELSE 0 END) As null_location,
		SUM(CASE WHEN Category IS NULL THEN 1 ELSE 0 END) As null_category,
		SUM(CASE WHEN Dish_Name IS NULL THEN 1 ELSE 0 END) As null_dish,
		SUM(CASE WHEN Price_INR IS NULL THEN 1 ELSE 0 END) As null_price,
		SUM(CASE WHEN Rating IS NULL THEN 1 ELSE 0 END) As null_rating,
		SUM(CASE WHEN Rating_Count IS NULL THEN 1 ELSE 0 END) As null_rating_count
FROM swiggy_data;


-- Blank or Empty Strings --
 SELECT * FROM swiggy_data
 WHERE State = '' or City = '' or Restaurant_Name = '' or Location = '' or Category = '' or Dish_Name = '' 
;

-- Duplicate Records Detection--

SELECT 
State, City, Order_Date, Restaurant_Name, Location, Category, 
Dish_Name, Price_INR, Rating, Rating_Count, COUNT(*) As CNT
From swiggy_data
GROUP BY 
State, City, Order_Date, Restaurant_Name, Location, Category, 
Dish_Name, Price_INR , Rating, Rating_Count
HAVING COUNT(*) > 1;

-- Delete Duplications --

WITH CTE AS (
SELECT *, ROW_NUMBER() OVER (
					PARTITION BY State, City, Order_Date, Restaurant_Name, Location, Category, 
Dish_Name, Price_INR, Rating, Rating_Count 
ORDER BY (SELECT NULL)
) AS rn
FROM swiggy_data
)
DELETE FROM CTE WHERE rn > 1 ;


/*============================================================*/
