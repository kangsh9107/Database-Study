/* student ���� ������ �߰� */
SELECT * FROM student;
INSERT INTO student(phone) values('010');
INSERT INTO student(phone) values('010');
INSERT INTO student(gender) values('k');
INSERT INTO student(postalCode) values('abc');
INSERT INTO student(id) values('a001');
INSERT INTO student(id) values('a001');
commit;

/* id�� pk�� ���� */
ALTER TABLE student ADD CONSTRAINT student_id_pk PRIMARY key(id); /* ������ null�� ������ ���� */
UPDATE student SET id='b001' /WHERE id IS null; /* null���� �񱳿����� �Ұ���. IS �Ǵ� IS NOT */
SELECT * FROM student;
commit;

ALTER TABLE student ADD CONSTRAINT student_id_pk PRIMARY key(id); /* id�� �ߺ��� �� ������ ���� */

/* name�� NOT null�� ���� ���� ���� */
UPDATE student SET NAME = 'kim';
commit;
ALTER TABLE student MODIFY NAME varchar(30) NOT null;
INSERT INTO student(id) values('a001'); /* name�� NOT null�̶� ���� */
ALTER TABLE student MODIFY NAME varchar(30) null; /* �׽�Ʈ�� ���� null�� �ٲ� */
commit;

/* phone�� UNIQUE ���� ���� �߰� */
ALTER TABLE student ADD CONSTRAINT student_phone_uk unique(phone); /* �̹� 010�̶�� ���� �ߺ��̶� ���� */
SELECT * FROM student;
UPDATE student SET phone = null; /* �ߺ��� �� �ٲٰų� ������ �ϴµ� ���⼭�� �׳� ����. */
commit;
ALTER TABLE student ADD CONSTRAINT student_phone_uk unique(phone); /* UNIQUE ���� �߰� �Ϸ�. */
INSERT INTO student(phone) values('010');
INSERT INTO student(phone) values('010'); /* UNIQUE ���� ���� ������ ���� */

/* address�� DEFAULT ���� ���� ���� */
ALTER TABLE student MODIFY  address varchar(50) DEFAULT 'seoul';
DESC student;
ALTER TABLE student MODIFY  address varchar(50) DEFAULT null; /* DEFAULT �� ������� �ʰڴ�. */
;
DESC student;

/* gender�� CHECK ���� */
ALTER TABLE student ADD CONSTRAINT student_gender_ck
			check( gender in('m', 'f') ); /* �̹� k��� ���� �� �־ ���� */
SELECT * FROM student;

UPDATE student SET gender = 'm' WHERE gender = 'k';
SELECT * FROM student;
commit;
ALTER TABLE student ADD CONSTRAINT student_gender_ck
			check( gender in('m', 'f') );
SELECT * FROM student;

/* postalCode�� fk ���� */
ALTER TABLE student ADD CONSTRAINT student_postalCode_fk
			FOREIGN key(postalCode) REFERENCES member(id);
			/* member ���̺� ���� ���� �ʴ� ���� �̹� �ԷµǾ� �־� ���� */
SELECT * FROM student;
SELECT * FROM member;

UPDATE student SET postalCode='aaa' WHERE postalCode = 'abc';
commit;
ALTER TABLE student ADD CONSTRAINT student_postalCode_fk
			FOREIGN key(postalCode) REFERENCES member(id);





