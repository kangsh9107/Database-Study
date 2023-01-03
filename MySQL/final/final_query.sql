USE final_test_db;

##### 1. index.jsp 투데이 인기해시태그. 자바에서 가공해서 카운트 제일 많은 것 뿌려주기. top5
SELECT hashtag FROM board;

##### 2. index.jsp 투데이 게시글랭킹.
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
INSERT INTO board(sno, id, boardType, nal, subject, doc, hashtag, thumbup, thumbdown)
VALUES(7, 'lee', 'freetalking', NOW(), '하나더', 'ㅎㅇㅌ', '#JAVA', 33, 11, 0);

SELECT id, (thumbup-thumbdown), viewcount FROM board
ORDER BY (thumbup-thumbdown) DESC, viewcount DESC LIMIT 0,5; # 1차 추천수, 2차 조회수
SELECT id FROM board GROUP BY id
ORDER BY count(id) DESC, id ASC LIMIT 0,5; # 게시글 많이 쓴 수

##### 3. index.jsp 투데이 멘토랭킹. txt파일을 가장 많이 생성한 멘토. 퍼스널멘토는 랭킹집계 X
SELECT count(docfile) FROM mantoman mm JOIN board b ON mm.id = b.id
WHERE b.grade = 'plus' OR b.grade = 'partner' LIMIT 0,5;

##### 4. index.jsp/main.jsp 최신 QnA 게시글 5개
SELECT b.sno, b.id, b.nal, b.subject, (b.thumbup-b.thumbdown), count(r.repl_sno)
FROM board b JOIN repl r ON b.sno = r.sno
WHERE b.boardtype = 'QnA'
GROUP BY b.sno, b.id, b.nal, b.subject, (b.thumbup-b.thumbdown)
ORDER BY b.nal DESC LIMIT 0,5;

##### 5. index.jsp/main.jsp 투데이 Best 게시글
SELECT b.sno, b.id, b.nal, b.subject, (b.thumbup-b.thumbdown), b.viewcount, count(r.repl_sno)
FROM board b JOIN repl r ON b.sno = r.sno
WHERE b.nal = SYSDATE()
GROUP BY b.sno, b.id, b.nal, b.subject, b.viewcount, (b.thumbup-b.thumbdown)
ORDER BY b.viewcount DESC LIMIT 0,5;

##### 6. index.jsp/main.jsp 최신 자유게시판 게시글 5개
SELECT b.sno, b.id, b.nal, b.subject, (b.thumbup-b.thumbdown), count(r.repl_sno)
FROM board b JOIN repl r ON b.sno = r.sno
WHERE b.boardtype = 'freetalking'
GROUP BY b.sno, b.id, b.nal, b.subject, (b.thumbup-b.thumbdown)
ORDER BY b.nal DESC LIMIT 0,5;

##### 7. index.jsp/main.jsp 최신 정보공유 게시글 5개
SELECT b.sno, b.id, b.nal, b.subject, (b.thumbup-b.thumbdown), count(r.repl_sno)
FROM board b JOIN repl r ON b.sno = r.sno
WHERE b.boardtype = 'infoshare'
GROUP BY b.sno, b.id, b.nal, b.subject, (b.thumbup-b.thumbdown)
ORDER BY b.nal DESC LIMIT 0,5;

##### 8. index.jsp/main.jsp 최신 공지사항 게시글 5개
SELECT b.sno, b.id, b.nal, b.subject, (b.thumbup-b.thumbdown), count(r.repl_sno)
FROM board b JOIN repl r ON b.sno = r.sno
WHERE b.boardtype = 'notification'
GROUP BY b.sno, b.id, b.nal, b.subject, (b.thumbup-b.thumbdown)
ORDER BY b.nal DESC LIMIT 0,5;

##### 9. index.jsp/qna.jsp QnA게시판 리스트
SELECT b.sno, b.id, b.nal, b.subject, b.hashtag, b.viewcount, (b.thumbup-b.thumbdown),
       q.QnA_horsehead,
       m.profile_img, m.nickname,
       count(r.repl_sno)
FROM board b LEFT JOIN QnA_board q ON b.sno = q.sno
             LEFT JOIN member m    ON m.id = b.id
             LEFT JOIN repl r      ON b.sno = r.sno
WHERE b.boardtype = 'QnA'
GROUP BY b.sno, b.id, b.nal, b.subject, b.hashtag, b.viewcount, (b.thumbup-b.thumbdown),
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

##### 10. index.jsp/freetalking.jsp freetalking게시판 리스트
SELECT b.sno, b.id, b.nal, b.subject, b.hashtag, b.viewcount, (b.thumbup-b.thumbdown),
       f.freetalking_horsehead,
       m.profile_img, m.nickname,
       count(r.repl_sno)
FROM board b LEFT JOIN freetalking_board f ON b.sno = f.sno
             LEFT JOIN member m            ON m.id = b.id
             LEFT JOIN repl r              ON b.sno = r.sno
WHERE b.boardtype = 'freetalking'
GROUP BY b.sno, b.id, b.nal, b.subject, b.hashtag, b.viewcount, (b.thumbup-b.thumbdown),
         f.freetalking_horsehead,
         m.profile_img, m.nickname
ORDER BY b.sno desc;

##### 11. index.jsp/infoshare.jsp infoshare게시판 리스트
SELECT b.sno, b.id, b.nal, b.subject, b.hashtag, b.viewcount, (b.thumbup-b.thumbdown),
       i.infoshare_horsehead,
       m.profile_img, m.nickname,
       count(r.repl_sno)
FROM board b LEFT JOIN infoshare_board i ON b.sno = i.sno
             LEFT JOIN member m          ON m.id = b.id
             LEFT JOIN repl r            ON b.sno = r.sno
WHERE b.boardtype = 'infoshare'
GROUP BY b.sno, b.id, b.nal, b.subject, b.hashtag, b.viewcount, (b.thumbup-b.thumbdown),
         i.infoshare_horsehead,
         m.profile_img, m.nickname
ORDER BY b.sno desc;

##### 12. index.jsp/notification.jsp 공지사항게시판 리스트
SELECT b.sno, b.id, b.nal, b.subject, b.hashtag, b.viewcount, (b.thumbup-b.thumbdown),
       m.profile_img, m.nickname,
       count(r.repl_sno)
FROM board b LEFT JOIN notification_board n ON b.sno = n.sno
             LEFT JOIN member m             ON m.id = b.id
             LEFT JOIN repl r               ON b.sno = r.sno
WHERE b.boardtype = 'notification'
GROUP BY b.sno, b.id, b.nal, b.subject, b.hashtag, b.viewcount, (b.thumbup-b.thumbdown),
         m.profile_img, m.nickname
ORDER BY b.sno desc;

CREATE TABLE `notification_board` (
	`notification_sno`	int	NOT NULL,
	`sno`	int	NOT NULL,
	`notification_horsehead`	varchar(255)	NOT NULL
);

##### 13. index.jsp/jobsearch.jsp 구직게시판 리스트
SELECT b.sno, b.id, b.nal, b.subject, b.hashtag, b.viewcount, (b.thumbup-b.thumbdown),
       m.profile_img, m.nickname,
       count(r.repl_sno)
FROM board b LEFT JOIN jobsearch_board j ON b.sno = j.sno
             LEFT JOIN member m          ON m.id = b.id
             LEFT JOIN repl r            ON b.sno = r.sno
WHERE b.boardtype = 'jobsearch'
GROUP BY b.sno, b.id, b.nal, b.subject, b.hashtag, b.viewcount, (b.thumbup-b.thumbdown),
         m.profile_img, m.nickname
ORDER BY b.sno desc;

CREATE TABLE `jobsearch_board` (
	`infoshare_sno`	int	NOT NULL,
	`sno`	int	NOT NULL,
	`jobsearch_horsehead`	varchar(255)	NOT NULL
);

##### 14. index.jsp/qna_view.jsp
# 본문
SELECT b.id, b.nal, b.subject, b.hashtag, b.viewcount, (b.thumbup-b.thumbdown), b.doc,
       q.QnA_horsehead,
       m.profile_img, m.nickname
FROM board b LEFT JOIN QnA_board q ON b.sno = q.sno
             LEFT JOIN member m    ON m.id = b.id
WHERE b.sno = '1'
GROUP BY b.id, b.nal, b.subject, b.hashtag, b.viewcount, (b.thumbup-b.thumbdown), b.doc,
         q.QnA_horsehead,
         m.profile_img, m.nickname;
# 본문에 댓글. 마지막에 저장된 grp를 가져와서 INT 변수에 담고 그거로 insert.
SELECT MAX(grp)+1 FROM repl;
# 댓글에 댓글. 댓글에 있는 hidden repl_sno 값으로 자바단에서 grp, seq, deep 등 가져와서 그거로 잘 insert. 또는 hidden 태그 여러개.
# 댓글 리스트
SELECT r.grp, r.seq, r.deep, r.repl_nal, r.repl_doc, (r.thumbup-r.thumbdown),
       rs.repl_status,
       m.profile_img, m.nickname
FROM repl r LEFT JOIN repl_selected rs ON r.repl_sno = rs.repl_sno
            LEFT JOIN member m         ON r.id = m.id
ORDER BY rs.repl_status DESC, r.grp DESC, r.deep ASC, r.seq ASC;
# 작성자가 댓글을 채택했을 때 쿼리
UPDATE repl_selected rs JOIN repl r ON rs.repl_sno = r.repl_sno
SET rs.repl_status = 1 WHERE r.grp = 2;
# 댓글이 채택된 사람에게 픽셀 이동
# QnA 게시판에 글 작성 시 보상 픽셀만큼 차감
# 채택된 댓글에 댓글 달면 status가 1로
# 채택 안된 상태면 삭제 불가능
# 수정 시 보상픽셀 수정 불가능
# 본인 채택 불가능
#채택이 안되면 자동채택(후순위)

##### 15. index.jsp/infoshare_view.jsp
#본문
SELECT b.id, b.nal, b.subject, b.hashtag, b.viewcount, (b.thumbup-b.thumbdown), b.doc,
       i.infoshare_horsehead,
       m.profile_img, m.nickname
FROM board b LEFT JOIN infoshare_board i ON b.sno = i.sno
             LEFT JOIN member m          ON m.id = b.id
WHERE b.sno = '1'
GROUP BY b.id, b.nal, b.subject, b.hashtag, b.viewcount, (b.thumbup-b.thumbdown), b.doc,
         i.infoshare_horsehead,
         m.profile_img, m.nickname;
# 댓글
SELECT r.grp, r.seq, r.deep, r.repl_nal, r.repl_doc, (r.thumbup-r.thumbdown),
       m.profile_img, m.nickname
FROM repl r JOIN member m ON r.id = m.id
ORDER BY r.grp DESC, r.deep ASC, r.seq ASC;

CREATE TABLE `repl_selected` (
	`repl_sno`	int	NOT NULL,
	`repl_status`	int	NOT NULL	DEFAULT 0
);
INSERT INTO repl_selected(repl_sno, repl_status) values(1, 0);
INSERT INTO repl_selected(repl_sno, repl_status) values(2, 1);
INSERT INTO repl_selected(repl_sno, repl_status) values(3, 1);
INSERT INTO repl_selected(repl_sno, repl_status) values(4, 1);
INSERT INTO repl_selected(repl_sno, repl_status) values(5, 1);
INSERT INTO repl_selected(repl_sno, repl_status) values(6, 0);

##### 16. index.jsp/freetalking_view.jsp
#본문
SELECT b.id, b.nal, b.subject, b.hashtag, b.viewcount, (b.thumbup-b.thumbdown), b.doc,
       f.freetalking_horsehead,
       m.profile_img, m.nickname
FROM board b LEFT JOIN freetalking_board f ON b.sno = f.sno
             LEFT JOIN member m            ON m.id = b.id
WHERE b.sno = '1'
GROUP BY b.id, b.nal, b.subject, b.hashtag, b.viewcount, (b.thumbup-b.thumbdown), b.doc,
         f.freetalking_horsehead,
         m.profile_img, m.nickname;
# 댓글
SELECT r.grp, r.seq, r.deep, r.repl_nal, r.repl_doc, (r.thumbup-r.thumbdown),
       m.profile_img, m.nickname
FROM repl r JOIN member m ON r.id = m.id
ORDER BY r.grp DESC, r.deep ASC, r.seq ASC;

##### 17. index.jsp/jobsearch_view.jsp
#본문
SELECT b.id, b.nal, b.subject, b.hashtag, b.viewcount, (b.thumbup-b.thumbdown), b.doc,
       j.jobsearch_horsehead,
       m.profile_img, m.nickname
FROM board b LEFT JOIN jobsearch_board j ON b.sno = j.sno
             LEFT JOIN member m          ON m.id = b.id
WHERE b.sno = '1'
GROUP BY b.id, b.nal, b.subject, b.hashtag, b.viewcount, (b.thumbup-b.thumbdown), b.doc,
         j.jobsearch_horsehead,
         m.profile_img, m.nickname;
# 댓글
SELECT r.grp, r.seq, r.deep, r.repl_nal, r.repl_doc, (r.thumbup-r.thumbdown),
       m.profile_img, m.nickname
FROM repl r JOIN member m ON r.id = m.id
ORDER BY r.grp DESC, r.deep ASC, r.seq ASC;

##### 18. index.jsp/notification_view.jsp
#본문
SELECT b.id, b.nal, b.subject, b.hashtag, b.viewcount, (b.thumbup-b.thumbdown), b.doc,
       n.notification_horsehead,
       m.profile_img, m.nickname
FROM board b LEFT JOIN  notification_board n ON b.sno = n.sno
             LEFT JOIN member m              ON m.id = b.id
WHERE b.sno = '1'
GROUP BY b.id, b.nal, b.subject, b.hashtag, b.viewcount, (b.thumbup-b.thumbdown), b.doc,
         n.notification_horsehead,
         m.profile_img, m.nickname;
# 댓글
SELECT r.grp, r.seq, r.deep, r.repl_nal, r.repl_doc, (r.thumbup-r.thumbdown),
       m.profile_img, m.nickname
FROM repl r JOIN member m ON r.id = m.id
ORDER BY r.grp DESC, r.deep ASC, r.seq ASC;

##### 19. index.jsp/qna_insert.jsp
# sno를 getSerial로 가져올 때 INT 변수에 담아서 인터페이스에 매개변수로 준다.
INSERT INTO board(sno, id, boardtype, nal, subject, doc, hashtag)
VALUES();
INSERT INTO QnA_board(qna_sno, sno, pixel_reward, qna_horsehead)
VALUES();

##### 20. index.jsp/infoshare_insert.jsp
# sno를 getSerial로 가져올 때 INT 변수에 담아서 인터페이스에 매개변수로 준다.
INSERT INTO board(sno, id, boardtype, nal, subject, doc, hashtag)
VALUES();
INSERT INTO infoshare_board(infoshare_sno, sno, infoshare_horsehead)
VALUES();

##### 21. index.jsp/freetalking_insert.jsp
# sno를 getSerial로 가져올 때 INT 변수에 담아서 인터페이스에 매개변수로 준다.
INSERT INTO board(sno, id, boardtype, nal, subject, doc, hashtag)
VALUES();
INSERT INTO freetalking_board(freetalking_sno, sno, freetalking_horsehead)
VALUES();

##### 22. index.jsp/jobsearch_insert.jsp
# sno를 getSerial로 가져올 때 INT 변수에 담아서 인터페이스에 매개변수로 준다.
INSERT INTO board(sno, id, boardtype, nal, subject, doc, hashtag)
VALUES();
INSERT INTO jobsearch_board(jobsearch_sno, sno, jobsearch_horsehead)
VALUES();

##### 22. index.jsp/notification_insert.jsp
# sno를 getSerial로 가져올 때 INT 변수에 담아서 인터페이스에 매개변수로 준다.
INSERT INTO board(sno, id, boardtype, nal, subject, doc, hashtag)
VALUES();
INSERT INTO notification_board(notification_sno, sno, notification_horsehead)
VALUES();

##### 23. index.jsp/man_search.jsp 리스트
SELECT mb.pay, mb.corp_location, mb.position, mb.required_career, mb.job_type, mb.required_skill, mb.deadline, 
       b.subject, b.hashtag,
       c.corp_logo, c.corp_name
FROM mansearch_board mb LEFT JOIN board b       ON mb.sno = b.sno
                        LEFT JOIN member m      ON b.id = m.id
                        LEFT JOIN corperation c ON m.id = c.id
ORDER BY b.sno desc;

CREATE TABLE `mansearch_board` (
	`mansearch_sno`	int	NOT NULL,
	`sno`	int	NOT NULL,
	`work_start`	date	NOT NULL,
	`pay`	int	NOT NULL,
	`corp_location`	varchar(255)	NOT NULL,
	`position`	varchar(100)	NULL,
	`job_type`	varchar(100)	NULL,
	`required_career`	varchar(100)	NULL,
	`education_level`	varchar(255)	NULL,
	`work_type`	varchar(255)	NULL,
	`pay_date`	varchar(255)	NULL,
	`required_skill`	varchar(255)	NULL,
	`deadline`	date	NULL
);

CREATE TABLE `corperation` (
	`id`	varchar(255)	NOT NULL,
	`corp_license`	varchar(255)	NOT NULL,
	`corp_logo`	varchar(255)	NOT NULL,
	`corp_name`	varchar(255)	NOT NULL,
	`corp_phone`	varchar(255)	NOT NULL,
	`corp_email`	varchar(255)	NOT NULL,
	`manager_name`	varchar(255)	NOT NULL,
	`manager_phone`	varchar(255)	NOT NULL,
	`manager_email`	varchar(255)	NOT NULL
);

##### 24. index.jsp/mansearch_view.jsp
SELECT b.hashtag, b.subject, b.viewcount,
       c.corp_logo, c.corp_name, c.manager_name, c.manager_phone, c.manager_email,
       mb.deadline, mb.work_start, mb.pay, mb.corp_location, mb.position, mb.required_career,
       mb.job_type, mb.work_type, mb.required_skill, mb.education_level, mb.pay_date
FROM mansearch_board mb LEFT JOIN board b ON mb.sno = b.sno
                        LEFT JOIN member m ON b.id = m.id
                        LEFT JOIN corperation c ON m.id = c.id
WHERE b.sno = '1';

##### 25. index.jsp/mansearch_insert.jsp
# 구인글 작성 시 인증된 아이디인지 확인. 아래 쿼리문 cnt가 0보다 작으면 알러트
SELECT corp_license FROM corperation WHERE id = 'a001';
# 구인글 작성 누르면 session에 저장되어 있는 아이디로 자동으로 정보 받아와서 입력
SELECT corp_logo, corp_name, corp_license, corp_phone, corp_email,
       manager_name, manager_phone, manager_email
FROM corperation WHERE id = 'a001';

INSERT INTO mansearch_board(sno, work_start,pay,corp_location,position,job_type,required_carrer,
                            education_level,work_type,pay_date,required_skill,deadline
       VALUES()
       INTO board(subject, doc)
       VALUES();

##### 26. index.jsp/member_profile.jsp
SELECT m.profile_img, m.nickname, m.grade,
       mi.introduce
FROM member m JOIN member_introduce mi ON m.id = mi.id
WHERE m.id = 'a001';

CREATE TABLE `member_introduce` (
	`id`	varchar(255)	NOT NULL,
	`introduce`	longtext	NULL
);

##### 27. index.jsp/member_profile.jsp/member_profile_myarticle.jsp 내 최근 게시물
SELECT sno, subject, nal, boardtype FROM board WHERE id = 'a001'
ORDER BY sno desc;

##### 28. index.jsp/member_profile.jsp/member_profile_myrepl.jsp 내 최근 댓글
SELECT r.repl_nal, r.repl_doc, b.sno FROM repl r JOIN board b ON r.sno = b.sno WHERE id = 'a001'
ORDER BY sno desc;

##### 29. index.jsp/mypage.jsp/mypage_memberinfo.jsp 프로필 -> 마이페이지
SELECT nickname, email, gender, age, profile_img FROM member WHERE id = 'a001';

##### 30. index.jsp/mypage.jsp/mypage_mypixel.jsp
# 환전 신청시 ->해당ID  ①보유픽셀감소 ②환전신청리스트추가 ③픽셀기록 테이블에 추가
UPDATE member SET pixel = pixel - '파라미터' WHERE id = 'a001';

INSERT INTO pixel_exchange_list(id, apply_pixel)
VALUES();

INSERT INTO pixel_history(id, pixel_log)
VALUES();
# 로그인한 아이디의 사용 가능 픽셀, 계좌정보 등 출력
SELECT m.pixel, b.bank_name, b.account_holder, b.account
FROM member m JOIN bank b ON m.id = b.id WHERE m.id = 'a001';
# 로그인한 아이디의 환전 대기 픽셀 출력
SELECT SUM(apply_pixel) FROM pixel_exchange_list WHERE id = 'a001';
/*
SELECT (m.pixel-(sum(p.apply_pixel))), b.bank_name, b.account_holder, b.account
FROM member m LEFT JOIN bank b ON m.id = b.id
              LEFT JOIN pixel_exchange_list p ON m.id = p.id
WHERE m.id = 'a001'
GROUP BY m.pixel, b.bank_name, b.account_holder, b.account;
*/

CREATE TABLE `bank` (
	`sno`	int	NOT NULL,
	`id`	varchar(255)	NOT NULL,
	`bank_name`	varchar(255)	NOT NULL,
	`account_holder`	varchar(255)	NOT NULL,
	`account`	varchar(255)	NOT NULL
);

CREATE TABLE `pixel_history` (
	`pixel_history_sno`	int	NOT NULL,
	`id`	varchar(255)	NOT NULL,
	`pixel_log`	int	NULL,
	`history_date`	datetime	NOT NULL	DEFAULT NOW()
);

CREATE TABLE `pixel_exchange_list` (
	`pixel_exchange_list_sno`	int	NOT NULL,
	`id`	varchar(255)	NOT NULL,
	`apply_date`	datetime	NOT NULL	DEFAULT NOW(),
	`apply_pixel`	int	NOT NULL,
	`pixel_exchange_status`	int	NOT NULL	DEFAULT 0
);

##### 31. 이메일인증, 멘토인증 신청 시 STATUS 업데이트, 어드민사이트에서 신청 승인 시 STATUS 업데이트.

##### 32. 출석체크 라이브러리

##### 33. 로그인

##### 34. 회원가입

##### 35. 아이디/비밀번호 찾기

##### 36. 비밀번호 변경 이메일 발송

##### 37. index.jsp/pixel_buy.jsp 픽셀 구매 페이지
SELECT pixel_1_price, pixel_1_amount, pixel_2_price, pixel_2_amount,
       pixel_3_price, pixel_3_amount, pixel_4_price, pixel_4_amount,
       pixel_5_price, pixel_5_amount, pixel_6_price, pixel_6_amount
FROM pixel_price;

CREATE TABLE `pixel_price` (
	`pixel_1_price`	int	NULL,
	`pixel_1_amount`	int	NULL,
	`pixel_2_price`	int	NULL,
	`pixel_2_amount`	int	NULL,
	`pixel_3_price`	int	NULL,
	`pixel_3_amount`	int	NULL,
	`pixel_4_price`	int	NULL,
	`pixel_4_amount`	int	NULL,
	`pixel_5_price`	int	NULL,
	`pixel_5_amount`	int	NULL,
	`pixel_6_price`	int	NULL,
	`pixel_6_amount`	int	NULL
);

##### 38. 픽셀 구매. 결제API 연동 생각하기.
INSERT INTO pixel_history(pixel_history_sno, id, pixel_log)
VALUES() WHERE id = 'a001';

UPDATE member m SET pixel = pixel + '구매한pixel' WHERE id = 'a001';

##### 39. 어드민 사이트 픽셀 환전 승인 리스트
SELECT pel.id, pel.apply_pixel, pel.apply_date, '환전금액. grade로 text박스에 받아진 값과 el태그에서 연산',
       b.account,
       m.grade
FROM pixel_exchange_list pel LEFT JOIN bank b ON pel.id = b.id
                             LEFT JOIN member m ON pel.id = m.id
WHERE pel.pixel_exchange_status = 0
ORDER BY pel.apply_date ASC;
# 환전 승인
UPDATE pixel_exchange_list SET pixel_exchange_status = 1 WHERE id = '파라미터';

##### 40. 멘토멘티 보상 픽셀
# 신청
UPDATE member SET pixel = pixel - '파라미터' WHERE id = 'a001';
INSERT INTO pixel_history(id, pixel_log)
VALUES();
# 수락
UPDATE member SET pixel = pixel + '파라미터' WHERE id = '수락아이디';
INSERT INTO pixel_history(id, pixel_log)
VALUES();
# 거절
UPDATE member SET pixel = pixel + '파라미터' WHERE id = 'a001';
INSERT INTO pixel_history(id, pixel_log)
VALUES();

CREATE TABLE `mantoman` (
	`mantoman_sno`	int	NOT NULL,
	`id`	varchar(255)	NOT NULL,
	`your_id`	varchar(255)	NOT NULL,
	`docfile`	varchar(255)	NULL,
	`filetime`	datetime	NOT NULL	DEFAULT NOW(),
	`mantoman_pixel_reward`	int	NOT NULL
);

##### 41. mantoman_index.jsp/mantoman_mentolist.jsp
SELECT m.profile_img, m.nickname, m.grade
FROM member m JOIN mantoman mtm ON m.id = mtm.id
GROUP BY m.profile_img, m.nickname, m.grade
ORDER BY count(mtm.id) DESC;

##### 42. member_profile.jsp 팝업으로 띄우기
SELECT m.profile_img, m.nickname, m.grade,
       mi.introduce
FROM member m JOIN member_introduce mi ON m.id = mi.id
WHERE m.id = 'a001';

##### 43. mantoman_index.jsp/mantoman_chatlist.jsp
# 세션 아이디를 기준으로 your_id를 List<vo>에 담고 배열 길이만큼 반복문 실행
SELECT your_id, filetime FROM mantoman WHERE id = 'a001';
# 반복문에서 실행할 SQL문
SELECT profile_img, nickname FROM member WHERE id = '파라미터';










