use retail;

SELECT * FROM customer;

ALTER TABLE customer
ADD COLUMN balance DECIMAL(10,2) ;

SET SQL_SAFE_UPDATES = 0;

UPDATE customer SET balance=10000 WHERE city='CHENNAI';
UPDATE customer SET balance=20000 WHERE city='BANGALORE';
UPDATE customer SET balance=30000 WHERE city='HYDERABAD';
UPDATE customer SET balance=40000 WHERE city='AHMEDABAD';

SELECT min(balance),max(balance),sum(balance) , avg(balance) FROM customer;

SELECT city, sum(balance) as 'total_amount' 
FROM customer
WHERE city IN ('Ahmedabad','Bangalore')
GROUP BY city
HAVING total_amount > 10000
ORDER BY city DESC;


SELECT * FROM customer;

-- <25000 - POOR
-- >25000 and < 35000 - MIDDLE
-- > 35000 RICH

SELECT * , CASE 
WHEN balance < 25000 THEN 'POOR'
WHEN balance between 25000 and 35000 THEN 'MIDDLE'
WHEN balance > 35000 THEN 'RICH'
END as Category
FROM customer;

UPDATE customer SET city='DELHI' WHERE city='CHENNAI';

#UPDATE customer SET gender='M' WHERE gender='F'

UPDATE customer set gender=CASE
WHEN gender='M' THEN 'F'
WHEN gender='F' THEN 'M'
END;

-- VIEW is virtual table 

CREATE VIEW cust_details AS
SELECT custname,gender,city FROM customer;

SELECT * FROM cust_details;   -- Secure the confident data

SELECT * FROM customer;
SELECT * FROM cust_details WHERE gender='M' and City='Bangalore';

CREATE TABLE customer_with_sequence
( custid INT primary key auto_increment,
custname VARCHAR(100),
city VARCHAR(100)
);

INSERT INTO customer_with_sequence(custname,city) VALUES('Stalin MK','CHENNAI'),('MODI N','DELHI');

SELECT * FROM customer_with_sequence;

-- TCL , DCL command

SELECT * FROM customer;

-- GRANT SELECT,INSERT,UPDATE ON CUSTOMER to manoj@localhost;
-- GRANT ALL on CUSTOMER to manoj@localhost;

-- REVOKE INSERT,UPDATE,DELETE ON CUSTOMER to manoj@localhost;

-- TCL Transaction control language

 SELECT * FROM customer_with_sequence;

BEGIN TRANSACTION customerupdate;
UPDATE customer_with_sequence SET city='CHENNAI' ;
-- COMMIT;
ROLLBACK;