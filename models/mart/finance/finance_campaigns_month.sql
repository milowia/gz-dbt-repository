SELECT
    DATE_TRUNC(date_date, MONTH) AS datemonth,
    ROUND(SUM(daily_ads_margin), 2) AS monthly_ads_margin,
    ROUND(SUM(average_basket), 2) AS monthly_average_basket,
    ROUND(SUM(daily_operational_margin), 2) AS monthly_operational_margin,
    ROUND(SUM(daily_ads_cost), 2) AS monthly_ads_cost,
    ROUND(SUM(daily_impression), 2) AS monthly_impression,
    ROUND(SUM(daily_click), 2) AS monthly_click,
    ROUND(SUM(quantity_product), 2) AS monthly_quantity_product,
    ROUND(SUM(daily_revenue), 2) AS monthly_revenue,
    ROUND(SUM(daily_purchase_cost), 2) AS monthly_purchase_cost,
    ROUND(SUM(daily_margin), 2) AS monthly_margin,
    ROUND(SUM(daily_shipping_fee), 2) AS monthly_shipping_fee,
    ROUND(SUM(daily_log_cost), 2) AS monthly_log_cost,
FROM {{ref('finance_campaigns_day')}}
GROUP BY DATE_TRUNC(date_date, MONTH)
