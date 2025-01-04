CREATE DATABASE eCommerce;

USE eCommerce;

-- Table for customers
-- Create Employees Table
CREATE TABLE Employees (
    employee_id INT PRIMARY KEY,
    name VARCHAR(100),
    department VARCHAR(50),
    salary DECIMAL(10, 2),
    hire_date DATE
);

-- Create Projects Table
CREATE TABLE Projects (
    project_id INT PRIMARY KEY,
    project_name VARCHAR(100),
    department VARCHAR(50),
    budget DECIMAL(10, 2)
);

-- Create Assignments Table
CREATE TABLE Assignments (
    assignment_id INT PRIMARY KEY,
    employee_id INT,
    project_id INT,
    hours_worked INT,
    FOREIGN KEY (employee_id) REFERENCES Employees(employee_id),
    FOREIGN KEY (project_id) REFERENCES Projects(project_id)
);


 drop database ecommerce