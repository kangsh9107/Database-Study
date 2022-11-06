/* GROUP BY practice */
SELECT * FROM employees;
SELECT jobTitle, count(jobTitle) AS '������' FROM employees GROUP BY jobTitle;

/* CROSS JOIN */
SELECT * FROM offices JOIN employees; /* ǥ��SQL */
SELECT * FROM offices , employees;    /* �Ϻ� �����ͺ��̽� */

SELECT count(*) FROM customers; /* 122�� */
SELECT count(*) FROM orders;    /* 326�� */
SELECT 122*326;
SELECT count(*) FROM customers c JOIN orders o; /* ī��� ��: 122*326=39772�� */

/* equi JOIN(�����) ------------------------------ */
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

/* 1) ������ Signal Gift Stores�� �ֹ��� �ֹ� ��� */
SELECT 1*1;
DESC orders;
DESC customers;
SELECT customerNumber FROM customers
WHERE customerName = 'Signal Gift Stores';
SELECT * FROM orders WHERE customerNumber = '112';

SELECT * FROM orders e JOIN customers o
ON e.customerNumber = o.customerNumber
WHERE o.customerName = 'Signal Gift Stores';

/* 2) state�� 'CA'�� ������ �ֹ��� �ֹ� ����� ��ȸ */
SELECT o.*, c.state FROM orders o JOIN customers c
ON o.customerNumber = c.customerNumber
WHERE c.state = 'CA';

/* 3) France ������� �ֹ��� �ֹ� ����� ��ȸ */
SELECT o.*, c.country FROM orders o JOIN customers c
ON o.customerNumber = c.customerNumber
WHERE c.country = 'France';

/* 4) �ֹ����°� 'Cancelled' �Ǿ� �ִ� ��ǰ�� �ֹ��� ����
      �̸�, ����ó�� ��ȸ */
SELECT * FROM customers;
SELECT * FROM orders;
SELECT c.customerName, c.phone, o.status FROM customers c JOIN orders o
ON o.customerNumber = c.customerNumber
WHERE o.status = 'Cancelled';

/* 5) ��������(shippedDate)�� 2003���� ������ �̸�, ����ó�� ��ȸ */
SELECT customerName, phone, o.shippedDate FROM customers c JOIN orders o
ON c.customerNumber = o.customerNumber
WHERE year(o.shippedDate) = '2003';

SELECT customerName, phone, o.shippedDate FROM customers c JOIN orders o
ON c.customerNumber = o.customerNumber
WHERE date_format(o.shippedDate, '%Y') = '2003';

/* INNER join(self join) ------------------------------ */
SELECT * FROM employees;
DESC employees;
/* 1) Bow�� ���� �μ� �������� ���, �̸�, �̸����� ��ȸ */
/* e1 : Bow�� ���� ���̺�, e2 : ���� ���� ���̺� �̶�� �����Ѵٸ� */
SELECT e2.employeeNumber, e2.lastName, e2.email
FROM employees e2 JOIN employees e1
ON e2.officeCode = e1.officeCode
WHERE e1.lastName = 'Bow';

/* 2) Bott�� ���� ����(jobTitle)�� ���� �������� �̸��� �̸��� ��ȸ */
SELECT jobTitle FROM employees WHERE lastName = 'Bott';
/* e1 : Bott�� ���� ���̺�, e2 : ���� ���� ���̺� */
SELECT e2.lastName, e2.email, e2.jobTitle
FROM employees e2 JOIN employees e1
ON e2.employeeNumber = e1.employeeNumber
WHERE e1.jobTitle = 'Sales Rep';

SELECT e2.lastName, e2.email, e2.jobTitle /* jobTitle���� �������ָ� Bott�� jobTitle�� ���� Ȯ�� �����ϴ�. */
FROM employees e2 JOIN employees e1
ON e2.jobTitle = e1.jobTitle
WHERE e1.lastName = 'Bott'; /* �̷��� �۾��ϸ� Bott�� jobTitle�� ���� ���� �ذ� �����ϴ�. */

/* 3) ���� �̸��� Signal Gift Stores�� ���� ���� ������
      ����ȣ, ����ó, ������ ��ȸ */
SELECT * FROM customers WHERE customerName = 'Signal Gift Stores';
DESC customers;
/* e1 : Signa Gift Stores�� ���� ���̺�, e2 : �� ���� ���̺� */
SELECT e2.customerNumber, e2.phone, e2.customerName, e2.country
FROM customers e2 JOIN customers e1
ON e2.customerNumber = e1.customerNumber
WHERE e1.country = 'USA';

SELECT e2.customerNumber, e2.phone, e2.customerName, e2.country
FROM customers e2 JOIN customers e1
ON e2.country = e1.country
WHERE e1.customerName = 'Signal Gift Stores';

/* LEFT OUTER JOIN ------------------------------ */
/* �л����̺�� �������̺��� ���� ��, �Ϲ����� join�� ������ �Ⱥôٸ� ��ȸ�� �ȵ�����
   OUTER join�� ����ϸ� ���� ���̺��� �ڷḦ ������ ��ȸ�ϱ� ������������ �Ⱥ� �л��鵵 ��ȸ�ȴ�. */
/* 1) ����ȣ, ����, ��������, ���Ҿ� ��ȸ */
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










