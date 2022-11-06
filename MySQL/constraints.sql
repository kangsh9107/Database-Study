/* 제약 조건 */
USE information_schema;
SHOW tables;
SELECT * FROM table_constraints
WHERE table_name = 'customers';

/* 테이블 생성시 제약조건 추가 type1 */
USE mydb;
ALTER TABLE member ADD PRIMARY key(id);
CREATE TABLE std1(
	sno varchar(30) PRIMARY key,
	mname varchar(20) NOT null,
	phone varchar(20) unique,
	address varchar(50) DEFAULT '서울',
	gender varchar(2) CHECK ( gender in('m', 'f') ),
	zipcode varchar(30),
	score INT check( score BETWEEN 0 AND 100 ),
	FOREIGN key(zipcode) REFERENCES member(id)
);

SELECT * FROM student;
INSERT INTO student(id) values('a001');
INSERT INTO student(id, name) values('a001', 'hong');
INSERT INTO student values('a001', 'hong'); /* 칼럼명을 생략하면 모든 칼럼에 각각 해당하는 값을 넣어야 한다. 잘 안쓴다. */
INSERT INTO student values('a001', 'hong', 'm', '1111', '010', '12345', '관악구', '봉천동', 'hong@');

USE mydb;
SELECT * FROM member;
SELECT * FROM std1;
INSERT INTO std1(sno) values('aaaa'); /* mname이 Null이라 안된다. */
INSERT INTO std1(sno, mname) values('aaaa', 'hong');
INSERT INTO std1(sno, mname) values('aaaa', 'hong'); /* 키가 중복되어 안된다. */
INSERT INTO std1(sno, mname) values('bbbb', 'kim');  /* phone이 unique라서 Null도 하나만 있어야 하는데 버그로 들어갔다. */
INSERT INTO std1(sno, mname, phone) values('cccc', 'han', '010');
INSERT INTO std1(sno, mname, phone) values('dddd', 'jin', '010'); /* phone이 중복되어 안된다. */
INSERT INTO std1(sno, mname, gender) values('eeee', 'park', 'k'); /* m과 k만 가능하다. */
INSERT INTO std1(sno, mname, gender, zipcode)
			values('hhhh', 'yan', 'm', 'aaa'); /* zipcode는 member의 id를 참조하기 때문에 거기 존재하는 값만 들어간다. */
commit;
SELECT * FROM std1;

/* 테이블 생성시 제약조건 추가 type2 */
USE mydb;
CREATE TABLE std2(
	sno varchar(30),
	mname varchar(30) NOT null,
	phone varchar(30),
	address varchar(50) DEFAULT 'seoul',
	gender char(2),
	zipcode varchar(30),
	score int,
	
	CONSTRAINT std2_sno_pk PRIMARY key(sno),
	CONSTRAINT std_phone_uk UNIQUE (phone),
	CONSTRAINT std2_gender_ck check( gender in('m', 'f') ),
	CONSTRAINT std2_score_ck check( score BETWEEN 0 AND 100 ),
	CONSTRAINT std2_zipcode_fk FOREIGN key(zipcode) REFERENCES member(id)
);
SELECT * FROM std2;

INSERT INTO std2(sno) values('a100'); /* mname이 NOT null이라 오류 */
INSERT INTO std2(sno, mname) values('a100', 'sin');
INSERT INTO std2(sno, mname, phone) values('b100', 'back', '017');
INSERT INTO std2(sno, mname, phone) values('c100', 'go', '017'); /* phone이 unique라 오류 */
INSERT INTO std2(sno, mname, gender) values('d100', 'yoo', 'k'); /* gender가 check로 m과 f만 가능 */
INSERT INTO std2(sno, mname, zipcode)
			values('e100', 'jang', 'ggg'); /* zipcode가 member 테이블의 id를 참조하기에 없는 값은 오류 */
INSERT INTO std2(sno, mname, score) values('f100', 'sa', '150'); /* score가 check로 0~100 까지만 가능 */
INSERT INTO std2 values('g100', 'gong'); /* 칼럼을 생략하면 모든 칼럼에 각각 해당하는 값을 입력해야 한다. */
INSERT INTO std2 values('g100', 'gong', '018', 'busan', 'm', 'aaa', '100');












