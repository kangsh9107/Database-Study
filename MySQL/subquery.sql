/* SELECT 절 보다 WHERE 절이 먼저 실행된다는 증거*/
USE classicmodels;
SELECT customerNumber, amount AS amt FROM payments
ORDER BY amt;

/* sub QUERY ------------------------------ */
/* 1) 고객명이 Signal Gift Stores가 주문한 주문 목록 */
SELECT * FROM orders o JOIN customers c
ON o.customerNumber = c.customerNumber
WHERE c.customerName = 'Signal Gift Stores';

SELECT o.* FROM orders o
WHERE o.customerNumber = (
	SELECT customerNumber FROM customers
	WHERE customerName = 'Signal Gift Stores');

/* 2) state가 'CA'인 고객들이 주문한 주문 목록을 조회 */
SELECT o.*, c.state FROM orders o JOIN customers c
ON o.customerNumber = c.customerNumber
WHERE c.state = 'CA';

SELECT * FROM orders;
SELECT * FROM customers;
DESC orders;
DESC customers;
SELECT o.* FROM orders o
WHERE o.customerNumber IN (
	SELECT customerNumber FROM customers
	WHERE state = 'CA');

/* 3) France 사람들이 주문한 주문 목록을 조회 */
SELECT o.*, c.country FROM orders o JOIN customers c
ON o.customerNumber = c.customerNumber
WHERE c.country = 'France';

SELECT o.* FROM orders o
WHERE o.customerNumber IN (
	SELECT customerNumber FROM customers
	WHERE country = 'France');

/* 4) 주문상태가 'Cancelled' 되어 있는 상품을 주문한 고객의
      이름, 연락처를 조회 */
SELECT * FROM customers;
SELECT * FROM orders;
SELECT c.customerName, c.phone, o.status FROM customers c JOIN orders o
ON o.customerNumber = c.customerNumber
WHERE o.status = 'Cancelled';

SELECT c.customerName, c.phone FROM customers c
WHERE customerNumber IN  (
	SELECT customerNumber FROM orders
	WHERE STATUS = 'Cancelled');

/* 5) 선적일자(shippedDate)가 2003년인 고객들의 이름, 연락처를 조회 */
SELECT customerName, phone, o.shippedDate FROM customers c JOIN orders o
ON c.customerNumber = o.customerNumber
WHERE date_format(o.shippedDate, '%Y') = '2003';

/* pass 어렵다. JOIN 쓰는게 낫다 */

/* 6) Bow와 같은 부서 직원들의 사번, 이름, 이메일을 조회 */
/* e1 : Bow의 정보 테이블, e2 : 직원 정보 테이블 이라고 생각한다면 */
SELECT e2.employeeNumber, e2.lastName, e2.email
FROM employees e2 JOIN employees e1
ON e2.officeCode = e1.officeCode
WHERE e1.lastName = 'Bow';

SELECT e.employeeNumber, e.lastName, e.email FROM employees e
WHERE officeCode = (
	SELECT officeCode FROM employees
	WHERE lastName = 'Bow');

/* 7) Bott와 같은 직무(jobTitle)를 갖는 직원들의 이름과 이메일 조회 */
SELECT e2.lastName, e2.email, e2.jobTitle
FROM employees e2 JOIN employees e1
ON e2.jobTitle = e1.jobTitle
WHERE e1.lastName = 'Bott';

SELECT e.lastName, e.email FROM employees e
WHERE jobTitle = (
	SELECT jobTitle FROM employees
	WHERE lastName = 'Bott');

/* 8) 고객의 이름이 Signal Gift Stores와 같은 국가 고객들의
      고객번호, 연락처, 고객명을 조회 */
SELECT e2.customerNumber, e2.phone, e2.customerName, e2.country
FROM customers e2 JOIN customers e1
ON e2.country = e1.country
WHERE e1.customerName = 'Signal Gift Stores';

SELECT c.customerNumber, c.phone, c.customerName FROM customers c
WHERE country = (
	SELECT country FROM customers
	WHERE customerName = 'Signal Gift Stores');










