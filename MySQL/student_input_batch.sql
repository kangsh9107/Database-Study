DROP PROCEDURE student_input_batch;

CREATE PROCEDURE student_input_batch()
BEGIN
	DECLARE cnt INT DEFAULT 1;
	
	here : LOOP
		INSERT INTO student(id, name, gender,
							pwd, phone, postalCode,
							address, address2, email)
					VALUES (CONCAT('a00', cnt), 'hong', 'm',
							'1111', CONCAT('010-1111', cnt), '25025',
							'서울', '서울대입구', 'hong@korea.com');
		
		IF cnt = 214 THEN
			LEAVE here;
		END IF;
		
		SET cnt = cnt + 1;
	END LOOP;
END;

CALL student_input_batch();

SELECT * FROM student;
DESC student;
COMMIT;

CREATE TABLE student(
	id varchar(20),
	name varchar(30),
	gender varchar(10),
	pwd varchar(30),
	phone varchar(50),
	postalCode varchar(30),
	address varchar(50),
	address2 varchar(50),
	email varchar(50)
);
DROP TABLE student;







