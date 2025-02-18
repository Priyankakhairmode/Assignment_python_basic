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
