
/*  1.Inner JOIN -select the records from tables which have matching values 
     The inner join clause compares each row from the first table with every row from the second table.*/

/*  Creating two tables */

CREATE TABLE members (
    member_id INT AUTO_INCREMENT,
    name VARCHAR(100),
    PRIMARY KEY (member_id)
);

CREATE TABLE committees (
    committee_id INT AUTO_INCREMENT,  /* AUTO_INCREMENT value start with 1 */
    name VARCHAR(100),
    PRIMARY KEY (committee_id));

INSERT INTO members(name)
VALUES('John'),('Jane'),('Mary'),('David'),('Amelia');

INSERT INTO committees(name)
VALUES('John'),('Mary'),('Amelia'),('Joe'),('sahil');


SELECT m.member_id, c.committee_id, c.name AS name
FROM members m INNER JOIN committees c ON m.name = c.name;
/*  It will show matching  names from both tables */

SELECT m.member_id, c.committee_id, c.name AS name
FROM members m INNER JOIN committees c USING(name); 
/*  USING keyword used in  JOIN when we use = operator for comparision and both tables have same column name  */


/*  LEFT JOIN  */
/*   the left join selects all data from the left table whether there are matching rows exist in the right table or not */
/*    if mathching pair is not exist  ie will show NULL as its value */

SELECT m.member_id,m.name as name, c.committee_id, c.name AS name
FROM members m LEFT JOIN committees c  ON m.name = c.name;


SELECT m.member_id,m.name as name, c.committee_id, c.name AS name
FROM members m LEFT JOIN committees c  ON m.name = c.name WHERE c.name IS  NULL;
/*  It will show the values from right table which is NULL  */
/*  i.e. members who are not commitee memebers */



/*  The right join clause selects all rows from the right table and matches rows in the left table. */
/*    if mathching pair is not exist  ie will show NULL as its value */
SELECT m.member_id, m.name AS member, c.committee_id, c.name AS committee FROM members m
RIGHT JOIN committees c USING (name);
/*  It will select all rows from right table which is committees and find matching values in left table */


SELECT m.member_id, m.name AS member, c.committee_id, c.name AS committee FROM members m
RIGHT JOIN committees c USING (name) WHERE m.name is NULL;

/*  This query will show the right table rows which dosent have matching value in left table  */


/*  CROSS JOIN */
SELECT m.member_id, m.name AS member, c.committee_id, c.name AS committee FROM members m
CROSS JOIN committees c ;
/*  It will show combination of records in way that resulting query will show 
       first table rows* second table rows   number of rows */


/* GROUP BY 
The GROUP BY statement groups rows that have the same values */



SELECT t1.orderNumber,t1.status,SUM(quantityOrdered * priceEach) as total FROM orders t1
INNER JOIN orderdetails t2  ON t1.orderNumber = t2.orderNumber GROUP BY status;
/*  SUM is aggrigate function which reurns sum 
    by using INNER JOIN we select matching value rows from tables
    GROUP BY groups row which have matching values  */


SELECT o.orderNumber,orderDate,orderLineNumber,productCode,productName,quantityOrdered,priceEach FROM orders o
INNER JOIN orderdetails od  ON o.orderNumber =od.orderNumber
INNER JOIN products USING (productCode)
ORDER BY orderNumber, orderLineNumber;

/* it will take matching values from tables and ordering them by ordernumber and then orderLineNumber  */

SELECT orderNumber, productName, msrp, priceEach FROM products p
INNER JOIN orderdetails o ON p.productcode = o.productcode AND p.msrp > o.priceEach WHERE p.buyPrice > 50 ;

/*  It will join tables based on conditions  */

SELECT status, COUNT(*) FROM orders
GROUP BY status;
/*  it will give no of orders in each  status   */

SELECT orderNumber,SUM(quantityOrdered * priceEach) AS total
FROM orderdetails
GROUP BY orderNumber
ORDER BY total DESC ;         /*by adding LIMIT 10 to query it will show first highest 10 totals */ 
/*  this query shows total amount of each order and arranging it in descending order of that total */


SELECT YEAR(orderDate) AS year,SUM(quantityOrdered * priceEach) AS total FROM orders
INNER JOIN orderdetails  USING (orderNumber) WHERE status = 'cancelled'
GROUP BY year ORDER BY total DESC;

/* YEAR() Function returns a year from a date of datatype date 
   SUM()-> returns sum 
   INNER JOIN selects the matching  rows from table orders and orderdetails using orderNumber
   WHERE check the status ='cancelled ' from table  orders
   GROUP BY clause group selected items by year  
   ORDER BY clause arrange resulting table such that the highest order cancelled year appers first and so on...  */


/*  HAVING clause is used to  filter groups returned by GROUP BY clause */

SELECT  YEAR(orderDate) AS year,SUM(quantityOrdered * priceEach) AS total FROM orders
INNER JOIN orderdetails  USING (orderNumber) WHERE status = 'Shipped'
GROUP BY  year HAVING year >= 2003;

/*    INNER JOIN selects the matching  rows from table orders and orderdetails using orderNumber
       GROUP BY groups the data by year and HAVING clause select the data which is >=2003  */

/*  subquery is a query nested within another query  */

SELECT lastName, firstName FROM employees
WHERE officeCode IN (SELECT officeCode FROM offices WHERE country = 'USA');

/*  this query first execute subquery then main query */
/*  It will display lastname and firstname of employees whose office is in USA */



SELECT  YEAR(orderDate) year, ROUND(SUM(quantityOrdered*priceEach )) totalOrderValue FROM orders,orderdetails
GROUP BY  year WITH ROLLUP;

/*  ROLLUP adds extra rows to the resultset that represent super-aggregate summaries 
    In example ROLLUP will add extra row with NULL value as year 
    and perform aggrigate function i.e. SUM  on column of  totalOrderValue  */


/*  The EXISTS operator is a Boolean operator that returns either true or false */

SELECT customerNumber, customerName FROM customers
WHERE  EXISTS(SELECT 1 FROM orders WHERE orders.customernumber = customers.customernumber);

/* for each row in the customers table, the query checks the customerNumber in the orders table. 
If the customerNumber, which appears in the customers table, exists in the orders table, the subquery returns the first matching row. 
As a result, the EXISTS operator returns true and stops examining the orders table */


