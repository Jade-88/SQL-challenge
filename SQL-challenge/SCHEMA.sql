-- Exported from QuickDBD: https://www.quickdatabasediagrams.com/
-- Link to schema: https://app.quickdatabasediagrams.com/#/d/ZC495U
-- NOTE! If you have used non-SQL datatypes in your design, you will have to change these here.

-- Modify this code to update the DB schema diagram.
-- To reset the sample schema, replace everything with
-- two dots ('..' - without quotes).

CREATE TABLE "Titles" (
    "title_id" varchar   NOT NULL,
    "title" varchar   NOT NULL,
    PRIMARY KEY (
        "title_id"
     )
);

CREATE TABLE "Salaries" (
    "emp_no" int   NOT NULL,
    "salary" int   NOT NULL,
    PRIMARY KEY (
        "emp_no"
     )
);

CREATE TABLE "Dept_Manager" (
    "dept_no" varchar   NOT NULL,
    "emp_no" int   NOT NULL,
    PRIMARY KEY (
        "dept_no","emp_no"
     )
);

CREATE TABLE "Dept_emp" (
    "emp_no" int   NOT NULL,
    "dept_no" varchar   NOT NULL,
    PRIMARY KEY (
        "emp_no","dept_no"
     )
);

CREATE TABLE "Departments" (
    "dept_no" varchar   NOT NULL,
    "dept_name" varchar   NOT NULL,
    PRIMARY KEY (
        "dept_no"
     )
);

CREATE TABLE "Employees" (
    "emp_no" int   NOT NULL,
    "emp_title_id" varchar   NOT NULL,
    "birth_date" date   NOT NULL,
    "first_name" varchar   NOT NULL,
    "last_name" varchar   NOT NULL,
    "sex" varchar   NOT NULL,
    "hire_date" date   NOT NULL,
    PRIMARY KEY (
        "emp_no"
     )
);

ALTER TABLE "Salaries" ADD FOREIGN KEY("emp_no")
REFERENCES "Employees" ("emp_no");

ALTER TABLE "Dept_Manager" ADD FOREIGN KEY("dept_no")
REFERENCES "Departments" ("dept_no");

ALTER TABLE "Dept_Manager" ADD FOREIGN KEY("emp_no")
REFERENCES "Employees" ("emp_no");

ALTER TABLE "Dept_emp" ADD FOREIGN KEY("dept_no")
REFERENCES "Departments" ("dept_no");

ALTER TABLE "Dept_emp" ADD FOREIGN KEY("emp_no")
REFERENCES  "Employees"("emp_no");

ALTER TABLE "Employees" ADD FOREIGN KEY("emp_title_id")
REFERENCES "Titles" ("title_id");

