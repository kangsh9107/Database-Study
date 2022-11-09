DROP TABLE memberTest;
CREATE TABLE memberTest(
	id         VARCHAR(30) PRIMARY KEY,
	pwd        VARCHAR(30),
	name       VARCHAR(30),
	gender     VARCHAR(10),
	age        VARCHAR(10),
	postalCode VARCHAR(10),
	address1   VARCHAR(50),
	address2   VARCHAR(50),
	phone      VARCHAR(30) UNIQUE,
	email      VARCHAR(50) UNIQUE,
	question   VARCHAR(50),
	answer     VARCHAR(50),
	point      INT         DEFAULT 0
);

DROP TABLE buyTest;
CREATE TABLE buyTest(
	id          VARCHAR(30),
	category    VARCHAR(30),
	productName VARCHAR(50),
	price       INT,
	orderNumber INT,
	orderDate   DATE
);

DROP TABLE productsTest;
CREATE TABLE productsTest(
	category    VARCHAR(30),
	productName VARCHAR(50) PRIMARY KEY,
	price       INT,
	stock       INT,
	salesRate   INT
);

SELECT * FROM memberTest;
SELECT * FROM buyTest;
SELECT * FROM productsTest;