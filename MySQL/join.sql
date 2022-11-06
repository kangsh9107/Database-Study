/* GROUP BY practice */
SELECT * FROM employees;
SELECT jobTitle, count(jobTitle) AS '직원수' FROM employees GROUP BY jobTitle;

/* CROSS JOIN */
SELECT * FROM offices JOIN employees; /* 표준SQL */
SELECT * FROM offices , employees;    /* 일부 데이터베이스 */

SELECT count(*) FROM customers; /* 122행 */
SELECT count(*) FROM orders;    /* 326행 */
SELECT 122*326;
SELECT count(*) FROM customers c JOIN orders o; /* 카디션 곱: 122*326=39772행 */

/* equi JOIN(등가조인) ------------------------------ */
DESC offices;   /* officeCode PRI KEY */
DESC employees; /* officeCode MUL KEY */

SELECT city FROM employees JOIN offices
ON employees.officeCode = offices.officeCode
WHERE employeeNumber = '1002';

SELECT city FROM employees e JOIN offices o
ON e.officeCode = o.officeCode
WHERE employeeNumber = '1002';

DESC customers; /* customerNumber PRI KEY */
DESC orders;    /* customerNumber MUL KEY */

SELECT * FROM customers c JOIN orders o
ON c.customerNumber = o.customerNumber;

/* 1) 고객명이 Signal Gift Stores가 주문한 주문 목록 */
SELECT 1*1;
DESC orders;
DESC customers;
SELECT customerNumber FROM customers
WHERE customerName = 'Signal Gift Stores';
SELECT * FROM orders WHERE customerNumber = '112';

SELECT * FROM orders e JOIN customers o
ON e.customerNumber = o.customerNumber
WHERE o.customerName = 'Signal Gift Stores';

/* 2) state가 'CA'인 고객들이 주문한 주문 목록을 조회 */
SELECT o.*, c.state FROM orders o JOIN customers c
ON o.customerNumber = c.customerNumber
WHERE c.state = 'CA';

/* 3) France 사람들이 주문한 주문 목록을 조회 */
SELECT o.*, c.country FROM orders o JOIN customers c
ON o.customerNumber = c.customerNumber
WHERE c.country = 'France';

/* 4) 주문상태가 'Cancelled' 되어 있는 상품을 주문한 고객의
      이름, 연락처를 조회 */
SELECT * FROM customers;
SELECT * FROM orders;
SELECT c.customerName, c.phone, o.status FROM customers c JOIN orders o
ON o.customerNumber = c.customerNumber
WHERE o.status = 'Cancelled';

/* 5) 선적일자(shippedDate)가 2003년인 고객들의 이름, 연락처를 조회 */
SELECT customerName, phone, o.shippedDate FROM customers c JOIN orders o
ON c.customerNumber = o.customerNumber
WHERE year(o.shippedDate) = '2003';

SELECT customerName, phone, o.shippedDate FROM customers c JOIN orders o
ON c.customerNumber = o.customerNumber
WHERE date_format(o.shippedDate, '%Y') = '2003';

/* INNER join(self join) ------------------------------ */
SELECT * FROM employees;
DESC employees;
/* 1) Bow와 같은 부서 직원들의 사번, 이름, 이메일을 조회 */
/* e1 : Bow의 정보 테이블, e2 : 직원 정보 테이블 이라고 생각한다면 */
SELECT e2.employeeNumber, e2.lastName, e2.email
FROM employees e2 JOIN employees e1
ON e2.officeCode = e1.officeCode
WHERE e1.lastName = 'Bow';

/* 2) Bott와 같은 직무(jobTitle)를 갖는 직원들의 이름과 이메일 조회 */
SELECT jobTitle FROM employees WHERE lastName = 'Bott';
/* e1 : Bott의 정보 테이블, e2 : 직원 정보 테이블 */
SELECT e2.lastName, e2.email, e2.jobTitle
FROM employees e2 JOIN employees e1
ON e2.employeeNumber = e1.employeeNumber
WHERE e1.jobTitle = 'Sales Rep';

SELECT e2.lastName, e2.email, e2.jobTitle /* jobTitle까지 선택해주면 Bott의 jobTitle이 뭔지 확인 가능하다. */
FROM employees e2 JOIN employees e1
ON e2.jobTitle = e1.jobTitle
WHERE e1.lastName = 'Bott'; /* 이렇게 작업하면 Bott의 jobTitle이 뭔지 몰라도 해결 가능하다. */

/* 3) 고객의 이름이 Signal Gift Stores와 같은 국가 고객들의
      고객번호, 연락처, 고객명을 조회 */
SELECT * FROM customers WHERE customerName = 'Signal Gift Stores';
DESC customers;
/* e1 : Signa Gift Stores의 정보 테이블, e2 : 고객 정보 테이블 */
SELECT e2.customerNumber, e2.phone, e2.customerName, e2.country
FROM customers e2 JOIN customers e1
ON e2.customerNumber = e1.customerNumber
WHERE e1.country = 'USA';

SELECT e2.customerNumber, e2.phone, e2.customerName, e2.country
FROM customers e2 JOIN customers e1
ON e2.country = e1.country
WHERE e1.customerName = 'Signal Gift Stores';

/* LEFT OUTER JOIN ------------------------------ */
/* 학생테이블과 성적테이블이 있을 때, 일반적인 join은 시험을 안봤다면 조회가 안되지만
   OUTER join을 사용하면 한쪽 테이블의 자료를 무조건 조회하기 때문에시험을 안본 학생들도 조회된다. */
/* 1) 고객번호, 고객명, 지불일자, 지불액 조회 */
SELECT * FROM customers;
DESC customers;
SELECT * FROM payments;
DESC payments;

SELECT c.customerNumber, c.customerName, p.paymentDate, p.amount
FROM customers c JOIN payments p
ON c.customerNumber = p.customerNumber;

SELECT c.customerNumber, c.customerName, p.paymentDate, p.amount
FROM customers c LEFT OUTER JOIN payments p
ON c.customerNumber = p.customerNumber;










