-- v_orders_summary
-- Combines order info, payment, review, and delivery timelines
CREATE OR REPLACE VIEW v_orders_summary AS
SELECT
  o.order_id,
  o.customer_id,
  o.order_purchase_timestamp,
  DATE(o.order_purchase_timestamp) AS order_date, 
  ct.product_category_name_english AS product_category,
  oi.price,
  oi.freight_value,
  pay.payment_type,
  pay.payment_installments,
  pay.payment_value

FROM orders o
JOIN order_items oi ON o.order_id = oi.order_id
JOIN products p ON oi.product_id = p.product_id
LEFT JOIN category_translation ct 
  ON p.product_category_name = ct.product_category_name
LEFT JOIN payments pay 
  ON o.order_id = pay.order_id;




-- v_category_sales
-- Category-wise total sales, order count, and avg price

CREATE VIEW v_category_sales AS
SELECT
  ct.product_category_name_english,
  COUNT(*) AS total_items_sold,
  COUNT(DISTINCT oi.order_id) AS total_orders,
  SUM(oi.price) AS total_revenue,
  ROUND(AVG(oi.price)::numeric, 2) AS avg_price_per_item
FROM order_items oi
JOIN products p ON oi.product_id = p.product_id
LEFT JOIN category_translation ct ON p.product_category_name = ct.product_category_name
GROUP BY ct.product_category_name_english;



-- v_seller_performance
-- Revenue, shipping, and review scores by seller

CREATE VIEW v_seller_performance AS
SELECT
  s.seller_id,
  s.seller_city,
  s.seller_state,
  COUNT(DISTINCT oi.order_id) AS total_orders,
  COUNT(*) AS total_items_sold,
  SUM(oi.price) AS total_revenue,
  SUM(oi.freight_value) AS total_freight,
  ROUND(AVG(r.review_score)::numeric, 2) AS avg_review_score,
  ROUND(AVG(DATE_PART('day', CAST(o.order_delivered_customer_date AS timestamp) - CAST(o.order_purchase_timestamp AS timestamp)))::numeric, 2) AS avg_delivery_days,
  ROUND(AVG(DATE_PART('day', CAST(o.order_delivered_carrier_date AS timestamp) - CAST(o.order_approved_at AS timestamp)))::numeric, 2) AS avg_shipping_days
FROM order_items oi
JOIN orders o ON oi.order_id = o.order_id
LEFT JOIN v_reviews_cleaned r ON o.order_id = r.order_id
JOIN sellers s ON oi.seller_id = s.seller_id
GROUP BY s.seller_id, s.seller_city, s.seller_state;



-- v_customer_lifetime
-- Total spend, repeat orders, and customer lifespan

CREATE VIEW v_customer_lifetime AS
SELECT
  c.customer_id,
  c.customer_unique_id,
  c.customer_city,
  c.customer_state,
  COUNT(DISTINCT o.order_id) AS total_orders,
  SUM(oi.price) AS total_revenue,
  ROUND(AVG(oi.price)::numeric, 2) AS avg_order_value,
  MIN(o.order_purchase_timestamp) AS first_order_date,
  MAX(o.order_purchase_timestamp) AS last_order_date
FROM customers c
JOIN orders o ON c.customer_id = o.customer_id
JOIN order_items oi ON o.order_id = oi.order_id
GROUP BY 
  c.customer_id,
  c.customer_unique_id,
  c.customer_city,
  c.customer_state;



-- v_city_sales
-- Sales totals by city and state

CREATE VIEW v_city_sales AS
SELECT
  c.customer_city,
  c.customer_state,
  COUNT(DISTINCT o.order_id) AS total_orders,
  SUM(oi.price) AS total_revenue,
  ROUND(AVG(oi.price)::numeric, 2) AS avg_order_value
FROM customers c
JOIN orders o ON c.customer_id = o.customer_id
JOIN order_items oi ON o.order_id = oi.order_id
GROUP BY c.customer_city, c.customer_state;
