use laksh

-- Create the database
CREATE DATABASE online_sales;

-- Use the database
USE online_sales;

-- Create the orders table
CREATE TABLE orders (
    order_id INT IDENTITY(1,1) PRIMARY KEY,
    order_date DATE,
    amount DECIMAL(10, 2),
    product_id VARCHAR(10)
);

-- Insert sample data
INSERT INTO orders (order_date, amount, product_id) VALUES
('2025-04-01', 120.50, 'P001'),
('2025-04-02', 250.00, 'P002'),
('2025-04-02', 95.00,  'P003'),
('2025-04-03', 180.75, 'P001'),
('2025-04-04', 340.10, 'P004'),
('2025-04-05', 150.00, 'P002'),
('2025-04-06', 80.00,  'P005'),
('2025-04-06', 220.00, 'P001'),
('2025-04-07', 300.00, 'P003'),
('2025-04-08', 199.99, 'P004');

select * from orders

a

SELECT 
    MONTH  (order_date) AS order_month,
    SUM(amount) AS total_sales
FROM 
    orders
GROUP BY 
    MONTH  (order_date)
ORDER BY 
    order_month;
	
	b

	SELECT 
    YEAR  (order_date) AS order_year,
    MONTH  (order_date) AS order_month,
    SUM(amount) AS total_sales
FROM 
    orders
GROUP BY 
    YEAR  (order_date),
    MONTH  (order_date)
ORDER BY 
    order_year, order_month;

	c

	SELECT 
    FORMAT(order_date, 'yyyy-MM') AS year_month,
    SUM(amount) AS revenue
FROM 
    orders
GROUP BY 
    FORMAT(order_date, 'yyyy-MM')
ORDER BY 
    year_month;

	d

	SELECT 
    FORMAT(order_date, 'yyyy-MM') AS year_month,
    SUM(amount) AS revenue,
    COUNT(DISTINCT order_id) AS volume
FROM 
    orders
GROUP BY 
    FORMAT(order_date, 'yyyy-MM')
ORDER BY 
    year_month;


	e
	SELECT 
    FORMAT(order_date, 'yyyy-MM') AS year_month,
    SUM(amount) AS revenue,
    COUNT(DISTINCT order_id) AS volume
FROM 
    orders
GROUP BY 
    FORMAT(order_date, 'yyyy-MM')
ORDER BY 
    year_month ASC;

	''f''
	SELECT 
    FORMAT(order_date, 'yyyy-MM') AS year_month,
    SUM(amount) AS revenue,
    COUNT(DISTINCT order_id) AS volume
FROM 
    orders
WHERE 
    order_date BETWEEN '2025-04-01' AND '2025-04-30'
GROUP BY 
    FORMAT(order_date, 'yyyy-MM')
ORDER BY 
    year_month;
