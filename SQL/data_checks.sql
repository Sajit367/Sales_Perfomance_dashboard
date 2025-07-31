-- Basic null checks across all main tables
-- Using COUNT(column_name) to count non-null values

-- Orders table
SELECT COUNT(order_id) FROM orders;
SELECT COUNT(order_purchase_timestamp) FROM orders;
SELECT COUNT(order_delivered_customer_date) FROM orders;

-- Order items table
SELECT COUNT(order_id) FROM order_items;
SELECT COUNT(price) FROM order_items;
SELECT COUNT(freight_value) FROM order_items;

-- Payments table
SELECT COUNT(order_id) FROM payments;
SELECT COUNT(payment_value) FROM payments;

-- Customers table
SELECT COUNT(customer_id) FROM customers;
SELECT COUNT(customer_unique_id) FROM customers;

-- Products table
SELECT COUNT(product_id) FROM products;
SELECT COUNT(product_category_name) FROM products;

-- Sellers table
SELECT COUNT(seller_id) FROM sellers;
SELECT COUNT(seller_city) FROM sellers;

-- Reviews table
SELECT COUNT(review_id) FROM reviews;
SELECT COUNT(order_id) FROM reviews;
SELECT COUNT(review_score) FROM reviews;

-- Geolocation table
SELECT COUNT(geolocation_zip_code_prefix) FROM geolocation;
SELECT COUNT(geolocation_city) FROM geolocation;

-- Category translation table
SELECT COUNT(product_category_name) FROM category_translation;
SELECT COUNT(product_category_name_english) FROM category_translation;




-- Duplicate checks using GROUP BY + HAVING COUNT(*) > 1

-- Orders
SELECT order_id, COUNT(*)
FROM orders
GROUP BY order_id
HAVING COUNT(*) > 1;

-- Order items
SELECT order_id, order_item_id, COUNT(*)
FROM order_items
GROUP BY order_id, order_item_id
HAVING COUNT(*) > 1;

-- Payments
SELECT order_id, payment_sequential, COUNT(*)
FROM payments
GROUP BY order_id, payment_sequential
HAVING COUNT(*) > 1;

-- Customers
SELECT customer_id, COUNT(*)
FROM customers
GROUP BY customer_id
HAVING COUNT(*) > 1;

-- Products
SELECT product_id, COUNT(*)
FROM products
GROUP BY product_id
HAVING COUNT(*) > 1;

-- Sellers
SELECT seller_id, COUNT(*)
FROM sellers
GROUP BY seller_id
HAVING COUNT(*) > 1;

-- Reviews
SELECT review_id, COUNT(*)
FROM reviews
GROUP BY review_id
HAVING COUNT(*) > 1;

SELECT order_id, COUNT(*)
FROM reviews
GROUP BY order_id
HAVING COUNT(*) > 1;

-- Geolocation
SELECT geolocation_zip_code_prefix, geolocation_city, COUNT(*)
FROM geolocation
GROUP BY geolocation_zip_code_prefix, geolocation_city
HAVING COUNT(*) > 1;

-- Category translation
SELECT product_category_name, product_category_name_english, COUNT(*)
FROM category_translation
GROUP BY product_category_name, product_category_name_english
HAVING COUNT(*) > 1;
