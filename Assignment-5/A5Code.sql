SET ECHO ON;
SET LINESIZE 150;


DROP TABLE Customer;

PROMPT Creating Customer Table
CREATE TABLE Customer(
	cust_id VARCHAR2(5),
	cust_name VARCHAR2(25),
	address VARCHAR2(40),
	phone NUMBER(10),
#	cust_friend VARCHAR2(4),
	CONSTRAINT cust_pk PRIMARY KEY(cust_id)
);

PROMPT Creating Pizza Table
CREATE TABLE Pizza(
	pizza_ID VARCHAR2(5),
	pizza_type VARCHAR2(20),
	unit_price NUMBER(3),
	CONSTRAINT pizza_pk PRIMARY KEY(pizza_ID)
);

PROMPT Creating Orders Table

CREATE TABLE Orders(
	
);

#ALTER TABLE Customer ADD CONSTRAINT cust_friend_fk FOREIGN KEY(cust_friend) REFERENCES Customer(cust_id);

@ /home/mahesh/Documents/DBMSLab/Assignment-5/Pizza_DB.sql