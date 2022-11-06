/* student 제약 조건을 추가 */
SELECT * FROM student;
INSERT INTO student(phone) values('010');
INSERT INTO student(phone) values('010');
INSERT INTO student(gender) values('k');
INSERT INTO student(postalCode) values('abc');
INSERT INTO student(id) values('a001');
INSERT INTO student(id) values('a001');
commit;

/* id에 pk를 설정 */
ALTER TABLE student ADD CONSTRAINT student_id_pk PRIMARY key(id); /* 지금은 null값 때문에 오류 */
UPDATE student SET id='b001' /WHERE id IS null; /* null값은 비교연산자 불가능. IS 또는 IS NOT */
SELECT * FROM student;
commit;

ALTER TABLE student ADD CONSTRAINT student_id_pk PRIMARY key(id); /* id에 중복된 값 때문에 오류 */

/* name에 NOT null로 제약 조건 설정 */
UPDATE student SET NAME = 'kim';
commit;
ALTER TABLE student MODIFY NAME varchar(30) NOT null;
INSERT INTO student(id) values('a001'); /* name이 NOT null이라 오류 */
ALTER TABLE student MODIFY NAME varchar(30) null; /* 테스트를 위해 null로 바꿈 */
commit;

/* phone에 UNIQUE 제약 조건 추가 */
ALTER TABLE student ADD CONSTRAINT student_phone_uk unique(phone); /* 이미 010이라는 값이 중복이라 오류 */
SELECT * FROM student;
UPDATE student SET phone = null; /* 중복된 값 바꾸거나 지워야 하는데 여기서는 그냥 지움. */
commit;
ALTER TABLE student ADD CONSTRAINT student_phone_uk unique(phone); /* UNIQUE 설정 추가 완료. */
INSERT INTO student(phone) values('010');
INSERT INTO student(phone) values('010'); /* UNIQUE 제약 조건 때문에 오류 */

/* address에 DEFAULT 제약 조건 설정 */
ALTER TABLE student MODIFY  address varchar(50) DEFAULT 'seoul';
DESC student;
ALTER TABLE student MODIFY  address varchar(50) DEFAULT null; /* DEFAULT 값 사용하지 않겠다. */
;
DESC student;

/* gender에 CHECK 설정 */
ALTER TABLE student ADD CONSTRAINT student_gender_ck
			check( gender in('m', 'f') ); /* 이미 k라는 값이 들어가 있어서 오류 */
SELECT * FROM student;

UPDATE student SET gender = 'm' WHERE gender = 'k';
SELECT * FROM student;
commit;
ALTER TABLE student ADD CONSTRAINT student_gender_ck
			check( gender in('m', 'f') );
SELECT * FROM student;

/* postalCode에 fk 설정 */
ALTER TABLE student ADD CONSTRAINT student_postalCode_fk
			FOREIGN key(postalCode) REFERENCES member(id);
			/* member 테이블에 존재 하지 않는 값이 이미 입력되어 있어 오류 */
SELECT * FROM student;
SELECT * FROM member;

UPDATE student SET postalCode='aaa' WHERE postalCode = 'abc';
commit;
ALTER TABLE student ADD CONSTRAINT student_postalCode_fk
			FOREIGN key(postalCode) REFERENCES member(id);





