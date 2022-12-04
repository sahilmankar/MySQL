/*  This file contains where clause examples */

/*  where allows us to put conditoin in sql query */

SELECT * FROM orders WHERE status='Shipped';
 /*  It will return all columns whose staus is Shipped */

SELECT * FROM employees WHERE jobTitle="sales Rep" AND officeCode=3;
/*  And is used to give multiple conditions in where clause */
/*  If both conditons in and is true then it will return query result */


SELECT employeeNumber,lastName,firstName,officeCode,jobTitle FROM employees 
WHERE jobTitle='Sales Rep' OR officeCode=3 ORDER BY officeCode DESC ;
/*  OR condition will execute if any one of condition is true */

SELECT firstName, lastName, officeCode FROM employees
WHERE firstName BETWEEN 'a' AND 's' ORDER BY firstName;
 
/*  Between keyword is used to specify range */

SELECT firstName, lastName, officeCode FROM employees
WHERE firstName LIKE 'm%' ORDER BY lastName;
/*  Like operator is used to find matches   */
/*  to find matches we use % symbol with which string wee want match */
/*   */

SELECT firstName,lastName, officeCode FROM employees
WHERE officeCode IN (1, 5, 7) ORDER BY  officeCode;
/*  the IN keyword check the value inside list if value present it returns true */

SELECT firstName,lastName, officeCode FROM employees
WHERE officeCode IN (2,3,1) ORDER BY  firstName;

SELECT lastName,firstName,reportsTo FROM employees
WHERE reportsTo IS NULL;
/*  IS NULL is used to check if NULL value is present in column */  

SELECT customerNumber,amount FROM payments 
WHERE amount >= 10000 AND amount <=25000;

/*  we can use comparison operators in where clause */

SELECT lastname,firstname,jobtitle FROM employees 
WHERE jobtitle <> 'Sales Rep';

/*  This operator <> means not equal to same as != */


