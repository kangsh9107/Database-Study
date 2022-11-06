DROP PROCEDURE pro;
USE mydb;
/* 연습용 테이블 test */
CREATE TABLE test(
	mName varchar(30)
);
DROP TABLE test;

/********** LOOP **********/
CREATE PROCEDURE pro_test1()
begin
	DECLARE cnt INT DEFAULT 1;
	
	here:loop
		INSERT INTO test(mName) values( concat('hong', cnt) );
		IF cnt>=100 then
			LEAVE here;
		END if;
		SET cnt = cnt + 1;
	END loop;
end;
CALL pro_test1();
SELECT * FROM test;

/********** IN mode의 parameter **********/
CREATE PROCEDURE in_test(IN su1 int, IN su2 int)
begin
	DECLARE hap INT DEFAULT 0;
	SET hap = su1 + su2;
	SELECT su1, su2, hap;
end;
CALL in_test(55, 45);

/********** OUT MODE parameter **********/
CREATE PROCEDURE out_test( OUT str varchar(50) )
begin
	SET str = 'hong gil dong';
end;
CALL out_test(@abc);
SELECT @abc;

/********** PROCEDURE 만들기 응용 **********/
/* 1) 파라미터로 이름을 전달받아 test 테이블에 저장(pro_test2) */
DROP TABLE test;
SELECT * FROM test;

CREATE PROCEDURE pro_test2(imsi varchar(30))
begin
	INSERT INTO test(mName) values(imsi);
end;
CALL pro_test2('kim');
SELECT * FROM test;

/* 2) 첫번째 파라미터는 IN mode, 두번째 파라미터는 OUT mode로 선언하여
	  첫번째 파라미터에 직원번호를 전달받아 직원명을 OUT mode에 대입하여
	  프로시져 밖에서 확인(pro_test3) */
CREATE PROCEDURE pro_test3(IN eNumber int, OUT eName varchar(30))
begin
	SELECT e2.lastName INTO eName
	FROM classicmodels.employees e1 JOIN classicmodels.employees e2
	ON e1.employeeNumber = e2.employeeNumber
	WHERE e1.employeeNumber = eNumber;
end;
CALL pro_test3(1002, @eName);
SELECT @eName;

/* 
CREATE PROCEDURE pro_test3(IN en int, OUT lName varchar(30))
begin
	SELECT lastName INTO lName
	FROM classicmodels.employees
	WHERE employeeNumber = en;
end;
CALL pro_test3(1002, @irum);
SELECT @irum;
 */

/* 3) 고객번호를 전달받아 해당 고객의 지불 총액(payments)을 계산하여
	  OUT MODE 파라미터로 확인(pro_test4) */
SELECT * FROM classicmodels.payments;

CREATE PROCEDURE pro_test4(IN cn int, OUT total decimal(10, 2))
begin
	SELECT sum(amount) INTO total
	FROM classicmodels.payments
	WHERE customerNumber = cn;
end;
CALL pro_test4(103, @total);
SELECT @total;

/********** INOUT **********/
/* 5) 두 정수를 INOUT 모드의 파라미터로 전달받아 합계를 구하고
	  두 정수와 합계를 프로시져 밖에서 확인 하시오. */
CREATE PROCEDURE pro_test5(INOUT su1 int, INOUT su2 int, INOUT hap int)
begin
	SET hap = su1 + su2;
end;
SET @su1 = 100;
SET @su2 = 200;
CALL pro_test5(@su1, @su2, @hap);
SELECT @su1, @su2, @hap;

/* 6) 사번을 사용하여 사무실 주소(addressline1, addressline2)를
	  찾아 프로시져 밖에서 사번, 주소를 확인하시오.
	  (employees, offices 테이블 사용) */
SELECT * FROM classicmodels.employees;
SELECT * FROM classicmodels.offices;

CREATE PROCEDURE pro_test6(INOUT en varchar(10), inout add1 varchar(50), inout add2 varchar(50))
begin
	SELECT o.addressLine1, o.addressLine2 INTO add1, add2
	FROM classicmodels.offices o JOIN classicmodels.employees e
	ON o.officeCode = e.officeCode
	WHERE e.employeeNumber = en;
end;
SET @en = 1102;
CALL pro_test6(@en, @add1, @add2);
SELECT @en, @add1, @add2;
DROP PROCEDURE pro_test6;

/* 
SELECT addressLine1, addressLine2 INTO add1, add2
FROM classicmodels.offices
WHERE officeCode = (SELECT officeCode FROM classicmodels.employees);
 */

/* 7) 고객번호를 사용하여 연락처와 지불총액을 INOUT 모드의
	  파라미터를 사용하여 프로시져 밖에서 확인하시오.
	  (customers, payments) */
SELECT * FROM classicmodels.customers;
SELECT * FROM classicmodels.payments;

CREATE PROCEDURE pro_test7(INOUT cn INT, INOUT mPhone varchar(30), INOUT total varchar(50))
begin
	SELECT phone INTO mPhone
	FROM classicmodels.customers
	WHERE customerNumber in (SELECT customerNumber FROM classicmodels.payments WHERE customerNumber = cn);
	/* 만약 위 처럼 select를 한 경우 중간에 번호가 바뀐 사람이라면 어떤 번호가 선택될지 모른다. */
	/* 
	SELECT phone INTO mPhone
	FROM classicmodels.customers
	WHERE customerNumber = cn;
	이렇게 바꾸면 하나의 정확한 번호가 들어 온다.
	 */
	
	SELECT sum(amount) INTO total
	FROM classicmodels.payments
	WHERE customerNumber = (SELECT customerNumber FROM classicmodels.customers WHERE customerNumber = cn);
	/* 
	위의 서브쿼리 목적이 cn을 찾는 거라서 그냥 cn으로 적는게 더 간단하다.
	SELECT sum(amount) INTO total
	FROM classicmodels.payments
	WHERE customerNumber = cn;
	 */
end;
SET @cn = 103;
CALL pro_test7(@cn, @mPhone, @total);
SELECT @cn, @mPhone, @total;










SET @a = 0;
SET @b = 0;
SET @c = 0;
SELECT @a, @b, @c;

/* 함수나 프로시져 안에서 변수를 set할 때는 @를 쓰면 안된다.
   @를 쓰면 버그가 발생한다. */
CREATE PROCEDURE test1(IN a int, OUT b int, INOUT c int)
begin
	SET @a = 1;
	SET @b = 2;
	SET @c = 3;
end;

CALL test1(@a, @b, @c);
SELECT @a, @b, @c;


CREATE PROCEDURE test2(IN aaa int, OUT bbb int, INOUT ccc int)
begin
	SET a = 10;
	SET b = 20;
	SET c = 30;
end;

CALL test2(@a, @b, @c);
SELECT @a, @b, @c;


CREATE PROCEDURE test3(IN a int, OUT b int, INOUT c int)
begin
end;

SET @a = 100;
SET @b = 200;
SET @c = 300;
SELECT @a, @b, @c;

CALL test3(@a, @b, @c);
SELECT @a, @b, @c;









