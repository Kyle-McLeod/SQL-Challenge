DROP TABLE IF EXISTS employees;
DROP TABLE IF EXISTS departments;
DROP TABLE IF EXISTS dept_manager;
DROP TABLE IF EXISTS titles;
DROP TABLE IF EXISTS salaries;
DROP TABLE IF EXISTS dept_emp;

CREATE TABLE "departments" (
    "dept_no" VARCHAR NOT NULL,
    "dept_name" VARCHAR NOT NULL,
    CONSTRAINT "departments_PK" PRIMARY KEY (
        "dept_no"
     )
);

SELECT * FROM departments;

CREATE TABLE "dept_emp" (
    "emp_no" INT NOT NULL,
    "dept_no" INT NOT NULL
);

SELECT * FROM dept_emp;

CREATE TABLE "dept_manager" (
    "dept_no" VARCHAR NOT NULL,
    "emp_no" INT NOT NULL
);

SELECT * FROM dept_manager;

CREATE TABLE "employees" (
    "emp_no" INT NOT NULL,
    "emp_title_id" VARCHAR NOT NULL,
    "birth_date" date NOT NULL,
    "first_name" VARCHAR NOT NULL,
    "last_name" VARCHAR NOT NULL,
    "sex" VARCHAR NOT NULL,
    "hire_date" date NOT NULL,
    CONSTRAINT "employees_PK" PRIMARY KEY (
        "emp_no"
     )
);

SELECT * FROM employees;

CREATE TABLE "salaries" (
	"emp_no" INT NOT NULL,
	"salary" INT NOT NULL
);

SELECT * FROM salaries;

CREATE TABLE "titles" (
	"title_id" VARCHAR NOT NULL,
	"title" VARCHAR NOT NULL,
	CONSTRAINT "titles_PK" PRIMARY KEY (
		"title_id"
	)
);

SELECT * FROM titles;

ALTER TABLE "dept_emp" 
ADD CONSTRAINT "emp_no_FK"
FOREIGN KEY("emp_no")
REFERENCES "employees" ("emp_no");

ALTER TABLE "dept_emp"
ADD CONSTRAINT "dept_no_FK"
FOREIGN KEY("dept_no")
REFERENCES "departments" (dept_no);

ALTER TABLE "dept_manager" 
ADD CONSTRAINT "dept_no_FK" 
FOREIGN KEY("dept_no")
REFERENCES "departments" ("dept_no");

ALTER TABLE "dept_manager" 
ADD CONSTRAINT "emp_no_FK" 
FOREIGN KEY("emp_no")
REFERENCES "employees" ("emp_no");

ALTER TABLE "employees" 
ADD CONSTRAINT "emp_title_id_FK" 
FOREIGN KEY("emp_title_id")
REFERENCES "titles" ("title_id");

ALTER TABLE "salaries" 
ADD CONSTRAINT "emp_no_FK" 
FOREIGN KEY("emp_no")
REFERENCES "employees" ("emp_no");


