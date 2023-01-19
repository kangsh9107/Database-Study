## member
## pwd(1111) : sDRLe/gbqtGUc7EVp/uYSQ==
/*
CREATE PROCEDURE inputMemberM()
BEGIN
	DECLARE cnt INT DEFAULT 1;
	
	here : LOOP
		INSERT INTO member(id,                             pwd,                        email,
						   nickname,                       gender,                     age,
						   profile_img,                    account_type,               ban_status,
						   pixel,                          grade,                      join_date,
						   email_status,                   mento_status,               corp_status)
			   VALUES(CONCAT('kodup',cnt),                 'sDRLe/gbqtGUc7EVp/uYSQ==', CONCAT('info',cnt,'@kodup.kr'),
			   		  CONCAT(LEFT(UUID(),4), cnt),         'm',                        CONCAT((1960+FLOOR(RAND() * 32)),10+(FLOOR(RAND() * 3)),10+(FLOOR(RAND() * 18))),
			   		  CONCAT((1+FLOOR(RAND()*120)),'.png'), FLOOR(RAND()*2),           FLOOR(RAND()*2),
			   		  ROUND(FLOOR(RAND()*50000)/100)*100,  FLOOR(RAND()*4),            FROM_UNIXTIME(FLOOR(unix_timestamp('2002-07-07 00:00:00')+(RAND()*(unix_timestamp('2023-01-18 00:00:00')-unix_timestamp('2002-07-07 00:00:00'))))),
			   		  FLOOR(RAND()*3),                     FLOOR(RAND()*3),            FLOOR(RAND()*3));
		
		IF cnt = 500 THEN
			LEAVE here;
		END IF;
		
		SET cnt = cnt + 1;
	END LOOP;
END;
CALL inputMemberM();

CREATE PROCEDURE inputMemberF()
BEGIN
	DECLARE cnt INT DEFAULT 501;
	
	here : LOOP
		INSERT INTO member(id,                             pwd,                        email,
						   nickname,                       gender,                     age,
						   profile_img,                    account_type,               ban_status,
						   pixel,                          grade,                      join_date,
						   email_status,                   mento_status,               corp_status)
			   VALUES(CONCAT('kodup',cnt),                 'sDRLe/gbqtGUc7EVp/uYSQ==', CONCAT('info',cnt,'@kodup.kr'),
			   		  CONCAT(LEFT(UUID(),4), cnt),         'f',                        CONCAT((1960+FLOOR(RAND() * 32)),10+(FLOOR(RAND() * 3)),10+(FLOOR(RAND() * 18))),
			   		  CONCAT((1+FLOOR(RAND()*120)),'.png'), FLOOR(RAND()*2),           FLOOR(RAND()*2),
			   		  ROUND(FLOOR(RAND()*50000)/100)*100,  FLOOR(RAND()*4),            FROM_UNIXTIME(FLOOR(unix_timestamp('2002-07-07 00:00:00')+(RAND()*(unix_timestamp('2023-01-18 00:00:00')-unix_timestamp('2002-07-07 00:00:00'))))),
			   		  FLOOR(RAND()*3),                     FLOOR(RAND()*3),            FLOOR(RAND()*3));
		
		IF cnt = 1000 THEN
			LEAVE here;
		END IF;
		
		SET cnt = cnt + 1;
	END LOOP;
END;
CALL inputMemberF();
*/

## board
DROP PROCEDURE inputBoard;
CREATE PROCEDURE inputBoard()
BEGIN
	DECLARE cnt INT DEFAULT 1;
	
	here : LOOP
		INSERT INTO board(id,                              boardtype,                   subject,
						  doc,                             hashtag,                     viewcount,
						  thumbup,                         thumbdown)
			   VALUES(CONCAT('kodup',cnt),                 'qna',                       '세형',
			   		  '내용',                              '#REACT#CSS#SPRING',         300+FLOOR(RAND()*1501),
			   		  FLOOR(RAND()*151),                   FLOOR(RAND()*31));
		
		IF cnt = 200 THEN
			LEAVE here;
		END IF;
		
		SET cnt = cnt + 1;
	END LOOP;
END;
CALL inputBoard();

COMMIT;
SELECT * FROM board;


SELECT * FROM board WHERE sno = 1001;

SELECT * FROM member;







