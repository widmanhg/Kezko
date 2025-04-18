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

## Overview
analyzing email delivery failure messages to identify non-existent email addresses. It processes a CSV file containing email delivery data and separates addresses that failed due to non-existence from those that failed for other reasons.


## Main idea of how to do it
The script uses pattern matching to identify specific SMTP error codes and messages that indicate non-existent email addresses. It categorizes these failures into:

- **Definitive non-existent indicators**:
  - "does not exist" messages
  - SMTP error code 5.1.1
  - "user unknown" notifications
  - "no such host" errors
  - Other clear indicators of invalid addresses

- **Suspicious indicators** (might suggest non-existence):
  - SMTP error code 550 5.0.1
  - "sender verify failed" messages

## Output
The script generates a CSV file containing the list of identified non-existent email addresses.
