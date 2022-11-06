/* ���� ���� */
USE information_schema;
SHOW tables;
SELECT * FROM table_constraints
WHERE table_name = 'customers';

/* ���̺� ������ �������� �߰� type1 */
USE mydb;
ALTER TABLE member ADD PRIMARY key(id);
CREATE TABLE std1(
	sno varchar(30) PRIMARY key,
	mname varchar(20) NOT null,
	phone varchar(20) unique,
	address varchar(50) DEFAULT '����',
	gender varchar(2) CHECK ( gender in('m', 'f') ),
	zipcode varchar(30),
	score INT check( score BETWEEN 0 AND 100 ),
	FOREIGN key(zipcode) REFERENCES member(id)
);

SELECT * FROM student;
INSERT INTO student(id) values('a001');
INSERT INTO student(id, name) values('a001', 'hong');
INSERT INTO student values('a001', 'hong'); /* Į������ �����ϸ� ��� Į���� ���� �ش��ϴ� ���� �־�� �Ѵ�. �� �Ⱦ���. */
INSERT INTO student values('a001', 'hong', 'm', '1111', '010', '12345', '���Ǳ�', '��õ��', 'hong@');

USE mydb;
SELECT * FROM member;
SELECT * FROM std1;
INSERT INTO std1(sno) values('aaaa'); /* mname�� Null�̶� �ȵȴ�. */
INSERT INTO std1(sno, mname) values('aaaa', 'hong');
INSERT INTO std1(sno, mname) values('aaaa', 'hong'); /* Ű�� �ߺ��Ǿ� �ȵȴ�. */
INSERT INTO std1(sno, mname) values('bbbb', 'kim');  /* phone�� unique�� Null�� �ϳ��� �־�� �ϴµ� ���׷� ����. */
INSERT INTO std1(sno, mname, phone) values('cccc', 'han', '010');
INSERT INTO std1(sno, mname, phone) values('dddd', 'jin', '010'); /* phone�� �ߺ��Ǿ� �ȵȴ�. */
INSERT INTO std1(sno, mname, gender) values('eeee', 'park', 'k'); /* m�� k�� �����ϴ�. */
INSERT INTO std1(sno, mname, gender, zipcode)
			values('hhhh', 'yan', 'm', 'aaa'); /* zipcode�� member�� id�� �����ϱ� ������ �ű� �����ϴ� ���� ����. */
commit;
SELECT * FROM std1;

/* ���̺� ������ �������� �߰� type2 */
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

INSERT INTO std2(sno) values('a100'); /* mname�� NOT null�̶� ���� */
INSERT INTO std2(sno, mname) values('a100', 'sin');
INSERT INTO std2(sno, mname, phone) values('b100', 'back', '017');
INSERT INTO std2(sno, mname, phone) values('c100', 'go', '017'); /* phone�� unique�� ���� */
INSERT INTO std2(sno, mname, gender) values('d100', 'yoo', 'k'); /* gender�� check�� m�� f�� ���� */
INSERT INTO std2(sno, mname, zipcode)
			values('e100', 'jang', 'ggg'); /* zipcode�� member ���̺��� id�� �����ϱ⿡ ���� ���� ���� */
INSERT INTO std2(sno, mname, score) values('f100', 'sa', '150'); /* score�� check�� 0~100 ������ ���� */
INSERT INTO std2 values('g100', 'gong'); /* Į���� �����ϸ� ��� Į���� ���� �ش��ϴ� ���� �Է��ؾ� �Ѵ�. */
INSERT INTO std2 values('g100', 'gong', '018', 'busan', 'm', 'aaa', '100');












