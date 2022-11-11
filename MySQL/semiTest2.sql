USE semi;
commit;

/***** member *****/
/***** member *****/
/***** member *****/
/***** member *****/
/***** member *****/
DROP TABLE member;
CREATE TABLE member(
	id         VARCHAR(30) PRIMARY KEY,
	pwd        VARCHAR(30),
	name       VARCHAR(30),
	gender     VARCHAR(10) CHECK(gender IN('f', 'm')),
	age        INT,
	postalCode VARCHAR(10),
	address1   VARCHAR(30),
	address2   VARCHAR(50),
	phone      VARCHAR(30) UNIQUE,
	email      VARCHAR(30) UNIQUE,
	point      INT         DEFAULT 0
);

DROP PROCEDURE memberAdmin;
CREATE PROCEDURE memberAdmin()
BEGIN
	DECLARE cnt INT DEFAULT 1;
	
	here : LOOP
		INSERT INTO member(id, pwd, name, gender, age, postalCode, address1, address2, phone, email)
		VALUES('admin', '1111', 'tester', 'm', 30, '11111', '서울', '에그옐로우', '010-1111-1111', 'abc@naver.com');
		
		IF cnt = 1 THEN
			LEAVE here;
		END IF;
		
		SET cnt = cnt + 1;
	END LOOP;
END;
CALL memberAdmin();

DROP PROCEDURE memberM;
CREATE PROCEDURE memberM()
BEGIN
	DECLARE cnt INT DEFAULT 1;
	
	here : LOOP
		INSERT INTO member(id, pwd, name, gender, age, postalCode, address1, address2, phone, email)
		VALUES(CONCAT('m00',cnt), '1111', concat(char(round(rand()*25)+65), char(round(rand()*25)+97), char(round(rand()*25)+97), char(round(rand()*25)+97), char(round(rand()*25)+97), char(round(rand()*25)+97), char(round(rand()*25)+97), char(round(rand()*25)+97)),
			   'm', FLOOR(RAND() * 70), ROUND(RAND() * 100000), '서울', '에그옐로우', CONCAT('010-1111-', cnt), CONCAT('abc', cnt, '@naver.com'));
		
		IF cnt = 200 THEN
			LEAVE here;
		END IF;
		
		SET cnt = cnt + 1;
	END LOOP;
END;
CALL memberM();

DROP PROCEDURE memberF;
CREATE PROCEDURE memberF()
BEGIN
	DECLARE cnt INT DEFAULT 1;
	
	here : LOOP
		INSERT INTO member(id, pwd, name, gender, age, postalCode, address1, address2, phone, email)
		VALUES(CONCAT('f00',cnt), '1111', concat(char(round(rand()*25)+65), char(round(rand()*25)+97), char(round(rand()*25)+97), char(round(rand()*25)+97), char(round(rand()*25)+97), char(round(rand()*25)+97), char(round(rand()*25)+97), char(round(rand()*25)+97)),
			   'f', FLOOR(RAND() * 70), ROUND(RAND() * 100000), '서울', '에그옐로우', CONCAT('010-2222-', cnt), CONCAT('def', cnt, '@naver.com'));
		
		IF cnt = 100 THEN
			LEAVE here;
		END IF;
		
		SET cnt = cnt + 1;
	END LOOP;
END;
CALL memberF();

SELECT * FROM member;
SELECT * FROM orders;
SELECT * FROM products;

/***** orders *****/
/***** orders *****/
/***** orders *****/
/***** orders *****/
/***** orders *****/
DROP TABLE orders;
CREATE TABLE orders(
	id          VARCHAR(30),
	category    VARCHAR(30),
	SERIAL      INT,
	productName VARCHAR(50),
	price       INT,
	orderNumber INT AUTO_INCREMENT PRIMARY KEY,
	orderDate   DATE,
	status      INT DEFAULT 1
);

DROP PROCEDURE ordersOuter;
CREATE PROCEDURE ordersOuter()
BEGIN
	DECLARE cnt INT DEFAULT 1;
	
	here : LOOP
		UPDATE orders SET orderDate='2022-11-11'
		WHERE orderNumber > 700
		AND orderNumber <= 706;
		
		IF cnt = 1 THEN
			LEAVE here;
		END IF;
		
		SET cnt = cnt + 1;
	END LOOP;
END;
CALL ordersOuter();

SELECT * FROM orders;

/***** products *****/
/***** products *****/
/***** products *****/
/***** products *****/
/***** products *****/
DROP TABLE products;
CREATE TABLE products(
	category    VARCHAR(30),
	SERIAL      INT AUTO_INCREMENT PRIMARY KEY,
	productName VARCHAR(50),
	price       INT,
	stock       INT,
	salesRate   INT,
	img         VARCHAR(50)
);

DROP PROCEDURE productsOuter;
CREATE PROCEDURE productsOuter()
BEGIN
	DECLARE cnt INT DEFAULT 1;
	
	here : LOOP
		INSERT INTO products(category, productName, price, stock, salesRate, img)
		VALUES('outer', CONCAT('outer', cnt), ROUND(RAND() * 1000000, -3), FLOOR(RAND() * 500), FLOOR(RAND() * 100), CONCAT('outer', cnt));
		
		IF cnt = 70 THEN
			LEAVE here;
		END IF;
		
		SET cnt = cnt + 1;
	END LOOP;
END;
CALL productsOuter();

DROP PROCEDURE productsTop;
CREATE PROCEDURE productsTop()
BEGIN
	DECLARE cnt INT DEFAULT 1;
	
	here : LOOP
		INSERT INTO products(category, productName, price, stock, salesRate, img)
		VALUES('top', CONCAT('top', cnt), ROUND(RAND() * 1000000, -3), FLOOR(RAND() * 500), FLOOR(RAND() * 100), CONCAT('top', cnt));
		
		IF cnt = 70 THEN
			LEAVE here;
		END IF;
		
		SET cnt = cnt + 1;
	END LOOP;
END;
CALL productsTop();

DROP PROCEDURE productsBottom;
CREATE PROCEDURE productsBottom()
BEGIN
	DECLARE cnt INT DEFAULT 1;
	
	here : LOOP
		INSERT INTO products(category, productName, price, stock, salesRate, img)
		VALUES('bottom', CONCAT('bottom', cnt), ROUND(RAND() * 1000000, -3), FLOOR(RAND() * 500), FLOOR(RAND() * 100), CONCAT('bottom', cnt));
		
		IF cnt = 70 THEN
			LEAVE here;
		END IF;
		
		SET cnt = cnt + 1;
	END LOOP;
END;
CALL productsBottom();

DROP PROCEDURE productsShoes;
CREATE PROCEDURE productsShoes()
BEGIN
	DECLARE cnt INT DEFAULT 1;
	
	here : LOOP
		INSERT INTO products(category, productName, price, stock, salesRate, img)
		VALUES('shoes', CONCAT('shoes', cnt), ROUND(RAND() * 1000000, -3), FLOOR(RAND() * 500), FLOOR(RAND() * 100), CONCAT('shoes', cnt));
		
		IF cnt = 70 THEN
			LEAVE here;
		END IF;
		
		SET cnt = cnt + 1;
	END LOOP;
END;
CALL productsShoes();

DROP PROCEDURE productsAcc;
CREATE PROCEDURE productsAcc()
BEGIN
	DECLARE cnt INT DEFAULT 1;
	
	here : LOOP
		INSERT INTO products(category, productName, price, stock, salesRate, img)
		VALUES('acc', CONCAT('acc', cnt), ROUND(RAND() * 1000000, -3), FLOOR(RAND() * 500), FLOOR(RAND() * 100), CONCAT('acc', cnt));
		
		IF cnt = 70 THEN
			LEAVE here;
		END IF;
		
		SET cnt = cnt + 1;
	END LOOP;
END;
CALL productsAcc();

SELECT * FROM products;





/***** 쿼리문 *****/
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

commit;
SELECT * FROM member WHERE id='0000aaa';
SELECT * FROM member WHERE id='0000bbb';
