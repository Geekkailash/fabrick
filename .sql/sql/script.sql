-- Create a sample table
CREATE TABLE employees (
    employee_id INT,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    department VARCHAR(50),
    salary INT,
    join_date DATE
);

-- Insert sample data
INSERT INTO employees VALUES
(1, 'Amit', 'Sharma', 'HR', 50000, '2022-01-15'),
(2, 'Neha', 'Verma', 'IT', 70000, '2021-07-10'),
(3, 'Raj', 'Patel', 'Finance', 65000, '2020-03-20');

-- Query data
SELECT * FROM employees;
