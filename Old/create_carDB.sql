DROP DATABASE IF EXISTS carDB_test;

CREATE DATABASE carDB_test;

USE carDB_test;

DROP TABLE IF EXISTS car_basic;
CREATE TABLE car_basic(
id INT AUTO_INCREMENT NOT NULL PRIMARY KEY,
make  VARCHAR(255),
model VARCHAR(255),
model_year INT,
color VARCHAR(255),
doors INT,
axles INT,
engine VARCHAR(255)
);

USE carDB_test;
DROP TABLE IF EXISTS car_performance;
CREATE TABLE car_performance(
id INT AUTO_INCREMENT NOT NULL PRIMARY KEY,
car_id INT NOT NULL, 
mpg DECIMAL,
cylinders INT,
displacement INT,
horsepower INT,
weight DECIMAL,
acceleration DECIMAL,
origin INT,
car_name VARCHAR(500),
VIN VARCHAR(255),
od_reading BIGINT,
od_reading_dt DATETIME,
INDEX (car_id),
FOREIGN KEY (car_id) REFERENCES car_basic(id)


);

DROP TABLE IF EXISTS customer;
CREATE TABLE customer(
id INT AUTO_INCREMENT NOT NULL PRIMARY KEY,
first_name VARCHAR(255),
last_name VARCHAR(255),
email VARCHAR(500),
phone VARCHAR(255)

);

DROP TABLE IF EXISTS salesperson;
CREATE TABLE salesperson(
id INT AUTO_INCREMENT NOT NULL PRIMARY KEY,
first_name VARCHAR(255),
last_name VARCHAR(255),
email VARCHAR(500),
phone VARCHAR(255)

);


DROP TABLE IF EXISTS sale;
CREATE TABLE sale(
id INT AUTO_INCREMENT NOT NULL PRIMARY KEY,
car_id INT NOT NULL,
performance_id INT NOT NULL,
price DECIMAL,
commission DECIMAL,
customer_id INT NOT NULL,
salesperson_id INT NOT NULL,

INDEX (car_id),
FOREIGN KEY (car_id) REFERENCES car_basic(id),
INDEX(performance_id),
FOREIGN KEY (performance_id ) REFERENCES car_performance(id),
INDEX(customer_id),
FOREIGN KEY (customer_id) REFERENCES customer(id),
INDEX(salesperson_id),
FOREIGN KEY (salesperson_id) REFERENCES salesperson(id)
);
