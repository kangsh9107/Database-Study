SET GLOBAL log_bin_trust_function_creators = 1;

DROP FUNCTION getSerial;
CREATE FUNCTION getSerial(flag CHAR(1))
RETURNS INT
BEGIN
	DECLARE r INT DEFAULT 0;
	
	IF flag = 'i' THEN
		UPDATE serial SET sno = sno + 1;
	END IF;
	
	SELECT sno INTO r FROM SERIAL LIMIT 0,1;
	
	RETURN r;
END;



commit;
SELECT * FROM board;
SELECT * FROM boardAtt;
SELECT * FROM serial;
INSERT INTO serial(sno) values(0);

TRUNCATE board;
TRUNCATE boardAtt;
TRUNCATE serial;

DESC board;
DESC boardAtt;
DESC serial;

DELETE FROM board WHERE sno=496;

DROP PROCEDURE insertB;
CREATE PROCEDURE insertB()
BEGIN
	DECLARE cnt INT DEFAULT 1;
	
	here : LOOP
		INSERT INTO board(sno, grp, seq, deep, id, subject, doc, nal, hit)
		VALUES(getSerial('i'), getSerial(''), 0,0, CONCAT('hong00',cnt), CONCAT('제목00',cnt), CONCAT('내용00',cnt), sysdate(), 0);
		
		IF cnt = 500 THEN
			LEAVE here;
		END IF;
		
		SET cnt = cnt + 1;
	END LOOP;
END;
CALL insertB();