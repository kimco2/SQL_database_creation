-- Creating tables
CREATE TABLE "titles" (
    "title_id" varchar(5)   NOT NULL,
    "title" varchar(18)   NOT NULL,
    CONSTRAINT "pk_titles" PRIMARY KEY (
        "title_id"
     )
);

CREATE TABLE "employees" (
    "emp_no" integer   NOT NULL,
    "emp_title_id" varchar(5)   NOT NULL,
    "birth_date" date   NOT NULL,
    "first_name" varchar(20)   NOT NULL,
    "last_name" varchar(20)   NOT NULL,
    "sex" varchar(1)   NOT NULL,
    "hire_date" date   NOT NULL,
    CONSTRAINT "pk_employees" PRIMARY KEY (
        "emp_no"
     )
);

CREATE TABLE "departments" (
    "dept_no" varchar(4)   NOT NULL,
    "dept_name" varchar(18)   NOT NULL,
    CONSTRAINT "pk_departments" PRIMARY KEY (
        "dept_no"
     )
);

CREATE TABLE "salaries" (
    "emp_no" integer   NOT NULL,
    "salary" integer   NOT NULL,
    CONSTRAINT "pk_salaries" PRIMARY KEY (
        "emp_no"
     )
);

CREATE TABLE "dept_emp" (
    "emp_no" integer   NOT NULL,
    "dept_no" varchar(4)   NOT NULL,
    CONSTRAINT "pk_dept_emp" PRIMARY KEY (
        "emp_no","dept_no"
     )
);

CREATE TABLE "dept_manager" (
    "dept_no" varchar(4)   NOT NULL,
    "emp_no" integer   NOT NULL,
    CONSTRAINT "pk_dept_manager" PRIMARY KEY (
        "dept_no","emp_no"
     )
);

ALTER TABLE "employees" ADD CONSTRAINT "fk_employees_emp_title_id" FOREIGN KEY("emp_title_id")
REFERENCES "titles" ("title_id");

ALTER TABLE "salaries" ADD CONSTRAINT "fk_salaries_emp_no" FOREIGN KEY("emp_no")
REFERENCES "employees" ("emp_no");

ALTER TABLE "dept_emp" ADD CONSTRAINT "fk_dept_emp_emp_no" FOREIGN KEY("emp_no")
REFERENCES "employees" ("emp_no");

ALTER TABLE "dept_emp" ADD CONSTRAINT "fk_dept_emp_dept_no" FOREIGN KEY("dept_no")
REFERENCES "departments" ("dept_no");

ALTER TABLE "dept_manager" ADD CONSTRAINT "fk_dept_manager_dept_no" FOREIGN KEY("dept_no")
REFERENCES "departments" ("dept_no");

ALTER TABLE "dept_manager" ADD CONSTRAINT "fk_dept_manager_emp_no" FOREIGN KEY("emp_no")
REFERENCES "employees" ("emp_no");

-- Changing the date format
SET datestyle TO 'ISO, MDY';

-- Importing data into the tables from the relevant csv file
COPY titles FROM 'C:\Users\kymco\Desktop\UWA_data_analytics\homework\sql-challenge\data\titles.csv'DELIMITER ',' CSV HEADER;
COPY employees FROM 'C:\Users\kymco\Desktop\UWA_data_analytics\homework\sql-challenge\data\employees.csv'DELIMITER ',' CSV HEADER;
COPY departments FROM 'C:\Users\kymco\Desktop\UWA_data_analytics\homework\sql-challenge\data\departments.csv'DELIMITER ',' CSV HEADER;
COPY salaries FROM 'C:\Users\kymco\Desktop\UWA_data_analytics\homework\sql-challenge\data\salaries.csv'DELIMITER ',' CSV HEADER;
COPY dept_emp FROM 'C:\Users\kymco\Desktop\UWA_data_analytics\homework\sql-challenge\data\dept_emp.csv'DELIMITER ',' CSV HEADER;
COPY dept_manager FROM 'C:\Users\kymco\Desktop\UWA_data_analytics\homework\sql-challenge\data\dept_manager.csv'DELIMITER ',' CSV HEADER;

-- Checking the data imported
select * from titles;
select * from employees;
select * from departments;
select * from salaries;
select * from dept_emp;
select * from dept_manager;
