/* 1) 임의의 변수 a, b에 값을 대입한 후 큰 값을 if문만 사용하여 출력 */
CREATE PROCEDURE if_test1(IN a int, IN b int)
begin
	if(a>b) then
		SELECT a "큰값";
	elseif(a<b) then
		SELECT b "큰값";
	END if;
end;

SET @a = 10;
SET @b = 20;
CALL if_test1(@a, @b);

/* 2) a,b 값을 외부에서 전달 받아 큰값을 출력하는 if문을 작성 */
CREATE PROCEDURE if_test2(IN a int, IN b int, OUT r int)
begin
	SET r = 0;
	
	if(a>b) then
		SELECT a INTO r;
	elseif(a<b) then
		SELECT b INTO r;
	END if;
end;

SET @a = 10;
SET @b = 20;
CALL if_test2(@a, @b, @r);
SELECT @a, @b, @r "큰값";

CREATE PROCEDURE if_test2_teacher(IN a int, IN b int)
begin
	DECLARE m int;
	SET m = a;
	
	if(b>m) then
		SET m = b;
	END if;
	
	SELECT m;
end;

/* 3) a,b,c 값을 외부에서 전달 받아 최대값을 출력하는 if문을 작성 */
CREATE PROCEDURE if_test3(IN a int, IN b int, IN c int, OUT r int)
begin
	SET r = 0;
	if(a>b AND a>c) then
		SELECT a INTO r;
	elseif(b>a AND b>c) then
		SELECT b INTO r;
	elseif(c>a AND c>b) then
		SELECT c INTO r;
	END if;
end;

SET @a = 10;
SET @b = 20;
SET @c = 30;
CALL if_test3(@a, @b, @c, @r);
SELECT @a, @b, @c, @r "큰값";

CREATE PROCEDURE if_test3_teacher(a int, b int, c int)
begin
	DECLARE m int;
	SET m = a;
	IF b>m then
		SET m=b;
	END if;
	
	IF c>m then
		SET m=c;
	END if;
	SELECT m AS 'max';
end;

CALL if_test3_teacher(40, 20, 90);

/* 4) 고객번호를 파라메터로 전달받아 지불액 총액을 계산하여 8만이상이면
		'우수고객', 아니면 '고객'을 출력 (if_test4) */
SELECT * FROM classicmodels.payments;
SELECT * FROM classicmodels.customers;

CREATE PROCEDURE if_test4(IN cn int)
begin
	DECLARE r decimal(10, 2);
	DECLARE str varchar(30);
	
	SELECT sum(amount) INTO r
	FROM classicmodels.payments
	WHERE customerNumber = cn;
	
	if(r>=80000) then
		SET str = '우수';
	else
		SET str = '일반';
	END if;
	
	SELECT cn "고객번호", str "고객등급";
end;

CALL if_test4(103);

/* 5) 년도를 파라메터로 전달받아 해당 년도의 지불액 총액을 계산하여
		10만 이상 A, 8만 이상 B, 5만 이상 C, 그 외는 D를 출력 (if_test5) */
CREATE PROCEDURE if_test5(IN pd int)
begin
	DECLARE r decimal(10, 2);
	DECLARE str varchar(30);

	SELECT sum(amount) INTO r
	FROM classicmodels.payments
	WHERE date_format(paymentDate, '%Y') = pd;
	
	if(r>=100000) then
		SET str = 'A';
	elseif(r>=80000) then
		SET str = 'B';
	elseif(r>=50000) then
		SET str = 'C';
	else
		SET str = 'D';
	END if;
	
	SELECT pd "년도", r "매출", str "등급";
end;

CALL if_test5(2004);

/* 6) 고객번호와 년도를 파라메터로 전달받아 지불 총액을 계산하고
		해당 년도의 평균보다 높으면 'VVIP' 아니면 'VIP' 출력 (if_test6) */
/* SELECT sum(amount) INTO r
   FROM classicmodels.payments
   WHERE date_format(paymentDate, '%Y') = pd
   		 AND customerNumber = cn;
   
   SELECT avg(amount) INTO avg1
   FROM classicmodels.payments
   WHERE date_format(paymentDate, '%Y') = pd;
   		 
   이렇게 분리해야 avg(amount)가 전체 평균으로 나온다. */
CREATE PROCEDURE if_test6(IN cn int, IN pd int)
begin
	DECLARE r decimal(10, 2);
	DECLARE avg1 decimal(10, 2);
	DECLARE str varchar(30);
	
	SELECT sum(amount) INTO r
	FROM classicmodels.payments
	WHERE date_format(paymentDate, '%Y') = pd
		  AND customerNumber = cn;
   
	SELECT avg(amount) INTO avg1
	FROM classicmodels.payments
	WHERE date_format(paymentDate, '%Y') = pd;
	
	if(r>=avg1) then
		SET str = 'VVIP';
	else
		SET str = 'VIP';
	END if;
	
	SELECT cn "고객번호", pd "년도", r "지불총액", avg1 "평균", str "등급";
end;

CALL if_test6(103, 2004);










CREATE PROCEDURE test99(INOUT a INT, INOUT b int)
begin
	if(a=1) then
		SELECT '가';
	END if;
	
	if(b=2) then
		SELECT '나';
	END if;
end;
DROP PROCEDURE test99;

SET @a = 1;
SET @b = 2;
CALL test99(@a, @b);





CREATE PROCEDURE test999(INOUT a int, INOUT b int)
begin
	if(a=1) then
		SELECT '고객';
	elseif(b=1) then
		SELECT '우수고객';
	END if;
end;

SET @a = 1;
SET @b = 0;
CALL test999(@a, @b);





CREATE PROCEDURE test9999(IN cn int)
begin
	DECLARE r decimal(10, 2);
	
	SELECT sum(amount) INTO r
	FROM classicmodels.payments
	WHERE customerNumber = cn;
	
	SELECT cn "고객번호";
	
	if(r>=80000) then
		SELECT '고객';
	else
		SELECT '우수고객';
	END if;
end;

CALL test9999(103);





CREATE PROCEDURE test888(INOUT a int)
begin
	SELECT 1;
	
	SET a = 10;
	SELECT 2;
	SELECT 3;
end;

SET @a = 0;
CALL test888(@a);
SELECT @a;









