USE final_test_db;

# 1. index.jsp 투데이 인기태그. 자바에서 가공해서 카운트 제일 많은 것 뿌려주기. top5
SELECT hashtag FROM board;

# 2. index.jsp 투데이 게시글랭킹.
INSERT INTO board(sno, id, boardType, nal, subject, doc, hashtag, viewcount, thumbup, thumbdown)
VALUES(2, 'hong', 'freetalking', NOW(), '재밌다', '취뽀', '#MySQL#Python', 30, 2, 0);
INSERT INTO board(sno, id, boardType, nal, subject, doc, hashtag, viewcount, thumbup,thumbdown)
VALUES(3,'kim','QnA',sysdate(),'제곧내','제목이곧내용','#JAVA', 32, 17,3);
INSERT INTO board(sno, id, boardType, nal, subject, doc, hashtag, viewcount, thumbup, thumbdown)
VALUES(4, 'kim', 'infoshare', NOW(), '정보드립니다.', '냉무', '#C++', 100, 1, 0);
INSERT INTO board(sno, id, boardType, nal, subject, doc, hashtag, viewcount, thumbup, thumbdown)
VALUES(5, 'kang', 'freetalking', NOW(), '날씨가 맑아요.', '따뜻', '#Python#JAVA', 23, 10, 0);
INSERT INTO board(sno, id, boardType, nal, subject, doc, hashtag, viewcount, thumbup, thumbdown)
VALUES(6, 'lee', 'freetalking', NOW(), '파이널프로젝트', 'ㅎㅇㅌ', '#JavaScript', 10, 1, 0);
INSERT INTO board(sno, id, boardType, nal, subject, doc, hashtag, 
, thumbup, thumbdown)
VALUES(7, 'lee', 'freetalking', NOW(), '하나더', 'ㅎㅇㅌ', '#JAVA', 33, 11, 0);

SELECT id, (thumbup-thumbdown), viewcount FROM board
ORDER BY (thumbup-thumbdown) DESC, viewcount DESC LIMIT 0,5; # 1차 추천수, 2차 조회수
SELECT id FROM board GROUP BY id
ORDER BY count(id) DESC, id ASC LIMIT 0,5; # 게시글 많이 쓴 수

# 3. index.jsp 투데이 멘토랭킹. txt파일을 가장 많이 생성한 멘토. 퍼스널멘토는 랭킹집계 X
SELECT count(docfile) FROM mantoman mm JOIN board b ON mm.id = b.id
WHERE b.grade = 'plus' OR b.grade = 'partner' LIMIT 0,5;

# 4. index.jsp/main.jsp 최신 QnA 게시글 5개
SELECT b.sno, b.id, b.nal, b.subject, (b.thumbup-b.thumbdown), count(r.repl_sno)
FROM board b JOIN repl r ON b.sno = r.sno
WHERE b.boardtype = 'QnA'
GROUP BY b.sno, b.id, b.nal, b.subject, (b.thumbup-b.thumbdown)
ORDER BY b.nal DESC LIMIT 0,5;

# 5. index.jsp/main.jsp 투데이 Best 게시글
SELECT b.sno, b.id, b.nal, b.subject, (b.thumbup-b.thumbdown), b.viewcount, count(r.repl_sno)
FROM board b JOIN repl r ON b.sno = r.sno
WHERE b.nal = SYSDATE()
GROUP BY b.sno, b.id, b.nal, b.subject, b.viewcount, (b.thumbup-b.thumbdown)
ORDER BY b.viewcount DESC LIMIT 0,5;

# 6. index.jsp/main.jsp 최신 자유게시판 게시글 5개
SELECT b.sno, b.id, b.nal, b.subject, (b.thumbup-b.thumbdown), count(r.repl_sno)
FROM board b JOIN repl r ON b.sno = r.sno
WHERE b.boardtype = 'freetalking'
GROUP BY b.sno, b.id, b.nal, b.subject, (b.thumbup-b.thumbdown)
ORDER BY b.nal DESC LIMIT 0,5;

# 7. index.jsp/main.jsp 최신 정보공유 게시글 5개
SELECT b.sno, b.id, b.nal, b.subject, (b.thumbup-b.thumbdown), count(r.repl_sno)
FROM board b JOIN repl r ON b.sno = r.sno
WHERE b.boardtype = 'infoshare'
GROUP BY b.sno, b.id, b.nal, b.subject, (b.thumbup-b.thumbdown)
ORDER BY b.nal DESC LIMIT 0,5;

# 8. index.jsp/main.jsp 최신 공지사항 게시글 5개
SELECT b.sno, b.id, b.nal, b.subject, (b.thumbup-b.thumbdown), count(r.repl_sno)
FROM board b JOIN repl r ON b.sno = r.sno
WHERE b.boardtype = 'notification'
GROUP BY b.sno, b.id, b.nal, b.subject, (b.thumbup-b.thumbdown)
ORDER BY b.nal DESC LIMIT 0,5;

# 9. index.jsp/qna.jsp QnA게시판 리스트
SELECT b.sno, b.id, b.nal, b.subject, b.hashtag, b.viewcount, (b.thumbup-b.thumbdown),
       q.QnA_horsehead,
       m.profile_img, m.nickname,
       count(r.repl_sno)
FROM board b LEFT JOIN QnA_board q ON b.sno = q.sno
             LEFT JOIN member m    ON m.id = b.id
             LEFT JOIN repl r      ON b.sno = r.sno
WHERE b.boardtype = 'QnA'
GROUP BY b.sno,b.id, b.nal, b.subject, b.hashtag, b.viewcount, (b.thumbup-b.thumbdown),
         q.QnA_horsehead,
         m.profile_img, m.nickname
ORDER BY b.sno desc;

CREATE TABLE `QnA_board` (
	`qna_sno`	int	NOT NULL,
	`sno`	int	NOT NULL,
	`pixel_reward`	int	NOT NULL,
	`qna_horsehead`	varchar(255)	NOT NULL
);
INSERT INTO QnA_board(qna_sno,sno,pixel_reward,qna_horsehead)
VALUES(1,1,2000,'기술');
INSERT INTO QnA_board(qna_sno,sno,pixel_reward,qna_horsehead)
VALUES(2,3,500,'커리어');

CREATE TABLE `infoshare_board` (
	`infoshare_sno`	int	NOT NULL,
	`sno`	int	NOT NULL,
	`infoshare_horsehead`	varchar(255)	NOT NULL
);
INSERT INTO infoshare_board(infoshare_sno, sno, infoshare_horsehead)
VALUES(1, 4, '팁');

CREATE TABLE `freetalking_board` (
	`freetalking_sno`	int	NOT NULL,
	`sno`	int	NOT NULL,
	`freetalking_horsehead`	varchar(255)	NOT NULL
);
INSERT INTO freetalking_board(freetalking_sno, sno, freetalking_horsehead)
VALUES(1, 2, '연예');
INSERT INTO freetalking_board(freetalking_sno, sno, freetalking_horsehead)
VALUES(2, 5, '스포츠');
INSERT INTO freetalking_board(freetalking_sno, sno, freetalking_horsehead)
VALUES(3, 6, '게임');
INSERT INTO freetalking_board(freetalking_sno, sno, freetalking_horsehead)
VALUES(4, 7, '연예');

INSERT INTO member(id, pwd, email, nickname, gender, age)
VALUES('hong','1111','hong@naver.com','hong11','m',20);
INSERT INTO member(id, pwd, email, nickname, gender, age)
VALUES('kim','1111','kim@naver.com','kim11','m',20);
INSERT INTO member(id, pwd, email, nickname, gender, age)
VALUES('kang','1111','kang@naver.com','kang11','m',20);
INSERT INTO member(id, pwd, email, nickname, gender, age)
VALUES('lee','1111','lee@naver.com','lee11','m',20);

/* 3중조인. 오류 대비용
SELECT b.sno, b.id, b.nal, b.subject, b.hashtag, b.viewcount, (b.thumbup-b.thumbdown),
       q.qna_horsehead,
       m.profile_img, m.nickname
FROM board b JOIN QnA_board q ON b.sno = q.sno
             JOIN member m    ON m.id = b.id
GROUP BY b.sno, b.id, b.nal, b.subject, b.hashtag, b.viewcount, (b.thumbup-b.thumbdown),
         q.qna_horsehead,
         m.profile_img, m.nickname;

SELECT b.sno, count(repl_sno) FROM board b LEFT JOIN repl r
ON r.sno = b.sno
GROUP BY b.sno;
*/

# 10. index.jsp/qna.jsp freetalking게시판 리스트
SELECT b.sno, b.id, b.nal, b.subject, b.hashtag, b.viewcount, (b.thumbup-b.thumbdown),
       f.freetalking_horsehead,
       m.profile_img, m.nickname,
       count(r.repl_sno)
FROM board b LEFT JOIN freetalking_board f ON b.sno = f.sno
             LEFT JOIN member m            ON m.id = b.id
             LEFT JOIN repl r              ON b.sno = r.sno
WHERE b.boardtype = 'freetalking'
GROUP BY b.sno,b.id, b.nal, b.subject, b.hashtag, b.viewcount, (b.thumbup-b.thumbdown),
         f.freetalking_horsehead,
         m.profile_img, m.nickname
ORDER BY b.sno desc;

# 11. index.jsp/qna.jsp infoshare게시판 리스트
SELECT b.sno, b.id, b.nal, b.subject, b.hashtag, b.viewcount, (b.thumbup-b.thumbdown),
       i.infoshare_horsehead,
       m.profile_img, m.nickname,
       count(r.repl_sno)
FROM board b LEFT JOIN infoshare_board i ON b.sno = i.sno
             LEFT JOIN member m          ON m.id = b.id
             LEFT JOIN repl r            ON b.sno = r.sno
WHERE b.boardtype = 'infoshare'
GROUP BY b.sno,b.id, b.nal, b.subject, b.hashtag, b.viewcount, (b.thumbup-b.thumbdown),
         i.infoshare_horsehead,
         m.profile_img, m.nickname
ORDER BY b.sno desc;

# 12. index.jsp/qna.jsp 공지사항게시판 리스트
SELECT b.sno, b.id, b.nal, b.subject, b.hashtag, b.viewcount, (b.thumbup-b.thumbdown),
       m.profile_img, m.nickname,
       count(r.repl_sno)
FROM board b LEFT JOIN notification_board n ON b.sno = n.sno
             LEFT JOIN member m          ON m.id = b.id
             LEFT JOIN repl r            ON b.sno = r.sno
WHERE b.boardtype = 'notification'
GROUP BY b.sno,b.id, b.nal, b.subject, b.hashtag, b.viewcount, (b.thumbup-b.thumbdown),
         m.profile_img, m.nickname
ORDER BY b.sno desc;

CREATE TABLE `notification_board` (
	`notification_sno`	int	NOT NULL,
	`sno`	int	NOT NULL,
	`notification_horsehead`	varchar(255)	NOT NULL
);

# 13. index.jsp/qna.jsp 구직게시판 리스트
SELECT b.sno, b.id, b.nal, b.subject, b.hashtag, b.viewcount, (b.thumbup-b.thumbdown),
       m.profile_img, m.nickname,
       count(r.repl_sno)
FROM board b LEFT JOIN jobsearch_board j ON b.sno = j.sno
             LEFT JOIN member m          ON m.id = b.id
             LEFT JOIN repl r            ON b.sno = r.sno
WHERE b.boardtype = 'jobsearch'
GROUP BY b.sno,b.id, b.nal, b.subject, b.hashtag, b.viewcount, (b.thumbup-b.thumbdown),
         m.profile_img, m.nickname
ORDER BY b.sno desc;

CREATE TABLE `jobsearch_board` (
	`infoshare_sno`	int	NOT NULL,
	`sno`	int	NOT NULL,
	`jobsearch_horsehead`	varchar(255)	NOT NULL
);
