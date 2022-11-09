CREATE DATABASE semi;

USE semi;

DROP TABLE member;
CREATE TABLE member(
	id         VARCHAR(30) PRIMARY KEY,
	pwd        VARCHAR(30),
	name       VARCHAR(30),
	gender     VARCHAR(10),
	age        INT,
	postalCode VARCHAR(10),
	address1   VARCHAR(50),
	address2   VARCHAR(50),
	phone      VARCHAR(30),
	email      VARCHAR(50),
	point      INT         DEFAULT 0
);
DROP PROCEDURE memberP;
CREATE PROCEDURE memberP()
BEGIN
	DECLARE cnt INT DEFAULT 1;
	
	here : LOOP
		INSERT INTO member(id, pwd, name, gender, age, postalCode, address1, address2, phone, email)
		VALUES(CONCAT('c00',cnt), '1111', 'hong', 'm', '15', '11111', '서울', '서울대입구', '010-1111', 'abc@naver.com');
		
		IF cnt = 50 THEN
			LEAVE here;
		END IF;
		
		SET cnt = cnt + 1;
	END LOOP;
END;
CALL memberP();
SELECT * FROM member;

DROP TABLE orders;
CREATE TABLE orders(
	id          VARCHAR(30),
	category    VARCHAR(30),
	SERIAL      INT,
	price       INT,
	orderNumber INT PRIMARY KEY,
	orderDate   DATE,
	status      INT DEFAULT 1
);
DROP PROCEDURE ordersP1;
CREATE PROCEDURE ordersP1()
BEGIN
	DECLARE cnt INT DEFAULT 1;
	
	here : LOOP
		INSERT INTO orders(id, category, serial, price, orderNumber, orderDate, status)
		VALUES(CONCAT('a00',cnt), 'outer', 123, 50000, cnt, '2021-07-28', 1);
		
		IF cnt = 50 THEN
			LEAVE here;
		END IF;
		
		SET cnt = cnt + 1;
	END LOOP;
END;
CALL ordersP1();

DROP PROCEDURE ordersP2;
CREATE PROCEDURE ordersP2()
BEGIN
	DECLARE cnt INT DEFAULT 51;
	
	here : LOOP
		INSERT INTO orders(id, category, serial, price, orderNumber, orderDate, status)
		VALUES(CONCAT('a00',cnt), 'top', 567, 100000, cnt, '2022-10-17', 1);
		
		IF cnt = 100 THEN
			LEAVE here;
		END IF;
		
		SET cnt = cnt + 1;
	END LOOP;
END;
CALL ordersP2();

DROP PROCEDURE ordersP3;
CREATE PROCEDURE ordersP3()
BEGIN
	DECLARE cnt INT DEFAULT 101;
	
	here : LOOP
		INSERT INTO orders(id, category, serial, price, orderNumber, orderDate, status)
		VALUES(CONCAT('b00',cnt), 'bottom', 789, 250000, cnt, '2022-11-10', 1);
		
		IF cnt = 150 THEN
			LEAVE here;
		END IF;
		
		SET cnt = cnt + 1;
	END LOOP;
END;
CALL ordersP3();

DROP PROCEDURE ordersP4;
CREATE PROCEDURE ordersP4()
BEGIN
	DECLARE cnt INT DEFAULT 151;
	
	here : LOOP
		INSERT INTO orders(id, category, serial, price, orderNumber, orderDate, status)
		VALUES(CONCAT('c00',cnt), 'shoes', 456, 8000, cnt, '2020-03-22', 1);
		
		IF cnt = 180 THEN
			LEAVE here;
		END IF;
		
		SET cnt = cnt + 1;
	END LOOP;
END;
CALL ordersP4();

DROP PROCEDURE ordersP5;
CREATE PROCEDURE ordersP5()
BEGIN
	DECLARE cnt INT DEFAULT 181;
	
	here : LOOP
		INSERT INTO orders(id, category, serial, price, orderNumber, orderDate, status)
		VALUES(CONCAT('c00',cnt), 'acc', 1004, 7600, cnt, '2022-02-10', 1);
		
		IF cnt = 250 THEN
			LEAVE here;
		END IF;
		
		SET cnt = cnt + 1;
	END LOOP;
END;
CALL ordersP5();
SELECT * FROM orders;

DROP TABLE products;
CREATE TABLE products(
	category    VARCHAR(30),
	SERIAL      INT PRIMARY KEY,
	productName VARCHAR(30),
	price       INT,
	stock       INT,
	salesRate   INT
);
DROP PROCEDURE productsP1;
CREATE PROCEDURE productsP1()
BEGIN
	DECLARE cnt INT DEFAULT 1;
	
	here : LOOP
		INSERT INTO products(category, serial, price, stock, salesRate)
		VALUES('outer', 123, 50000, 500, 253);
		
		IF cnt = 1 THEN
			LEAVE here;
		END IF;
		
		SET cnt = cnt + 1;
	END LOOP;
END;
CALL productsP1();

DROP PROCEDURE productsP2;
CREATE PROCEDURE productsP2()
BEGIN
	DECLARE cnt INT DEFAULT 1;
	
	here : LOOP
		INSERT INTO products(category, serial, price, stock, salesRate)
		VALUES('top', 567, 100000, 300, 650);
		
		IF cnt = 1 THEN
			LEAVE here;
		END IF;
		
		SET cnt = cnt + 1;
	END LOOP;
END;
CALL productsP2();

DROP PROCEDURE productsP3;
CREATE PROCEDURE productsP3()
BEGIN
	DECLARE cnt INT DEFAULT 1;
	
	here : LOOP
		INSERT INTO products(category, serial, price, stock, salesRate)
		VALUES('bottom', 789, 8000, 1200, 800);
		
		IF cnt = 1 THEN
			LEAVE here;
		END IF;
		
		SET cnt = cnt + 1;
	END LOOP;
END;
CALL productsP3();

DROP PROCEDURE productsP4;
CREATE PROCEDURE productsP4()
BEGIN
	DECLARE cnt INT DEFAULT 1;
	
	here : LOOP
		INSERT INTO products(category, serial, price, stock, salesRate)
		VALUES('shoes', 456, 8000, 128, 780);
		
		IF cnt = 1 THEN
			LEAVE here;
		END IF;
		
		SET cnt = cnt + 1;
	END LOOP;
END;
CALL productsP4();

DROP PROCEDURE productsP5;
CREATE PROCEDURE productsP5()
BEGIN
	DECLARE cnt INT DEFAULT 1;
	
	here : LOOP
		INSERT INTO products(category, serial, price, stock, salesRate)
		VALUES('acc', 1005, 7600, 999, 555);
		
		IF cnt = 1 THEN
			LEAVE here;
		END IF;
		
		SET cnt = cnt + 1;
	END LOOP;
END;
CALL productsP5();
SELECT * FROM products;



SELECT SERIAL FROM products ORDER BY salesRate DESC LIMIT 3; ##  ***(1) 인덱스 메인 베스트10
select * from member where id='a001'; ## ***(2) 내정보보기
DELETE from member where id='a001' AND pwd='1111'; ## ***(3) 회원탈퇴
SELECT point from orders where id='a002'; ## ***(4) 마이페이지 마일리지 출력
select point from member where id='a002'; ## ***(5) 마일리지 확인
select id from member where id='a002' and pwd=1111; ##  ***(6) 로그인/로그아웃
insert into member(id,pwd,name,gender,age,postalCode,address1,address2,phone,email) 
			VALUES (?,?,?,?,?,?,?,?,?,?); ##  ***(7) 회원가입

select sum(price) from orders where serial=456 AND year(orderDate)=2020; ##  ***(8) 관리자 메인 total price
select sum(price) from orders where serial=1004 and year(orderDate)=2022 AND month(orderDate)=02; ##  ***(9) 월별 total price
select sum(price) from orders where serial=1004 and date(orderDate)='2022-02-10'; ##  ***(10) 일자별 total price
SELECT count(*) FROM orders; ##  ***(11) 주문건수 조회
SELECT count(status) FROM orders WHERE STATUS = 1; ##  ***(12) 주문상태 조회
SELECT * FROM member; ##  ***(13) 회원관리 조회
SELECT * FROM member WHERE id LIKE '%a%'; ##  ***(14) 회원관리 검색
UPDATE member SET id='a0000' WHERE id='a002'; ##  ***(15) 회원관리 수정
SELECT * FROM orders; ##  ***(16) 주문정보 조회
DELETE FROM orders WHERE orderNumber='1'; ## ***(17) 환불승인, 주문삭제
SELECT * FROM products; ## ***(18) 상품관리 조회

SELECT count(gender) FROM member WHERE gender='m'; ## ***(19) 통계 회원 분포도.
SELECT count(age) FROM member WHERE age > 1 AND age < 20;
SELECT count(price) from orders where year(orderDate)=2020; ## ***(20) 기간별 판매통계
SELECT count(*) FROM orders WHERE category='outer'; ## ***(21) 카테고리별 판매통계
SELECT SERIAL FROM products
WHERE category=(SELECT category FROM products WHERE serial=1004)
ORDER BY salesRate DESC LIMIT 3; ## ***(22) 내가 보고있는 카테고리 베스트5추천

DESC orders;
SELECT * FROM products WHERE category='top'; ## ***(23) 카테고리 선택시 해당 카테고리 상품 출력
SELECT * FROM products WHERE serial=1004; ## ***(24) 상품 선택시 해당 상품 출력
INSERT INTO orders(id, category, serial, price, orderDate)
            values('g00000', 'outer', 555, 80000, now); ## ***(25) 주문버튼 눌렀을 때 orders에 추가
UPDATE products SET stock=(stock-1) WHERE serial=1004; ## ***(26) 주문완료시 해당상품 재고-1

UPDATE member SET POINT = POINT + ? WHERE id='a001'; ## ***(27) 주문금액의 1% 마일리지 적립
SELECT * FROM orders WHERE id='a005'; ## ***(28) 마이페이지 주문정보확인 클릭시 본인 주문정보 출력
SELECT sum(price) FROM orders WHERE id='a005' AND year(orderDate)=2021; ## ***(29) 작년 총 구매금액에 따른 등급출력
UPDATE orders SET STATUS = 4 WHERE orderNumber=25; ## ***(30) 마이페이지 내주문보기에서 리스트 선택시 환불요청
UPDATE products SET salesRate=(salesRate+1) WHERE serial=1004; ## ***(31) 주문완료시 해당상품 판매량+1




