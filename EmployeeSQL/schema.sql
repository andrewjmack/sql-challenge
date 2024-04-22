-- Schema for sql-challenge

-- Drop table code block to facilitate recreation of tables as needed
-- DROP TABLE
--     titles,
--     departments,
--     employees,
--     dept_emp,
--     dept_manager,
--     salaries
--     ;

-- Create tables in an order that considers foreign keys
CREATE TABLE titles (
    title_id VARCHAR NOT NULL,
    title VARCHAR(25) NOT NULL,
    PRIMARY KEY (title_id)
    );

CREATE TABLE departments (
    dept_no VARCHAR NOT NULL,
    dept_name VARCHAR(25) NOT NULL,
    PRIMARY KEY (dept_no)
    );

CREATE TABLE employees (
    emp_no INT NOT NULL,
    emp_title_id VARCHAR NOT NULL, 
    birth_date DATE,
    first_name VARCHAR(25) NOT NULL,
    last_name VARCHAR(25) NOT NULL,
    sex VARCHAR(1),
    hire_date DATE,
    PRIMARY KEY (emp_no),
    FOREIGN KEY (emp_title_id) REFERENCES titles(title_id)
    );

CREATE TABLE dept_emp (
     emp_no INT NOT NULL,
     dept_no VARCHAR NOT NULL,
     -- Create primary key from foreign keys
     PRIMARY KEY (emp_no, dept_no),
     FOREIGN KEY (emp_no) REFERENCES employees(emp_no),
     FOREIGN KEY (dept_no) REFERENCES departments(dept_no)
    );

CREATE TABLE dept_manager (
    dept_no VARCHAR NOT NULL,
    emp_no INT NOT NULL,
    -- Create primary key from foreign keys
     PRIMARY KEY (dept_no, emp_no),
     FOREIGN KEY (dept_no) REFERENCES departments(dept_no),
     FOREIGN KEY (emp_no) REFERENCES employees(emp_no)
    );

CREATE TABLE salaries (
    emp_no INT NOT NULL,
    salary INT,
    PRIMARY KEY (emp_no),
    FOREIGN KEY (emp_no) REFERENCES employees(emp_no)
    );

-- Import table data without CSV headers in same order as table creation

-- Check data import
SELECT * FROM titles LIMIT(5);
SELECT * FROM departments LIMIT(5);
SELECT * FROM employees LIMIT(5);
SELECT * FROM dept_emp LIMIT(5);
SELECT * FROM dept_manager LIMIT(5);
SELECT * FROM salaries LIMIT(5);