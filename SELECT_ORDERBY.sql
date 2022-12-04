
/* This is a file of basic MySQL SELECT ,ORDER BY,DISTINCT,LIMIT clause */


USE classicmodels;  /* USE keyword is used to connect to DATABASE */

SHOW TABLES;        /*  SHOW keyword is used to show all tables in database */

/*  SELECT statement is used to show  rows or columns from table */

SELECT lastname FROM employees; /*  It will display lastname column  FROM employee table  */

/*  ORDER BY is used to arrange result of query in ascending or descending order   */


SELECT employeeNumber,
lastName,
firstName,                 /* It will show mentioned columns from table  */
jobTitle 
FROM employees;

SELECT * FROM employees;  /*  It will show all columns of employees table  */

SELECT NOW();    /*  It will display current date and time */

SELECT 5+8+88;   /*It will show sum of these numbers */

SELECT CONCAT('sahil',' ','mankar'); /*  this function concates string */

/*  column_alias is used to change a column name of resulting column 
       AS keyword is used to afte expression and before column_ alias name  */

SELECT 5+4+8 AS sum;  /*  It will return output in column name sum */
SELECT NOW() as current_datetime; 

SELECT CONCAT('sahil ','mankar') as name;
SELECT CONCAT( lastName, firstname) AS Fullname FROM employees;
/*  concatenation of COLUMN */



SELECT CONCAT_WS(', ', lastName, firstname) AS Fullname FROM employees;
/*  we can concatenate two  or more columns  with a specefied seprator BETWEEN COLUMN VALUES */


SELECT lastname FROM employees ORDER BY lastname ASC;  /* It will show lastname column by ascending order  */

SELECT lastname FROM employees ORDER BY lastname DESC; /* It will show lastname column by decending order  */

SELECT customerNumber, paymentDate, amount FROM payments ORDER BY amount DESC; 
/*  It will show selected columns from table and arranged in descending order of amount  */

SELECT customerNumber, paymentDate, amount FROM payments ORDER BY amount ; 
/*  for ascending order asc keyword is not mandatory to mension */
/*  It will show selected columns from table and arranged in ascending order of amount  */

SELECT customerNumber, paymentDate, amount FROM payments ORDER BY customerNumber ASC,amount DESC ; 


SELECT orderNumber,productCode,quantityOrdered*priceEach as Total FROM orderdetails ORDER BY Total DESC;
/*  this query create new column named Total and order it by descending order of Total column */

SELECT 
    orderNumber, status FROM orders
ORDER BY FIELD(status,    /*  first mention the column in list */
        'In Process',
        'On Hold',
        'Cancelled',
        'Resolved',
        'Disputed',
        'Shipped') ;  /*  It will order by FIELD(list) that we provided it  */
                      /*  We can add DESC keyword to reverse the order */
                      
/*  NULL means no value i.e.dosen't exist  */
/*  if we order by ascending order the row which contains NULL value will apper first before any value   */
/* even if it is 0 or negative */



/*  DISTINCT clause */
/*  distinct clause is used to remove duplicate rows */

SELECT lastName FROM employees ORDER BY lastName;
/*  It will print all rows of COLUMN lastname even if it contain duplicates */

SELECT DISTINCT  lastname FROM employees ORDER BY lastName;
/*  It will remove duplicate occurances of lastname */

SELECT DISTINCT country,state,city FROM customers WHERE state IS NOT NULL ORDER BY country;/*  we can also use state <> NULL */

/* it will show rows with differnt values  */


SELECT customerNumber, customerName, creditLimit FROM customers
ORDER BY creditLimit DESC LIMIT 5;
/*  LIMIT  is used to return how many rows user want to show  */

SELECT customerNumber, customerName, creditLimit FROM customers
ORDER BY creditLimit  LIMIT 5;
/*  it will show first five entries in table by creditLimit */

SELECT customerNumber, customerName, creditLimit FROM customers
ORDER BY creditLimit DESC LIMIT 1;
/*  It will show only one row which have heighest creditLimit */

SELECT DISTINCT state FROM customers WHERE state IS NOT NULL LIMIT 5;
/*  it will show first five different states which value is not NULL */


SELECT  COUNT(*) as TOTAL_ROWS FROM employees; /*  It will return total no of rows in table */








                    
