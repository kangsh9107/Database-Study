/* VIEW ------------------------------ */
CREATE VIEW my_cus AS
SELECT customerNumber, customerName, city FROM customers;

SELECT * FROM my_cus
WHERE customerNumber = 323
ORDER BY city;

/* 일부러 복잡한 코드를 만들었다. */
/* replace를 사용할 때는 신중하게. 다른 사람이 만들어 놓은 뷰와 이름이 같으면 덮어 씌워진다. */
CREATE OR REPLACE VIEW my_cur2 AS /* 여기에 이걸 추가하면  나중에 간단하게 사용 가능하다. */
SELECT employeeNumber AS '사번', lastName AS '성명', e.officeCode '부서코드',
       phone '부서전화번호'
FROM employees e JOIN offices o
ON   e.officeCode = o.officeCode
ORDER BY lastName asc;

SELECT * FROM my_cur2;