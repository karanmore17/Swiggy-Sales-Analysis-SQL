# Swiggy Sales Analysis – SQL Server Data Warehouse Project
End-to-End SQL Data Cleaning, Star Schema Design &amp; KPI Analysis on Swiggy Sales Dataset

📌 Project Overview

This project focuses on transforming raw Swiggy food delivery data into a structured analytical model using SQL Server. The objective was to clean, validate, model, and analyze transactional data to generate actionable business insights.

The project simulates a real-world data warehouse implementation with star schema design and business KPI reporting.

🧹 Data Cleaning & Validation

Performed comprehensive data quality checks on the raw dataset:

Null value detection across business-critical columns

Blank / empty string validation

Duplicate record detection using GROUP BY

Duplicate removal using ROW_NUMBER() window function

Data type validation and numeric conversions for analytical accuracy

This ensured reliable and consistent data before dimensional modeling.

🏗 Dimensional Modeling – Star Schema Design

Designed and implemented a Star Schema for optimized analytical querying.

📦 Dimension Tables

dim_date (Year, Month, Month_Name, Quarter, Weekday)

dim_location (State, City, Location)

dim_restaurant

dim_category

dim_dish

📊 Fact Table

fact_swiggy_orders

Price_INR

Rating

Rating_Count

Foreign Keys to all dimensions

All foreign keys were resolved during fact loading to ensure referential integrity.

This structure improves query performance and aligns with industry-standard BI practices.

📊 KPI Development & Business Analysis
🔹 Core KPIs

Total Orders

Total Revenue

Average Dish Price (Formatted in INR)

Average Rating

📈 Deep-Dive Analysis
📅 Time-Based Analysis

Monthly order trends

Year-wise growth

Day-of-week ordering patterns (Mon–Sun with correct weekday ordering)

📍 Location-Based Analysis

Top 10 cities by order volume

Bottom 10 cities by order volume

Top 10 cities by revenue contribution

🍽 Food Performance Analysis

Top 10 restaurants by total orders

Top categories by order volume

Top 20 most ordered dishes

Cuisine performance (Orders + Average Rating)

💰 Customer Spending Insights

Price bucket segmentation:

Under 100

100–199

200–299

300–499

500+

Analyzed order distribution across spending ranges to understand pricing behavior.

⭐ Ratings Analysis

Distribution of ratings (1–5)

Average rating across platform

Cuisine-wise rating performance

🛠 SQL Concepts Applied

Window Functions (ROW_NUMBER())

CASE Expressions for segmentation

Aggregations (SUM, COUNT, AVG)

Data Type Conversion (CONVERT, CAST)

Formatting & Precision Control (ROUND, FORMAT)

Star Schema Implementation

Multi-table Joins for analytical queries

🎯 Key Business Insights

Mid-range price bucket (100–299 INR) drives the majority of orders

Certain cities contribute disproportionately to revenue

High-performing cuisines combine high order volume with strong ratings

Weekend ordering patterns show visible spikes compared to weekdays

📌 Project Outcome

Successfully converted raw transactional data into a structured analytical warehouse, enabling scalable business reporting and performance tracking.

This project demonstrates practical skills in:

Data Cleaning

Dimensional Modeling

SQL Optimization

Business Intelligence Thinking

💻 Tools Used

SQL Server

SSMS (SQL Server Management Studio)

🚀 Why This Project Matters

This project replicates a real-world data analyst workflow:

Clean raw data

Design data model

Build fact-dimension architecture

Generate business KPIs

Extract insights for decision-making
