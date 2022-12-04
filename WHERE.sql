/*  This file contains where clause examples AND ,OR ,IN,NOT IN,BETWEEN,LIKE Operators */

/*  where allows us to put conditoin in sql query */

SELECT * FROM orders WHERE status='Shipped';
 /*  It will return all columns whose staus is Shipped */

SELECT * FROM employees WHERE jobTitle="sales Rep" AND officeCode=3;
/*  And is used to give multiple conditions in where clause */
/*  If both conditons in and is true then it will return query result */


SELECT employeeNumber,lastName,firstName,officeCode,jobTitle FROM employees 
WHERE jobTitle='Sales Rep' OR officeCode=3 ORDER BY officeCode DESC ;
/*  OR Operator will execute if any one of condition is true */

SELECT firstName, lastName, officeCode FROM employees
WHERE firstName BETWEEN 'a' AND 's' ORDER BY firstName;
 
/*  Between Operator is used to specify range */


/*  we have two wildcard  CHARACTERS ADD
    1. % :which can combination of zero or more CHARACTERS
    2. _ :It only represent a single character */

SELECT firstName, lastName, officeCode FROM employees
WHERE firstName LIKE 'm%' ORDER BY lastName;
/*  Like operator is used to find matches   */
/*  to find matches we use % symbol with which string wee want match */
/*   */

SELECT employeeNumber, lastName, firstName FROM employees
WHERE lastname LIKE '%on%';

/*  It will show all lastName containing 'on' as substring */

SELECT customerNumber,customerName,country FROM customers
WHERE country LIKE 'U_A';
/*  It will show rows which have the single CHARACTER which is presentin 'U_A'  */

SELECT customerNumber,customerName,country FROM customers
WHERE country NOT LIKE 'U_';
/*  It will show all rows which dosent have contry name started with U and have two characters  */

SELECT productCode, productName FROM products
WHERE productCode LIKE '%\_20%';  /*  It will show values which contain _20 value */
/*  \ -escape character */
/*  Escape CHARACTER in like used in case of value contain % or _ sign */


SELECT firstName,lastName, officeCode FROM employees
WHERE officeCode IN (1, 5, 7) ORDER BY  officeCode;
/*  the IN Operator check the value inside list if value present it returns true */

SELECT firstName,lastName, officeCode FROM employees
WHERE officeCode IN (2,3,1) ORDER BY  firstName;

SELECT lastName,firstName,reportsTo FROM employees
WHERE reportsTo IS NULL; /*  or reportsTO!= NULL */

/*  IS NULL is used to check if NULL value is present in column */  

SELECT customerNumber,amount FROM payments      /*SELECT customerNumber,amount FROM payments 
                                                    WHERE  amount BETWEEN  10000 AND 25000;
                                                     both queries return same values  */
WHERE  amount  >= 10000 AND amount <=25000;


SELECT orderNumber,requiredDate,status FROM orders
WHERE requireddate BETWEEN 
 CAST('2003-01-01' AS DATE) AND  CAST('2003-05-31' AS DATE);
 /*  Here cast is used for typecasting
      we use CAST() FUNCTION to  explicitly cast string into DATE type
      This query prints the dates BETWEEN range */
 



/*  we can use comparison operators in where clause */

SELECT lastname,firstname,jobtitle FROM employees 
WHERE jobtitle <> 'Sales Rep';

/*  This operator <> means not equal to same as != */

SELECT officeCode,city, phone,country FROM offices
WHERE country NOT IN ('USA' , 'France')
ORDER BY city;
/*  Not IN  is opposite of IN operator it will show the values which are not given in list  */


