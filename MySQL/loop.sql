/* LOOP */
CREATE PROCEDURE loop_test1()
begin
	DECLARE a INT DEFAULT 0;
	DECLARE str varchar(100) DEFAULT '';
	
	here : loop
		SET a = a + 1;
		IF a>10 then
			LEAVE here;
		END if;
		SET str = CONCAT (str, ' ', a);
	END loop;
	
	SELECT str;
end;

CALL loop_test1();

/* loop를 사용한 구구단 출력 */
CREATE PROCEDURE loop_test2()
begin
	DECLARE dan INT DEFAULT 2;
	DECLARE su  INT DEFAULT 1;
	DECLARE r   INT DEFAULT 0;
	DECLARE str varchar(1000) DEFAULT '';

	outer_rtn : loop
		SET su = 1;
		SET str = '';
		inner_rtn : loop
			SET r = dan * su;
			SET str = concat(str, dan, ' * ', su, ' = ', r, '\n');
			SET su = su + 1;
			IF su>9 then
				LEAVE inner_rtn;
			END if;
		END loop;
		
		SELECT str;
		
		SET dan = dan + 1;
		IF dan>9 then
			LEAVE outer_rtn;
		END if;
	END loop;
end;

DROP PROCEDURE loop_test2;
CALL loop_test2();








