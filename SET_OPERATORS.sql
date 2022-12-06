
/*  1. UNION OPERATOR */
/*  The UNION operator is used to combine the result-set of two or more SELECT statements. */

SELECT firstName, lastName FROM employees 
UNION SELECT contactFirstName,  contactLastName FROM customers;
/*  This query will combine firstname and lastname of empoyees and customers */
/*  it bydefault use first table column names as resulting table column name */

SELECT firstName, lastName FROM employees 
UNION ALL SELECT contactFirstName,  contactLastName FROM customers; /*  UNION ALL does not remove any duplicate values */

SELECT CONCAT(firstName ,' ',lastName) fullname FROM employees 
UNION SELECT  CONCAT(contactFirstName,' ',contactLastName)  FROM customers ORDER BY fullname;
/*  this query concat the firstname and lastname as fullname ADD
    then concat contactFirstName and contactLastName ADD
    then it will combine both resulting sets as fullname  
    and order it by fullname */

SELECT CONCAT(firstName, ' ', lastName) fullname, 'Employee' as contactType FROM employees 
UNION SELECT CONCAT(contactFirstName, ' ', contactLastName),'Customer' FROM customers
ORDER BY fullname DESC;
/*  we added additional column   contactType for differntiate between customer and employee
    orede it by descending order of fullname*/

/*  2.INTERSEECT - it means it select common VALUES from selected tables return distinct rows
     MySQL dosent support INTERSECT operator but we can emulate by USING 
      INNER JOIN and DISTINCT ADD */
  
  /*  DISTINCT select UNIQUE values from both TABLESPACE
     INNER JOIN select matching values from both table */

CREATE TABLE Student(id INT,name VARCHAR(20));
INSERT INTO Student VALUES(1,'abhay'),(2,'sahil'),(3,'shubham'); 

CREATE TABLE Student2(id INT,name VARCHAR(20));
INSERT INTO Student2 VALUES(4,'abhay'),(5,'kunal'),(6,'rohit'),(8,'abhay'); 

SELECT name FROM Student INNER JOIN Student2 USING(name);
/*  the query INNER JOIN both tables and then select DISTINCT values from it */

