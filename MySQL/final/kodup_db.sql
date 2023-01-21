########## member
########## pwd 1111 암호화 : sDRLe/gbqtGUc7EVp/uYSQ==
CREATE PROCEDURE input_member_m()
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
CALL input_member_m();

CREATE PROCEDURE input_member_f()
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
CALL input_member_f();

########## board
CREATE PROCEDURE input_board()
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
CALL input_board();

########## qna_board
CREATE TABLE qna_board_horsehead(
	horsehead VARCHAR(255)
);
INSERT INTO qna_board_horsehead VALUE('기술');
INSERT INTO qna_board_horsehead VALUE('커리어');
INSERT INTO qna_board_horsehead VALUE('기타');

CREATE PROCEDURE input_qna_board()
BEGIN
	DECLARE cnt INT DEFAULT 1;
	
	here : LOOP
		INSERT INTO qna_board(sno, qna_pixel_reward,             qna_horsehead)
			           VALUES(cnt, 500+(1+FLOOR(RAND()*50))*100, (SELECT * FROM qna_board_horsehead ORDER BY RAND() LIMIT 1));
		
		IF cnt = 1000 THEN
			LEAVE here;
		END IF;
		
		SET cnt = cnt + 1;
	END LOOP;
END;
CALL input_qna_board();

########## infoshare_board
CREATE TABLE infoshare_board_horsehead(
	horsehead VARCHAR(255)
);
INSERT INTO infoshare_board_horsehead VALUE('팁');
INSERT INTO infoshare_board_horsehead VALUE('리뷰');
INSERT INTO infoshare_board_horsehead VALUE('기타');

CREATE PROCEDURE input_infoshare_board()
BEGIN
	DECLARE cnt INT DEFAULT 2401;
	
	here : LOOP
		INSERT INTO infoshare_board(sno, infoshare_horsehead)
			                 VALUES(cnt, (SELECT horsehead FROM infoshare_board_horsehead ORDER BY RAND() LIMIT 1));
		
		IF cnt = 3400 THEN
			LEAVE here;
		END IF;
		
		SET cnt = cnt + 1;
	END LOOP;
END;
CALL input_infoshare_board();

########## freetalking_board
CREATE TABLE freetalking_board_horsehead(
	horsehead VARCHAR(255)
);
INSERT INTO freetalking_board_horsehead VALUE('스포츠');
INSERT INTO freetalking_board_horsehead VALUE('게임');
INSERT INTO freetalking_board_horsehead VALUE('일상');
INSERT INTO freetalking_board_horsehead VALUE('연예');
INSERT INTO freetalking_board_horsehead VALUE('기타');

CREATE PROCEDURE input_freetalking_board()
BEGIN
	DECLARE cnt INT DEFAULT 1001;
	
	here : LOOP
		INSERT INTO freetalking_board(sno, freetalking_horsehead)
			                   VALUES(cnt, (SELECT horsehead FROM freetalking_board_horsehead ORDER BY RAND() LIMIT 1));
		
		IF cnt = 2000 THEN
			LEAVE here;
		END IF;
		
		SET cnt = cnt + 1;
	END LOOP;
END;
CALL input_freetalking_board();

########## jobsearch_board
CREATE TABLE jobsearch_board_horsehead(
	horsehead VARCHAR(255)
);
INSERT INTO jobsearch_board_horsehead VALUE('백엔드');
INSERT INTO jobsearch_board_horsehead VALUE('프론트엔드');
INSERT INTO jobsearch_board_horsehead VALUE('풀스택');
INSERT INTO jobsearch_board_horsehead VALUE('기타');

CREATE PROCEDURE input_jobsearch_board()
BEGIN
	DECLARE cnt INT DEFAULT 2001;
	
	here : LOOP
		INSERT INTO jobsearch_board(sno, jobsearch_horsehead)
			                 VALUES(cnt, (SELECT horsehead FROM jobsearch_board_horsehead ORDER BY RAND() LIMIT 1));
		
		IF cnt = 2200 THEN
			LEAVE here;
		END IF;
		
		SET cnt = cnt + 1;
	END LOOP;
END;
CALL input_jobsearch_board();

########## notification_board
CREATE TABLE notification_board_horsehead(
	horsehead VARCHAR(255)
);
INSERT INTO notification_board_horsehead VALUE('공지사항');
INSERT INTO notification_board_horsehead VALUE('이벤트');

CREATE PROCEDURE input_notification_board()
BEGIN
	DECLARE cnt INT DEFAULT 2201;
	
	here : LOOP
		INSERT INTO notification_board(sno, notification_horsehead)
			                    VALUES(cnt, (SELECT horsehead FROM notification_board_horsehead ORDER BY RAND() LIMIT 1));
		
		IF cnt = 2400 THEN
			LEAVE here;
		END IF;
		
		SET cnt = cnt + 1;
	END LOOP;
END;
CALL input_notification_board();


commit;