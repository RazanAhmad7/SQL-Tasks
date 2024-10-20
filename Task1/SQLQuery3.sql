CREATE TABLE products (
    product_id INT PRIMARY KEY,
    product_name VARCHAR(100),
    price DECIMAL(10, 2),
);

-- Inserting data into products table
INSERT INTO products (product_id, product_name, price) 
VALUES 
(1, 'Laptop', 50),
(2, 'Headphones', 150.00);
