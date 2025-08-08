**Sales Performance Dashboard**

Project Overview
This project is an end-to-end sales performance analysis built using Python (Pandas), SQL, and Power BI.
It uses the Brazilian E-Commerce Public Dataset by Olist to analyze sales trends, payment behavior, regional performance, and category contributions.

The workflow covers:

Loading raw CSV data into SQL using Python

Cleaning and transforming data into analytical views

Building an interactive Power BI dashboard to answer business questions

Extracting actionable business insights

Folder Structure
graphql
Copy
Edit
00_Raw Data/         # Original dataset CSV files from Kaggle
01_Python/           # Script to load data into SQL
02_SQL/              # SQL queries for cleaning and analysis
03_Power BI/         # Power BI report (.pbix) and PDF export
README.md            # Documentation
SQL Data Model
Tables:

customers

orders

order_items

payments

products

reviews

sellers

geolocation

category_translation

Key Analytical Views:

v_category_sales – Sales by product category

v_city_sales – Revenue by customer city

v_customer_lifetime – Metrics per customer

v_reviews_cleaned – Clean review scores

v_sales_summary – Detailed sales records with categories

v_seller_performance – Metrics by seller

Dashboard Overview
Metrics and Visuals:

Total Revenue – R$ 16.01M

Average Revenue per Day – R$ 18.79K

Total Orders – 99K

Average Order Value – R$ 162.25

Revenue by Product Category

Revenue Trend Over Time

Revenue by Payment Type

Revenue by Top Cities

Revenue by Weekday vs Weekend

Key Insights
Top Revenue Categories
Health & Beauty, Watches & Gifts, and Bed & Bath lead in total sales.

Regional Concentration
São Paulo generates nearly double the revenue of Rio de Janeiro, highlighting a key target market.

Payment Preferences
Credit cards account for over 75% of transactions, followed by boleto at ~20%.

Time-based Revenue Patterns
Weekdays drive ~77% of total revenue, showing heavier buying activity during the workweek.

Consistent Spending Behavior
Average order value remains steady at ~R$ 162, indicating predictable customer purchase amounts.

Business Value
This project demonstrates:

SQL-based data cleaning and analytical modeling

End-to-end BI development from raw data to interactive dashboard

Ability to identify revenue drivers and customer behavior patterns

Presentation of insights in a way that supports strategic decisions
