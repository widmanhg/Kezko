#  SQL  (Part 1)

## Step 1: Create the `web_analytics` Table and just fill it with values , i used a copy of the photo and then a bunch of random data of the photo i was given

The table `web_analytics` stores daily website metrics including page views, conversions, and revenue.

```sql
CREATE TABLE web_analytics (
    date DATE,
    page_views INTEGER,
    conversions INTEGER,
    revenue NUMERIC(10, 2)
);
```

## Step 2: Run Key Queries

### 1. Total Conversions, Page Views & Conversion Rate

This query returns:
- The total number of conversions
- The total number of page views
- The overall conversion rate as a percentage

```sql
SELECT
    SUM(conversions) AS total_conversions,
    SUM(page_views) AS total_page_views,
    (SUM(conversions) * 100.0) / SUM(page_views) AS conversion_rate
FROM web_analytics;
```

![image](https://github.com/user-attachments/assets/35a2627e-1a2d-4abf-ae8d-278c289a9cae)


### 2. Revenue Per Day

This query returns the revenue earned each day, sorted by date.

```sql
SELECT
    date,
    revenue AS total_revenue_per_day
FROM web_analytics
ORDER BY date;
```
![image](https://github.com/user-attachments/assets/58c28b6e-9bbc-4312-b273-093f852e32cf)


### 3. Average Revenue Per Conversion Per Day

This query calculates the average revenue generated from each individual conversion per day.

```sql
SELECT
    date,
    revenue / conversions AS avg_revenue_per_conversion
FROM web_analytics
ORDER BY date;
```

![image](https://github.com/user-attachments/assets/ec065681-e557-4e18-9aaa-0532f870beb9)


#  Python  (Part 2)
