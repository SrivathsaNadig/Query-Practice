use eCommerce;
-- Insert Sample Data into Employees
INSERT INTO Employees (employee_id, name, department, salary, hire_date) VALUES
(1, 'Alice', 'Sales', 60000, '2020-02-15'),
(2, 'Bob', 'Sales', 65000, '2019-05-10'),
(3, 'Charlie', 'IT', 70000, '2021-03-25'),
(4, 'David', 'HR', 55000, '2020-07-30'),
(5, 'Eve', 'IT', 72000, '2018-01-20');

-- Insert Sample Data into Projects
INSERT INTO Projects (project_id, project_name, department, budget) VALUES
(1, 'Project A', 'Sales', 200000),
(2, 'Project B', 'IT', 300000),
(3, 'Project C', 'HR', 150000);

-- Insert Sample Data into Assignments
INSERT INTO Assignments (assignment_id, employee_id, project_id, hours_worked) VALUES
(1, 1, 1, 50),
(2, 2, 1, 40),
(3, 3, 2, 60),
(4, 4, 3, 30),
(5, 5, 2, 70);