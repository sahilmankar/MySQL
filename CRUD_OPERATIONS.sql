/*  Creating table */
CREATE TABLE IF NOT EXISTS tasks (
    task_id INT AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR(25) NOT NULL,
    start_date DATE,
    due_date DATE,
    status TINYINT NOT NULL,
    priority TINYINT NOT NULL,
    description TEXT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);  
/*  NOT EXISTS check is the table is alrady present in database or not, if present it will return false otherwise it create table
The task_id is an auto-increment column. If you use the INSERT statement to insert a new row into the table without specifying a value for the task_id column,
MySQL will automatically generate a sequential integer for the task_id starting from 1.
The title column is a variable character string column whose maximum length is 25. It means that you cannot insert a string whose length is greater than 25 into this column. 
The NOT NULL constraint indicates that the column does not accept NULL. In other words, you have to provide a non-NULL value when you insert or update this column.
The start_date and due_date are DATE columns. Because these columns do not have the NOT NULL constraint, they can store NULL.
The start_date column has a default value of the current date. In other words, if you don’t provide a value for the start_date column when you insert a new row,
the start_date column will take the current date of the database server.
The status and priority are the TINYINT columns which do not allow NULL.
The description column is a TEXT column that accepts NULL.
The created_at is a TIMESTAMP column that accepts the current time as the default value.
The task_id is the primary key column of the tasks table. It means that the values in the task_id column will uniquely identify rows in the table. */


CREATE TABLE newemployees (
    emp_no INT AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(20),
    last_name VARCHAR(20)
);
/*   This query will create table with three columns
     first is emp_no column which have AUTO_INCREMENT property
     then first name and lastname */


     /*  Inserting into table */
     INSERT INTO newemployees(first_name,last_name) VALUES('sahil','mankar'),('abhay','navle'),('shubham','teli');
     /*  It will insert three values in table */
     /*  we used AUTO_INCREMENT so it will automatically assign emp_no start from 1 */

     INSERT INTO newemployees(emp_no,first_name,last_name) VALUES(55,'tony','stark'),(6,'jhon','cena');
     /*  we can also give emp_no from user even it have AUTO_INCREMENT property */
     SELECT * FROM newemployees;

     /*  UPDATE 
        update  allows you to change the values in one or more columns of a single row or multiple rows.
    */

    UPDATE newemployees SET emp_no=4 WHERE first_name='tony' AND last_name='stark';
    /*  It will update the value of emp_no
        WHERE clause is use to specify condition */
    UPDATE newemployees SET first_name='rock' WHERE emp_no=6;

   /*  DELETE
       delete is used to delete data from a single table 
       we use WHERE clause in delete to specify the condition
 */

 DELETE FROM newemployees WHERE emp_no > 4;
 /*   this query will delete all employyes whose emp_no is greater than 4 */
 
 /*    DELETE FROM newemployees; /*this query  will delete all rows from table  */ 
 



 /*  RENAME TABLE is used to change the name of table */

 /*   Any table  that has foreign keys referenced to should avoided to be renamed 
 beacuse while performing delete or update operation on FOREIGN KEY constaiant return error */
 
 
 /* syntax - RENAME TABLE old_table_name TO new_table_name*/

 RENAME TABLE newemployees to emp;
 /*  It will change name of table  */

 /*  Alter TABLE 
      ALTER TABLE statement to add a column, alter a column, rename a column, drop a column and rename a table. */

      ALTER TABLE emp ADD age INT NOT NULL;
      /*   It will add new column to table emp named age */

      ALTER TABLE emp MODIFY last_name varchar(50) ;
/*  This will modify the limit of lastname from varchar(20) to varchar(50)   */

    ALTER TABLE emp CHANGE COLUMN age salary INT;
    /*  It will change column name age to salary */

    ALTER TABLE emp DROP COLUMN salary ;
    /*  This query will delete column of salary */

    ALTER TABLE emp RENAME TO EMPS;
    /*   It will change the name of table */

   /* TRUNCATE TABLE EMPS ; /* IT WILL DELETE ALL data inside table not a table defination*/
    
    /* DROP TABLE EMPS;  /* it will delete whole table*/

    
    





      
 
 

          
     
     

