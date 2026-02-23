-- Dimension Modelling --
-- STAR SCHEMA --

/*============================================================*/

-- CREATING SCHEMA -- 
-- DIMENSION TABLES --
-- DATE TABLE --
CREATE TABLE dim_date (
		date_id INT IDENTITY(1,1) PRIMARY KEY,
		Full_Date DATE,
		Year INT,
		Month INT,
		Month_Name VARCHAR(20),
		Quarter INT,
		Day INT,
		Week INT
		);

SELECT * FROM dim_date;

-- dim_Location Table --

CREATE TABLE dim_location (
		location_id INT IDENTITY(1,1) PRIMARY KEY,
		State VARCHAR(100),
		City VARCHAR(100),
		Location VARCHAR(200)
);

SELECT * FROM dim_location;

-- dim_restaurant Table --

CREATE TABLE dim_restaurant (
		restaurant_id INT IDENTITY(1,1) PRIMARY KEY,
		Restaurant_name VARCHAR(200)
);

SELECT * FROM dim_restaurant;


-- dim_category Table --

CREATE TABLE dim_category (
		category_id INT IDENTITY(1,1) PRIMARY KEY,
		Category VARCHAR(200)
);

SELECT * FROM dim_category;


-- dim_dish Table --

CREATE TABLE dim_dish (
		dish_id INT IDENTITY(1,1) PRIMARY KEY,
		Dish_Name VARCHAR(200)
);

SELECT * FROM dim_dish;


-- Successfully created all dimension tables -- :)

/*============================================================*/
