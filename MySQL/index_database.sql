/* 학생 정보 입력에 있는 정보들이 입력될 테이블 만들기 */
CREATE TABLE student(
	id varchar(20),
	name varchar(30),
	gender varchar(10),
	pwd varchar(30),
	phone varchar(50),
	postalCode varchar(10),
	address varchar(50),
	address2 varchar(50),
	email varchar(50)
);

/* 성적 관리에 있는 정보들이 입력될 테이블 만들기 */
CREATE TABLE score(
	serial int,
	id varchar(20),
	subject varchar(20),
	score decimal(10, 2),
	mdate date
);

/* 회원 관리에 있는 정보들이 입력될 테이블 만들기 */
CREATE TABLE member(
	id varchar(20),
	name varchar(30),
	gender varchar(10),
	phone varchar(50),
	picture varchar(100),
	mdate date
);