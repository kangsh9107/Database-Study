/***** 1번 *****/
/* VIEW 사용 목적
(1) 보안 : 고객의 개인정보나 회사의 중요한 정보가 포함되어 있는 테이블일 경우
           필요한 정보만 추려서 View를 만들어 사용하면 정보 유출을 예방 할 수 있다.
           이렇게 필요한 정보만 추려서 View를 만들면 일종의 가상테이블처럼 사용 가능하다.
(2) 재사용성 : 자주 사용하는 쿼리나 길고 복잡한 쿼리의 경우 View로 만들어 놓으면
               다음에 재사용하기 굉장히 편하다.
               추가로 이미 회사나 선배들이 사용하고 있는 View의 이름과 동일한 View를
               만들면 회사생활이 힘들어질 수 있으니 주의하는게 좋다.
 */
SELECT * FROM employees;
SELECT * FROM offices;

CREATE OR REPLACE VIEW empinfo AS
SELECT e.employeeNumber '사번', e.lastName '사원명', o.officeCode '사무실코드',
       o.phone '사무실연락처' , o.city '도시'
FROM   employees e JOIN offices o
ON     e.officeCode = o.officeCode
ORDER BY e.employeeNumber asc; /* 19행 : 사번 오름차순 */

SELECT * FROM empinfo;

/***** 1번 강사님 *****/
CREATE VIEW empInfo as
	SELECT e.employeeNumber, e.lastName, e.officeCode, o.phone, o.city
	FROM   employees e JOIN offices o
	ON     e.officeCode = o.officeCode;

SELECT * FROM empInfo;

/***** 2번 *****/
CREATE TABLE student(
	sno     INT                 ,
	mname   varchar(50) NOT null,
	address varchar(50)         ,
	phone   varchar(50)
);

ALTER TABLE student ADD CONSTRAINT student_pk PRIMARY key(sno);
ALTER TABLE student MODIFY sno INT auto_increment; /* 학번 자동 추가 */

CREATE TABLE score(
	sno     INT           ,
	mdate   DATETIME      ,
	SUBJECT varchar(50)   ,
	score   decimal(10, 2),
	exam    varchar(50)   ,
	
	FOREIGN key(sno) REFERENCES student(sno)
);

SELECT * FROM student;
SELECT * FROM score;

SELECT * FROM information_schema.key_column_usage
WHERE table_name = 'score'; /* 외래키 참조 확인 */

/***** 2번 강사님 *****/
CREATE TABLE student(
	sno INT PRIMARY key,
	mName varchar(20),
	address varchar(100),
	phone varchar(20)
);

CREATE TABLE score(
	mdate date,
	SUBJECT varchar(100),
	score int,
	exam varchar(50),
	sno int,
	
	FOREIGN key(sno) REFERENCES student(sno)
);

/***** 3번 *****/
CREATE TABLE member(
	MID     INT                 ,
	NAME    varchar(50) NOT null,
	phone   varchar(50)         ,
	address varchar(50)         ,
	age     INT                 ,
	
	CONSTRAINT member_mid_pk PRIMARY key(mid),
	CONSTRAINT member_phone_uk unique(phone),
	CONSTRAINT member_age check(age>0)
);

DESC member;
INSERT INTO member values(1, 'hong', '1234', '서울', 0); /* age가 0보다 크지 않아서 오류 */
INSERT INTO member values(1, 'hong', '1234', '서울', 1); /* 정상적으로 추가 */







