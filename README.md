# sql-challenge
## 2024 April

## Summary
This repo contains the files for the bootcamp SQL challenge (module 9). This Challenge is divided into three parts: data modeling, data engineering, and data analysis.
An entity relationship diagram ("ERD") visually models the schema.
The EmployeeSQL folder contains the sql database schema for creation (engineering) as well as a queries file for the analysis.
NOTE:
    (1) Tables should be created in the schema order provided, to avoid potential issues with key mapping between the tables.
    (2) Before queries can be run but after database and tables creation, the .csv files in the data folder must be imported to the database tables corresponding with their respective file names.

## Files
- ERD
- EmployeeSQL
-- /schema.sql
-- /queries.sql 
- data
-- /departments.csv
-- /dept_emp.csv
-- /dept_manager.csv
-- /employees.csv
-- /salaries.csv
-- /titles.csv

## Resources
- CSV data files provided by the bootcamp
- Bootcamp activities and class learnings utilized for modeling, engineering and analysis
- ERD modeled via:
    https://app.quickdatabasediagrams.com/
- Recasting DATE types to allow use of LIKE string operator:
    https://stackoverflow.com/questions/4799615/postgresql-select-data-with-a-like-on-timestamp-field
