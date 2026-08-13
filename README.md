# 🍕 Pizza Sales SQL Analysis

A MySQL-based Pizza Sales Analysis project focused on database design, table relationships, constraints, CSV data import, and SQL-based business analysis.

## 📌 Project Overview

This project analyzes pizza sales data using MySQL.

The project covers the complete SQL workflow:

- Database creation
- Table creation and database design
- Primary Key and Foreign Key relationships
- Data integrity using constraints
- CSV data import
- SQL data analysis
- Business-oriented queries and insights

## 🗄️ Database Structure

Database name:

`pizzahut`

The database contains four tables:

1. `pizza_types`
2. `pizzas`
3. `orders`
4. `order_details`

### Table Relationships

- `pizza_types` → `pizzas`
- `pizzas` → `order_details`
- `orders` → `order_details`

These relationships allow pizza information, pricing, orders, and order quantities to be analyzed together.

## 🔑 Keys & Constraints

The project uses different SQL constraints to maintain data integrity, including:

- Primary Key
- Foreign Key
- NOT NULL
- UNIQUE
- CHECK

Examples of validation include:

- Pizza IDs are uniquely identified.
- Foreign Keys maintain relationships between related tables.
- Pizza size is restricted to valid size values.
- Pizza price must be greater than zero.
- Required fields cannot contain NULL values.

## 📥 Data Import

The project uses CSV files as the source data.

CSV files included:

- `orders.csv`
- `order_details.csv`
- `pizza_types.csv`
- `pizzas.csv`

Data for `orders` and `order_details` was imported using SQL `LOAD DATA LOCAL INFILE`.

The other two tables, `pizza_types` and `pizzas`, were imported directly because their datasets were smaller.

## 📊 SQL Analysis

The project includes SQL queries for analyzing pizza sales data.

The analysis covers areas such as:

- Total orders
- Total pizzas sold
- Revenue analysis
- Pizza performance
- Sales by category
- Sales by size
- Order trends
- Top-performing pizzas
- Ranking and comparative analysis

Advanced SQL concepts are also used where required, including:

- Aggregate Functions
- GROUP BY
- ORDER BY
- JOINs
- Subqueries
- Window Functions
- Ranking

## 📁 Project Files

| File | Description |
|---|---|
| `01_data_base_setup.sql` | Creates the database and tables with keys and constraints |
| `02_import_data.sql` | Contains SQL-based CSV data import queries |
| `03_analysis_queries.sql` | Contains SQL analysis and business queries |
| `orders.csv` | Order date and time data |
| `order_details.csv` | Order-level pizza quantity data |
| `pizza_types.csv` | Pizza names, categories and ingredients |
| `pizzas.csv` | Pizza sizes and prices |

## 🛠️ Tools & Technologies

- MySQL
- MySQL Workbench
- SQL
- CSV

## 🎯 Project Objective

The main objective of this project is to demonstrate practical SQL skills by designing a relational database, maintaining data integrity through constraints and relationships, importing real-world CSV data, and extracting useful business insights using SQL.

## 👨‍💻 Author

Aditya Bijarnia
