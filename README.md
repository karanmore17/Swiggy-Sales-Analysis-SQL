# Swiggy Sales Analysis – SQL Server Data Warehouse Project

Welcome to the Swiggy Sales Analysis Project repository! 🚀
This project demonstrates an end-to-end SQL-based analytical solution, starting from raw transactional food delivery data to a structured Star Schema model with actionable business insights. 

Designed as a portfolio project showcasing real-world data cleaning, dimensional modeling, and advanced SQL analytics.

---

## 🏗️ Data Architecture

This project follows a structured analytical modeling approach inspired by modern data warehousing principles.

---

🔹 Raw Layer

Source: Swiggy food delivery dataset (CSV format)

Imported into SQL Server

Initial validation and profiling performed

🔹 Cleaned Layer

Null value validation

Blank field detection

Duplicate identification using GROUP BY

Duplicate removal using ROW_NUMBER()

Data type standardization using CONVERT and CAST

🔹 Analytical Layer (Star Schema)

Data was modeled into a Fact-Dimension architecture to support scalable analytical queries.

---

📖 Project Overview

This project involves:

- Data Cleaning & Validation

- Star Schema Design

- Fact & Dimension Table Creation

- KPI Development

- Advanced SQL-Based Business Analysis

- Insight Generation for Decision-Making

---

🎯 Project Objective

Develop a structured analytical model using SQL Server to:

- Understand customer ordering behavior

- Analyze food & cuisine performance

- Identify revenue-driving cities

- Study pricing patterns

- Track rating distribution

- Examine time-based trends

---

## 🏗 Data Modeling – Star Schema
📦 Dimension Tables

- dim_date

- Year

- Month

- Month_Name

- Weekday

- Quarter

- dim_location

- State

- City

- Location

- dim_restaurant

- dim_category

- dim_dish

---

## 📊 Fact Table

🔹fact_swiggy_orders

Includes:

- Price_INR

- Rating

- Rating_Count

Foreign Keys to all dimension tables

This design improves:

- Query performance

- Analytical clarity

- Scalability

- BI compatibility

---

## 📊 KPI Development & Business Analytics
🔹 Core KPIs

- Total Orders

- Total Revenue

- Average Dish Price (INR formatted)

- Average Rating

---

## 📅 Time-Based Analysis

- Monthly Order Trends

- Year-Wise Growth

---

## Day-of-Week Patterns (Mon–Sun with correct ordering logic)

📍 Location-Based Analysis

- Top 10 Cities by Order Volume

- Bottom 10 Cities by Order Volume

- Top 10 Cities by Revenue Contribution

---

## 🍽 Food & Cuisine Performance

- Top 10 Restaurants by Orders

- Top Categories by Order Volume

- Top 20 Most Ordered Dishes

- Cuisine Performance (Orders + Avg Rating)

---

## 💰 Customer Spending Insights

Price Segmentation using CASE logic:

- Under 100

- 100–199

- 200–299

- 300–499

- 500+

Analyzed order distribution across price buckets to understand pricing behavior and revenue concentration.

---

## ⭐ Ratings Analysis

- Rating distribution (1–5 scale)

- Average Rating

- Category-wise rating comparison

---

## 🧠 SQL Concepts Applied

- Window Functions (ROW_NUMBER)

- CASE Expressions (Segmentation)

- Aggregations (SUM, COUNT, AVG)

- Numeric Formatting (ROUND, FORMAT)

- Multi-table Joins

- Star Schema Implementation

- Data Type Conversion (CONVERT, CAST)

- Date Functions (DATENAME, DATEPART)

---


##📂 Repository Structure
```
Swiggy-Sales-Analysis-SQL/
│
├── 01_Data_Cleaning.sql
├── 02_Dimension_Tables.sql
├── 03_Fact_Table_Load.sql
├── 04_KPI_Analysis.sql
├── docs/
│ └── ERD_Diagram.png
├── README.md
└── .gitignore
```
## 🚀 Business Insights Derived

- Date Functions (DATENAME, DATEPART)

- Mid-price range (100–299 INR) dominates order volume

- Certain cities significantly outperform others in revenue

- High-performing cuisines balance strong ratings with large order counts

- Weekend ordering shows noticeable spikes

- Premium price segments contribute smaller but higher-value orders

---

## 💻 Tools Used

- SQL Server

- SSMS (SQL Server Management Studio)

- Build fact-dimension architecture

- Generate business KPIs

- Extract insights for decision-making

---

## About ME 

Hi there! I'm **Karan More** an aspiring Data Analyst & Data Engineer with a strong foundation in Python, SQL, Power BI, and ETL workflows.
