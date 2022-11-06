/* VIEW ------------------------------ */
CREATE VIEW my_cus AS
SELECT customerNumber, customerName, city FROM customers;

SELECT * FROM my_cus
WHERE customerNumber = 323
ORDER BY city;

/* �Ϻη� ������ �ڵ带 �������. */
/* replace�� ����� ���� �����ϰ�. �ٸ� ����� ����� ���� ��� �̸��� ������ ���� ��������. */
CREATE OR REPLACE VIEW my_cur2 AS /* ���⿡ �̰� �߰��ϸ�  ���߿� �����ϰ� ��� �����ϴ�. */
SELECT employeeNumber AS '���', lastName AS '����', e.officeCode '�μ��ڵ�',
       phone '�μ���ȭ��ȣ'
FROM employees e JOIN offices o
ON   e.officeCode = o.officeCode
ORDER BY lastName asc;

SELECT * FROM my_cur2;