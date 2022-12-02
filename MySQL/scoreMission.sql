commit;

SELECT * FROM score;

DROP PROCEDURE scoreInput;
CREATE PROCEDURE scoreInput()
BEGIN
	DECLARE cnt INT DEFAULT 271;
	
	here : LOOP
		INSERT INTO score(id, subject, score, mdate)
		VALUES(CONCAT('a00',cnt), '파이썬', FORMAT((CAST(RAND() * 10000 AS SIGNED) + 1) / 100,1), NOW());
	
		IF cnt = 300 THEN
			LEAVE here;
		END IF;
		
		SET cnt = cnt + 1;
	END LOOP;
END;
CALL scoreInput();



select count(serial) from score
where serial=1
or    id  like '%$%'
or    subject like '%%'
or    score like '%%';

select * from score
where serial=1
or    id  like '%%'
or    subject like '%%'
or    score like '%%'
order by score desc
LIMIT 0, 10;