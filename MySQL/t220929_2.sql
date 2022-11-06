/***** 1번 *****/
SELECT * FROM payments;

DROP PROCEDURE exam_proc;
CREATE PROCEDURE exam_proc(Y int)
begin
	DECLARE m_ym  varchar(50)    DEFAULT '';
	DECLARE m_sum decimal(10, 2) DEFAULT 0;
	DECLARE m_avg decimal(10, 2) DEFAULT 0;
	DECLARE flag  INT            DEFAULT 0;

	DECLARE cur CURSOR for
		SELECT date_format(paymentDate, '%Y-%m'),
		       sum(amount),
		       avg(amount)
		FROM   payments
		WHERE date_format(paymentDate, '%Y') = Y
		GROUP BY date_format(paymentDate, '%Y-%m')
		ORDER BY date_format(paymentDate, '%Y-%m');
	DECLARE CONTINUE HANDLER FOR NOT FOUND SET flag = 1;
	
	OPEN cur;
	here : loop
		FETCH cur INTO m_ym, m_sum, m_avg;
		IF flag = 1 then
			LEAVE here;
		END if;
		
		SELECT m_ym "year-month-statistics", m_sum "mongth-sum", m_avg "month-avg";
	END loop;
	CLOSE cur;
end;

CALL exam_proc(2004);

/* (1) 프로시져에 년도를 in모드로 입력해서 콜한다.
   (2) select문에 따라 커서가 선언된다.
       (프로시져를 만들기 전에 미리 select문으로 시험해보고 만들면 좋다.)
   (3) 상태값 핸들러가 선언된다.
   (4) 커서가 오픈된다.
   (5) 반복문이 실행된다.
   (5) 페치를 통해 조건에 맞는 데이터를 하나씩 가져와서 반복문을 실행한다.
   (6) 조건에 맞는 데이터를 into로 상태값 핸들러에 저장한다.
   (7) 상태값 핸들러에 입력된 값을 select한다.
   (8) 조건에 맞는 데이터가 없으면 flag값이 1로 설정되면서 반복문이 종료된다.
   (9) 반복문이 종료되면 커서도 종료되고 프로시져도 종료된다.
   (10) 최종적으로 select한 값이 화면에 출력된다. */

/***** 1번 강사님 *****/
/* WHERE 절에는 닉네임을 쓸 수 없다. select절보다 where절이 먼저 실행되기 때문이다. */
CREATE PROCEDURE exam_proc(yy int)
BEGIN
	DECLARE hap INT           DEFAULT 0;
	DECLARE pyu decimal(10,2) DEFAULT 0;
	DECLARE nal varchar(20)   DEFAULT '';
	
	DECLARE flag INT DEFAULT 0;
	DECLARE cur CURSOR FOR
		SELECT sum(amount) h, avg(amount) p, date_format(paymentDate, '%Y-%m') nal
		FROM   payments
		WHERE   year(paymentDate) = yy
		GROUP BY date_format(paymentDate, '%Y-%m')
		ORDER BY nal;
	DECLARE CONTINUE HANDLER FOR NOT FOUND SET flag = 1;
	
	OPEN cur;
	here : LOOP
		FETCH cur INTO hap, pyu, nal;
		IF flag = 1 THEN
			LEAVE here;
		END IF;
		SELECT hap, pyu, nal;
	END LOOP;
	CLOSE cur;
END;
/* 
	SET flag = 1;
	OPEN cur;
	here2 : WHILE flag = 0 DO
		FETCH cur INTO hap, pyu, nal;
		IF flag = 1 THEN
			LEAVE here2;
		END IF;
		SELECT hap, pyu, nal;
	END while;
	CLOSE cur;
 */

/***** 2번 *****/
SELECT * FROM employees;
SELECT * FROM offices;

DROP PROCEDURE getPhone;
CREATE PROCEDURE getPhone(en int, OUT m_phone varchar(50))
begin
	SELECT o.phone INTO m_phone
	FROM offices o JOIN employees e
	ON o.officeCode = e.officeCode
	WHERE e.employeeNumber = en;
end;

SET @m_phone = '';
CALL getPhone(1002, @m_phone);
SELECT @m_phone;









