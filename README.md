**Sales Performance Dashboard**

This project is an end-to-end sales analysis using the Brazilian E-Commerce Public Dataset from Kaggle: https://www.kaggle.com/datasets/olistbr/brazilian-ecommerce
The goal was to take raw transactional data, clean and model it using Python and SQL, and then build an interactive Power BI dashboard that delivers clear, business-ready insights.


Folder Structure

00_Raw Data/         Original CSV files downloaded from Kaggle

01_Python/           Scripts for loading raw data into PostgreSQL

02_SQL/              SQL scripts for data cleaning and analytical views

03_Power BI/         Final Power BI report (.pbix) and PDF export

README.md            Project documentation


Process Overview

Data Loading & Preparation (Python) – Loaded all CSV files into PostgreSQL and handled missing values.

Data Cleaning & Modeling (SQL) – Created analytical views for cleaned data and ready-to-use metrics.

Dashboard Creation (Power BI) – Connected to PostgreSQL, built KPIs and visuals, and designed filters.


SQL Views Created

v_geolocation_cleaned – Standardized city/state names and removed invalid coordinates.

v_reviews_cleaned – Removed null/invalid reviews and standardized date formats.

v_orders_summary – Sales-level dataset including product category in English, payment details, and purchase date.

v_city_sales – Aggregated total revenue by city for geographic insights.

v_customer_lifetime – Calculated lifetime revenue per customer for retention analysis.

v_category_sales – Revenue aggregated by product category.

v_seller_performance – Seller-level performance metrics.


Key Insights

- São Paulo contributes over 20% of total revenue, indicating market concentration.
- Credit cards dominate payment methods, opening opportunities for alternative payment promotions.
- Health & Beauty is the highest revenue category—ideal for targeted campaigns.
- Weekday sales dominate, suggesting workday-driven consumer behavior.
- Revenue shows consistent growth with identifiable spikes linked to promotions.

Dashboard Overview

KPI Cards:
• Total Revenue: R$ 16.01M
• Avg Revenue Per Day: R$ 18.79K
• Total Orders: 99K
• Average Order Value: R$ 162.25

Visuals:
• Revenue by Product Category – Health & Beauty, Watches, Bed & Bath, and Sports & Leisure lead.
• Total Revenue by Date – Clear growth trend with seasonal spikes.
• Revenue by Payment Type – Credit card dominates (75% of orders).
• Revenue by City – São Paulo and Rio de Janeiro are top markets.
• Revenue by Day of the Week – Weekdays account for 77% of revenue.
