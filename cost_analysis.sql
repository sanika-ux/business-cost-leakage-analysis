-- Total refunds by vendor
SELECT 
    vendor,
    SUM(refund_amount) AS total_refund
FROM orders
GROUP BY vendor
ORDER BY total_refund DESC;

-- Refund rate by delivery speed
SELECT
    CASE 
        WHEN delivery_days <= 3 THEN 'Fast Delivery'
        WHEN delivery_days BETWEEN 4 AND 6 THEN 'Medium Delivery'
        ELSE 'Slow Delivery'
    END AS delivery_speed,
    COUNT(*) AS total_orders,
    SUM(CASE WHEN is_returned = 'Yes' THEN 1 ELSE 0 END) AS returned_orders
FROM orders
GROUP BY delivery_speed;

-- Top products causing losses
SELECT
    product,
    SUM(refund_amount) AS refund_loss
FROM orders
GROUP BY product
ORDER BY refund_loss DESC;
