/****************************** 쿼리

## LOGIN
SELECT COUNT(id) FROM member WHERE id = #{id} AND pwd = #{pwd}

## CHECK ID
SELECT COUNT(id) FROM member WHERE account_type = 1 AND id = #{_parameter}

## CHECK GRADE
SELECT grade FROM member WHERE id = #{_parameter}

## CHAT INSERT
INSERT INTO chat(id) VALUES(#{_parameter})

## CHECK CHAT ID
SELECT COUNT(id) FROM chat WHERE id = #{_parameter}

## CHAT DELETE
DELETE FROM chat WHERE id = #{_parameter}

## TOP WRITER
SELECT b.id, m.profile_img FROM board b JOIN member m ON b.id = m.id
WHERE nal BETWEEN DATE_ADD(NOW(),INTERVAL -1 WEEK ) AND NOW()
GROUP BY b.id ORDER BY COUNT(b.id) DESC, b.id ASC LIMIT 0,5;

## HOT TAG
SELECT hashtag FROM board

## CHECK NICNAME
SELECT COUNT(nickname) FROM member WHERE nickname = #{_parameter}

## INSERT MEMBER KAKAO
INSERT INTO member(id, email, nickname, gender, age, profile_img, account_type, join_date)
VALUES(#{id}, #{email}, #{nickname}, #{gender}, #{age}, #{profile_img}, 1, NOW())

## INSERT MEMBER
INSERT INTO member(id, email, nickname, gender, age, account_type, join_date)
VALUES(#{id}, #{email}, #{nickname}, #{gender}, #{age}, 1, NOW())

## QNA5
SELECT b.sno, b.boardtype, b.nal, b.subject, (b.thumbup-b.thumbdown) AS thumb,
       m.profile_img, m.nickname,
       COUNT(r.repl_sno) AS countRepl
FROM board b LEFT JOIN member m ON b.id = m.id
             LEFT JOIN repl r   ON b.sno = r.sno
WHERE b.boardtype = 'qna'
GROUP BY b.sno, b.boardtype, b.nal, b.subject, (b.thumbup-b.thumbdown), m.profile_img, m.nickname
ORDER BY b.nal DESC, b.sno DESC LIMIT 0, 5

## FREETALKING5
SELECT b.sno, b.boardtype, b.nal, b.subject, (b.thumbup-b.thumbdown) AS thumb,
       m.profile_img, m.nickname,
       COUNT(r.repl_sno) AS countRepl
FROM board b LEFT JOIN member m ON b.id = m.id
             LEFT JOIN repl r   ON b.sno = r.sno
WHERE b.boardtype = 'freetalking'
GROUP BY b.sno, b.boardtype, b.nal, b.subject, (b.thumbup-b.thumbdown), m.profile_img, m.nickname
ORDER BY b.nal DESC, b.sno DESC LIMIT 0, 5

## INFOSHARE5
SELECT b.sno, b.boardtype, b.nal, b.subject, (b.thumbup-b.thumbdown) AS thumb,
       m.profile_img, m.nickname,
       COUNT(r.repl_sno) AS countRepl
FROM board b LEFT JOIN member m ON b.id = m.id
             LEFT JOIN repl r   ON b.sno = r.sno
WHERE b.boardtype = 'infoshare'
GROUP BY b.sno, b.boardtype, b.nal, b.subject, (b.thumbup-b.thumbdown), m.profile_img, m.nickname
ORDER BY b.nal DESC, b.sno DESC LIMIT 0, 5

## NOTIFICATION5
SELECT b.sno, b.boardtype, b.nal, b.subject, (b.thumbup-b.thumbdown) AS thumb,
       m.profile_img, m.nickname,
       COUNT(r.repl_sno) AS countRepl
FROM board b LEFT JOIN member m ON b.id = m.id
             LEFT JOIN repl r   ON b.sno = r.sno
WHERE b.boardtype = 'notification'
GROUP BY b.sno, b.boardtype, b.nal, b.subject, (b.thumbup-b.thumbdown), m.profile_img, m.nickname
ORDER BY b.nal DESC, b.sno DESC LIMIT 0, 5

## WEEKLYBEST5
SELECT b.sno, b.boardtype, b.nal, b.subject, (b.thumbup-b.thumbdown) AS thumb, b.viewcount,
	   m.profile_img, m.nickname,
	   COUNT(r.repl_sno) AS countRepl
FROM board b LEFT JOIN member m ON b.id = m.id
			 LEFT JOIN repl r   ON b.sno = r.sno
WHERE b.nal > DATE_ADD(NOW(), INTERVAL -7 DAY)
GROUP BY b.sno, b.boardtype, b.nal, b.subject, thumb, b.viewcount, m.profile_img, m.nickname
ORDER BY thumb DESC, viewcount DESC, b.nal DESC, b.sno DESC LIMIT 0, 5

## EDITOR'S CHOICE. 현재는 그냥 전체 게시글에서 랜덤으로 5개를 뽑는다.
SELECT b.sno, b.boardtype, b.nal, b.subject, (b.thumbup-b.thumbdown) AS thumb, b.viewcount,
       m.profile_img, m.nickname,
       COUNT(r.repl_sno) AS countRepl
FROM board b LEFT JOIN member m ON b.id = m.id
             LEFT JOIN repl r   ON b.sno = r.sno
GROUP BY b.sno, b.boardtype, b.nal, b.subject, thumb, b.viewcount, m.profile_img, m.nickname
ORDER BY RAND() LIMIT 0, 5;

## CHECK EMAIL
SELECT COUNT(email) FROM member WHERE email = #{_parameter} AND account_type = 0

## UPDATE PWD
UPDATE member SET pwd = #{pwd} WHERE id = #{id}

## GET ID
SELECT id FROM member WHERE email = #{_parameter}

## totSize
SELECT COUNT(b.sno) AS totSize, b.boardtype, qb.qna_horsehead AS horsehead
FROM board b LEFT JOIN member m     ON b.id = m.id
             LEFT JOIN qna_board qb ON b.sno = qb.sno
WHERE m.nickname LIKE '%${findStr}%'
OR    b.hashtag  LIKE '%${findStr}%'
OR    b.subject  LIKE '%${findStr}%'
OR    b.doc      LIKE '%${findStr}%'
GROUP BY b.boardtype, qb.qna_horsehead
HAVING b.boardtype = #{boardType}
AND    qb.qna_horsehead LIKE '%${horsehead}%'

## Q&A LIST
SELECT b.sno, b.boardtype, b.nal, b.subject, b.doc, b.hashtag, b.viewcount,
	   b.thumbup, b.thumbdown, (b.thumbup-b.thumbdown) AS thumb, board_delete,
       m.id, m.nickname, m.profile_img, qb.qna_horsehead AS horsehead,
       COUNT(r.repl_sno) AS countRepl
FROM board b LEFT JOIN member m     ON b.id = m.id
             LEFT JOIN repl r       ON b.sno = r.sno
             LEFT JOIN qna_board qb ON b.sno = qb.sno
WHERE m.nickname LIKE '%${findStr}%'
OR    b.hashtag  LIKE '%${findStr}%'
OR    b.subject  LIKE '%${findStr}%'
OR    b.doc      LIKE '%${findStr}%'
GROUP BY b.sno, b.boardtype, b.nal, b.subject, b.doc, b.hashtag, b.viewcount,
		 b.thumbup, b.thumbdown, thumb, board_delete,
		 m.id, m.nickname, m.profile_img, qb.qna_horsehead
HAVING b.boardtype = #{boardtype}
<if test="horsehead != '' and horsehead != null">
	AND qb.qna_horsehead = #{horsehead}
</if>
<choose>
	<when test="sort == 1">
		ORDER BY b.nal DESC, b.sno DESC
	</when>
	<when test="sort == 2">
		ORDER BY thumb DESC, b.nal DESC, b.sno DESC
	</when>
	<when test="sort == 3">
		ORDER BY countRepl DESC, b.nal DESC, b.sno DESC
	</when>
	<otherwise>
		ORDER BY b.viewcount DESC, b.nal DESC, b.sno DESC
	</otherwise>
</choose>
LIMIT ${startNo}, ${listSize}



*/

SELECT b.sno, b.boardtype, b.nal, b.subject, b.doc, b.hashtag, b.viewcount,
	   b.thumbup, b.thumbdown, (b.thumbup-b.thumbdown) AS thumb, board_delete,
       m.id, m.nickname, m.profile_img, qb.qna_horsehead AS horsehead,
       COUNT(r.repl_sno) AS countRepl
FROM board b LEFT JOIN member m     ON b.id = m.id
             LEFT JOIN repl r       ON b.sno = r.sno
             LEFT JOIN qna_board qb ON b.sno = qb.sno
WHERE b.hashtag  LIKE '%#프론트엔드%'
GROUP BY b.sno, b.boardtype, b.nal, b.subject, b.doc, b.hashtag, b.viewcount,
		 b.thumbup, b.thumbdown, thumb, board_delete,
		 m.id, m.nickname, m.profile_img, qb.qna_horsehead;


commit;
/****************************** 데이터추가

*/
UPDATE board SET nal = FROM_UNIXTIME(FLOOR(unix_timestamp('2022-12-14 00:00:00')+(RAND()*(unix_timestamp('2023-01-14 00:00:00')-unix_timestamp('2022-12-14 00:00:00')))));

DROP PROCEDURE notificationlist;
CREATE PROCEDURE notificationlist()
BEGIN 
    declare cnt int DEFAULT 1;
    
    here : LOOP 
       INSERT INTO board(id, boardtype, nal, subject, doc, hashtag, viewcount, thumbup, thumbdown)
       VALUES(CONCAT('m001',cnt), 'notification', '2023-01-12 10:26:02', 'java가 뭔가요?',
             '1월 첫째주 처형 목록',
             '#정지#이벤트', FLOOR(RAND() * 1200), FLOOR(RAND() * 100), FLOOR(RAND() * 100));
       
       IF cnt = 100 THEN
           LEAVE here;
       END IF;
       
       SET cnt = cnt + 1;
    END LOOP;
END;
CALL notificationlist();

DROP PROCEDURE qna_boardList1;
CREATE PROCEDURE qna_boardList1()
BEGIN 
    declare cnt int DEFAULT 1;
    
    here : LOOP 
       INSERT INTO qna_board(sno, qna_pixel_reward, qna_horsehead)
       VALUES(cnt, 3000, '기술');
       
       IF cnt = 100 THEN
           LEAVE here;
       END IF;
       
       SET cnt = cnt + 1;
    END LOOP;
END;
CALL qna_boardList1();

DROP PROCEDURE qna_boardList2;
CREATE PROCEDURE qna_boardList2()
BEGIN 
    declare cnt int DEFAULT 101;
    
    here : LOOP 
       INSERT INTO qna_board(sno, qna_pixel_reward, qna_horsehead)
       VALUES(cnt, 3000, '커리어');
       
       IF cnt = 200 THEN
           LEAVE here;
       END IF;
       
       SET cnt = cnt + 1;
    END LOOP;
END;
CALL qna_boardList2();

DROP PROCEDURE qna_boardList3;
CREATE PROCEDURE qna_boardList3()
BEGIN 
    declare cnt int DEFAULT 201;
    
    here : LOOP 
       INSERT INTO qna_board(sno, qna_pixel_reward, qna_horsehead)
       VALUES(cnt, 3000, '기타');
       
       IF cnt = 300 THEN
           LEAVE here;
       END IF;
       
       SET cnt = cnt + 1;
    END LOOP;
END;
CALL qna_boardList3();

DROP PROCEDURE qna_boardList4;
CREATE PROCEDURE qna_boardList4()
BEGIN 
    declare cnt int DEFAULT 1601;
    
    here : LOOP 
       INSERT INTO qna_board(sno, qna_pixel_reward, qna_horsehead)
       VALUES(cnt, 3000, '커리어');
       
       IF cnt = 1700 THEN
           LEAVE here;
       END IF;
       
       SET cnt = cnt + 1;
    END LOOP;
END;
CALL qna_boardList4();
