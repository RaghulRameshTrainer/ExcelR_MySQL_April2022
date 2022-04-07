use retail;


CREATE TABLE customer1
(
cust_id INT,
custname VARCHAR(100),
age INT,
city VARCHAR(100),
contact VARCHAR(100)
);

INSERT INTO customer1(custname,age) VALUES('Manoj',500);

SELECT * FROM customer1;

-- CONSTRAINTS:
-- NOT NULL
-- UNIQUE
-- PRIMARY KEY
-- FOREIGN KEY
-- CHECK
-- DEFAULT


CREATE TABLE customer2
(
cust_id INT NOT NULL,
custname VARCHAR(100),
age INT,
city VARCHAR(100),
contact VARCHAR(100)
);

INSERT INTO customer2(cust_id,custname,age) VALUES(100,'Manoj',500);

SELECT * FROM CUSTOMER2;

CREATE TABLE customer3
(
cust_id INT NOT NULL,
custname VARCHAR(100) UNIQUE,
age INT,
city VARCHAR(100),
contact VARCHAR(100)
);

INSERT INTO customer3(cust_id,custname,age) VALUES(101,'Raghul',30);

SELECT * FROM CUSTOMER3;

CREATE TABLE customer4
(
cust_id INT PRIMARY KEY,
custname VARCHAR(100) UNIQUE,
age INT,
city VARCHAR(100),
contact VARCHAR(100)
);


INSERT INTO customer4(cust_id,custname,age) VALUES(102,'Ashish',30);

SELECT * FROM CUSTOMER4;

CREATE TABLE transaction_tbl
(
trans_id INT primary KEY,
cust_id INT,
product_name VARCHAR(100),
amount DECIMAL(10,2),
trans_date DATE,
FOREIGN KEY (cust_id) REFERENCES customer4(cust_id));

INSERT INTO transaction_tbl VALUES(1000,101,'Mobile',25000,current_date());
INSERT INTO transaction_tbl VALUES(1001,102,'AC',55000,current_date());

CREATE TABLE customer5
(
cust_id INT PRIMARY KEY,
custname VARCHAR(100) UNIQUE,
age INT,
city VARCHAR(100),
contact VARCHAR(100),
CHECK(age>0 and age<=100)
);

INSERT INTO customer5(cust_id,custname,age) VALUES(101,'Karthick',1);

SELECT * FROM customer5;

CREATE TABLE customer6
(
cust_id INT PRIMARY KEY,
custname VARCHAR(100) UNIQUE,
age INT,
city VARCHAR(100) DEFAULT 'PUNE',
contact VARCHAR(100),
CHECK(age>0 and age<=100)
);

INSERT INTO customer6(cust_id,custname,age) VALUES(101,'Karthick',1);
SELECT * FROM customer6;
INSERT INTO customer6(cust_id,custname,age,city) VALUES(102,'Raghul',100,'ÇHENNAI');

SELECT * FROM customer6;
SET sql_safe_updates=0;

UPDATE customer SET city='DELHI' WHERE city='ÇHENNAI';

update customer SET city='CHENNAI', registered_date=current_date() WHERE city='DELHI';

UPDATE customer SET age=100 WHERE city IN ('bangalore','hyderabad');

DELETE FROM customer6 WHERE city='CHENNAI';

-- ALTER STATEMENTS

CREATE TABLE customer_details (
custid INT,
fname VARCHAR(100),
lname VARCHAR(100),
age INT,
contact VARCHAR(100)
);

-- RENAME THE TABLE

RENAME TABLE customer_details to customer_data; 

DESC customer_data;
ALTER TABLE customer_data
ADD COLUMN city VARCHAR(100);

ALTER TABLE customer_data
DROP COLUMN lname;

ALTER TABLE customer_data
RENAME COLUMN fname to name;

ALTER TABLE customer_data
MODIFY COLUMN custid INT primary key;

create table test_table(
id int,
fname varchar(100),
lname varchar(100),
city varchar(100)
);

INSERT INTO test_table VALUES(1,'Manoj','Patil','Pune'),(2,'Raghul','Ramesh','Çhennai');

SELECT id, concat(fname,' ',lname) as fullname,city FROM test_table;

-- JOINS
-- INNER JOIN
-- OUTER JOIN

SELECT * FROM customer;
SELECT * FROM transaction_table;


SELECT c.cust_id,c.custname,c.city,t.prod_name,t.amount FROM customer c 
INNER JOIN transaction_table t
ON c.cust_id=t.cust_id;

SELECT c.cust_id,c.custname,c.city,t.prod_name,t.amount FROM customer c 
LEFT JOIN transaction_table t
ON c.cust_id=t.cust_id;

SELECT c.cust_id,c.custname,c.city,t.prod_name,t.amount FROM customer c 
RIGHT JOIN transaction_table t
ON c.cust_id=t.cust_id;

SELECT * FROM customer c CROSS JOIN transaction_table t;