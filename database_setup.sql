CREATE DATABASE IF NOT EXISTS ecommerce_analytics;
USE ecommerce_analytics;

CREATE TABLE users (
    user_id INT AUTO_INCREMENT PRIMARY KEY,
    username VARCHAR(50),
    email VARCHAR(100) UNIQUE,
    signup_date DATETIME DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE products (
    product_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100),
    price DECIMAL(10, 2),
    stock_quantity INT
);

CREATE TABLE orders (
    order_id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT,
    product_id INT,
    order_date DATETIME DEFAULT CURRENT_TIMESTAMP,
    total_amount DECIMAL(10, 2),
    FOREIGN KEY (user_id) REFERENCES users(user_id),
    FOREIGN KEY (product_id) REFERENCES products(product_id)
);
INSERT INTO users (username, email) VALUES ('alex_safe', 'alex@test.com'), ('jordan_risk', 'jordan@test.com');
INSERT INTO products (name, price, stock_quantity) VALUES ('Laptop', 1200, 50), ('Mouse', 25, 100);
INSERT INTO orders (user_id, product_id, order_date, total_amount) VALUES (1, 1, '2026-02-10', 1200), (2, 2, '2026-02-12', 25), (2, 2, '2026-02-12 10:02:00', 25);