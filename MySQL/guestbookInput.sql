DESC guestbook;

SELECT * FROM guestbook;

DROP PROCEDURE inputG;
CREATE PROCEDURE inputG()
BEGIN
	DECLARE cnt INT DEFAULT 1;
	
	here : LOOP
		INSERT INTO guestbook(id, nal, doc, pwd)
		VALUES(CONCAT('a00',cnt), now(), CONCAT('안녕하시렵니까?',cnt), '1111');
	
		IF cnt = 300 THEN
			LEAVE here;
		END IF;
	
		SET cnt = cnt + 1;
	END LOOP;
END;
CALL inputG();

COMMIT;