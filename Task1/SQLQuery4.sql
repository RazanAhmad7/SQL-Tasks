CREATE TABLE employees (
    employee_id INT PRIMARY KEY,
    full_name VARCHAR(50),
    position VARCHAR(50),
    salary DECIMAL(10, 2)
);

-- Inserting data into employees table
INSERT INTO employees (employee_id, full_name, position, salary) 
VALUES 
(1, 'Alice Johnson', 'Manager', 6000.00),
(2, 'Bob Williams', 'Sales Associate',3500.00);
