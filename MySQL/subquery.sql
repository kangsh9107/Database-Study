/* SELECT �� ���� WHERE ���� ���� ����ȴٴ� ����*/
USE classicmodels;
SELECT customerNumber, amount AS amt FROM payments
ORDER BY amt;

/* sub QUERY ------------------------------ */
/* 1) ������ Signal Gift Stores�� �ֹ��� �ֹ� ��� */
SELECT * FROM orders o JOIN customers c
ON o.customerNumber = c.customerNumber
WHERE c.customerName = 'Signal Gift Stores';

SELECT o.* FROM orders o
WHERE o.customerNumber = (
	SELECT customerNumber FROM customers
	WHERE customerName = 'Signal Gift Stores');

/* 2) state�� 'CA'�� ������ �ֹ��� �ֹ� ����� ��ȸ */
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

/* 3) France ������� �ֹ��� �ֹ� ����� ��ȸ */
SELECT o.*, c.country FROM orders o JOIN customers c
ON o.customerNumber = c.customerNumber
WHERE c.country = 'France';

SELECT o.* FROM orders o
WHERE o.customerNumber IN (
	SELECT customerNumber FROM customers
	WHERE country = 'France');

/* 4) �ֹ����°� 'Cancelled' �Ǿ� �ִ� ��ǰ�� �ֹ��� ����
      �̸�, ����ó�� ��ȸ */
SELECT * FROM customers;
SELECT * FROM orders;
SELECT c.customerName, c.phone, o.status FROM customers c JOIN orders o
ON o.customerNumber = c.customerNumber
WHERE o.status = 'Cancelled';

SELECT c.customerName, c.phone FROM customers c
WHERE customerNumber IN  (
	SELECT customerNumber FROM orders
	WHERE STATUS = 'Cancelled');

/* 5) ��������(shippedDate)�� 2003���� ������ �̸�, ����ó�� ��ȸ */
SELECT customerName, phone, o.shippedDate FROM customers c JOIN orders o
ON c.customerNumber = o.customerNumber
WHERE date_format(o.shippedDate, '%Y') = '2003';

/* pass ��ƴ�. JOIN ���°� ���� */

/* 6) Bow�� ���� �μ� �������� ���, �̸�, �̸����� ��ȸ */
/* e1 : Bow�� ���� ���̺�, e2 : ���� ���� ���̺� �̶�� �����Ѵٸ� */
SELECT e2.employeeNumber, e2.lastName, e2.email
FROM employees e2 JOIN employees e1
ON e2.officeCode = e1.officeCode
WHERE e1.lastName = 'Bow';

SELECT e.employeeNumber, e.lastName, e.email FROM employees e
WHERE officeCode = (
	SELECT officeCode FROM employees
	WHERE lastName = 'Bow');

/* 7) Bott�� ���� ����(jobTitle)�� ���� �������� �̸��� �̸��� ��ȸ */
SELECT e2.lastName, e2.email, e2.jobTitle
FROM employees e2 JOIN employees e1
ON e2.jobTitle = e1.jobTitle
WHERE e1.lastName = 'Bott';

SELECT e.lastName, e.email FROM employees e
WHERE jobTitle = (
	SELECT jobTitle FROM employees
	WHERE lastName = 'Bott');

/* 8) ���� �̸��� Signal Gift Stores�� ���� ���� ������
      ����ȣ, ����ó, ������ ��ȸ */
SELECT e2.customerNumber, e2.phone, e2.customerName, e2.country
FROM customers e2 JOIN customers e1
ON e2.country = e1.country
WHERE e1.customerName = 'Signal Gift Stores';

SELECT c.customerNumber, c.phone, c.customerName FROM customers c
WHERE country = (
	SELECT country FROM customers
	WHERE customerName = 'Signal Gift Stores');










