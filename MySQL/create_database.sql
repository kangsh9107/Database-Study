/* 데이터베이스 생성 및 삭제 */
CREATE DATABASE mydb;
SHOW databases;

DROP DATABASE mydb;
SHOW databases;

/* 프로젝트에서 사용할 DB 생성 */
CREATE DATABASE mydb;
SHOW databases;
USE mydb;
SHOW tables;

/* student 테이블 생성 */
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

/* 암호(pwd)와 주소(address) 컬럼을 추가 */
CREATE TABLE student(
	mid varchar(20),
	irum varchar(30),
	phone varchar(20)
);
ALTER TABLE student ADD pwd varchar(30);
ALTER TABLE student ADD address varchar(50);

/* MID 컬럼을 id로, irum 컬럼명을 name으로 수정 */
ALTER TABLE student CHANGE mid id varchar(20);
ALTER TABLE student CHANGE irum name varchar(30);
DESC student;

/* 기존 테이블 정보를 사용하여 새로운 테이블 생성하기 */
CREATE TABLE cus AS SELECT * FROM classicmodels.customers;
SELECT * FROM cus;

CREATE TABLE cus2 AS SELECT customerNumber, customerName
FROM classicmodels.customers;
SELECT * FROM cus2;

/* 1. payments사용: 금액(amount)가 50000~100000인 고객의 정보를 사용하여
   새로운 테이블 pay1으로 생성하시오. */
CREATE TABLE cus3 AS SELECT *
FROM classicmodels.payments;

SELECT * FROM cus3 WHERE amount>'50000' and amount<'100000';
CREATE TABLE pay1 AS SELECT *
FROM cus3 WHERE amount>'50000' and amount<'100000';

/* CREATE TABLE pay1 AS SELECT *
   FROM classicmodels.payments WHERE amount>='50000' AND amount<='100000'; */

SELECT * FROM pay1;

/* 2. 지불일자(paymentDate)가 2004년인 정보를 사용하여 새로운 테이블
   pay2로 생성하시오. */
CREATE TABLE pay2 AS SELECT *
FROM classicmodels.payments WHERE year(paymentDate) = '2004';

SELECT * FROM pay2;

/* CREATE TABLE pay2 AS SELECT * FROM classicmodels.payments
   WHERE date_format(paymentDate, '%Y') = '2004'; */

/* 3. 지불일자(paymentDate)가 9월인 정보를 사용하여 새로운 테이블
   pay3을 생성하시오. */
CREATE TABLE pay3 SELECT *
FROM classicmodels.payments WHERE month(paymentDate) = '09';

SELECT * FROM pay3;

/* CREATE TABLE pay3 AS SELECT * FROM classicmodels.payments
   WHERE date_format(paymentDate, '%m') = '09'; */

/* 4. 2004-09 */
CREATE TABLE pay4 AS SELECT * FROM classicmodels.payments
WHERE date_format(paymentDate, '%Y-%m') = '2004-09';

SELECT * FROM pay4;

/* 데이터없이 구조만 복사 */
USE mydb;
CREATE TABLE pay5 AS SELECT * FROM classicmodels.payments
WHERE 1=2; /* 논리 부정. 데이터가 아무것도 선택되지 않는다. */

SELECT * FROM pay5;

USE classicmodels;
DROP TABLE pay5;




