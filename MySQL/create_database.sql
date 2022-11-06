/* �����ͺ��̽� ���� �� ���� */
CREATE DATABASE mydb;
SHOW databases;

DROP DATABASE mydb;
SHOW databases;

/* ������Ʈ���� ����� DB ���� */
CREATE DATABASE mydb;
SHOW databases;
USE mydb;
SHOW tables;

/* student ���̺� ���� */
CREATE TABLE student(
	mid varchar(20),
	irum varchar(30),
	phone varchar(50)
);
SHOW tables;
DESC student;

DROP TABLE student;
SHOW tables;
DESC student;

/* ��ȣ(pwd)�� �ּ�(address) �÷��� �߰� */
CREATE TABLE student(
	mid varchar(20),
	irum varchar(30),
	phone varchar(20)
);
ALTER TABLE student ADD pwd varchar(30);
ALTER TABLE student ADD address varchar(50);

/* MID �÷��� id��, irum �÷����� name���� ���� */
ALTER TABLE student CHANGE mid id varchar(20);
ALTER TABLE student CHANGE irum name varchar(30);
DESC student;

/* ���� ���̺� ������ ����Ͽ� ���ο� ���̺� �����ϱ� */
CREATE TABLE cus AS SELECT * FROM classicmodels.customers;
SELECT * FROM cus;

CREATE TABLE cus2 AS SELECT customerNumber, customerName
FROM classicmodels.customers;
SELECT * FROM cus2;

/* 1. payments���: �ݾ�(amount)�� 50000~100000�� ���� ������ ����Ͽ�
   ���ο� ���̺� pay1���� �����Ͻÿ�. */
CREATE TABLE cus3 AS SELECT *
FROM classicmodels.payments;

SELECT * FROM cus3 WHERE amount>'50000' and amount<'100000';
CREATE TABLE pay1 AS SELECT *
FROM cus3 WHERE amount>'50000' and amount<'100000';

/* CREATE TABLE pay1 AS SELECT *
   FROM classicmodels.payments WHERE amount>='50000' AND amount<='100000'; */

SELECT * FROM pay1;

/* 2. ��������(paymentDate)�� 2004���� ������ ����Ͽ� ���ο� ���̺�
   pay2�� �����Ͻÿ�. */
CREATE TABLE pay2 AS SELECT *
FROM classicmodels.payments WHERE year(paymentDate) = '2004';

SELECT * FROM pay2;

/* CREATE TABLE pay2 AS SELECT * FROM classicmodels.payments
   WHERE date_format(paymentDate, '%Y') = '2004'; */

/* 3. ��������(paymentDate)�� 9���� ������ ����Ͽ� ���ο� ���̺�
   pay3�� �����Ͻÿ�. */
CREATE TABLE pay3 SELECT *
FROM classicmodels.payments WHERE month(paymentDate) = '09';

SELECT * FROM pay3;

/* CREATE TABLE pay3 AS SELECT * FROM classicmodels.payments
   WHERE date_format(paymentDate, '%m') = '09'; */

/* 4. 2004-09 */
CREATE TABLE pay4 AS SELECT * FROM classicmodels.payments
WHERE date_format(paymentDate, '%Y-%m') = '2004-09';

SELECT * FROM pay4;

/* �����;��� ������ ���� */
USE mydb;
CREATE TABLE pay5 AS SELECT * FROM classicmodels.payments
WHERE 1=2; /* �� ����. �����Ͱ� �ƹ��͵� ���õ��� �ʴ´�. */

SELECT * FROM pay5;

USE classicmodels;
DROP TABLE pay5;




