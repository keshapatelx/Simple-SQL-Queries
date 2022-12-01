CREATE DATABASE SIMPLEqueries;
USE SIMPLEqueries;
/*Department*/
CREATE TABLE DEPARTMENT(
ID INT AUTO_INCREMENT PRIMARY KEY,
NAME VARCHAR(50) NOT NULL
);
/*Company*/
CREATE TABLE COMPANY(
ID INT AUTO_INCREMENT PRIMARY KEY,
NAME VARCHAR(50) NOT NULL,
REVENUE INT NOT NULL
);
/*Employee*/
CREATE TABLE  EMPLOYEE(
ID INT AUTO_INCREMENT PRIMARY KEY,
NAME VARCHAR(50) NOT NULL,
CITY VARCHAR(50) NOT NULL,
DEPARTMENT_ID INT NOT NULL,
SALARY INT NOT NULL,
FOREIGN KEY (DEPARTMENT_ID) REFERENCES DEPARTMENT(ID)
);
INSERT INTO DEPARTMENT (NAME) VALUES
('IT'),
('MANAGEMENT'),
('IT'),
('SUPPORT');
SELECT * FROM DEPARTMENT;
INSERT INTO COMPANY (NAME, REVENUE) VALUES
('IBM', 2000000),
('GOOGLE', 9000000),
('APPLE', 10000000);
SELECT * FROM COMPANY;
INSERT INTO EMPLOYEE (NAME, CITY, DEPARTMENT_ID, SALARY) VALUES
('DAVID', 'LONDON', 3, 80000),
('EMILY', 'LONDON', 3, 70000),
('PETER', 'PARIS', 3, 60000),
('AVA', 'PARIS', 3, 50000),
('PENNY', 'LONDON', 2, 110000),
('JIM', 'LONDON', 2, 90000),
('AMY', 'ROME', 4, 30000),
('CLOE', 'LONDON', 3, 110000);
SELECT * FROM EMPLOYEE;
/*QUESTION 1 - Query all rows from Department table*/
SELECT * FROM DEPARTMENT;
/*QUESTION 2 - Change the name of department with id =  1 to 'Management'*/
UPDATE DEPARTMENT
SET NAME = 'MANAGEMENT'
WHERE ID = 1;
SELECT * FROM DEPARTMENT;
/*QUESTION 3 - Delete employees with salary greater than 100 000*/
DELETE FROM employee
WHERE salary > 100000;
/*QUESTION 4 - Query the names of companies*/
SELECT NAME 
FROM COMPANY;
/*QUESTION 5 - Query the name and city of every employee*/
SELECT NAME, CITY
FROM EMPLOYEE;
/*QUESTION 6 - Query all companies with revenue greater than 5 000 000*/
SELECT *
FROM COMPANY
WHERE REVENUE > 5000000;
/*QUESTION 7 - Query all companies with revenue smaller than 5 000 000*/
SELECT *
FROM COMPANY
WHERE REVENUE < 5000000;
/*QUESTION 8 -  Query all companies with revenue smaller than 5 000 000, but you cannot use the '<' operator*/
SELECT * 
FROM COMPANY
WHERE REVENUE BETWEEN 0 AND 5000000;
/* VERSION 2*/
SELECT * 
FROM COMPANY
ORDER BY REVENUE
LIMIT 1;
/* VERSION 3*/
SELECT * FROM company
WHERE NOT revenue >= 5000000;
/*QUESTION 9 - Query all employees with salary greater than 50 000 and smaller than 70 000*/
SELECT *
FROM EMPLOYEE
WHERE SALARY BETWEEN 50000 AND 70000;
/*QUESTION 10 - Query all employees with salary greater than 50 000 and smaller than 70 000, but you cannot use BETWEEN*/
SELECT *
FROM EMPLOYEE
WHERE SALARY >= 50000 AND SALARY <= 70000;
/*QUESTION 11 - Query all employees with salary equal to 80 000*/
SELECT *
FROM EMPLOYEE
WHERE SALARY = 80000;
/*QUESTION 12 - Query all employees with salary not equal to 80 000*/
SELECT *
FROM EMPLOYEE
WHERE NOT SALARY = 80000;
/* VERSION 2*/
SELECT *
FROM EMPLOYEE
WHERE SALARY != 80000;
/*QUESTION 13 - Query all names of employees with salary greater than 70 000 together with employees who work on the 'IT' department.*/
SELECT *
FROM EMPLOYEE
WHERE SALARY >= 70000 OR DEPARTMENT_ID IN 
(SELECT ID 
FROM DEPARTMENT 
WHERE NAME = 'IT');
/*QUESTION 14 - Query all employees that work in city that starts with 'L'*/
SELECT *
FROM EMPLOYEE
WHERE CITY LIKE 'L%';
/*QUESTION 15 - Query all employees that work in city that starts with 'L' or ends with 's'*/
SELECT *
FROM EMPLOYEE
WHERE CITY LIKE 'L%' OR CITY LIKE '%S';
/*QUESTION 16 - Query all employees that  work in city with 'o' somewhere in the middle*/
SELECT *
FROM EMPLOYEE
WHERE CITY LIKE '%O%';
/*QUESTION 17 - Query all departments (each name only once)*/
SELECT DISTINCT NAME
FROM DEPARTMENT;
/*QUESTION 18 - Query names of all employees together with id of department they work in, but you cannot use JOIN*/
SELECT EMP.NAME, DEP.ID, DEP.NAME
FROM EMPLOYEE EMP, DEPARTMENT DEP
WHERE EMP.DEPARTMENT_ID = DEP.ID
ORDER BY EMP.NAME, DEP.ID;
/*QUESTION 19 - Query names of all employees together with id of department they work in, using JOIN*/
SELECT EMP.NAME, DEP.ID, DEP.NAME
FROM EMPLOYEE EMP 
JOIN DEPARTMENT DEP
ON EMP.DEPARTMENT_ID = DEP.ID
ORDER BY EMP.NAME, DEP.ID;
/*QUESTION 20 - Query name of every company together with every department
Personal thoughts: It is kinda weird question, as there is no relationship between company and departement*/
SELECT COM.NAME , DEP.NAME
FROM COMPANY COM, DEPARTMENT DEP
ORDER BY COM.NAME;
/*QUESTION 21 - Query name of every company together with departments without the 'Support' department*/
SELECT COM.NAME , DEP.NAME
FROM COMPANY COM, DEPARTMENT DEP
WHERE DEP.NAME <> 'SUPPORT'
ORDER BY COM.NAME;
/*QUESTION 22 - Query employee name together with the department name that they are not working in*/
SELECT EMP.NAME, EMP.DEPARTMENT_ID, DEP.NAME, DEP.ID
FROM EMPLOYEE EMP, DEPARTMENT DEP
WHERE EMP.DEPARTMENT_ID <> DEP.ID;
/*QUESTION 23 - Query company name together with other companies names 
LIKE:
GOOGLE Apple
GOOGLE IBM
Apple IBM
...
*/
SELECT COM.NAME , COM1.NAME
FROM COMPANY COM, COMPANY COM1
WHERE COM.NAME <> COM1.NAME
ORDER BY COM.NAME;
/*QUESTION 25 - Query names of every company and change the name of column to 'Company'*/
SELECT NAME AS COMPANY
FROM COMPANY;
/*QUESTION 26 - Query all employees that work in same department as Peter*/
SELECT *
FROM EMPLOYEE
WHERE DEPARTMENT_ID IN 
(SELECT DEPARTMENT_ID 
FROM EMPLOYEE 
WHERE NAME LIKE 'PETER') 
AND NAME NOT LIKE 'PETER';