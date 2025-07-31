-- v_reviews_cleaned
-- Removes duplicate reviews by keeping the earliest review per order.

CREATE VIEW v_reviews_cleaned AS
SELECT DISTINCT ON (order_id)
  review_id,
  order_id,
  review_score,
  review_comment_title,
  review_comment_message,
  review_creation_date,
  review_answer_timestamp
FROM (
  SELECT DISTINCT ON (review_id)
    *
  FROM reviews
  WHERE review_creation_date IS NOT NULL
  ORDER BY review_id, review_creation_date
) sub
ORDER BY order_id, review_creation_date;



-- v_geolocation_cleaned
-- Standardizes city names (e.g. lowercased, accents removed, dashes replaced).

CREATE VIEW v_geolocation_cleaned AS
SELECT 
  *,
  LOWER(UNACCENT(REPLACE(TRIM(geolocation_city), '-', ' '))) AS cleaned_city
FROM geolocation;
