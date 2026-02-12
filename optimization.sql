USE ecommerce_analytics;
CREATE INDEX idx_order_date ON orders(order_date);
EXPLAIN SELECT * FROM orders WHERE order_date > '2026-01-01';