/* COMMENT '고객번호를 사용하여 연락처와 지불총액을 inout모드의 파라미터를 사용하여 프로시저 밖에서 확인하시오' */
/* GROUP BY 연습 */
SELECT * FROM classicmodels.customers;
SELECT * FROM classicmodels.payments;

SELECT sum(p.amount), c.phone
FROM classicmodels.payments p
JOIN classicmodels.customers c
ON p.customernumber = c.customernumber
where c.customernumber = 103
group BY c.phone;
	
/* 1) 사원번호와 사원명을 커서를 사용하여 출력 */
SELECT * FROM classicmodels.offices;
SELECT * FROM classicmodels.employees;

DROP PROCEDURE cur_test1;
CREATE PROCEDURE cur_test1()
begin
	DECLARE msg LONGTEXT DEFAULT '';
	DECLARE m_no varchar(50);
	DECLARE m_name varchar(50);
	DECLARE finished INT DEFAULT 0;
	
	DECLARE cur CURSOR 
		SELECT employeeNumber, lastName
		FROM classicmodels.employees;
	DECLARE CONTINUE HANDLER  NOT FOUND SET finished = 1;
	
	OPEN cur;
	here : loop
		FETCH cur INTO m_no, m_name;
		IF finished = 1 then
			LEAVE here;
		END if;
		SET msg = concat(msg, m_no, '-', m_name, '\n');
	END loop;
	CLOSE cur;
	
	SELECT msg;
end;

CALL cur_test1();

/* 2) 사번을 입력받아 같은 부서 직원의 이름과, 이메일, 직무(jobTitle)을 출력 */
/* e1은 같은 부서 직원들이 있는 테이블, e2는 찾고자 하는 직원의 사번이 있는 테이블 */
SELECT * FROM classicmodels.offices;
SELECT * FROM classicmodels.employees;

DROP PROCEDURE cur_test2;
CREATE PROCEDURE cur_test2(IN en int)
begin
	DECLARE m_name varchar(30) DEFAULT '';
	DECLARE m_mail varchar(50) DEFAULT '';
	DECLARE m_job varchar(20) DEFAULT '';
	DECLARE finished INT DEFAULT 0;
	DECLARE msg LONGTEXT DEFAULT '';
	
	DECLARE cur CURSOR 
		SELECT e1.lastName, e1.email, e1.jobTitle
		FROM classicmodels.employees e1 JOIN classicmodels.employees e2
		ON e1.officeCode = e2.officeCode
		WHERE e2.employeeNumber = en;
	DECLARE CONTINUE HANDLER  NOT FOUND SET finished = 1;
	
	OPEN cur;
	here : loop
		FETCH cur INTO m_name, m_mail, m_job;
		IF finished = 1 then
			LEAVE here;
		END if;
		SET msg = concat(msg, 'name: '    , m_name, ' // ',
							  'email: '   , m_mail, ' // ',
							  'jobTitle: ', m_job , '\n');
	END loop;
	CLOSE cur;
	
	SELECT msg "employeeInmation";
end;

CALL cur_test2(1002);

/* 강사님 */
DROP PROCEDURE cur_test2_teacher;
CREATE PROCEDURE cur_test2_teacher(en int)
begin
	DECLARE flag INT DEFAULT 0;
	DECLARE m_lastName varchar(50);
	DECLARE m_email varchar(50);
	DECLARE m_jobTitle varchar(50);
	DECLARE str longtext;
	
	DECLARE cur CURSOR 
		SELECT other.lastName, other.email, other.jobTitle
		FROM classicmodels.employees other JOIN classicmodels.employees me
		ON other.officeCode = me.officeCode
		WHERE me.employeeNumber = en;
	DECLARE CONTINUE HANDLER  NOT FOUND SET flag = 1;
	
	OPEN cur;
	here : loop
		FETCH cur INTO m_lastName, m_email, m_jobTitle;
		IF flag = 1 then
			LEAVE here;
		END if;
		SET str = concat(str, m_lastName, m_email, m_jobTitle);
	END loop;
	CLOSE cur;
	SELECT str;
end;

/* 3) 고객번호를 입력받아 고객이름, 연락처, 지불액, 우편번호를 출력 */
SELECT * FROM classicmodels.customers;
SELECT * FROM classicmodels.payments;

DROP PROCEDURE cur_test3;
CREATE PROCEDURE cur_test3(IN cn int)
begin
	DECLARE m_name varchar(30) DEFAULT '';
	DECLARE m_phone varchar(30) DEFAULT '';
	DECLARE m_amount INT DEFAULT 0;
	DECLARE m_postalCode varchar(20) DEFAULT '';
	DECLARE finished INT DEFAULT 0;
	DECLARE msg LONGTEXT DEFAULT '';
	
	DECLARE cur CURSOR 
		SELECT c.customerName, c.phone, p.amount, c.postalCode
		FROM classicmodels.customers c JOIN classicmodels.payments p
		ON c.customerNumber = p.customerNumber
		WHERE p.customerNumber = cn;
	DECLARE CONTINUE HANDLER  NOT FOUND SET finished = 1;
	
	OPEN cur;
	here : loop
		FETCH cur INTO m_name, m_phone, m_amount, m_postalCode;
		IF finished = 1 then
			LEAVE here;
		END if;
		SET msg = concat(msg, 'name: '      , m_name      , ' // ',
							  'phone: '     , m_phone     , ' // ',
							  'amount: '    , m_amount    , ' // ',
							  'postalCode: ', m_postalCode, '\n');
	END loop;
	CLOSE cur;
	
	SELECT msg "customerInmation";
end;

CALL cur_test3(103);

/* 강사님 */
DROP PROCEDURE cur_test3_teacher;
CREATE PROCEDURE cur_test3_teacher(cn int)
begin
	DECLARE m_customerName varchar(50);
	DECLARE m_phone        varchar(30);
	DECLARE m_amount       decimal(10, 2);
	DECLARE m_postalCode   varchar(30);
	DECLARE flag           INT DEFAULT 0;
	
	DECLARE cur CURSOR 
		SELECT c.customerName, c.phone, p.amount, c.postalCode
		FROM   classicmodels.customers c
		JOIN   classicmodels.payments p
		ON     c.customerNumber = p.customerNumber
		WHERE  c.customerNumber = cn;
	DECLARE CONTINUE HANDLER  NOT FOUND SET flag = 1;
	
	OPEN cur;
	here : loop
		FETCH cur INTO m_customerName, m_phone, m_amount, m_postalCode;
		IF flag = 1 then
			LEAVE here;
		END if;
		
		SELECT m_customerName, m_phone, m_amount, m_postalCode;
	END loop;
	CLOSE cur;
end;

CALL cur_test3_teacher(103);

/* 4) 년도를 입력받아 해당 년도에 고객에게 지불된 지불액과, 고객명, 연락처 출력 */
SELECT * FROM classicmodels.customers;
SELECT * FROM classicmodels.payments;

DROP PROCEDURE cur_test4;
CREATE PROCEDURE cur_test4(IN pd int)
begin
	DECLARE m_name varchar(200) DEFAULT '';
	DECLARE m_date varchar(30) DEFAULT 0;
	DECLARE m_amount INT DEFAULT 0;
	DECLARE m_phone varchar(30) DEFAULT '';
	DECLARE finished INT DEFAULT 0;
	DECLARE msg LONGTEXT DEFAULT '';
	
	DECLARE cur CURSOR 
		SELECT c.customerName, p.paymentDate, p.amount, c.phone
		FROM classicmodels.customers c JOIN classicmodels.payments p
		ON c.customerNumber = p.customerNumber
		WHERE year(p.paymentDate) = pd;
	DECLARE CONTINUE HANDLER  NOT FOUND SET finished = 1;
	
	OPEN cur;
	here : loop
		FETCH cur INTO m_name, m_date, m_amount, m_phone;
		IF finished = 1 then
			LEAVE here;
		END if;
		SET msg = concat(msg, 'name: '  , m_name  , ' // ',
							  'date: '  , m_date  , ' // ',
							  'amount: ', m_amount, ' // ',
							  'phone: ' , m_phone , '\n');
	END loop;
	CLOSE cur;
	
	SELECT msg "customerInmation";
end;

CALL cur_test4(2004);

/* 강사님 */
DROP PROCEDURE cur_test4_teacher;
CREATE PROCEDURE cur_test4_teacher(Y int)
begin
	DECLARE m_amt            varchar(50);
	DECLARE m_customerNumber int;
	DECLARE m_customerName   varchar(50);
	DECLARE m_phone          varchar(50);
	DECLARE flag             INT;
	
	DECLARE cur CURSOR 
		SELECT customerNumber, amount
		FROM   classicmodels.payments
		WHERE  year(paymentDate) = Y;
	DECLARE CONTINUE HANDLER  NOT FOUND SET flag = 1;
	
	OPEN cur;
	here : loop
		FETCH cur INTO m_customerNumber, m_amt;
		IF flag = 1 then
			LEAVE here;
		END if;
		
		SELECT customerName, phone INTO m_customerName, m_phone
		FROM   classicmodels.customers
		WHERE  customerNumber = m_customerNumber;
		
		SELECT m_customerNumber, m_customerName, m_phone, m_amt;
	END loop;
	CLOSE cur;
end;

CALL cur_test4_teacher(2004);

/* 5) 신용한도액(creditLimit)과 지불 총액을 비교하여 신용한도액을
	  초과한 고객의 이름, 신용한도액, 지불총액, 연락처 조회 */
SELECT * FROM classicmodels.customers;
SELECT * FROM classicmodels.payments;

DROP PROCEDURE cur_test5;
CREATE PROCEDURE cur_test5()
begin
	DECLARE m_name varchar(200) DEFAULT '';
	DECLARE m_creditLimit INT DEFAULT 0;
	DECLARE m_total INT DEFAULT 0;
	DECLARE m_phone varchar(30) DEFAULT '';
	DECLARE finished INT DEFAULT 0;
	DECLARE msg LONGTEXT DEFAULT '';
	
	DECLARE cur CURSOR 
		SELECT customerName, creditLimit, sum(amount), phone
		FROM classicmodels.customers c JOIN classicmodels.payments p
		ON c.customerNumber = p.customerNumber
		GROUP BY c.customerNumber;
	DECLARE CONTINUE HANDLER  NOT FOUND SET finished = 1;
	
	OPEN cur;
	here : loop
		FETCH cur INTO m_name, m_creditLimit, m_total, m_phone;
		IF finished = 1 then
			LEAVE here;
		END if;
		
		IF m_total>m_creditLimit then
			SET msg = concat(msg, 'name: '       , m_name       , ' // ',
								  'creditLimit: ', m_creditLimit, ' // ',
								  'total: '      , m_total      , ' // ',
								  'phone: '      , m_phone      , '\n');
		END if;
	END loop;
	CLOSE cur;
	
	SELECT msg "creditInmation";
end;

CALL cur_test5();

/* 강사님 */
/* 지불 총액을 출력하지 않을 때 */
SELECT c.customerNumber, c.creditLimit, c.phone
FROM   classicmodels.customers c
WHERE  c.creditLimit < (
	SELECT sum(amount) FROM classicmodels.payments
	WHERE customerNumber = c.customerNumber
);

/* 지불 총액을 출력할 때 */
SELECT c.customerNumber, c.phone, c.creditLimit,
	   (
	   SELECT sum(amount) FROM classicmodels.payments
	   WHERE customerNumber = c.customerNumber
	   ) "tot"
FROM   classicmodels.customers c
WHERE  c.creditLimit < (
	SELECT sum(amount) FROM classicmodels.payments
	WHERE customerNumber = c.customerNumber
);


DROP PROCEDURE cur_test5_teacher;
CREATE PROCEDURE cur_test5_teacher()
begin
	DECLARE m_customerNumber int;
	DECLARE m_customerName   varchar(50);
	DECLARE m_creditLimit    decimal(10, 2);
	DECLARE m_phone          varchar(50);
	DECLARE flag             INT DEFAULT 0;
	DECLARE m_amount         decimal(10, 2);
	
	DECLARE cur CURSOR 
		SELECT customerNumber, customerName, creditLimit, phone
		FROM   classicmodels.customers;
	DECLARE CONTINUE HANDLER  NOT FOUND SET flag = 1;
	
	OPEN cur;
	here : loop
		FETCH cur INTO m_customerNumber, m_customerName, m_creditLimit, m_phone;
		IF flag = 1 then
			LEAVE here;
		END if;
		
		SELECT sum(amount) INTO m_amount
		FROM classicmodels.payments
		WHERE customerNumber = m_customerNumber;
		
		IF m_amount > m_creditLimit then
			SELECT m_customerName, m_creditLimit, m_amount, m_phone;
		END if;
	END loop;
	CLOSE cur;
end;

CALL cur_test5_teacher();










/* CONCAT 기능 확인 */
/* cursor는 같은 공간에 여러개가 있으면 에러 난다. */
SELECT * FROM classicmodels.customers;

DROP PROCEDURE concat_test1;
CREATE PROCEDURE concat_test1(c varchar(50), INOUT msg longtext)
begin
	DECLARE m_number  varchar(200);
	DECLARE m_phone varchar(30);
	DECLARE flag1   int;
	DECLARE flag2   int;
		
	DECLARE cur1 CURSOR 
		SELECT customerNumber
		FROM classicmodels.customers
		WHERE city = c;
	DECLARE CONTINUE HANDLER  NOT FOUND SET flag1 = 1;
	OPEN cur1;
	here1 : loop
		FETCH cur1 INTO m_number;
		IF flag1 = 1 then
			LEAVE here1;
		END if;
		SET msg = concat(msg, 'numer: ', m_number, '\n');
	END loop;
	CLOSE cur1;

	SELECT msg;
end;

DROP PROCEDURE concat_test2;
CREATE PROCEDURE concat_test2(cn int, INOUT msg longtext)
begin
	DECLARE m_number varchar(200);
	DECLARE m_amount varchar(30);
	DECLARE flag1    int;
	DECLARE flag2    int;
		
	DECLARE cur2 CURSOR 
		SELECT amount
		FROM classicmodels.payments
		WHERE customerNumber = cn;
	DECLARE CONTINUE HANDLER  NOT FOUND SET flag2 = 1;
	OPEN cur2;
	here2 : loop
		FETCH cur2 INTO m_amount;
		IF flag2 = 1 then
			LEAVE here2;
		END if;
		SET msg = concat(msg, 'amount: ', m_amount, '\n');
	END loop;
	CLOSE cur2;

	SELECT msg;
end;

SET @msg = '';
CALL concat_test1('Nantes', @msg);
CALL concat_test2(103, @msg);

SELECT @msg;









