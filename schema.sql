-- Create database
CREATE DATABASE IF NOT EXISTS sql_optimization_demo;
USE sql_optimization_demo;

-- Create Departments table
CREATE TABLE departments (
    id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100)
);

-- Create Workers table (No indexes yet)
CREATE TABLE workers (
    id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100),
    department_id INT,
    salary INT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Insert sample departments
INSERT INTO departments (name) VALUES ('HR'), ('IT'), ('Production'), ('Marketing'), ('Sales');
