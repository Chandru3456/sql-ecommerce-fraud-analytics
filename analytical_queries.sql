USE ecommerce_analytics;
SELECT * FROM (
    SELECT order_id, user_id, order_date,
    TIMESTAMPDIFF(MINUTE, LAG(order_date) OVER (PARTITION BY user_id ORDER BY order_date), order_date) as mins_diff
    FROM orders
) AS sub WHERE mins_diff <= 5;
(SELECT 'HIGH' as status, p.name, COUNT(o.order_id) as sales FROM products p 
 JOIN orders o ON p.product_id = o.product_id GROUP BY p.name ORDER BY sales DESC LIMIT 1)
UNION ALL
(SELECT 'LOW' as status, p.name, 0 as sales FROM products p 
 LEFT JOIN orders o ON p.product_id = o.product_id WHERE o.order_id IS NULL);