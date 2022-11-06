/* CASE 1번 유형 */
CREATE PROCEDURE case_test1()
begin
	DECLARE score INT DEFAULT 0;
	DECLARE str varchar(100);
	
	SET score = 80;
	CASE score
		WHEN 80 THEN SET str = '팔십';
		WHEN 70 THEN SET str = '칠십';
	END case;
	
	SELECT score, str;
end;

CALL case_test1();

/* CASE 2번 유형 */
CREATE PROCEDURE case_test2()
begin
	DECLARE score INT DEFAULT 0;
	DECLARE str varchar(100);
	
	SET score = 80;
	case
		WHEN score>=90 THEN SET str = 'A';
		WHEN score>=80 THEN SET str = 'B';
		WHEN score>=70 THEN SET str = 'C';
		ELSE SET str = 'F';
	END case;
	
	SELECT score, str;
end;

CALL case_test2();






