use retail;   -- CREATE DATABASE retail;


CREATE TABLE customer (
cust_id INT,
custname VARCHAR(100),
age INT,
gender CHAR(1),
contact VARCHAR(50),
city VARCHAR(50),
registered_date DATE
);

-- DATA TYPES IN MySQL
-- INT | INTEGER
-- SMALLINT,
-- BIGINT
-- VARCHAR
-- CHAR()
-- DATE


INSERT INTO customer 
VALUES(100,'Raghul Ramesh',36,'M','9843994899','Çhennai',current_date()),
(101,'Shivani K',11,'F','9898989898','Bangalore',current_date()),
(102,'Harsha K',7,'F','9843943989','Hyderabad','2022-04-06');

SELECT * FROM customer;

INSERT INTO customer 
VALUES(103,'Malini Ramesh',30,'F','7843994899','Çhennai',current_date()),
(104,'Arun K',5,'M','6898989898','Bangalore',current_date()),
(105,'Vetri R',2,'M','9643943989','Hyderabad','2022-04-06');

SELECT custname, city, contact FROM customer;

SELECT custname FROM customer;

SELECT * 
FROM customer 
WHERE city="Chennai";

SELECT *  FROM customer  WHERE city="Bangalore";

SELECT * FROM customer WHERE gender='M';
SELECT * FROM customer WHERE gender='F';


-- WRITE A SELECT QUERY TO GET THE PEOPLE NAME AND CITY WHOEVER AGE IS 20 above

SELECT custname, city FROM customer WHERE age>20;

SELECT * FROM customer WHERE city='Hyderabad';

SELECT * FROM customer WHERE city IN ('Çhennai','Bangalore');

SELECT * FROM customer WHERE city NOT IN ('Çhennai','Bangalore');

SELECT * FROM CUSTOMER WHERE city IN ('Chennai','Hyderabad') OR gender='F';

-- CONSTRAINTS IN DB
-- NOT NULL
-- UNIQUE
-- PRIMARY KEY
-- FOREIGN KEY
-- CHECK
-- DEFAULT

create table mytable_nn (
custid INT NOT NULL,
custname VARCHAR(100),
age INT,
city VARCHAR(100),
registered_date DATE);

INSERT INTO mytable_nn VALUES(1000,'Rajesh Kumar',30,'Delhi','2022-01-01');
SELECT * FROM mytable_nn;

INSERT INTO mytable_nn(custid,age,city,registered_date) VALUES(1001,29,'Bangalore',current_date());
INSERT INTO mytable_nn(custid,custname,city,registered_date) VALUES(1001,'Vijay Antony','Bangalore',current_date());
INSERT INTO mytable_nn(custid) VALUES(1002);



create table mytable_uniq (
custid INT UNIQUE,
custname VARCHAR(100),
age INT,
city VARCHAR(100),
registered_date DATE);

INSERT INTO mytable_uniq(custname,age,city,registered_date) VALUES('Ashwin S',17,'Chennai','2022-04-01');
INSERT INTO mytable_uniq VALUES(2,'Amit Mishra',45,'Pune','2022-04-02');
INSERT INTO mytable_uniq VALUES(1,'Raghul Ramesh',36,'Chennai','2022-04-01');
INSERT INTO mytable_uniq(custname,age,city,registered_date) VALUES('Dharani S',29,'Chennai','2022-04-01');

-- SELECT * FROM mytable_uniq t1, mytable_uniq t2 WHERE t1.custid=t2.custid;



create table mytable_pk (
custid INT PRIMARY KEY,   -- PRIMARY KEY  = UNIQUE + NOT NULL
custname VARCHAR(100),
age INT,
city VARCHAR(100),
registered_date DATE);

INSERT INTO mytable_pk VALUES(100,'Ashwin S',17,'Chennai','2022-04-01');
INSERT INTO mytable_pk VALUES(101,'Ajit Kumar',47,'Chennai','2022-04-01');
INSERT INTO mytable_pk(custid,custname,age,city,registered_date) VALUES(102,'Dharani S',29,'Chennai','2022-04-01');

SELECT * FROM mytable_pk;


create table mytable_fk (
custid INT ,  
custname VARCHAR(100),
age INT,
city VARCHAR(100),
registered_date DATE,
FOREIGN KEY (custid) references mytable_pk(custid)
);

INSERT INTO mytable_fk VALUES(103,'Ashwin S',17,'Chennai','2022-04-01');

SELECT * FROM mytable_fk;
