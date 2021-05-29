CREATE TABLE  employees  (
     emp_no  INT   NOT NULL,
     emp_title_id  VARCHAR(255)   NOT NULL,
     birth_date  VARCHAR(255)   NOT NULL,
     first_name  VARCHAR(255)   NOT NULL,
     last_name  VARCHAR(255)   NOT NULL,
     sex  VARCHAR(255)   NOT NULL,
     hire_date  VARCHAR(255)   NOT NULL,
    CONSTRAINT  pk_employees  PRIMARY KEY (
         emp_no 
     )
);

COPY employees (emp_no, emp_title_id, birth_date, first_name, last_name, sex, hire_date)
FROM '/Library/PostgreSQL/12/bin/employees.csv'
DELIMITER ','
CSV HEADER;

select * from employees;

CREATE TABLE  dept_emp  (
     emp_no  INT   NOT NULL,
     dept_no  VARCHAR(255)   NOT NULL
);

COPY dept_emp (emp_no, dept_no)
FROM '/Library/PostgreSQL/12/bin/dept_emp.csv'
DELIMITER ','
CSV HEADER;

select * from dept_emp;

CREATE TABLE  titles  (
     title_id  VARCHAR(255)   NOT NULL,
     title  VARCHAR(255)   NOT NULL,
    CONSTRAINT  pk_titles  PRIMARY KEY (
         title_id 
     )
);

COPY titles (title_id, title)
FROM '/Library/PostgreSQL/12/bin/titles.csv'
DELIMITER ','
CSV HEADER;

select * from titles;

CREATE TABLE  departments  (
     dept_no  VARCHAR   NOT NULL,
     dept_name  VARCHAR   NOT NULL,
    CONSTRAINT  pk_departments  PRIMARY KEY (
         dept_no 
     )
);

COPY departments (dept_no, dept_name)
FROM '/Library/PostgreSQL/12/bin/departments.csv'
DELIMITER ','
CSV HEADER;

select * from departments;

CREATE TABLE  dept_manager  (
     dept_no  VARCHAR   NOT NULL,
     emp_no  INT   NOT NULL
);


COPY dept_manager (dept_no, emp_no)
FROM '/Library/PostgreSQL/12/bin/dept_manager.csv'
DELIMITER ','
CSV HEADER;

select * from dept_manager;

CREATE TABLE  salaries  (
     emp_no  INT   NOT NULL,
     salary  INT   NOT NULL,
    CONSTRAINT  pk_salaries  PRIMARY KEY (
         emp_no 
     )
);

COPY salaries (emp_no, salary)
FROM '/Library/PostgreSQL/12/bin/salaries.csv'
DELIMITER ','
CSV HEADER;

select * from salaries;

ALTER TABLE  employees  ADD CONSTRAINT  fk_employees_emp_title_id  FOREIGN KEY( emp_title_id )
REFERENCES  titles  ( title_id );

ALTER TABLE  dept_emp  ADD CONSTRAINT  fk_dept_emp_emp_no  FOREIGN KEY( emp_no )
REFERENCES  employees  ( emp_no );

ALTER TABLE  dept_emp  ADD CONSTRAINT  fk_dept_emp_dept_no  FOREIGN KEY( dept_no )
REFERENCES  departments  ( dept_no );

ALTER TABLE  dept_manager  ADD CONSTRAINT  fk_dept_manager_dept_no  FOREIGN KEY( dept_no )
REFERENCES  departments  ( dept_no );

ALTER TABLE  dept_manager  ADD CONSTRAINT  fk_dept_manager_emp_no  FOREIGN KEY( emp_no )
REFERENCES  salaries  ( emp_no );
