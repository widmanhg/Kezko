-- I Created the web_analytics table in my own local psql so i could do the queries, evidence in the readme.md

-- Query: Total conversions, total page views, and overall conversion rate
SELECT
    SUM(conversions) AS total_conversions,
    SUM(page_views) AS total_page_views,
    (SUM(conversions) * 100.0) / SUM(page_views) AS conversion_rate
FROM web_analytics;

-- Query: Revenue per day
SELECT
    date,
    revenue AS total_revenue_per_day
FROM web_analytics
ORDER BY date;

-- Query: Average revenue per conversion per day
SELECT
    date,
    revenue / conversions AS avg_revenue_per_conversion
FROM web_analytics
ORDER BY date;
