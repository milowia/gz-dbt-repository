{{config(materialized='view')}}

SELECT *,
    ROUND(daily_operational_margin - daily_ads_cost, 2) AS daily_ads_margin
FROM {{ref('finance_days')}}
INNER JOIN
{{ref('int_campaigns_day')}}
USING (date_date)
