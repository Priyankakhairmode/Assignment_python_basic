/*Question 1 : Explain the fundamental differences between DDL, DML, and DQL
commands in SQL. Provide one example for each type of command.
Ans: 
DDL - Data definition language - Defines and manages the structure of database objects like tables, schemas and indexes. 
create drop alter truncate
CREATE TABLE students (
    student_id INT PRIMARY KEY,
    name VARCHAR(50),
    age INT
    
DML- data Manupulation language- Handles data stored in tables 
insert delete update
eg . INSERT INTO students (student_id, name, age)
VALUES (1, 'Amit', 20);
 
 DQL- Data Query language- Retrieves data from the database without modifying it
 select
eg. SELECT name, age FROM students WHERE age > 18;*/

/*Question 2 : What is the purpose of SQL constraints? Name and describe three common types
of constraints, providing a simple scenario where each would be useful.	
 Ans: 
 SQL constraints are rules applied to table columns to enforce data integrity, consistency and accuracy within a database. 
 They ensure that only valid data is stored and help maintain relationships between tables.
Purpose of SQL Constraints
- Prevent invalid or duplicate data
- Enforce business rules at the database level
- Maintain referential integrity between related tables
- Reduce the need for manual data validation in applications
There are three types of constraints
Primary Key -  Ensures each row in a table has a unique identifier. Only one per table.
In a students table, student_id is a primary key to uniquely identify each student.
CREATE TABLE students (
    student_id INT PRIMARY KEY,
    name VARCHAR(50)
);

Unique -  Ensures all values in a column are different.
In a users table, the email column must be unique so no two users can register with the same email.
CREATE TABLE users (
    user_id INT PRIMARY KEY,
    email VARCHAR(100) UNIQUE
);

Foreign Key - Enforces a link between two tables by referencing a primary key in another table.
In an orders table, customer_id is a foreign key referencing the customers table to ensure orders are only placed by existing customers.
CREATE TABLE orders (
    order_id INT PRIMARY KEY,
    customer_id INT,
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id)
);*/

/*Question 3 :Explain the difference between LIMIT and OFFSET clauses in SQL. How
would you use them together to retrieve the third page of results, assuming each page
has 10 records?
LIMIT clause:- Specifies the maximum number of records to return.
OFFSET clause:- Skips a specified number of rows before starting to return results.
SELECT * FROM your_table
LIMIT 10 OFFSET 20;
This returns page 3, assuming:
• 	Each page has 10 records
• 	Page 1 → OFFSET 0
• 	Page 2 → OFFSET 10
• 	Page 3 → OFFSET 20
OFFSET = (page_number - 1) * records_per_page
OFFSET = (3 - 1) * 10 = 20 */

/* Question 4 : What is a Common Table Expression (CTE) in SQL, and what are its main
benefits? Provide a simple SQL example demonstrating its usage.
Ans:
A Common Table Expression (CTE) in SQL is a temporary result set that you can reference within a select, insert, update or delete  statement. 
It improves readability and modularity of complex queries, especially when dealing with subqueries or recursive logic.
Main Benefits of CTEs
• 	Improves readability: Makes complex queries easier to understand and maintain.
• 	Supports recursion: Useful for hierarchical or tree-structured data.
• 	Reusable logic: Can be referenced multiple times within the same query.
• 	Scoped execution: Exists only during the execution of the query.
WITH AverageSalary AS (
    SELECT AVG(salary) AS avg_salary
    FROM employees
)
SELECT name, salary
FROM employees, AverageSalary
WHERE employees.salary > AverageSalary.avg_salary;
Explanation:
• 	The  clause defines a CTE named Average salary.
• 	It calculates the average salary from the  Employee table.
• 	The main query then selects employees whose salary is above that average.*/


/* Question 5 : Describe the concept of SQL Normalization and its primary goals. Briefly
explain the first three normal forms (1NF, 2NF, 3NF).
Ans:
SQL Normalization is a process used to organize data in a relational database to reduce redundancy and improve data integrity. 
It involves structuring tables and relationships so that data is stored efficiently and consistently.
It Eliminate redundant data (e.g., storing the same data in multiple places)
Ensures data dependencies make sense (i.e., data is logically stored)
Improves data integrity and consistency
Simplifies maintenance and updates
First Normal Form (1NF)
- Rule: Each column must contain atomic (indivisible) values, and each record must be unique.
- Example Violation: A column storing multiple phone numbers like '123-456, 789-012'
- Fix: Split into separate rows or create a related table for phone numbers.
Second Normal Form (2NF)
- Rule: Must be in 1NF, and all non-key attributes must be fully dependent on the entire primary key.
- Example Violation: In a table with a composite key (student_id, course_id), storing student_name violates 2NF because it's only dependent on student_id.
- Fix: Move student_name to a separate students table.
Third Normal Form (3NF)
- Rule: Must be in 2NF, and all attributes must be directly dependent on the primary key — no transitive dependencies.
- Example Violation: A table with student_id, department_id, and department_name — department_name depends on department_id, not student_id.
- Fix: Move department_id and department_name to a separate departments table.*/

/*Question 6 : Create a database named ECommerceDB and perform the following
tasks:

1. Create the following tables with appropriate data types and constraints:
● Categories
○ CategoryID (INT, PRIMARY KEY)
○ CategoryName (VARCHAR(50), NOT NULL, UNIQUE)

● Products
○ ProductID (INT, PRIMARY KEY)
○ ProductName (VARCHAR(100), NOT NULL, UNIQUE)
○ CategoryID (INT, FOREIGN KEY → Categories)
○ Price (DECIMAL(10,2), NOT NULL)
○ StockQuantity (INT)
● Customers
○ CustomerID (INT, PRIMARY KEY)
○ CustomerName (VARCHAR(100), NOT NULL)
○ Email (VARCHAR(100), UNIQUE)
○ JoinDate (DATE)
● Orders
○ OrderID (INT, PRIMARY KEY)
○ CustomerID (INT, FOREIGN KEY → Customers)
○ OrderDate (DATE, NOT NULL)
○ TotalAmount (DECIMAL(10,2))

2. Insert the following records into each table
● Categories
CategoryID Category Name
1 Electronics
2 Books
3 Home Goods
4 Apparel

Products
ProductID ProductName CategoryID Price StockQuantity
ProductID ProductName CategoryID Price StockQuantity
101 Laptop Pro 1 1200.00 50
102 SQL
Handbook
2 45.50 200
103 Smart Speaker 1 99.99 150
104 Coffee Maker 3 75.00 80
105 Novel : The
Great SQL
2 25.00 120
106 Wireless
Earbuds
1 150.00 100
107 Blender X 3 120.00 60
108 T-Shirt Casual 4 20.00 300

Customers
CustomerID CustomerName Email Joining Date
1 Alice Wonderland alice@example.com 2023-01-10
2 Bob the Builder bob@example.com 2022-11-25
3 Charlie Chaplin charlie@example.com 2023-03-01
4 Diana Prince diana@example.com 2021-04-26 

Orders
OrderID CustomerID OrderDate TotalAmount
1001 1 2023-04-26 1245.50
1002 2 2023-10-12 99.99
1003 1 2023-07-01 145.00
1004 3 2023-01-14 150.00
1005 2 2023-09-24 120.00
1006 1 2023-06-19 20.00

*/

create database ECommerceDB;
show databases;
use ECommerceDB;
create table Categories (
CategoryID INT PRIMARY KEY, 
CategoryName VARCHAR(50) NOT NULL UNIQUE);

create table Products (
ProductID INT PRIMARY KEY, 
ProductName VARCHAR(100) NOT NULL UNIQUE, 
CategoryID INT,
Price DECIMAL(10,2) NOT NULL, 
StockQuantity INT,
foreign key (CategoryID) references Categories( CategoryID));

create table Customers(
CustomerID INT PRIMARY KEY,
CustomerName VARCHAR(100) NOT NULL, 
Email VARCHAR(100) UNIQUE, 
JoinDate DATE);

create table orders(OrderID INT PRIMARY KEY, CustomerID INT, OrderDate DATE NOT NULL, TotalAmount DECIMAL(10,2),
foreign key(customerID) references customers(customerID)
);

insert into Categories(CategoryID , CategoryName)
values(1, 'Electronics'),
(2, 'Books'),
(3, 'Home Goods'),
(4, 'Apparel');

insert into Products(ProductID,ProductName, CategoryID, Price, StockQuantity)
values(101, 'Laptop Pro', 1, 1200.00, 50),
(102, 'SQL Handbook',2, 45.50, 200),
(103, 'Smart Speaker', 1, 99.99, 150),
(104, 'Coffee Maker', 3, 75.00, 80),
(105, 'Novel : The Great SQL', 2, 25.00, 120),
(106, 'Wireless Earbuds', 1, 150.00, 100),
(107, 'Blender X', 3, 120.00, 60),
(108, 'T-Shirt Casual', 4, 20.00, 300); 

insert into customers( CustomerID , CustomerName, Email, JoinDate)
values(1, 'Alice Wonderland',  'alice@example.com', '2023-01-10'),
(2, 'Bob the Builder', 'bob@example.com', '2022-11-25'),
(3, 'Charlie Chaplin', 'charlie@example.com','2023-03-01'),
(4, 'Diana Prince', 'diana@example.com', '2021-04-26');

insert into orders (OrderID, CustomerID, OrderDate, TotalAmount)
values(1001, 1, '2023-04-26', 1245.50),
(1002, 2, '2023-10-12', 99.99),
(1003, 1, '2023-07-01', 145.00),
(1004, 3, '2023-01-14', 150.00),
(1005, 2, '2023-09-24', 120.00),
(1006, 1, '2023-06-19', 20.00);
show tables;


/*1. Create a table called employees with the following structure?
: emp_id (integer, should not be NULL and should be a primary key)Q
: emp_name (text, should not be NULL)Q
: age (integer, should have a check constraint to ensure the age is at least 18)Q
: email (text, should be unique for each employee)Q
: salary (decimal, with a default value of 30,000)*/
#Write the SQL query to create the above table with all constraints.
 
create table employees(
emp_id int primary key not null,
emp_name varchar(50) not null,
age int check(age >= 18),
email varchar(50) unique,
salary float 
 );

/*Question 7 : Generate a report showing CustomerName, Email, and the
TotalNumberofOrders for each customer. Include customers who have not placed
any orders, in which case their TotalNumberofOrders should be 0. Order the results
by CustomerName.*/
SELECT c.CustomerName, c.Email, COUNT(o.OrderID) AS TotalNumberOfOrders
FROM Customers c
LEFT JOIN Orders o ON c.CustomerID = o.CustomerID
GROUP BY c.CustomerID, c.CustomerName, c.Email;

/*Question 8 : Retrieve Product Information with Category: Write a SQL query to
display the ProductName, Price, StockQuantity, and CategoryName for all
products. Order the results by CategoryName and then ProductName alphabetically.
*/

 SELECT p.ProductName, p.Price, p.StockQuantity, c.CategoryName
FROM Products p
INNER JOIN Categories c ON p.CategoryID = c.CategoryID
ORDER BY c.CategoryName, p.ProductName;



/*2.Explain the purpose of constraints and how they help maintain data integrity in a database. 

 constarints are the rules that enforces the integrity and validity of the data in the table
Constraints define the conditions or restrictions on columns or group of columns ensuring that the data meets certain criteria.
it also help to maintain data accuracy,consistency and reliability in dataset

prvide examples of common types of constraints.
Primary Key: A Primary Key constarints uniquely identifies each record in the table. It must contain unique values and can not contain NULL values. 
Example 
We have a table Students with columns StudentID, FirstName and LastName.We want StudentID to be the primary key.*/

CREATE TABLE students(
StudentID INT PRIMARY KEY,
FirstName VARCHAR(255),
LastName VARCHAR(255)
 );
 INSERT INTO Students(StudentID, FirstName, LastName) VALUES
 (1,'Priyanka', 'Khairmode'),
 (2,'Asmi', 'singh'),
 (3,'Anvi', 'Rathod');
 select * from students;
 
 /*Foreign Key : A Foreign Key constarints establishes a relationship between two tables. 
 It ensures referential integrity by enforcing a link between foreign key column in one table and primary key column in another table 
 We have two tables Student and course. we want to link them  using the courseID column as a foreign key in the Course table */
 
 CREATE TABLE students(
StudentID INT PRIMARY KEY,
FirstName VARCHAR(255),
LastName VARCHAR(255)
 );
CREATE TABLE Courses(
CourseID INT PRIMARY KEY,
Delivery_Mode VARCHAR(255),
Faculty VARCHAR(255),
StudentID INT,
FOREIGN KEY (StudentID) REFERENCES Students(StudentID)
 ); 
 INSERT INTO Students(StudentID, FirstName, LastName) VALUES
 (1,'Priyanka', 'Khairmode'),
 (2,'Asmi', 'singh'),
 (3,'Anvi', 'Rathod');
 INSERT INTO Courses(CourseID, Delivery_Mode, Faculty, StudentID) VALUES
 (100,'Live','Ajay',1),
 (200,'Reccorded','Vijay', 2),
 (300,'Live','Bijay',3);
 select *from Students;
 select *from Courses;
 describe Courses;
 select s.StudentID, s.FirstName, s.LastName,
 c.CourseID, c.Delivery_Mode, c.Faculty
 from Students s
 join Courses c on s.StudentID=c.StudentID;
 /*Not null: The not null constraint ensures that the column can not contain null values. It requires every row to have values.
 Suppose we have a table Employees with a salary column that can not be null*/
 create table employees(
emp_id int primary key,
emp_name varchar(50),
salary Decimal(10,2) not null
 );
 insert into employees(emp_id, emp_name,salary) values
 (101,'ABC', 70000.50),
 (102,'DEF', 80000.50);
 select *from employees;
 /*Unique: The unique constraints ensures that all values in the columns are unique. it will allow null values
 suppose we have table courses have column StudentID that must be unique*/
 
 CREATE TABLE Courses(
Course_ID INT PRIMARY KEY,
Delivery_Mode VARCHAR(255),
Faculty VARCHAR(255),
Student_ID INT unique 
);
 select *from Courses;
 INSERT INTO Courses(Course_ID, Delivery_Mode, Faculty, Student_ID) VALUES
 (100,'Live','Ajay',1),
 (200,'Reccorded','Vijay', 2),
 (300,'Live','Bijay',3);
 /* check : the check constraints defines a condition , and the values must meet the condition when entered into the column.
 it allows you to specify custom validation rules*/
  
 create table employees(
emp_id int primary key not null,
emp_name varchar(50) not null,
age int check(age >= 18)
 );
insert into employees(emp_id,age) values
(101,'ABC', 19),
(102,'DEF', 20);
 select * from employees;
/*Default: the default constraint provide a default value for a column when no value is specified during an insert operation 
suppose we have teaching faculty that default to Ajay*/
CREATE TABLE Courses(
Course_ID INT PRIMARY KEY,
Delivery_Mode VARCHAR(255),
Faculty VARCHAR(255) default 'Ajay',
Student_ID INT unique 
);
 select *from Courses;
 INSERT INTO Courses(Course_ID, Delivery_Mode, Faculty, Student_ID) VALUES
 (100,'Live','Ajay',1),
 (200,'Reccorded','Vijay', 2),
 (300,'Live',3);

/*3 Why would you apply NOT NULL constraint to a column? Can a primary Key contain NULL value?
The not null constraint ensures that the column can not contain null values. It requires every row to have values.
Suppose we have a table Employees with a salary column that can not be null.
A Primary Key constarints uniquely identifies each record in the table. 
It is a unique identifier and must contain unique values and can not contain NULL values. 
We have a table Students with columns StudentID, FirstName and LastName.
We want StudentID to be the primary key which can not contain null value.*/
 
 
 create table employees(
emp_id int primary key,
emp_name varchar(50),
salary Decimal(10,2) not null
);
  
 CREATE TABLE students(
StudentID INT PRIMARY KEY,
FirstName VARCHAR(255),
LastName VARCHAR(255)
);
 # while inserting values in the table if we put null for StudentID, it will trigger error ie. column can not be null
 
/* 4 Explain the steps and SQL commands used to add or remove constraints on an existing table. Provide an
example for both adding and removing a constraint.
*/
# adding constarints
alter table Students
add constraint pk_students primary key 
(StudentID);

alter TABLE Courses(
add constraint fk_CourseID FOREIGN KEY,
(StudentID),
REFERENCES Students(StudentID)
); 

alter table Students
add constraint unique_studentID unique 
(StudentID);

alter table Students
add constraint check_student_intake 
check(Student_intake >=90);

alter table Students
modify column Course_name Varchar(30) not Null;

# removing constarints
alter table Students
drop constraint pk_students;

alter TABLE Courses 
drop constraint fk_CourseID; 

alter table Students
drop constraint unique_studentID;

alter table Students
drop constraint check_student_intake;

alter table Students
modify column Course_name Varchar(30) Null;

/*5 . Explain the consequences of attempting to insert, update, or delete data in a way that violates constraints.
Provide an example of an error message that might occur when violating a constraint.
when atempting to insert, update and delete data in such a way that violates constraints, the database management system (DBMS)
enforces rules and generates error messages.*/
# primary key violation
create table Courses(
Course_Id char(10) primary key,
Course_name Varchar(30) not Null,
Delivery_Mode Varchar(30),
Student_intake int check(Student_intake >=90),
Faculty Varchar(30)
);
insert into Courses values
("PW101","Data Analytics","Live","90","Suraj"),
("PW101","FS Data science","Live","90","Vijay"),
("PW103","Web Development","Hybrid","90","Vijay"),
("PW104","Generative AI","Hybrid","90","Surabh");
# output: Error Code: 1062 Duplicate entry 'PW101' for key 'Courses.Courses_Id '

# foreign key violation
create table Customer(
Customer_Id int primary key);
create table Orders(
Order_Id int primary key, Customer_Id int,
foreign key(customer_Id)
references Customer(Customer_Id) 
);
#insert into Customer(Customer_Id)
#values(001);  
insert into orders (Order_Id, Customer_Id)
values(1,001); 

#Not null violation
create database Market;
use Market;
create table Products(
Product_ID int primary key,
Product_Name varchar(30) not null);

insert into products(Product_ID, Product_Name)
values (100,NULL);
#Output: Error Code: 1048 Column 'Product_Name' cannot be null
 
# Unique violation
create database Market;
use Market;
create table Products(
Product_ID int primary key unique,
Product_Name varchar(30) not null);

insert into products(Product_ID, Product_Name)
values (100, 'ABC'),
(100,'EFG');
#Output: Error Code: 1062 Duplicate entry '100' for Key 'products.PRIMARY'

#Check constarints violation
create table Accounts(
Account_ID int primary key,
Balance decimal(10,2)
check (balance>=0)
);
insert into Accounts(Account_ID, Balance)
values(2775,-500);
#Output: Error Code: 3819 Check constraint 'Accounts_chk_1' is violate.

/*6. You created a products table without constraints as follows:

CREATE TABLE products (

    product_id INT,

    product_name VARCHAR(50),

    price DECIMAL(10, 2));
Now, you realise that?
: The product_id should be a primary keyQ
: The price should have a default value of 50.00*/

CREATE TABLE products(
product_id INT,
product_price float
);
ALTER TABLE product
ADD constraint pk_product primary key
(product_id);

ALTER TABLE product
ALTER column product_price set DEFAULT 50;
 
/* 7 You have two tables:
Write a query to fetch the student_name and class_name for each student using an INNER JOIN.*/

create database student_data;
use student_data;
create table Student(
student_id int primary key, 
student_name varchar(20),
class_id int);
create table Classes(
class_id int, 
class_name varchar(20));
insert into Student(student_id, student_name,class_id) values
(1,'Alice', 101),
(2,'Bob', 102),
(3,'Charlie', 103);
select *from Student;
insert into Classes( class_id, class_name)values
(101, 'Maths'),
(102, 'Science'),
(103, 'History');
select *from Classes;

select s.student_name, c.class_name
from Student s
join Classes c on s.class_id = c.class_id;

/* 8  Consider the following three tables:
Write a query that shows all order_id, customer_name, and product_name, ensuring that all products are
listed even if they are not associated with an order 

Hint: (use INNER JOIN and LEFT JOIN)5 */

create database order_management;
use order_management;

CREATE table Orders( 
order_id int primary key,
order_date date,
Customer_id int,
foreign key (customer_id) references Customers(customer_id));

CREATE table Customers(
customer_id int primary key,
customer_name varchar(30)
);
CREATE table Products(
product_id int primary key,
product_name varchar(30),
order_id int,
foreign key (order_id) references Orders(order_id));

insert into Orders( order_id, order_date, customer_id) values
(1, '2024-01-02', 1),
(2, '2024-01-05', 2);

select *from orders;

insert into Customers( customer_id, customer_name) values
(101, 'Alice'),
(102, 'Bob');

select *from Customers;

insert into Products( product_id, product_name, order_id) values
(1, 'laptop', 1),
(1, 'phone', 'NULL');

select *from Products;

# order_id, customer_name, product_name
select o.order_id, c.customer_name, p.product_name 
from orders o
inner join Customers c on c.Customer_id = o.Customer_id
left join Products p on o.order_id = p.order_id

union select null, null, p.product_name
from products p
where p.order_id is null;

/*9 Given the following tables:
Write a query to find the total sales amount for each product using an INNER JOIN and the SUM() function.*/

create database SalesProduct;
use SalesProduct;
create table Sales( 
sale_id int primary key, 
product_id int, 
amount int);

create table Product(
product_id int primary key,
product_name varchar(50)
);

insert into Sales(sale_id, proct_id) values
(1, 101, 500),
(2, 102, 300),
(3, 103, 700);

insert into Product(product_id, product_name) values
(101, 'laptop'),
(102, 'phone');

select * from Sales;
select * from product;

# total sale amount using inner join and sum
select p.product_name, SUM(s.amount) as total_sale
from Sales s 
inner join Product p on s.product_id= p.product_id
group by p.product_name;

/* 10 You are given three tables:
Write a query to display the order_id, customer_name, and the quantity of products ordered by each
customer using an INNER JOIN between all three tables.
Note - The above-mentioned questions don't require any dataset.
*/
create database sale;
use sale;
CREATE table Orders( 
order_id int primary key,
order_date date,
Customer_id int);

CREATE table Customers(
customer_id int primary key,
customer_name varchar(30)
);
CREATE table Order_Details(
order_id int primary key,
product_id int,
quantity int);

insert into Orders( order_id, order_date, customer_id) values
(1, '2024-01-02', 1),
(2, '2024-01-05', 2);

select *from orders;

insert into Customers( customer_id, customer_name) values
(101, 'Alice'),
(102, 'Bob');

select *from Customers;

insert into Order_Deatils( product_id, product_name, order_id) values
(1, 101, 2),
(1, 102, 1),
(2, 101, 3);

select *from Order_Details;

#  total sales amount for each product using an INNER JOIN and the SUM()
select o.order_id, c.customer_name, od.quantity
from Orders o
inner join Customers c on c.Customer_id = o.Customer_id
inner join Order_Details od on o.order_id = od.order_id;

/* SQL commands
1-Identify the primary keys and foreign keys in maven movies db. Discuss the differences

2- List all details of actors

3 -List all customer information from DB.

4 -List different countries.

5 -Display all active customers.

6 -List of all rental IDs for customer with ID 1.

7 - Display all the films whose rental duration is greater than 5 .

8 - List the total number of films whose replacement cost is greater than $15 and less than $20.

9 - Display the count of unique first names of actors.

10- Display the first 10 records from the customer table .

11 - Display the first 3 records from the customer table whose first name starts with ‘b’.

12 -Display the names of the first 5 movies which are rated as ‘G’.

13-Find all customers whose first name starts with "a".

14- Find all customers whose first name ends with "a".

15- Display the list of first 4 cities which start and end with ‘a’ .

16- Find all customers whose first name have "NI" in any position.

17- Find all customers whose first name have "r" in the second position .

18 - Find all customers whose first name starts with "a" and are at least 5 characters in length.

19- Find all customers whose first name starts with "a" and ends with "o".

20 - Get the films with pg and pg-13 rating using IN operator.

21 - Get the films with length between 50 to 100 using between operator.

22 - Get the top 50 actors using limit operator.

23 - Get the distinct film ids from inventory table.*/
