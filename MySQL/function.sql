CREATE FUNCTION f1()
RETURNS varchar(50)
begin
	DECLARE irum varchar(30);
	SET irum = 'kim';
	RETURN irum;
end
SELECT f1();
DROP FUNCTION f1;

CREATE FUNCTION f2()
RETURNS varchar(100)
begin
	DECLARE id varchar(30);
	DECLARE irum varchar(30);
	DECLARE address varchar(50);
	DECLARE r varchar(100);
	SET id = 'a001';
	SET irum = '길동이';
	SET address = '서울';
	SET r = concat(id, ', ', irum, ', ', address);
	RETURN r;
end;
SELECT f2() "아이디, 성명, 주소";

CREATE FUNCTION f3(en int)
RETURNS varchar(50)
begin
	DECLARE lName varchar(50);
	
	SELECT lastName INTO lName
	FROM employees
	WHERE employeeNumber = en;
	RETURN lName;
end;
SELECT * FROM employees;
SELECT * FROM offices;
SELECT f3(1002), f3(1056);

/* 사번을 매개변수로 전달받아 해당 직원의 사무실 전화번호를 반환 */
SELECT o.phone FROM offices o JOIN employees e
ON o.officeCode = e.officeCode
WHERE e.employeeNumber = 1002;

SELECT phone FROM offices
WHERE officeCode = (SELECT officeCode FROM employees WHERE employeeNumber = 1002);

CREATE FUNCTION f4(en int)
RETURNS varchar(50)
begin
	DECLARE lPhone varchar(30);
	
	SELECT phone INTO lPhone
	FROM offices
	WHERE officeCode =
	(SELECT officeCode FROM employees WHERE employeeNumber = en);
	RETURN lPhone;
end;
SELECT f4(1002), f4(1056);
