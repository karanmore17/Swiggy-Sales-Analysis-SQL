/*============================================================*/

-- Fact Table 
CREATE TABLE fact_swiggy_orders(
			order_id INT IDENTITY(1,1) PRIMARY KEY,

			date_id INT,
			Price_INR Decimal(10,2),
			Rating DECIMAL(4,2),
			Rating_Count INT,

			location_id INT,
			restaurant_id INT,
			category_id INT,
			dish_id INT,

			FOREIGN KEY (date_id) REFERENCES dim_date(date_id),
			FOREIGN KEY (location_id) REFERENCES dim_location(location_id),
			FOREIGN KEY (restaurant_id) REFERENCES dim_restaurant(restaurant_id),
			FOREIGN KEY (category_id) REFERENCES dim_category(category_id),
			FOREIGN KEY (dish_id) REFERENCES dim_dish(dish_id)
);

SELECT * FROM fact_swiggy_orders;

----------------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------------
-- INSERT DATA INTO TABLES --
-- DIM_DATE --
INSERT INTO dim_date( Full_Date, Year, Month, Month_Name, Quarter, DAY, WEEK )
	SELECT DISTINCT 
		Order_Date,
		YEAR(Order_Date),
		MONTH(Order_Date),
		DATENAME(Month, Order_Date),
		DATEPART(QUARTER, Order_Date),
		DAY(Order_Date),
		DATEPART(WEEK, Order_Date)
		FROM swiggy_data
	WHERE Order_Date IS NOT NULL;

SELECT * FROM dim_date;


-- Dim_Location --
INSERT INTO dim_location( State, City, Location )
	SELECT DISTINCT 
		State, 
		City, 
		Location
		FROM swiggy_data;

SELECT * FROM dim_location;

-- Dim_Restaurant --
INSERT INTO dim_restaurant( Restaurant_name )
	SELECT DISTINCT 
		Restaurant_Name
		FROM swiggy_data;

SELECT * FROM dim_restaurant;

-- Dim_category --
INSERT INTO dim_category( Category )
	SELECT DISTINCT 
		Category
		FROM swiggy_data;

SELECT * FROM dim_category;

-- Dim_dish --
INSERT INTO dim_dish( Dish_Name )
	SELECT DISTINCT 
		Dish_Name
		FROM swiggy_data;

SELECT * FROM dim_dish;

----------------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------------
-- INSERT DATA INTO FACT TABLE --
INSERT INTO fact_swiggy_orders
(
		date_id,
		Price_INR,
		Rating,
		Rating_Count,
		location_id,
		restaurant_id,
		category_id,
		dish_id
)
SELECT 
		dd.date_id,
		s.Price_INR,
		s.Rating,
		s.Rating_Count,

		dl.location_id,
		dr.restaurant_id,
		dc.category_id,
		dsh.dish_id
	FROM swiggy_data s

	JOIN dim_date dd
	ON dd.Full_Date = s.Order_Date

	JOIN dim_location dl
	ON  dl.State = s.State
	AND dl.City = s.City
	AND dl.Location = s.Location

	JOIN dim_restaurant dr
	ON dr.Restaurant_name = s.Restaurant_Name

	JOIN dim_category dc
	ON dc.Category = s.Category

	JOIN dim_dish dsh
	ON dsh.Dish_Name = s.Dish_Name;

SELECT * FROM fact_swiggy_orders;

-- INSERTION COMPLETED SUCCESSFULLY -- :)
/*============================================================*/
